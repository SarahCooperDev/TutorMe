<%-- 
    Document   : login
    Created on : Sep 10, 2017, 9:21:22 PM
    Author     : Mango
--%>

<%@page import="Models.Tutor"%>
<%@page import="Models.Tutors"%>
<%@page import="Models.Student"%>
<%@page import="Models.Students"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="template.css" rel="stylesheet" type="text/css"/>
        <title>Tutor Me!-Login</title>
    </head>
    <body>
    <% 
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String filePath = application.getRealPath("WEB-INF/students.xml");
        String filePath2 = application.getRealPath("WEB-INF/tutors.xml");
    %>
   
    <jsp:useBean id="studentApp" class="Applications.StudentApplication" scope="application">
        <jsp:setProperty name="studentApp" property="filePath" value="<%=filePath%>"/>
    </jsp:useBean>
    
    <jsp:useBean id="tutorApp" class="Applications.TutorApplication" scope="application">
        <jsp:setProperty name="tutorApp" property="filePath" value="<%=filePath2%>"/>
    </jsp:useBean>
    
    
    <%if(email==null && password==null){%>
        <h1>Login</h1>
        <form action="login.jsp" method="POST" id="loginForm">
             <table>
                
                <tr>
                    <td>Email:</td> 
                    <td><input type="text" name="email"> </td>
                </tr>
                <tr> 
                    <td>Password:</td> 
                    <td><input type="password" name="password"></td>
                </tr>
                <tr>
               <td></td> 
               <td><input type="submit" value="Login" name="Login"></td> 
           
                </tr>
             </table>
        </form>
        <hr>
           <p> Click <a href="register.jsp">here </a>to register. </p>
           <%}else{%>
           
           <%
            Students students = studentApp.getStudents();                               //Fetch current students and tutors. 
            Student student = students.login(email, password);
            
            Tutors tutors = tutorApp.getTutors();
            Tutor tutor = tutors.login(email, password);
        %>

        <% if (student != null) {                                                       // Upon successful match, activate session for appropriate user type and redirect to main.jsp
                session.setAttribute("tutor", null);
                session.setAttribute("student", student); 
                
                response.sendRedirect("main.jsp");
                %>
        <% }else if(tutor != null) {
            session.setAttribute("student", null);
             session.setAttribute("tutor", tutor); 
        response.sendRedirect("main.jsp");
        %>
             
        <% } else { %>
            <p> Username or password is incorrect. Click <a href="login.jsp">here </a>to retry. </p>
            <p> Alternatively, click <a href="register.jsp">here</a> to register. </p>
        <% }}%>
           
    </body>
</html>
