public class Basilisk extends MagicalCreature {
    int venomPotency;

    Basilisk(String name, String habitat, int venomPotency) {
        super(name, habitat);
        this.venomPotency = venomPotency;
    }

    @Override
    void performMagic() {
        System.out.println(name + " uses its deadly gaze and venom with potency " + venomPotency + "!\n");
    }
}