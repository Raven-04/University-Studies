# CMP-310 Mini-Project: Multithreaded Producer-Consumer Application

## Table of Contents
1. [Project Overview](#project-overview)
2. [Requirements](#requirements)
3. [Code Implementation](#code-implementation)
4. [Compilation](#compilation)
5. [Running](#running)
6. [Sample Output](#sample-output)
7. [Group Details](#group-details)

## _Project Overview_
The goal of this project is to implement a multithreaded Producer-Consumer model uisng the POSIX threads (pthread), semaphores, and mutexes to manage synchronization. Using a bounded buffer (acting as a shared resource), producers generate data and consumers process that data. Additionally, to ensure that threads are synchronized safely, this project handles race conditions and buffer overflows/underflows.

## _Requirements_
- **VMs:** Oracle VirtualBox or Kali Linux
- **Language:** C
- **Libraries:** Standard I/O, Standard Utility, POSIX Threads (pthread.h), Semaphores (semaphore.h), Unix Standard, Date Time Functions
- **Compiler:** GCC (with -pthread flag)

## _Code Implementation_
Main Code is created/modified by using nano: -

_nano producer_consumer.c_ 

## _Compilation_
Once you have created your code, you need to compile by using gcc:-

_gcc -o producer_consumer producer_consumer.c -pthread_

## _Running_
And finally, after compiling it, you can run it like so (requires number of producers, consumers, and buffer size respectively):-

_./producer_consumer 3 2 10_

## _Sample Output_
[Producer-2] Produced item: 67
<br> 
[Producer-3] Produced item: 12 
<br>
[Producer-1] Produced item: 77 
<br>
[Consumer-1] Consumed item: 67 
<br>
# ...
[Producer-1] Produced item: 21 
<br>
[Producer-2] Finished producing 20 items. 
<br>
[Producer-1] Finished producing 20 items. 
<br>
[Consumer-1] Consumed item: 38 
<br>
[Consumer-2] Consumed item: 0 
<br>
[Consumer-1] Consumed item: 14 
<br>
[Consumer-2] Consumed item: 81 
<br>
[Consumer-1] Consumed item: 80 
<br>
[Consumer-2] Consumed item: 53 
<br>
[Consumer-1] Consumed item: 74 
<br>
[Consumer-2] Consumed item: 64 
<br>
[Consumer-1] Consumed item: 42 
<br>
[Consumer-2] Consumed item: 21 
<br>
[Consumer-1] Finished consuming. 
<br>
[Consumer-2] Finished consuming.

## _Group Details_
**Course:** CMP-310 Operating Systems (Spring 2025)

**Section:** 2

**Class Time:** TR | 9:30 - 10:45 AM

**Group:** 9

**Members:**
1. b00091962 - Ahmed Tarek
2. b00094286 - Mohamed Alawadhi
3. b00091718 - Omar Amer
4. b00091315 - Yasir Al-jaf

**Deadline:** Sunday, April 20th at 11:59 PM

<style>
    h1 { 
        border-bottom: 0;
    }
</style>