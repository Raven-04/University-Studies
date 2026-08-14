public class Phoenix extends MagicalCreature {
    int rebirthCount;

    Phoenix(String name, String habitat, int rebirthCount) {
        super(name, habitat);
        this.rebirthCount = rebirthCount;
    }

    @Override
    void performMagic() {
        System.out.println(name + " bursts into flames and is reborn from the ashes! Rebirth count: " + rebirthCount);
    }

    void singsSong() {
        System.out.println(name + " sings a sad song which heals the soul.");
    }
}