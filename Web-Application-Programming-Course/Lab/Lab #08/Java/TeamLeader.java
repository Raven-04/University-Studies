public class TeamLeader extends Employee implements manage {
    TeamLeader(String name, int employeeID, int salary) {
        super(name, employeeID, salary);
    }

    @Override
    public void manageTeam() {
        System.out.println(name + " is trying to manage the team... but mostly just mediating arguements over the thermostat.");
    }

    @Override
    public void reportToManager() {
        System.out.println(name + " is reporting to the manager. Spoiler: It's Micheal. Good luck.\n");
    }
}
