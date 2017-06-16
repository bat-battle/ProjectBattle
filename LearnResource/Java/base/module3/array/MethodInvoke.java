public class MethodInvoke {
    public static void main(String[] args) {
        int age = 21;
        addAge(age);
        System.out.println("age=" + age);
    }

    public static void addAge(int age) {
        age++;
        System.out.println("a=" + age);
    }
}
