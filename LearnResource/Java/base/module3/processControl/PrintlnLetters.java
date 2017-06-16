class PrintlnLetters {
    public static void main(String[] args) {
        for (int i = 0; i < 26; i++) {
            char c = (char)('a' + i);
            System.out.println(c);
        }

        String[][] ours = {{"郭蕊","涵涵","栋栋",""},{"","","","家西"}};
        for(int i = 0; i< ours.length;i++){
            System.out.println(ours[i]);
            for(int j = 0; j < ours[i].length;j++){
                System.out.println(ours[i][j]);
            }
        }







        
        System.out.println("请输入魔法数字");
        Scanner sc = new Scanner(System.in);
        int a = sc.nextInt();
        for (int i = 0; i < 6; i++) {
            int total = 0;
            for (int j = 0; j <= i; j++) {
                total += (int) (Math.pow(10, j)) * a;
            }
            System.out.println(total);
        }
    }
}