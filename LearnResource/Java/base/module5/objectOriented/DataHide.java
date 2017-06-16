class DataHide {
    private String privateFiled;
    public String publicFiled;

    private void privateMethod() {
        System.out.println("privateMethod invoke");
    }

    public void publicMethod() {
        System.out.println("publicMethod invoke");
    }
}