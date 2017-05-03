class BitMoveOP {
    public static void main(String[] args) {
        int n = 7 >> 2; //0000 0111 => 0000 0001   1
        int m = 7 << 2; //0000 0111 =>  0001 1100  28
        int i = 7 >>> 2; // 0000 0111 => 0000 0001  1
        byte b1 = -1 >> 2; // 1111 1111  1111 1110 1000 0001 1000 0000 1000 0001    63  
        byte b2 = 1 >> 2; // 0000 0001 => 0000 0000 0
        System.out.println(Integer.toBinaryString(-1));
        System.out.println(Integer.toBinaryString(28));
        System.out.println(n);
        System.out.println(m);
        System.out.println(i);
        System.out.println(b1);
        System.out.println(b2);
    }
}