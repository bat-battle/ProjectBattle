import java.sql.Date;

class HourlyEmployee extends Employee {
    double hourSarlay;
    int workHours;

    double getSalary() {
        double total = 0;
        Date date = new Date();
        total += super.getSalary(date.getMonth() + 1);
        int workOutHours = 160;
        float workOutSalaryRate = 1.5f;
        if (this.workHours > workOutHours) {
            return (this.workHours - workOutHours) * hourSarlay * workOutSalaryRate;
        } else {
            return this.hourSarlay * workHours;
        }
    }
}