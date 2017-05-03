import java.util.Arrays;
import java.util.Random;

public class Practice {

    public static void main(String[] args) {

        Random random = new Random();

        int[] randomNumbers = new int[10];
        for (int i = 0; i < randomNumbers.length; i++) {
            randomNumbers[i] = random.nextInt(100);
            System.out.println("randomNumbers[" + i + "] = " + randomNumbers[i]);
        }

        int first = randomNumbers[0];
        for (int i = 0; i < randomNumbers.length; i++) {
            randomNumbers[i] = (i == randomNumbers.length - 1) ? first : randomNumbers[i + 1];
            System.out.println("randomNumbers[" + i + "] = " + randomNumbers[i]);
        }
        int[] score = new int[40];
        int total = 0;
        for (int i = 0; i < score.length; i++) {
            score[i] = random.nextInt(100);
            total += score[i];
            System.out.println("score[" + i + "] = " + score[i]);
        }
        double avg1 = total / 40;
        int count = 0;
        for (int i = 0; i < score.length; i++) {
            if (score[i] < avg1) {
                count++;
            }
        }
        System.out.println("低于平均值得人数=" + count);
        int[] nums = new int[] { 61, 23, 4, 74, 13, 148, 20 };

        int max = nums[0]; // 假定最大值为数组中的第一个元素
        int min = nums[0]; // 假定最小值为数组中的第一个元素
        double sum = 0; // 累加值
        double avg = 0; // 平均值
        for (int i = 0; i < nums.length; i++) {
            if (nums[i] > max) {
                max = nums[i];
            }
            if (nums[i] < min) {
                min = nums[i];
            }
            sum += nums[i];
        }
        avg = sum / nums.length;
        System.out.println("数组中的最大值：" + max);
        System.out.println("数组中的最小值：" + min);
        System.out.println("数组中的平均值：" + avg);

        introArrays();
    }

    static void introArrays() {
        int[] nums = new int[] { 61, 23, 4, 74, 13, 148, 20 };

        int max = nums.length - 1;
        StringBuffer sBuffer = new StringBuffer();
        sBuffer.append("[");
        for (int i = 0;; i++) {
            sBuffer.append(nums[i]);
            if (max == i) {
                sBuffer.append("]");
                break;
            }
            sBuffer.append(", ");
        }

        Object ob = new Object();
        System.out.println(sBuffer);
        Arrays.sort(nums);
        System.out.println(Arrays.toString(nums));
    }
}