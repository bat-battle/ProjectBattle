class CopyArray {
    public static void main(String[] args) {
        int[] src = { 1, 2, 3, 4 };
        int[] dest = { 5, 6, 7 };
        System.arraycopy(src, 0, dest, 0, src.length);
        for (int var : dest) {
            System.out.println(var);
        }
    }
}