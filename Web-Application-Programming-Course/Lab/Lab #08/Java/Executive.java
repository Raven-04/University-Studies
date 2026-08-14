public class Executive extends Employee implements budget, manage {
    Executive(String name, int employeeID, int salary) {
        super(name, employeeID, salary);
    }

    @Override
    public void manageTeam() {
        System.out.println(name + " is overseeing the entire department, but secretly wondering why they hired Micheal in the first place.");
    }

    @Override
    public void approveBudget(int budget) {
        System.out.println(name + " just approved a budget of $" + budget + ". Hopefully, this won't end up in another 'Dundie Awards' fiasco.");
    }

    @Override
    public void reportToManager() {
        System.out.println(name + " reports to the CEO. But let's be honest, the real boss here is the Scranton Branch Chaos.\n");
    }
}
