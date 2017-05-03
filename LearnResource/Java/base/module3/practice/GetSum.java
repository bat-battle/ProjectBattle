class GetSum {
    static int total = 0;

    public static void main(String[] args) {
        // GetSum gs = new GetSum();
        System.out.println(GetSum.total);
        System.out.print(GetSum.getTotal(9999));
    }

    static void init() {
        System.out.println("getSum class init");
    }

    static void run() {
        System.out.println("getSum class run");
    }

    public int getTotal() {
        return this.getTotal(9999);
    }

    static void stop() {
        System.out.println("getSum class stop");
    }

    static int getTotal(int bound) {
        int result = 0;
        for (int i = 1; i <= bound; i++) {
            if (i % 2 != 0) {
                result += i;
            }
        }
        return result;
    }
}