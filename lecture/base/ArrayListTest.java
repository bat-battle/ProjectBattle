
import java.util.ArrayList;
import java.util.Iterator;

class ArrayListTest {

    public static void main(String []args) {
        ArrayList<String> array = new ArrayList<String>();
        array.add("1");
        array.add("2");
        array.add("3");
        array.add("4");
        array.add("5");
        Iterator<String> iter = array.iterator();
        iter.next();
        while(iter.hasNext()) {
            iter.remove();
        }
    }
}
