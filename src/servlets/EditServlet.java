package servlets;

import db.DBManager;
import db.Item;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

@WebServlet(value = "/edit-item")
public class EditServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("item_id"));
        String name = req.getParameter("edit_itemName");
        String description = req.getParameter("edit_itemDescription");
        String done = req.getParameter("item_done");

        String dateOld = req.getParameter("edit_itemDate").replace('-','.');
        DateTimeFormatter oldFormat = DateTimeFormatter.ofPattern("yyyy.MM.dd");
        DateTimeFormatter newFormat = DateTimeFormatter.ofPattern("dd.MM.yyyy");
        String dateNew = LocalDate.parse(dateOld, oldFormat).format(newFormat);


        Item item = new Item();
        item.setId(id);
        item.setName(name);
        item.setDescription(description);
        item.setDeadlineDate(dateNew);
        item.setFinished(done);

        DBManager.updateItem(item);


        resp.sendRedirect("/");

    }
}
