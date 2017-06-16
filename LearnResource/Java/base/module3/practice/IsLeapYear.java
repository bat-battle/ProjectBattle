import java.util.Scanner;

class IsLeapYear {
    public static void main(String[] args) {
        int year;
        System.out.println("请输入年份:");
        Scanner sc = new Scanner(System.in);
        year = sc.nextInt();
        System.out.println("year = " + year);
        if (year % 4 == 0 && year % 100 != 0 || year % 400 == 0) {
            System.out.println("是闰年");
        } else {
            System.out.println("不是闰年");
        }
    }
}