import java.util.Date;

class Declaration {
    public static void main(String[] args) {
        int[] numbers = new int[2];
        double[] scores = new double[2];
        Date[] dates = new Date[2];

        System.out.println("numbers ===");
        for (int i = 0; i < numbers.length; i++) {
            System.out.println(numbers[i]);
        }

        System.out.println("scores ===");
        for (int i = 0; i < scores.length; i++) {
            System.out.println(scores[i]);
        }
        
        System.out.println("dates ===");
        for (int i = 0; i < dates.length; i++) {
            System.out.println(dates[i]);
        }
    }
}