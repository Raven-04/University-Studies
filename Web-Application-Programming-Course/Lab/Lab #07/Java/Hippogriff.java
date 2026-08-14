public class Hippogriff extends MagicalCreature {
    int flyingSpeed;

    Hippogriff(String name, String habitat, int flyingSpeed) {
        super(name, habitat);
        this.flyingSpeed = flyingSpeed;
    }

    @Override
    void performMagic() {
        System.out.println(name + " flies at " + flyingSpeed + " km/h and performs a magical bow!");
    }
}