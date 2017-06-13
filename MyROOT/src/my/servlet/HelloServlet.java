package my.servlet;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @WebServlet("/URLmapping") ������̼��� ����ϸ� web.xml��
 * ���� ����� ���� �ʾƵ� �ȴ�.
 */
@WebServlet("/Hello")
public class HelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out=res.getWriter();
		out.println("<body>");
		out.println("<h1>Hello Servlet</h1>");
		out.println("<h1>�ȳ� Servlet</h1>");
		out.println("</body>");
		out.close();
	}

}





