class PrimitiveArray {
    public static void main(String[] args) {
        int[] a = { 1, 2, 3 };
        int[] b = { 4, 5, 6 };
        System.out.println(a);
        System.out.println(b);
        int[] c = new int[3];
        for (int i = 0; i < c.length; i++) {
            System.out.println(c[i]);
        }
        System.out.println(c);
        for (int i = 0; i < b.length; i++) {
            System.out.println(b[i]);
        }
    }
}