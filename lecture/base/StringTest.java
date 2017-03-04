public class StringTest {

    public static void main(String []args) {
        String str = new String(" Hello World:java ");
        for (String s : str.split(" |:")) {
            System.out.println(s);
        }
        for (String s : str.trim().split(" |:")) {
            System.out.println(s);
        }

        System.out.println(str.contains("Wor"));
        System.out.println(str.startsWith("Helo"));
        System.out.println(str.endsWith("ld"));
        System.out.println(str.endsWith("l"));
        System.out.println(str.equalsIgnoreCase("HELLO WORLD"));
        System.out.println(String.format("%s \n", str));
        System.out.println(str.indexOf("W"));
        System.out.println(str.indexOf("o"));
        System.out.println(str.substring(str.indexOf("o"), str.lastIndexOf("o")));
        System.out.println(str.replace("Hello", "HO"));
        System.out.println(str.lastIndexOf("o"));
        System.out.println(str.indexOf(" "));
        System.out.println("".isEmpty());
        System.out.println(" ".isEmpty());
        System.out.println(str.toLowerCase());
        System.out.println(str.toUpperCase());
        System.out.println(String.valueOf(123));
        System.out.println(String.valueOf(false));
        System.out.println("false" == "false");
        System.out.println("false".equals("false"));

        String str1 = "";
        for (int i = 0; i < 100; i++) {
            // new String(i)
            // new String("stri")
            str1 += i;
        }
        System.out.println(str1);

        StringBuilder str2 = new StringBuilder(100);
        for (int i = 0; i < 100; i++) {
            //char []
            str2.append(i);
        }
        System.out.println(str2);

        StringBuilder str3 = new StringBuilder("123456789");
        System.out.println(str3.delete(2,5));
        System.out.println(str3.deleteCharAt(2));

        StringBuilder str4 = new StringBuilder("Hello World");
        System.out.println(str4.indexOf("o", 0));
        System.out.println(str4.indexOf("o", 5));
        System.out.println(str4.insert(2, "SSSSS"));
        System.out.println(str4.reverse());

        long begin = System.currentTimeMillis();
 	    long beginNS = System.nanoTime();
        for (int i = 0; i < 10000000; i++) {
        }
        long end = System.currentTimeMillis();
 	    long endNS = System.nanoTime();
        System.out.println(end - begin);
        System.out.println(endNS - beginNS);


    }
}
