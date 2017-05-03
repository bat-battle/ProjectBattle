public class HelloBaseDateType{
    public static void main(String[] args) {
        byte __byte = (byte)128;
        byte __byteBinary = 0b1111111;
	byte __byteOctal = 03;
        byte __byteHex = 0x3; 

        short __short = 128; 

        int __intOctal = 011; 
        int __intHex = 0x55;
        
        long __long = 1234567L;
	char __char = '\u0060';
	float __float = 123.4f;
	double __double = 123.0000000D;

	double __doubleToInt = 123;
	int __intToDouble = (int)123.2D;
	
	System.out.println("__doubleToInt:" + __doubleToInt);
	System.out.println("__intToDouble:" + __intToDouble);
        System.out.println("__byte[十进制]:" + __byte);
        System.out.println("__byte[二进制]:" + __byteBinary);
        System.out.println("__byte[八进制]:" + __byteOctal);
        System.out.println("__byte[十六进制]:" + __byteHex);
        System.out.println("__short:" + __short);
        System.out.println("__intHex:" + __intHex);
        System.out.println("__intOctal:" + __intOctal);
        System.out.println("__long:" + __long);
        System.out.println("__char:" + __char);
        System.out.println("__float:" + __float);
        System.out.println("__double:" + __double);
	}
}
