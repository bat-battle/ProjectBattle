public class GradeLevel{
   public static void main( String args[] ){
      System.out.println("\n**** first situation ****");
	   char grade='C';
	   switch( grade ){
	     case 'A' : 
		System.out.println(grade+" is 85~100");break;
	     case 'B' : 
		System.out.println(grade+" is 70~84");break;
	     case 'C' : 
		System.out.println(grade+" is 60~69");break;
         case 'D' : 
		System.out.println(grade+" is <60");break;
         default : System.out.println("input error");
	  }
   }
}