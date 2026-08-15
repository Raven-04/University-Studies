/* 
* Multithreaded Producer-Consumer using POSIX pthreads, semaphores, and mutex 
* Group (9) 
* Ahmed Tarek , Omer Amer ,Yasir al jaf , Mohamed Alawadhi 
* CMP-310 Operating Systems Mini Project 
*/ 
 
#include <stdio.h> 
#include <stdlib.h> 
#include <pthread.h> 
#include <semaphore.h> 
#include <unistd.h> 
#include <time.h> 
  
#define ITEMS_PER_PRODUCER 20 
  
int *buffer; 
int buffer_size; 
int in = 0, out = 0; 
  
sem_t empty_slots; 
sem_t filled_slots; 
pthread_mutex_t buffer_mutex; 
  
int total_produced = 0; 
int total_consumed = 0; 
int total_items; 
  
void *producer(void *arg) { 
	int id = *(int *)arg; 
	for (int i = 0; i < ITEMS_PER_PRODUCER; ++i) { 
		int item = rand() % 100; 
  
		sem_wait(&empty_slots); 
		pthread_mutex_lock(&buffer_mutex); 
  
		buffer[in] = item; 
		printf("[Producer-%d] Produced item: %d\n", id, item); 
		in = (in + 1) % buffer_size; 
		total_produced++; 
		pthread_mutex_unlock(&buffer_mutex); 
		sem_post(&filled_slots); 
  
		usleep(100000); // sleep 100ms to simulate time 
	} 
	printf("[Producer-%d] Finished producing %d items.\n", id, ITEMS_PER_PRODUCER); 
	free(arg); 
	return NULL; 
} 
  
void *consumer(void *arg) { 
	int id = *(int *)arg; 
	while (1) { 
		sem_wait(&filled_slots); 
		pthread_mutex_lock(&buffer_mutex); 
  
		if (total_consumed >= total_items) { 
			pthread_mutex_unlock(&buffer_mutex); 
			sem_post(&filled_slots); 
			break; 
		} 
  
		int item = buffer[out]; 
		printf("[Consumer-%d] Consumed item: %d\n", id, item); 
		out = (out + 1) % buffer_size; 
		total_consumed++; 
  
		pthread_mutex_unlock(&buffer_mutex); 
		sem_post(&empty_slots); 
  
		usleep(150000); // sleep 150ms 
	} 
	printf("[Consumer-%d] Finished consuming.\n", id); 
	free(arg); 
	return NULL; 
} 
  
int main(int argc, char *argv[]) { 
	if (argc != 4) { 
		fprintf(stderr, "Usage: %s <num_producers> <num_consumers> <buffer_size>\n", argv[0]);   
		exit(1); 
	} 
  
	int num_producers = atoi(argv[1]); 
	int num_consumers = atoi(argv[2]); 
	buffer_size = atoi(argv[3]); 
	total_items = num_producers * ITEMS_PER_PRODUCER; 
  
	if (num_producers <= 0 || num_consumers <= 0 || buffer_size <= 0) { 
		fprintf(stderr, "Invalid input: All values must be positive integers.\n"); 
		exit(1); 
	} 
  
	buffer = malloc(sizeof(int) * buffer_size); 
	pthread_t producers[num_producers]; 
	pthread_t consumers[num_consumers]; 
  
	sem_init(&empty_slots, 0, buffer_size); 
	sem_init(&filled_slots, 0, 0); 
	pthread_mutex_init(&buffer_mutex, NULL); 
  
	srand(time(NULL)); 
  
	for (int i = 0; i < num_producers; ++i) { 
		int *id = malloc(sizeof(int)); 
		*id = i + 1; 
		pthread_create(&producers[i], NULL, producer, id); 
	} 
  
	for (int i = 0; i < num_consumers; ++i) { 
		int *id = malloc(sizeof(int)); 
		*id = i + 1; 
		pthread_create(&consumers[i], NULL, consumer, id); 
	} 
  
	for (int i = 0; i < num_producers; ++i) { 
		pthread_join(producers[i], NULL); 
	} 
  
	// Wake up consumers so they can exit 
	while (1) { 
		pthread_mutex_lock(&buffer_mutex); 
		if (total_consumed >= total_items) { 
			pthread_mutex_unlock(&buffer_mutex); 
			for (int i = 0; i < num_consumers; ++i) sem_post(&filled_slots); 
			break; 
		} 
		pthread_mutex_unlock(&buffer_mutex); 
	} 
  
	for (int i = 0; i < num_consumers; ++i) { 
		pthread_join(consumers[i], NULL); 
	} 
  
	sem_destroy(&empty_slots); 
	sem_destroy(&filled_slots); 
	pthread_mutex_destroy(&buffer_mutex); 
	free(buffer); 
  
	return 0; 
}