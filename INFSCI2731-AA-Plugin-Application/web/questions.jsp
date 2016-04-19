<%-- 
    Document   : questions
    Created on : Apr 2, 2016, 5:36:23 PM
    Author     : shao dai
--%>

<%@page import="dataAccessObject.ActivityLogDao"%>
<%@page import="model.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
    ActivityLogDao logDao = new ActivityLogDao();
    IPAddress ipAddress = new IPAddress();
    String sysSource = request.getRequestURI();
    String ipAddr = ipAddress.getClientIpAddress(request);
    if(session.getAttribute("resetPasswordObj") == null) {
        //log accesss attempt to this page without session attribute resetPasswordObj set
        logDao.logAccessAttempt(ipAddr, sysSource, "attempt to access question.jsp without session attribute resetPasswordObj set");
        
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Security Questions</title>
    </head>
    <body>
        <h1>Security Questions</h1>
        <p>Please answer this security question to continue</p>
        <% if (session.getAttribute("questionAttempts") != null && (Integer)session.getAttribute("questionAttempts") > 0) { %>
        <p>Your supplied answer does not match our records</p>
        <% } %>
        <form name="resetform-question" method="POST" action="AnswerQuestions">
            <div>${requestScope.question_string}</div>
            <input name="security_answer" placeholder="Your answer" />
            <input type="submit">
        </form>
    </body>
</html>
