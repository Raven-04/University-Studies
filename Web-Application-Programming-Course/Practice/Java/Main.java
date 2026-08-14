import java.util.Scanner;

public class Main {
    // This is required in all java codes, since it is the main.
    public static void main(String[] args) {
        System.out.println("Hello World");
        System.out.println("I am learning Java.");
        System.out.println("It is awesome!\n");
        System.out.println(3);
        System.out.println(538);
        System.out.println(500000);
        System.out.println(3 + 3);
        System.out.println(2 * 5);
        int x = 0;
        String name = "Mo";
        String last = "Alawa";
        System.out.println(x + " " + name + " " + last);

        Scanner myObj = new Scanner(System.in);
        System.out.println("Enter a value: ");
        int myValue = myObj.nextInt();
        System.out.println("Value = " + myValue);
    }
}