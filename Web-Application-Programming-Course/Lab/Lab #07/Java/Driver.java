import java.util.Scanner;

public class Driver {
    public static void main(String[] args) {
        MagicalCreature creature = new MagicalCreature("Bowtruckle", "Forbidden Forest");
        creature.performMagic(); 
        System.out.println();

        Hippogriff buckbeak = new Hippogriff("Buckbeak", "Forbidden Forest", 100);
        buckbeak.performMagic(); 
        System.out.println();

        Phoenix fawkes = new Phoenix("Fawkes", "Dumbledore's Office", 5);
        fawkes.performMagic(); 
        fawkes.singsSong(); 
        System.out.println();

        Basilisk basilisk = new Basilisk("Basilisk", "Chamber of Secrets", 10);
        basilisk.performMagic();
    }
}