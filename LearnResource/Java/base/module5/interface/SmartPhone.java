class SmartPhone extends TelPhone implements IPlayGame {
    public void call() {
        System.out.println("SmartPhone is call");
    }

    public void playGame() {
        System.out.println("SmartPhone has playGame feature");
    }
}