<%-- 
    Document   : index
    Created on : Sep 10, 2017, 9:17:56 PM
    Author     : Mango
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="template.css" rel="stylesheet" type="text/css"/>
        <title>Tutor Me!</title>
    </head>
    <body>
        <%session.invalidate();    %>
        <div id="headerSection">
            <h1>UTSTutor</h1>
        </div>
        <hr>
        <table width="100%" align="center">
            <tr>
                <td align="center"><u><a href="register.jsp">Register</a></u></td>
            </tr> 
            <tr>
                <td align="center" ><u><a href="login.jsp">Login</a></u></td>
            </tr>   
        </table>

    </body>
</html>
