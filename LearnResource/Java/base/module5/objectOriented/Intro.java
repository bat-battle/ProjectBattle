class Intro extends Object {
    public static void main(String[] args) {
        Phone phone1 = new Phone();
        phone1.brand = "小米";
        phone1.cup = "骁龙835";
        phone1.screenSize = "12英寸";
        phone1.call();
        phone1.sendMsg();
        phone1.info();
        
        Phone phone2 = new Phone();
        phone2.brand = "小米";
        phone2.cup = "骁龙835";
        phone2.screenSize = "12英寸";
        phone2.call();
        phone2.sendMsg();
        phone2.info();

        Phone phone3 = new Phone();
        phone3.brand = "小米";
        phone3.cup = "骁龙835";
        phone3.screenSize = "12英寸";
        phone3.sendMsg();
        phone3.call();
        phone3.info();

        DataHide dataHiden = new DataHide();
        dataHiden.publicFiled = "1";
        dataHiden.privateFiled = "2";
        dataHiden.publicMethod();
        dataHiden.privateMethod();
    }
}