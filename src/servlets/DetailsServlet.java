package servlets;

import db.DBManager;
import db.Item;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(value = "/details")
public class DetailsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int id = -1;

        try{
            id = Integer.parseInt(req.getParameter("item_id"));
        }catch (Exception e) {

        }


        Item item = DBManager.getItem(id);

        req.setAttribute("item",item);

        req.getRequestDispatcher("/details_page.jsp").forward(req,resp);
    }
}
