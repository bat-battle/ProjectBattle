package com.action;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.dao.*;
import com.actionForm.*;

public class Borrow extends HttpServlet {
	/******************�ڹ��췽����ʵ����Borrow����Ӧ�õĳ־ò���Ķ���**************************/
	   private BorrowDAO borrowDAO = null;
	   private ReaderDAO readerDAO=null;
	   private BookDAO bookDAO=null;
	   private ReaderForm readerForm=new ReaderForm();
	   public Borrow() {
	       this.borrowDAO = new BorrowDAO();
	       this.readerDAO=new ReaderDAO();
	       this.bookDAO=new BookDAO();
	   }
	/******************************************************************************************/
	   public void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
	        String action =request.getParameter("action");
	        if(action==null||"".equals(action)){
	            request.setAttribute("error","���Ĳ�������");
	            request.getRequestDispatcher("error.jsp").forward(request, response);
	        }else if("bookBorrowSort".equals(action)){
	            bookBorrowSort(request,response); 
	        }else if("bookborrow".equals(action)){
	            bookborrow(request,response);  //ͼ�����
	        }else if("bookrenew".equals(action)){
	            bookrenew(request,response);  //ͼ������
	        }else if("bookback".equals(action)){
	            bookback(request,response);  //ͼ��黹
	        }else if("Bremind".equals(action)){
	            bremind(request,response);  //���ĵ�������
	        }else if("borrowQuery".equals(action)){
	            borrowQuery(request,response);  //������Ϣ��ѯ
	        }
	    }
    /*********************ͼ���������***********************/
    private void bookBorrowSort(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
        request.setAttribute("bookBorrowSort",borrowDAO.bookBorrowSort());
        request.getRequestDispatcher("bookBorrowSort.jsp").forward(request, response);
    }
 /*********************ͼ����Ĳ�ѯ***********************/
    private void borrowQuery(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
        String str=null;
        String flag[]=request.getParameterValues("flag");
        if (flag!=null){
            String aa = flag[0];
            if ("a".equals(aa)) {
                if (request.getParameter("f") != null) {
                    str = request.getParameter("f") + " like '%" +
                          request.getParameter("key") + "%'";
                }
            }
            if ("b".equals(aa)) {
                String sdate = request.getParameter("sdate");
                String edate = request.getParameter("edate");
                if (sdate != null && edate != null) {
                    str = "borrowTime between '" + sdate + "' and '" + edate +
                          "'";
                }
                System.out.println("����" + str);
            }
            //ͬʱѡ�����ں��������в�ѯ
            if (flag.length == 2) {
                if (request.getParameter("f") != null) {
                    str = request.getParameter("f") + " like '%" +
                          request.getParameter("key") + "%'";
                }
                System.out.println("���ں�����");
                String sdate = request.getParameter("sdate");
                String edate = request.getParameter("edate");
                String str1 = null;
                if (sdate != null && edate != null) {
                    str1 = "borrowTime between '" + sdate + "' and '" + edate +
                           "'";
                }
                str = str + " and borr." + str1;
                System.out.println("���������ڣ�" + str);
            }
        }
        request.setAttribute("borrowQuery",borrowDAO.borrowQuery(str));
       System.out.print("������ѯͼ�������Ϣʱ��str:"+str);
       request.getRequestDispatcher("borrowQuery.jsp").forward(request, response);
    }
    /*********************��������***********************/
    private void bremind(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
        request.setAttribute("Bremind",borrowDAO.bremind());
        request.getRequestDispatcher("bremind.jsp").forward(request, response);
    }

    /*********************ͼ�����***********************/
    private void bookborrow(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
        //��ѯ������Ϣ
        readerForm.setBarcode(request.getParameter("barcode"));
        ReaderForm reader = (ReaderForm) readerDAO.queryM(readerForm);
        request.setAttribute("readerinfo", reader);
        //��ѯ���ߵĽ�����Ϣ
        request.setAttribute("borrowinfo",borrowDAO.borrowinfo(request.getParameter("barcode")));
        //��ɽ���
        String f = request.getParameter("f");
        String key = request.getParameter("inputkey");
        if (key != null && !key.equals("")) {
            String operator = request.getParameter("operator");
            BookForm bookForm=bookDAO.queryB(f, key);
            if (bookForm!=null){
                int ret = borrowDAO.insertBorrow(reader, bookDAO.queryB(f, key),
                                                 operator);
                if (ret == 1) {
                    request.setAttribute("bar", request.getParameter("barcode"));
                    request.getRequestDispatcher("bookBorrow_ok.jsp").forward(request, response);

                } else {
                    request.setAttribute("error", "��ӽ�����Ϣʧ��!");
                    request.getRequestDispatcher("error.jsp").forward(request, response);
                }
            }else{
                request.setAttribute("error", "û�и�ͼ��!");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
        }else{
        	request.getRequestDispatcher("bookBorrow.jsp").forward(request, response);
        }
    }
    /*********************ͼ��̽�***********************/
    private void bookrenew(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
        //��ѯ������Ϣ
        readerForm.setBarcode(request.getParameter("barcode"));
        ReaderForm reader = (ReaderForm) readerDAO.queryM(readerForm);
        request.setAttribute("readerinfo", reader);
        //��ѯ���ߵĽ�����Ϣ
        request.setAttribute("borrowinfo",borrowDAO.borrowinfo(request.getParameter("barcode")));
         if(request.getParameter("id")!=null){
             int id = Integer.parseInt(request.getParameter("id"));
             if (id > 0) { //ִ�м̽����
                 int ret = borrowDAO.renew(id);
                 if (ret == 0) {
                     request.setAttribute("error", "ͼ��̽�ʧ��!");
                     request.getRequestDispatcher("error.jsp").forward(request, response);
                 } else {
                     request.setAttribute("bar", request.getParameter("barcode"));
                     request.getRequestDispatcher("bookRenew_ok.jsp").forward(request, response);
                 }
             }
         }else{
        	 request.getRequestDispatcher("bookRenew.jsp").forward(request, response);
         }
    }
    /*********************ͼ��黹***********************/
    private void bookback(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
        //��ѯ������Ϣ
        readerForm.setBarcode(request.getParameter("barcode"));
        ReaderForm reader = (ReaderForm) readerDAO.queryM(readerForm);
        request.setAttribute("readerinfo", reader);
        //��ѯ���ߵĽ�����Ϣ
        request.setAttribute("borrowinfo",borrowDAO.borrowinfo(request.getParameter("barcode")));
         if(request.getParameter("id")!=null){
             int id = Integer.parseInt(request.getParameter("id"));
             String operator=request.getParameter("operator");
             if (id > 0) { //ִ�й黹����
                 int ret = borrowDAO.back(id,operator);
                 if (ret == 0) {
                     request.setAttribute("error", "ͼ��黹ʧ��!");
                     request.getRequestDispatcher("error.jsp").forward(request, response);
                 } else {
                     request.setAttribute("bar", request.getParameter("barcode"));
                     request.getRequestDispatcher("bookBack_ok.jsp").forward(request, response);
                 }
             }
         }else{
        	 request.getRequestDispatcher("bookBack.jsp").forward(request, response);
         }
    }
	public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {

doGet(request, response);
}
}
