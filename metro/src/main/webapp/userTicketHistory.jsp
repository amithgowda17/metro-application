<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ page isELIgnored="false" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <html>

        <head>
            <link rel="icon" type="image/x-icon" href="https://www.x-workz.in/Logo.png" />
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-..." crossorigin="anonymous">
        </head>

        <body>
            <header class="bg-dark text-white py-3">
                <div class="d-flex justify-content-between align-items-center">
                    <img src="https://www.x-workz.in/Logo.png" alt="Coders World Logo" style="max-height: 50px;">
                    <h1 class="text-center mb-0 flex-grow-1"></h1>
                </div>
            </header>

            <form action="findTicketId">
                <input type="number" name="ticketId" id="ticketId" placeHolder="enter a ticket Id" class="form-control"
                    hidden>
            </form>

            <h5 style="text-align:center">Ticket Booking Details</h5>
            <table class="table table-hover mx-auto rounded-3" style="width: 60%;">
                <thead style="background-color: #6f42c1; color: white;" class="rounded-top">
                    <tr>
                        <th>ticketId</th>
                        <th>userId</th>
                        <th>source</th>
                        <th>destination</th>
                        <th>price</th>
                        <th>tokenNumber</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="ticket" items="${ticketDto}">
                        <tr>
                            <td>${ticket.ticketId}</td>
                            <td>${ticket.userId}</td>
                            <td>${ticket.source}</td>
                            <td>${ticket.destination}</td>
                            <td>${ticket.price}</td>
                            <td>${ticket.tokenNumber}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <footer class="bg-dark text-white py-3 fixed-bottom">
                <div class="container text-center">
                </div>
            </footer>
        </body>

        </html>