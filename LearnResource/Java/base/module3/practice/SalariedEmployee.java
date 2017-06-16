class SalariedEmployee extends Employee {
    private double monthSalary = 1800;

    public double getSalary() {
        super.getSalary(super.getBirth().getMonth());
        return this.monthSalary;
    }
}