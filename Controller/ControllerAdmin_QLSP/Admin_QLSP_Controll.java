package ControllerAdmin_QLSP;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ModelBean.SanPham;
import ModelBean.ThuongHieu;
import ModelBean.HoaDonNhap;
import ModelService.Admin_QLSP_XulyTT;

/**
 * Servlet implementation class Admin_QLSP_Controll
 */
@WebServlet("/Admin_QLSP_Controll")
public class Admin_QLSP_Controll extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Admin_QLSP_Controll() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher dispatcher= request.getRequestDispatcher("Admin_QLSP.jsp");
		Admin_QLSP_XulyTT control_SP = new Admin_QLSP_XulyTT();
		
		ResultSet DSSP = control_SP.Funct_Admin_BangTTSanPham();		
		request.getSession().setAttribute("Funct_Admin_BangTTSanPham", DSSP);
		
		SanPham[] outstock= control_SP.Funct_Admin_DSSP_OutofStock();
		request.getSession().setAttribute("Funct_Admin_DSSP_OutofStock", outstock);
		
		ThuongHieu[] dsth = control_SP.Funct_Admin_DSThHieu();
		request.getSession().setAttribute("Funct_Admin_DSThHieu", dsth);
		
		HoaDonNhap[] dshdn = control_SP.Funct_Admin_DS_HDN();
		request.getSession().setAttribute("Funct_Admin_DS_HDN", dshdn);
		
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Admin_QLSP_XulyTT control_SP = new Admin_QLSP_XulyTT();
		int masp = Integer.parseInt(request.getParameter("MaSP"));
		
		
		
		int flag = Integer.parseInt(request.getParameter("FLAG"));
		switch(flag)
		{
		case 0:
			control_SP.Proc_Admin_XoaSP(masp);
			response.getWriter().print("Delete successfull !");
			break;
		}
	}

}
