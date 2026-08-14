public class Intern extends Employee {
    Intern(String name, int employeeID, int salary) {
        super(name, employeeID, salary);
    }

    @Override
    void reportToManager() {
        System.out.println(name + " is reporting to the team leader... but might get distracted making copies.\n");
    }
}