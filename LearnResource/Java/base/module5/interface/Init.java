class Init {
    public static void main(String[] args) {
        IPlayGame ip1 = new NDSL();
        IPlayGame ip2 = new SmartPhone();
        //IPlayGame ip3 = new CellPhone();
        IPlayGame ip4 = new IPlayGame(){
            public void playGame(){
                System.out.println("anonymousInnerClazz has play game features");
            }
        };

        ip1.playGame();
        ip2.playGame();
        //ip3.playGame();
        ip4.playGame();
    }
}

    