class Init {
    public static void main(String[] args) {
        Animal animal = new Animal();
        Animal dog = new Dog();
        Animal cat = new Cat();
        animal.eat();
        dog.eat();
        cat.eat();

        Dog dog1 = new Dog();
        Animal animal1 = dog1;
        if (animal1 instanceof Cat) {
            Cat cat = (Cat) animal1;
        } else {
            System.out.println("animal1 can not cast Cat type");
        }
        if (obj1 instanceof Dog) {
            System.out.println("Animal obj1 this is Animal Type");
        }
        if (dog1 instanceof Animal) {
            System.out.println("Dog dog is Animal Type");
        }
        if (dog1 instanceof Dog) {
            System.out.println("Dog dog is Dog Type");
        }

    }
}