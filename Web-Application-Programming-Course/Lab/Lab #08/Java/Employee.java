public abstract class Employee {
    String name;
    int employeeID;
    int salary;

    Employee(String name, int employeeID, int salary) {
        super();
        this.name = name;
        this.employeeID = employeeID;
        this.salary = salary;
    }

    void attendMeeting() {
        System.out.println(name + " is attending a meeting... but probably just for the free snacks.");
    }

    abstract void reportToManager();
}