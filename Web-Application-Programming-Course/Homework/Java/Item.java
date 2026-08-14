public class Item {
    // encapsulate the variables
    private String type;
    private int quantity;
    private double price;

    // default constructor
    public Item() {}

    // constructor
    public Item (String type) {
        this.type = type;
    }

    /* set methods */
    // setting the quanity
    public Item setQuantity(int quantity) {
        this.quantity = quantity;
        return this;
    }

    // setting the price
    public Item setPrice(double price) {
        this.price = price;
        return this;
    }

    /* get methods */
    // getting the type
    public String getType() {
        return type;
    }

    // getting the quantity
    public int getQuantity() {
        return quantity;
    }

    // getting the price
    public double getPrice() {
        return price;
    }

    // updates the amount of items
    public Item update(int qtyIncrease) {
        this.quantity += qtyIncrease;
        return this;
    }

    // updates the price
    public Item update(double adjustmentFactor) {
        this.price *= (1 + adjustmentFactor);
        return this;
    }
}
