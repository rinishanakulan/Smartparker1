
<%
  response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);

  if(session.getAttribute("user_id")==null)
      response.sendRedirect("login.jsp");

  %>
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
        String freeslot_id=request.getParameter("id");
        parker s=new parker();
        Connection con=s.getcon();
        Statement st=con.createStatement();
         st.executeUpdate("update slotregistration set status='free' where slot_id='"+freeslot_id+"'");
                
                
        %>
         <script>
         alert("slot free  successfully");
         window.location="adminhome.jsp"
         </script>
     
<form id="form1" name="form1" method="post" action="">
</form>
</body>
</html>