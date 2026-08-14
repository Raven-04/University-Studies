class MagicalCreature {
    String name;
    String habitat;

    MagicalCreature(String name, String habitat) {
        super();
        this.name = name;
        this.habitat = habitat;
    }

    void performMagic() {
        System.out.println(name + " uses basic magical abilities!");
    }
}