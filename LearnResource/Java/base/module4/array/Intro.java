import java.util.Arrays;
import java.util.Random;
import java.util.Scanner;

class Intro {

    public static void main(String[] args) {
        Intro intro = new Intro();
        intro.test();
        // String[][] ours = { { "辉辉", "涵涵", "栋栋", "" }, { "张雨", "郭蕊", "严静", "家玺" } };
        // for (int row = 0; row < ours.length; row++) {
        //     System.out.println(ours[row]);
        //     for (int col = 0; col < ours[row].length; col++) {
        //         System.out.println(ours[row][col]);
        //     }
        // }
        // char[] defaultCharArray = new char[5];
        // defaultCharArray[4] = 'a';
        // int[] defaultIntArray = new int[5];
        // boolean[] defaultBooleanArray = new boolean[5];
        // for (int i = 0; i < 5; i++) {
        //     System.out.println(defaultBooleanArray[i]);
        //     System.out.println(defaultIntArray[i]);
        //     System.out.println(defaultCharArray[i]);
        // }
        // char[] letters = new char[26];
        // for (int i = 0; i < 26; i++) {
        //     letters[i] = (char)('a' + i);
        //     System.out.println(letters[i]);
        // }

        // double studentScore1 = 20.1;
        // double studentScore2 = 90.8;
        // double studentScore3 = 80.0;
        // double studentScore4 = 40.0;
        // double total = studentScore1 + studentScore2 + studentScore3 + studentScore4;
        // System.out.println("总成绩为= " + total);

        // System.out.println("===============");
        // double[] studentScore = { 20.1, 90.8, 80.0, 40.0 };
        // double arrayTotal = 0;
        // for (int i = 0; i < studentScore.length; i++) {
        //     arrayTotal += studentScore[i];
        // }
        // System.out.println("总成绩为= " + arrayTotal);
    }

    public void test() {
        Random random = new Random();
        int[] score = new int[40];
        int total = 0;
        for (int i = 0; i < score.length; i++) {
            score[i] = random.nextInt(100);
            total += score[i];
            System.out.print("score[" + i + "] = " + score[i]);
        }
        double avg1 = getAvg(total, count);
        System.out.println("平均值为：" + avg1);
        int count = 0;
        for (int i = 0; i < score.length; i++) {
            if (score[i] < avg1) {
                count++;
            }
        }
        System.out.println("低于平均值得人数=" + count);
        Arrays.sort(score);
        for (int i = 0; i < score.length; i++) {
            System.out.println("score[" + i + "] :" + score[i]);
        }
    }

    public int[] initArray(int[] array){
        int[] result = new int[score.length];
        // TODO
        return result;
    }

    public static double getAvg(int total, int count){
        return total/count;
    }

    public static int getLowerAvgCount(int[] score,double avg){

    }

}
