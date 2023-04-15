<%@ page import="java.util.ArrayList" %>
<%@ page import="db.Item" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.LocalDate" %>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="css_and_js.jsp" %>
</head>
<body class="p-3">


<%@include file="navbar.jsp" %>
<%
    Item item = (Item) request.getAttribute("item");

    String dateOld = item.getDeadlineDate();
    DateTimeFormatter oldFormat = DateTimeFormatter.ofPattern("yyyy.MM.dd");
    DateTimeFormatter newFormat = DateTimeFormatter.ofPattern("dd.MM.yyyy");


    String dateNew = LocalDate.parse(dateOld, newFormat).format(oldFormat).replace('.', '-');


%>
<div class="container px-5">
    <div class="row">
        <div class="col-12">
            <form action="/edit-item" method="post">

                <input type="hidden" name="item_id" value="<%=item.getId()%>">

                <div class="row mt-3">
                    <div class="col-12">
                        <label>Наименование: </label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <input type="text" class="form-control" name="edit_itemName" value="<%=item.getName()%>">
                    </div>
                </div>


                <div class="row mt-3">
                    <div class="col-12">
                        <label>Описание: </label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <textarea class="form-control" name="edit_itemDescription"
                                  rows="5"><%=item.getDescription() + item.getFinished() %></textarea>
                    </div>
                </div>


                <div class="row mt-3">
                    <div class="col-12">
                        <label>Крайний срок: </label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <input type="date" class="form-control" name="edit_itemDate" value="<%=dateNew%>">
                    </div>
                </div>


                <div class="row mt-3">
                    <div class="col-12">
                        <label>Выполнено: </label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <select class="form-select" name="item_done">
                            <option <%=(item.getFinished().equals("yes") ? "selected" : "")%> value="yes">Да</option>
                            <option <%=(item.getFinished().equals("no") ? "selected" : "")%> value="no">Нет</option>
                        </select>
                    </div>
                </div>


                <div class="row">
                    <div class="col-2">
                        <button type="submit" class="btn btn-primary mt-3">
                            Изменить
                        </button>
                    </div>
                </div>

            </form>
            <div class="row">
                <div class="col-2">

                    <button type="button" class="btn btn-danger mt-3" data-bs-toggle="modal"
                            data-bs-target="#deleteItem">
                        - Удалить
                    </button>

                    <div class="modal fade" id="deleteItem" data-bs-backdrop="static" data-bs-keyboard="false"
                         tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <form action="/delete-item" method="post">
                                    <input type="hidden" name="delete_item_id" value="<%=item.getId()%>">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="staticBackdropLabel">Modal title</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <h5>Are you sure?</h5>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">NO
                                        </button>
                                        <button type="submit" class="btn btn-danger">YES</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
