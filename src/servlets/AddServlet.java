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

@WebServlet(value = "/add-item")
public class AddServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("itemName");
        String description = req.getParameter("itemDescription");
        String date = req.getParameter("itemDate").replace('-','.');

        DateTimeFormatter oldFormat = DateTimeFormatter.ofPattern("yyyy.MM.dd");
        DateTimeFormatter newFormat = DateTimeFormatter.ofPattern("dd.MM.yyyy");
        String dateNew = LocalDate.parse(date, oldFormat).format(newFormat);

        Item item = new Item();
        item.setName(name);
        item.setDescription(description);
        item.setDeadlineDate(dateNew);
        item.setFinished("no");

        DBManager.addItem(item);

        resp.sendRedirect("/");
    }
}
