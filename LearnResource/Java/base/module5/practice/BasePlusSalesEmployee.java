class BasePlusSalesEmployee extends SalesEmployee {
    double baseSalary;

    double getSalary() {
        return baseSalary + super.getSalary();
    }
}