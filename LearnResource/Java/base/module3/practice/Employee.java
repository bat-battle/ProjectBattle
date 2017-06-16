import java.util.Calendar;
import java.util.Date;

class Employee {
    private String name;
    private Date birth;

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return this.name;
    }

    public void setBirth(Date birth) {
        this.birth = birth;
    }

    public Date getBirth() {
        return this.birth;
    }

    public double getSalary(int month) {
        double salary = 0.0;
        if (this.birth != null && Calendar.getInstance().get(Calendar.MONTH) == month) {
            salary += 100;
        }
        return salary;
    }

    public static void main(String[] args) {
        Employee em = new Employee();
        System.out.println(em);
        System.out.println(em.toString());
    }

    public String toString() {
        return "1";
    }
}