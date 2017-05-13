import java.util.Date;

class Employee {
    String name;
    String birthMonth;

    double getSalary(int month) {
        double total = 0;
        if (birthMonth == month) {
            total += 100;
        }
        return total;
    }
}