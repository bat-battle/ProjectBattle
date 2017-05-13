import java.util.ArrayList;

class Female extends Human {
    @Override
    public void goPee() {
        System.out.println("Sit Down");
    }

    public static void main(String[] args) {
        Human[] group1 = new Human[4];
        group1[0] = new Female();
        group1[1] = new Male();
        group1[2] = new Female();
        group1[3] = new Male();
        for (Human person : group1) {
            person.goPee();
        }

        ArrayList<Human> group = new ArrayList<Human>();
        group.add(new Female());
        group.add(new Male());
        group.add(new Female());
        group.add(new Female());
        group.add(new Male());
        group.add(new Male());
        for (Human person : group) {
            person.goPee();
        }
    }
}