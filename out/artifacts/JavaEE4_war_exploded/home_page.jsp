<%@ page import="db.Item" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: akimzhan
  Date: 14.04.2023
  Time: 21:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="css_and_js.jsp" %>
</head>
<body class="p-3">
<%@include file="navbar.jsp" %>

<div>

    <div class="row mt-3">
        <div class="col-12">
            <button type="button" class="btn btn-info btn-sm" data-bs-toggle="modal" data-bs-target="#addItem">
                + Добавит задание
            </button>

            <div class="modal fade" id="addItem" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
                 aria-labelledby="staticBackdropLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="/add-item" method="post">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="staticBackdropLabel">Новое задание</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <%@include file="add_form.jsp" %>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Закрыть</button>
                                <button type="submit" class="btn btn-primary">Добавить</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-12">
            <table class="table table-striped table-hover">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Наимнеование</th>
                    <th>Крайний срок</th>
                    <th>Выполнено</th>
                    <th style="width: 10%">Детали</th>
                </tr>
                </thead>
                <tbody>
                <%
                    ArrayList<Item> items = (ArrayList<Item>) request.getAttribute("items");
                    String ans = (String) request.getAttribute("done");
                    for (Item i : items) {

                %>
                <tr>

                    <td><%=i.getId()%>
                    </td>

                    <td><%=i.getName()%>
                    </td>

                    <td><%=i.getDeadlineDate()%>
                    </td>

                    <td><%=(i.getFinished().equals("yes")?"Да":"Нет")%>
                    <td>
                        <a href="/details?item_id=<%=i.getId()%>" class="btn btn-sm btn-success">DETAILS</a>
                    </td>

                </tr>
                <%
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>
</div>


</body>
</html>
