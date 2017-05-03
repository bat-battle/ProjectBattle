class Random {
    public static void main(String[] args) {
        int n = 7;
        System.out.println("variable n = 7");
        if (n > 3) {
            System.out.println("variable n > 3");
        } else {
            System.out.println("variable n < 3");
        }
        java.util.Random random = new java.util.Random();
        int rInt = random.nextInt(3);
        System.out.println("rInt =" + rInt);
        // double number = Math.random();
        // System.out.println(number);
        if (rInt > 1) {
            System.out.println("random value >  1");
        } else {
            System.out.println("random value <= 1");
        }
    }
}