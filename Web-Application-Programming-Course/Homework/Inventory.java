import java.util.ArrayList;

public class Inventory {
    // encapsulate the variables
    private ArrayList<Item> inventory;
    private String category;

    // constructor
    public Inventory(String category) {
        this.category = category;
        this.inventory = new ArrayList<>();
    }

    // Adding a new generic item
    public void newItem(String type, int quantity, double price) {
        if (findItem(type, true) == -1) {
            Item item = new Item(type);
            item.setQuantity(quantity);
            item.setPrice(price);
            inventory.add(item);   
        }
    }

    // Adding a new branded item
    public void newItem(String brand, String type, int quantity, double price) {
        if (findItem(brand, type, true) == -1) {
            Brand brandedItem = new Brand(brand, type);
            brandedItem.setQuantity(quantity);
            brandedItem.setPrice(price);
            inventory.add(brandedItem);
        }
    }

    // Sets the quantity of the generic item
    public void setQuantity(String type, int quantity) {
        int index = findItem(type, false);
        if (index != -1) {
            inventory.get(index).setQuantity(quantity);
        }
    }

    // Sets the quantity of the branded item
    public void setQuantity(String brand, String type, int quantity) {
        int index = findItem(brand, type, false);
        if (index != -1) {
            inventory.get(index).setQuantity(quantity);
        }
    }

    // Setting the price for the generic item
    public void setPrice(String type, double price) {
        int index = findItem(type, false);
        if (index != -1) {
            inventory.get(index).setPrice(price);
        }
        else {
            System.out.println("Cannot find " + type);
        }
    }

    // Setting the price for the branded item
    public void setPrice(String brand, String type, double price) {
        int index = findItem(brand, type, false);
        if (index != -1) {
            inventory.get(index).setPrice(price);
        }
        else {
            System.out.println("Cannot find " + brand + " " + type);
        }
    }

    // Gets the quantity of the generic item
    public int getQuantity(String type) {
        int index = findItem(type, false);
        if (index != -1) {
            return inventory.get(index).getQuantity();
        }
        else {
            return -1;
        }
    }

    // Gets the quantity of the branded item
    public int getQuantity(String brand, String type) {
        int index = findItem(brand, type, false);
        if (index != -1) {
            return inventory.get(index).getQuantity();
        }
        else {
            return -1;
        }
    }

    // Gets the price of the generic item
    public double getPrice(String type) {
        int index = findItem(type, false);
        if (index != -1) {
            return inventory.get(index).getPrice();
        }
        else {
            return -1.0;
        }
    }

    // Gets the price of the branded item
    public double getPrice(String brand, String type) {
        int index = findItem(brand, type, false);
        if (index != -1) {
            return inventory.get(index).getPrice();
        }
        else {
            return -1.0;
        }
    }

    // Updates the quantity of a generic item
    public void update(String type, int qtyIncrease) {
        int index = findItem(type, false);
        if (index != -1) {
            inventory.get(index).update(qtyIncrease);
        }
        else {
            System.out.println("Cannot find " + type);
        }
    }

    // Updates the quantity of a branded item
    public void update(String brand, String type, int qtyIncrease) {
        int index = findItem(brand, type, false);
        if (index != -1) {
            inventory.get(index).update(qtyIncrease);
        }
        else {
            System.out.println("Cannot find " + brand + " " + type);
        }
    }

    // Updates the price for a generic item
    public void update(String type, double adjustmentFactor) {
        int index = findItem(type, false);
        if (index != -1) {
            inventory.get(index).update(adjustmentFactor);
        }
        else {
            System.out.println("Cannot find " + type);
        }
    }

    // Updates the price for passed the branded item
    public void update(String brand, String type, double adjustmentFactor) {
        int index = findItem(brand, type, false);
        if (index != -1) {
            inventory.get(index).update(adjustmentFactor);
        }
        else {
            System.out.println("Cannot find " + brand + " " + type);
        }
    }

    // Finding an item type, determing whether it is generic or branded
    private int findItem(String type, boolean warningIfFound) {
        int index = -1;
        int count = 0;
        
        for (int i = 0; i < inventory.size(); i++) {
            if (inventory.get(i).getType().equals(type)) {
                index = i;
                count++;
            }
        }

        if (count > 1) {
            System.out.println("Found more than one brand of " + type);
            return -1;
        }
        else if (count == 1 && warningIfFound) {
            System.out.println(type + " already exists");
        }

        return index;
    }

    // Finding an item by brand and type
    private int findItem(String brand, String type, boolean warningIfFound) {
        for (int i = 0; i < inventory.size(); i++) {
            if (inventory.get(i) instanceof Brand) {
                Brand brandedItem = (Brand) inventory.get(i);
                if (brandedItem.getBrand().equals(brand) && brandedItem.getType().equals(type)) {
                    if (warningIfFound) {
                        System.out.println(brand + " " + type + " already exists");
                    }
                    return i;
                }
            }
        }

        return -1;
    }

    // This method prints out the stock report
    public void stockReport() {
        double total = 0.0;
        
        for (Item item : inventory) {
            if (item instanceof Brand) {
                Brand brandedItem = (Brand) item;
                System.out.println(brandedItem.getBrand() + " " + brandedItem.getType() + " - in stock: " + brandedItem.getQuantity() + ", price: $" + brandedItem.getPrice());
            }
            else {
                System.out.println(item.getType() + " - in stock: " + item.getQuantity() + ", price: $" + item.getPrice());
            }
            
            total += item.getQuantity() * item.getPrice();
        }
        System.out.println("Total value: $" + total + "\n");
    }
}