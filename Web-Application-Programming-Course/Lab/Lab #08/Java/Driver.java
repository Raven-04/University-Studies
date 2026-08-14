public class Driver {
    public static void main(String[] args) {
        // Create instances of each employee role
        Intern intern = new Intern("Jim", 101, 30000);
        TeamLeader teamLeader = new TeamLeader("Pam", 102, 50000);
        Manager manager = new Manager("Michael", 103, 80000);
        Executive executive = new Executive("Jan", 104, 150000);
        // Intern reports to TeamLeader
        intern.attendMeeting();
        intern.reportToManager();
        // TeamLeader manages a team and reports to Manager
        teamLeader.attendMeeting();
        teamLeader.manageTeam();
        teamLeader.reportToManager();
        // Manager manages teams, approves budget, and reports to Executive
        manager.attendMeeting();
        manager.manageTeam();
        manager.approveBudget(10000);
        manager.reportToManager();
        // Executive manages the whole department and approves large budgets
        executive.attendMeeting();
        executive.manageTeam();
        executive.approveBudget(50000);
        executive.reportToManager();
    }
}    