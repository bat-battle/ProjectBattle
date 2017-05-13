class Phone {
    String brand;
    String cup;
    String screenSize;
    String memory;

    void call() {
        System.out.println("打电话中...");
    }

    void sendMsg() {
        System.out.println(brand + "发短信中...");
    }

    void info() {
        System.out.println("当前手机信息" + "品牌:" + brand + "not this cup:" + cup + "屏幕尺寸:" + screenSize);
    }
}