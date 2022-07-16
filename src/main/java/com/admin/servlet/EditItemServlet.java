package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.ItemDAOImpl;
import com.DB.DBConnect;
import com.entity.ItemDtls;

@WebServlet("/edititems")
public class EditItemServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int bookId = Integer.parseInt(req.getParameter("id"));
			String itemName = req.getParameter("iname");
			String company = req.getParameter("company");
			String price = req.getParameter("price");
			String status = req.getParameter("status");

			ItemDtls it = new ItemDtls();
			it.setItemId(bookId);
			it.setItemName(itemName);
			it.setCompany(company);
			it.setPrice(price);
			it.setStatus(status);

			ItemDAOImpl dao = new ItemDAOImpl(DBConnect.getConn());
			boolean f = dao.updateEditItems(it);

			HttpSession session = req.getSession();

			if (f) {
				session.setAttribute("succMsg", "Item update Successfully..");
				resp.sendRedirect("admin/view_items.jsp");
			} else {
				session.setAttribute("failedMsg", "Something wrong on server");
				resp.sendRedirect("admin/view_items.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
