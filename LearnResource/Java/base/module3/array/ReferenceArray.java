
public class ReferenceArray {
    public static void main(String[] args) {
        Student[] mclazz = new Student[2];
        for (int i = 0; i < mclazz.length; i++) {
            mclazz[i] = new Student();
            mclazz[i].setName("Kiro");
            mclazz[i].setAge(21);
            System.out.println(mclazz[i].getName());
            System.out.println(mclazz[i].getAge());
        }
    }
}

class Student {
    private int age;
    private String name;

    public int getAge() {
        return this.age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }
}