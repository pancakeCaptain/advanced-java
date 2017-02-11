<%@ page errorPage="WEB-INF/ErrorPage.jsp"
    import="java.util.Iterator, com.apress.faq.*" %>

<html>
<head>
    <title>Java FAQ Welcome Page</title>
</head>
<body>
<h1>Java FAQ Welcome Page</h1>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
%>
You are not yet registered, please
<a href="RegistrationForm.html">register</a>.
<%
    } else {
%>
Welcome to the Java FAQ

<%! FaqCategories faqs = new FaqCategories(); %>
Click a link below for answers to the given topic.
<%
    Iterator categories = faqs.getAllCategories();
    while (categories.hasNext()) {
        String category = (String) categories.next();
%>
<p>
    <a href="<%= replaceUnderscore(category) %>.jsp"><%= category %></a>
</p>
<%
    }
%>

<%@ include file="WEB-INF/Footer.jspf" %>
<%
    }
%>
</body>
</html>

<%!
    public String replaceUnderscore(String s) {
        return s.replace(' ', '_');
    }
%>