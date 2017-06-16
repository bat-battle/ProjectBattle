import java.awt.GridLayout;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.BitSet;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Scanner;
import java.util.TreeSet;
import java.util.Vector;
import java.util.concurrent.locks.Condition;

import javax.swing.*;



class Intro {
    public static void main(String[] args) {
        try {
            Runnable r = new MyCollection();
            Thread thread = new Thread(r);
            thread.interrupt();
            thread.sleep(1000);
            thread.start();
            System.out.println(thread.getState());
        } catch (InterruptedException e) {
            System.out.println(e);
        }
        // long start = System.currentTimeMillis();
        // int number = 20000;
        // BitSet bs = new BitSet(number + 1);
        // for (int i = 0; i < number; i++) {
        //     if (i % 2 == 0) {
        //         bs.set(i);
        //     } else {
        //         bs.clear(i);
        //     }
        //     System.out.println(bs.get(i));
        // }
        // long end = System.currentTimeMillis();
        // System.out.println((end - start) + "milliseconds");

        // JFrame frame = new JFrame();
        // JPanel panel = new JPanel();
        // JTextArea textArea = new JTextArea();

        // panel.setLayout(new GridLayout());
        // textArea.setText("test");
        // //当TextArea里的内容过长时生成滚动条  
        // panel.add(new JScrollPane(textArea));
        // frame.add(panel);

        // frame.setSize(200, 200);
        // frame.setVisible(true);
        // String[] list = new String[5];
        // list[0] = "ABob";
        // list[1] = "CBob";
        // list[2] = "BBob";
        // list[3] = "ZBob";
        // list[4] = "DBob";
        // Arrays.sort(list, Collections.reverseOrder());
        // for (String s : list) {
        //     System.out.println(s);
        // }
        // Map staff = new LinkedHashMap();
        // staff.put("kiro1", "1");
        // staff.put("kiro2", "2");
        // staff.put("kiro3", "3");
        // staff.put("kiro4", "4");
        // staff.keySet().iterator();
        // TreeSet<String> ts = new TreeSet<>();
        // ts.add("Bob");
        // ts.add("Acorn");
        // ts.add("Cdir");
        // for (String s : ts) {
        //     System.out.print(s);
        // }
    }

    public int add() {
        System.out.println("override add");
        return 1;
    }
}

class MyCollection implements Runnable {
    public void run() {
        Thread th = new Thread();
        System.out.println(th.getState());
        System.out.println("MyCollection run ");
    }
}