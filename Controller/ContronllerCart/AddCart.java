package ContronllerCart;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ModelBean.Cart;

import ModelService.XuLiGioHang;

/**
 * Servlet implementation class AddCart
 */
@WebServlet("/AddCart")
public class AddCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddCart() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//lấy ra số lượng trong trang chi tiết sản phẩm
		int MaSP=Integer.parseInt(request.getParameter("MaSP"));
		int sl =0;
		if(request.getParameter("SoLuong")==null)
			 sl = 1;
		else
			sl =Integer.parseInt(request.getParameter("SoLuong"));
		HttpSession session = request.getSession();
        XuLiGioHang xlgh=new XuLiGioHang();
        
        
        
        String kt="";
        ResultSet rs= xlgh.KiemTraSoLuong(MaSP, sl);
        try {
			while(rs.next())
			{
				kt=rs.getString("kiemtra");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        if(kt.equals("1"))
        {
    		response.setContentType("text/plain");
    		response.setCharacterEncoding("UTF-8");
    		response.getWriter().write(kt);
        	return;
        }

        
        
        //lấy ra  giỏ hàng
        List<Cart> listGH = xlgh.LayGioHang(request);
        //kiểm tra sản phẩm này tồn tại trong giỏ hàng hay chưa
        Cart Sp=new Cart();
        Sp=null;
        for(int i=0;i<listGH.size();i++) {
        	if(listGH.get(i).getMaSP()==MaSP)
        	{
        		Sp=listGH.get(i);
        		break;
        	}
        }
        if(Sp == null)//nếu sản phẩm chưa tồn tại trong giỏ hàng thì tạo mới giỏ hàng và thêm sản phẩm vào
        {
        	Sp = new Cart(MaSP);
        	Sp.setSoLuong(sl);
            listGH.add(Sp);//thêm sản phẩm đó vào giỏ
            session.setAttribute("GioHang", listGH);
			session.setAttribute("SLIConGH", xlgh.TongSoLuong(request));
        }
        else//nếu có rồi thì cập nhật số lượng
        {
        	Sp.setSoLuong(Sp.getSoLuong()+sl);//SoLuong sẽ bằng 1 khi nó ở trang sản phẩm.
            request.getSession().setAttribute("GioHang", listGH);		
            session.setAttribute("SLIConGH", xlgh.TongSoLuong(request));
        }		
		response.setContentType("text/plain");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(kt);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
