package com.admin.servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DAO.ItemDAOImpl;
import com.DB.DBConnect;
import com.entity.ItemDtls;

@WebServlet("/add_items")
@MultipartConfig
public class ItemsAdd extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String itemName = req.getParameter("iname");
			String company = req.getParameter("company");
			String price = req.getParameter("price");
			String categories = req.getParameter("categories");
			String status = req.getParameter("status");
			Part part = req.getPart("iimg");
			String filename = part.getSubmittedFileName();

			ItemDtls it = new ItemDtls(itemName, company, price, categories, status, filename, "admin");
			// System.out.println(it);

			ItemDAOImpl dao = new ItemDAOImpl(DBConnect.getConn());

			boolean f = dao.addItems(it);

			HttpSession session = req.getSession();

			if (f) {
				String path = getServletContext().getRealPath("") + "items";
				File file = new File(path);

				part.write(path + File.separator + filename);

				session.setAttribute("succMsg", "Book Add Sucessfully");
				resp.sendRedirect("admin/add_items.jsp");
			} else {
				session.setAttribute("failedMsg", "Something wrong on Server");
				resp.sendRedirect("admin/add_items.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
