package com.rain.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.rain.bean.AdminBean;
import com.rain.dao.AdminDao;
import com.rain.dao.ProblemDao;

/**
 * Servlet implementation class feedbackServlet
 */
@WebServlet("/AddProblemServlet")
public class AddProblemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddProblemServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		// 设置编码类型
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		HttpSession session = request.getSession();
		AdminBean adminbean = new AdminBean();
		// 获取存到session的aid
		String aid = (String) session.getAttribute("aid");
		AdminDao admindao = new AdminDao();
		// 通过aid获取到读者的信息
		adminbean = admindao.get_AidInfo2(aid);
		// 获取反馈问题的信息
		String name = request.getParameter("name");
		String page = request.getParameter("page");
		String body = request.getParameter("body");
		String phone = request.getParameter("phone");
		ProblemDao problemdao = new ProblemDao();
		// 调用函数存入反馈信息
		problemdao.addProblem(adminbean, name, page, body, phone);
		response.sendRedirect("/books/result.jsp");
	}

}
