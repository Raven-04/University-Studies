import java.util.Scanner;
import java.util.ArrayList;

class Order {
    String coffeeType;
    int numCookies;

    public Order(String coffeeType, int numCookies) {
        this.coffeeType = coffeeType;
        this.numCookies = numCookies;
    }

    public double calBills() {
        return 2.5 + (numCookies * 1.25);
    }

    public void displayRST(int i) {
        System.out.println("Customer " + (i + 1) + " needs to pay $" + calBills());
    }
}

public class CoffeeHouse {
    public static void main(String[] args) {
        System.out.print("Please enter the number of customers: ");
        Scanner userInput = new Scanner(System.in);
        // Number of customers (size of the array)
        int n = userInput.nextInt();
        userInput.nextLine();

        ArrayList<Order> Orders = new ArrayList<>();

        for (int i = 0; i < n; i++) {
            System.out.print("\nPlease enter type of Customer " + (i + 1) + "'s coffee: ");
            String coffeeType = userInput.nextLine();

            System.out.print("How many cookies does Customer " + (i + 1) + " want: ");
            int cookies = userInput.nextInt();
            userInput.nextLine();

            Orders.add(new Order(coffeeType, cookies));
        }

        System.out.println("\n");

        System.out.println("============xxxxx============\n");

        for (int i = 0; i < Orders.size(); i++) {
            Orders.get(i).displayRST(i);
        }
        System.out.print("\n");
    }
}