import java.util.Scanner;

class ScoreLevel {
    public static void main(String[] args) {
        System.out.println("请输入分数");
        Scanner sc = new Scanner(System.in);
        int score = sc.nextInt();
        if (score >= 90) {
            System.out.println("A");
        } else if (score >= 80 && score < 90) {
            System.out.print("B");
        } else if (score >= 70 && score < 80) {
            System.out.print("C");
        } else if (score >= 60 && score < 70) {
            System.out.print("D");
        } else if (score < 60) {
            System.out.print("E");
        }
    }
}