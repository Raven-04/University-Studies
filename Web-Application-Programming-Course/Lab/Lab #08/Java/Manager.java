public class Manager extends Employee implements budget, manage {
    Manager(String name, int employeeID, int salary) {
        super(name, employeeID, salary);
    }

    @Override
    public void manageTeam() {
        System.out.println(name + " is managing the team with his unique leadership style: 'Delegation by Confusion.'");
    }

    @Override
    public void approveBudget(int budget) {
        System.out.println(name + " just approved a budget of $" + budget + ". Probably for something ridiculous, like 'Party Planning Supplies.'");
    }

    @Override
    public void reportToManager() {
        System.out.println(name + " reports to the Executive, but he's probably thinking about his next improv class.\n");
    }
}
