<%-- 
    Document   : booking
    Created on : 15/09/2017, 9:17:40 PM
    Author     : Max
--%>

<%@page import="Models.Tutor"%>
<%@page import="Models.Student"%>
<%@page import="Models.Booking"%>
<%@page import="Models.Bookings"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Booking</title>
    </head>
    <body>
        <h1>Booking Page</h1>
        <% 
            String bookingsFilePath = application.getRealPath("bookings.xml");
            String tutorsFilePath = application.getRealPath("WEB-INF/tutors.xml");
        %>
        <jsp:useBean id="bookingApp" class="Applications.BookingApplication" scope="session">
            <jsp:setProperty name="bookingApp" property="filePath" value="<%=bookingsFilePath%>"/>
        </jsp:useBean>
        <jsp:useBean id="tutorApp" class="Applications.TutorApplication" scope="application">
<<<<<<< HEAD
            <jsp:setProperty name="tutorApp" property="filePath" value="<%=tutorsFilePath%>"/>
=======
            <jsp:setProperty name="tutorApp" property="filePath" value="<%=filePath2%>"/>
>>>>>>> bdc50f7ae52ad12e4191db981545b9a8b2d37151
        </jsp:useBean>
        <%
            Student student = (Student) session.getAttribute("student");
            Tutor tutor = (Tutor) session.getAttribute("tutor");
            String tutorid = request.getParameter("tutorid");
            if(tutorid != null){ %>
               <h1><%= tutorid %></h1>
            <%
                Tutor bookedTutor = tutorApp.getTutorFromID(tutorid);
                
                bookingApp.createBooking(bookedTutor, student);
                tutorApp.saveTutors();
            }
         %>
        <% if(student != null){
            %><a href="createBooking.jsp">Create Booking</a></br><%          
        } %>
        <%  Bookings bookings;
        if(student != null){
            bookings = bookingApp.getBookingsByStudent(student.getName());
        }
        else{
            bookings = bookingApp.getBookingsByTutor(tutor.getName());
        }
        if(bookings.getList().size() <= 0){ %>
            <p>You currently don't have any bookings.</p>
        <% }
        else
        { %>
            <h2>My Bookings</h2>
            <table>
                <thead>
                    <tr>
                        <th>Tutor Name</th>
                        <th>Tutor Email</th>
                        <th>Subject</th>
                        <th>Student Name</th>
                        <th>Student Email</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                <% for(Booking b : bookings.getList()){
                    %> <form action="viewBooking.jsp" method="GET"><tr>
                    <td><%= b.getTutorName() %></td>
                    <td><%= b.getTutorEmail() %></td>
                    <td><%= b.getSubject() %></td>
                    <td><%= b.getStudentName() %></td>
                    <td><%= b.getStudentEmail() %></td>
                    <td><%= b.getStatus() %></td>
                    <td><input type="submit" value="View" name="View"></td>
                    <td><input type="hidden" value="<%= b.getBookingID() %>" id="bookingID" name="bookingID"></td>
                    </tr></form>
                    <% } %>
                </tbody>
            </table>
        <% } %>
        <h2>All Bookings</h2>
        <table>
            <thead>
                <th>Tutor Name</th>
                <th>Tutor Email</th>
                <th>Subject</th>
                <th>Student Name</th>
                <th>Student Email</th>
                <th>Status</th>
            </thead>
            <tbody>
            <%  
                Bookings allBookings = bookingApp.getBookings();
                for(Booking b : allBookings.getList()){
            %> <form action="viewBooking.jsp" method="GET"><tr>
                    <td><%= b.getTutorName() %></td>
                    <td><%= b.getTutorEmail() %></td>
                    <td><%= b.getSubject() %></td>
                    <td><%= b.getStudentName() %></td>
                    <td><%= b.getStudentEmail() %></td>
                    <td><%= b.getStatus() %></td>
                    <td><input type="submit" value="View" name="View"></td>
                    <td><input type="hidden" value="<%= b.getBookingID() %>" id="bookingID" name="bookingID"></td>
                </tr></form>
            <% }
            %>
            </tbody>
        </table>
        <a href="main.jsp">Return to Main</a>
    </body>
</html>