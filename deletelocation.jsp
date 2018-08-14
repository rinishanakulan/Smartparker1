<%@page import="parkerpackage.parker"%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>

<body>

    <%
        String parking_id=request.getParameter("id");
        parker s=new parker();
        Connection con=s.getcon();
        Statement st=con.createStatement();
        st.executeUpdate("delete from parkinglocation where parking_id='"+parking_id+"'");
                response.sendRedirect("viewlocation.jsp");
                
        %>
</body>

</html>