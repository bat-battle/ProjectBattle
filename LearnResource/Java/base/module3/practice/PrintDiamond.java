import java.util.Scanner;

class PrintDiamond {
    public static void main(String[] args) {
        String SYMBOL = "*";
        Scanner sc = new Scanner(System.in);
        System.out.println("请输入symbol数量(奇数)");
        int count = sc.nextInt();
        if (count % 2 == 0) {
            count += 1;
        }
        for (int i = 0; i < count / 2 + 1; i++) {
            for (int j = 0; j < 2 * (i + 1) - 1; j++) {
                System.out.print(SYMBOL);
            }
            System.err.println();

        }
        for (int i = 0; i < count / 2; i++) {
            for (int j = 0; j < 2 * (count / 2 - i) - 1; j++) {
                System.out.print(SYMBOL);
            }
            System.err.println();
        }
    }
}