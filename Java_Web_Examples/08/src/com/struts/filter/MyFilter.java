package com.struts.filter;       		//��������������com.struts.filter����
import java.io.IOException;      		//����java.io.IOException��
import javax.servlet.Filter;			//����javax.servlet.Filter��
import javax.servlet.FilterChain;		//����javax.servlet.FilterChain��
import javax.servlet.FilterConfig;		//����avax.servlet.FilterConfig��
import javax.servlet.ServletException;	//����avax.servlet.ServletException��
import javax.servlet.ServletRequest;	//����javax.servlet.ServletRequest��
import javax.servlet.ServletResponse;	//����javax.servlet.ServletResponse��
public class MyFilter implements Filter {
      			
		
   public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
	    request.setCharacterEncoding("gb2312");   	//����request�ı����ʽ
	    response.setCharacterEncoding("gb2312");  	//����response�ı����ʽ
	    chain.doFilter(request, response);			//����FilterChain�����doFilter()����
		
	}
   public void init(FilterConfig arg0) throws ServletException {
   }                        //�÷�����Ϊ��
   public void destroy() {
							//destroy()�˷�����Ϊ��
	
  }
}
