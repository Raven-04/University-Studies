// Brand inherits from Item class
public class Brand extends Item {
    // encapsulate the variables
    private String brand;

    // default constructor
    public Brand() {}

    // constructor
    public Brand(String brand, String type) {
        super(type);
        this.brand = brand;
    }

    // getting the brand
    public String getBrand() {
        return brand;
    }
}
