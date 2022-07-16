package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CartDAOImpl;
import com.DAO.ItemDAOImpl;
import com.DB.DBConnect;
import com.entity.Cart;
import com.entity.ItemDtls;

@WebServlet("/cart1")
public class Cart1Servlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int iid = Integer.parseInt(req.getParameter("iid"));
			int uid = Integer.parseInt(req.getParameter("uid"));

			ItemDAOImpl dao = new ItemDAOImpl(DBConnect.getConn());
			ItemDtls it = dao.getItemById(iid);

			Cart c = new Cart();
			c.setIid(iid);
			c.setUserId(uid);
			c.setItemName(it.getItemName());
			c.setCompany(it.getCompany());
			c.setPrice(Double.parseDouble(it.getPrice()));
			c.setTotalPrice(Double.parseDouble(it.getPrice()));

			CartDAOImpl dao2 = new CartDAOImpl(DBConnect.getConn());
			boolean f = dao2.addCart(c);

			HttpSession session = req.getSession();

			if (f) {
				session.setAttribute("addCart", "Item Added to cart");
				resp.sendRedirect("all_Stationary_item.jsp");
				
			} else {
				
				session.setAttribute("failed", "Something Wrong on server");
				resp.sendRedirect("all_new_item.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
}
