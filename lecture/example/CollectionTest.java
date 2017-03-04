
import java.util.LinkedList;
import java.util.List;
import java.util.HashSet;
import java.util.Iterator;
import java.util.TreeSet;
import java.util.Comparator;
import java.util.ArrayDeque;
import java.util.PriorityQueue;
import java.util.Vector;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

class CollectionTest {

    void dump(List<String> list) {
        for(String s : list) {
            System.out.println(s);
        }
        System.out.println("--------------------------");
    }

    void print(String str) {
        System.out.println(str);
    }

    void testLinkeList() {
        LinkedList<String> list = new LinkedList<String>();
        list.add("a");
        list.add("b");
        list.add("c");
        list.add("d");
        dump(list);
        list.remove("c");
        dump(list);
        String str = list.peek();
        print(str);
        dump(list);
        str = list.peekFirst();
        print(str);
        dump(list);
        str = list.peekLast();
        print(str);
        dump(list);
        str = list.poll();
        print(str);
        dump(list);
        str = list.pollFirst();
        print(str);
        dump(list);
    }

    void testHashSet() {
        LinkedList<String> list = new LinkedList<String>();
        list.add("a");
        list.add("a");
        list.add("a");
        list.add("b");
        list.add("c");
        list.add("d");
        HashSet<String> set = new HashSet<String>(list);
        dump(set.iterator());
        set.add("e");
        System.out.println(set.isEmpty());
        System.out.println(set.contains("a"));
        System.out.println(set.contains("f"));
        System.out.println(set.size());
        set.clear();
        dump(set.iterator());
    }

    void dump(Iterator<String> iter) {
        while (iter.hasNext()) {
            String str = iter.next();
            System.out.println(str);
        }
        System.out.println("----------------------------");
    }

    class StringComparator implements Comparator<String> {
        @Override
        public int compare(String str1, String str2) {
            int ret = str1.compareTo(str2);
            return -ret;
        }
    }

    class StudentComparator implements Comparator<Student> {
        @Override
        public int compare(Student st1, Student st2) {
            if (st1.getNum() < st2.getNum()) {
                return -1;
            } else {
                return 1;
            }
        }
    }

    void dumpStudent(Iterator<Student> iter) {
        while (iter.hasNext()) {
            Student st = iter.next();
            System.out.println("num:"+ st.getNum() + " name:" + st.getName());
        }
        System.out.println("----------------------------");
    }


    void testTreeSet1() {
        //TreeSet<Student> list = new TreeSet<Student>();
        TreeSet<Student> list = new TreeSet<Student>(new StudentComparator());
        list.add(new Student(1608103, "Jack"));
        list.add(new Student(1608102, "John"));
        list.add(new Student(1608101, "Susan"));
        dumpStudent(list.iterator());
    }

    void testTreeSet() {
        LinkedList<String> list = new LinkedList<String>();
        list.add("a");
        list.add("b");
        list.add("e");
        list.add("f");
        list.add("f");
        list.add("f");
        Iterator<String> iter = list.iterator();

        //TreeSet<String> tSet = new TreeSet<String>(
        //        new Comparator<String>() {
        //            public int compare(String str1, String str2) {
        //                int ret = str1.compareTo(str2);
        //                return -ret;
        //            }
        //        }
        //);
        TreeSet<String> tSet = new TreeSet<String>(new StringComparator());
        tSet.addAll(list);
        dump(tSet.iterator());
        dump(tSet.descendingIterator());
        tSet.add("g");
        dump(tSet.iterator());
        print(tSet.ceiling("c"));
        print(tSet.ceiling("e"));
        print(tSet.floor("c"));
        print(tSet.floor("e"));
        print(tSet.first());
        print(tSet.last());
        print(tSet.higher("c"));
        print(tSet.higher("e"));
        print(tSet.lower("c"));
        print(tSet.lower("e"));
    }

    void testDeque() {
        LinkedList<String> list = new LinkedList<String>();
        list.add("a");
        list.add("b");
        list.add("e");
        list.add("f");
        list.add("f");
        list.add("f");
        ArrayDeque<String> dqueue = new ArrayDeque<String>(list);
        dqueue.add("g");
        dump(dqueue.iterator());
        dqueue.addFirst("i");
        dqueue.addLast("j");
        dump(dqueue.iterator());
        print(dqueue.getFirst());
        print(dqueue.getLast());
        dump(dqueue.iterator());
        dqueue.offer("k");
        print(dqueue.peek());
        dump(dqueue.iterator());
        print(dqueue.poll());
        dump(dqueue.iterator());
        print(dqueue.remove());
        dump(dqueue.iterator());
        print(dqueue.removeFirst());
        dump(dqueue.iterator());
    }

    void testPriorityQueue() {
        TreeSet<Student> tSet = new TreeSet<Student>(new StudentComparator());
        tSet.add(new Student(1608103, "Jack"));
        tSet.add(new Student(1608102, "John"));
        tSet.add(new Student(1608101, "Susan"));
        dumpStudent(tSet.iterator());
        PriorityQueue<Student> pqueue = new PriorityQueue<Student>(tSet);
        dumpStudent(pqueue.iterator());
    }

    void testVector() {
        Vector<String> vec = new Vector<String>();
        for (int i = 0; i < 10; i++) {
            vec.add(String.valueOf(i));
        }
        dump(vec.iterator());
        List<String> subVec = vec.subList(2, 5);
        String []subVecArray = vec.toArray(new String[10]);
        for (String s : subVecArray) {
            System.out.println(s);
        }
        System.out.println("--------------------------");
        dump(subVec.iterator());
        Iterator<String> iter = subVec.iterator();
        while(iter.hasNext()) {
            iter.next();
            iter.remove();
        }
        dump(vec.iterator());
        for (String s : subVecArray) {
            System.out.println(s);
        }
    }

    void dumpMap(Map<Integer, Student> map) {
        Set<Entry<Integer, Student>> set = map.entrySet();
        Iterator<Entry<Integer, Student>> iter = set.iterator();
        while(iter.hasNext()) {
            Entry<Integer, Student> entry = iter.next();
            System.out.println("key:" + entry.getKey() + " value" + entry.getValue());
        }
    }

    void testHashMap() {
        HashMap<Integer, Student> map = new HashMap<Integer, Student>(5);
        Student st1 = new Student(1608103, "Jack");
        Student st2 = new Student(1608102, "John");
        Student st3 = new Student(1608101, "Susan");
        map.put(st1.getNum(), st1);
        map.put(st2.getNum(), st2);
        map.put(st3.getNum(), st3);
        System.out.println(map.containsKey(st1.getNum()));
        System.out.println(map.containsKey(1608104));
        System.out.println(map.containsValue(new Student(1608104, "Jn")));
        System.out.println(map.containsValue(st3));
        dumpMap(map);
        dumpStudent(map.values().iterator());
        map.remove(st1.getNum());
        dumpMap(map);
    }

    public static void main(String []args) {
        //new CollectionTest().testHashSet();
        //new CollectionTest().testTreeSet();
        //new CollectionTest().testTreeSet1();
        //new CollectionTest().testDeque();
        //new CollectionTest().testPriorityQueue();
        //new CollectionTest().testVector();
        new CollectionTest().testHashMap();
    }
}


class Student implements Comparable<Student> {
    int num;
    String name;

    Student(int num, String name) {
        this.num = num;
        this.name = name;
    }

    @Override
    public int compareTo(Student o) {
        if (num > o.getNum()) {
            return -1;
        } else if (num == o.getNum()) {
            return 0;
        } else {
            return 1;
        }
    }

    public int getNum() {
        return num;
    }

    public String getName() {
        return name;
    }


    @Override
    public int hashCode() {
        int result = 1;
        return num + result * 31;
        //return num * result + name.hashCode();
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj == null) {
            return false;
        }

        if (!(obj instanceof Student))
            return false;
        Student other = (Student) obj;

        if (num != other.num) {
            return false;
        }
        //if (name == null) {
        //    if (other.name != null)
        //        return false;
        //} else if (!name.equals(other.name)) {
        //    return false;
        //}
        return true;
    }

    @Override
    public String toString() {
        return new StringBuilder(20)
            .append("[")
            .append("num: ").append(num).append(",")
            .append("name: ").append(name)
            .append("]").toString();
    }
}














