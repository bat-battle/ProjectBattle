class SalariedEmployee extends Employee {
    double monthSarla;
    int month;

    public double getSalary() {
        return super.getSalary(this.month) + this.monthSarla;
    }
}