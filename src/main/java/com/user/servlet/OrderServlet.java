package com.user.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CartDAOImpl;
import com.DAO.ItemDAOImpl;
import com.DAO.ItemOrderImpl;
import com.DB.DBConnect;
import com.entity.Cart;
import com.entity.Item_Order;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
            HttpSession session=req.getSession();
             
			int id = Integer.parseInt(req.getParameter("id"));
			String name = req.getParameter("username");

			String email = req.getParameter("email");
			String phno = req.getParameter("phno");
			String address = req.getParameter("address");
			String landmark = req.getParameter("landmark");
			String city = req.getParameter("city");
			String state = req.getParameter("state");
			String pincode = req.getParameter("pincode");
			String paymentType = req.getParameter("payment");

			String fullAdd = address + "," + landmark + "," + city + "," + state + "," + pincode;

			// System.out.println(name+" "+email+" "+phno+" "+fullAdd+" "+paymentType);

			CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());

			List<Cart> ilist = dao.getItemByUser(id);
			
			if(ilist.isEmpty())
			{
				session.setAttribute("failedMsg", "Add Item");	
               resp.sendRedirect("checkout.jsp");				
			}
			else
			{
				ItemOrderImpl dao2 = new ItemOrderImpl(DBConnect.getConn());

				Item_Order o =null; 
				
			    ArrayList<Item_Order> orderList = new ArrayList<Item_Order>();
			    Random r = new Random();
				for (Cart c : ilist) {
					o=new Item_Order();	
					o.setOrderId("ITEM-ORD-00" + r.nextInt(1000));
					o.setUserName(name);
					o.setEmail(email);
					o.setPhno(phno);
					o.setFulladd(fullAdd);
					o.setItemName(c.getItemName());
					o.setCompany(c.getCompany());
					o.setPrice(c.getPrice() + "");
					o.setPaymentType(paymentType);
					orderList.add(o);

				}

				if ("noselect".equals(paymentType)) {
					session.setAttribute("failedMsg", "Choose Payment Type");
					resp.sendRedirect("checkout.jsp");
				} else {
					boolean f = dao2.saveOrder(orderList);

					if (f) {
						resp.sendRedirect("order_success.jsp");
						System.out.println("Order Success");
					} else {
						session.setAttribute("failedMsg", "Your Order Failed");
		   				resp.sendRedirect("checkout.jsp");

						//System.out.println("Order Failed");
					}
				}

			}	
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
