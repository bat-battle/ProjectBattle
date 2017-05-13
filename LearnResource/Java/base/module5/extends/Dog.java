class Dog extends Animal {

    Dog() {
        System.out.println("Dog initial~");
    }

    @Override
    public void eat() {
        System.out.println("dog eating");
    }

    public String toString() {
        return "[Dog] age " + this.age;
    }

    public boolean equals(Object obj) {
        return true;
    }

    public static void main(String[] args) {
        Dog dog = new Dog();
        dog.age = 10;
        Dog dog2 = new Dog();
        dog2.age = 15;
        if (dog.equals(dog2)) {
            System.out.println("equals");
        }
        System.out.println(dog);
    }
}