import java.sql.Date;

class SalesEmployee extends Employee {
    double monthlySalary;
    float royaltyRate;

    double getSalary(int xxx) {
        Date date = new Date();
        return monthlySalary * royaltyRate + 
        super.getSalary(date.getMonth() + 1);
    }
}