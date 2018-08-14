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
 <jsp:include page="header1.jsp"/> 
    <%
        parker s=new parker();
         Connection con=s.getcon();
       Statement st=con.createStatement();
       ResultSet rs=null;
         rs=st.executeQuery("select * from userregistration");
    if(request.getParameter("button")!=null)
        {
          String name=request.getParameter("textfield");
          rs=st.executeQuery("select * from userregistration where firstname='"+name+"' or lastname='"+name+"'");
          
        }
    %>
<form id="form1" name="form1" method="post" action="">
  <table width="200" border="1">
    <tr>
      <td>Search</td>
      <td><label for="textfield"></label>
      <input type="text" name="textfield" id="textfield" /></td>
      <td><input type="submit" name="button" id="button" value="Search" /></td>
    </tr>
  </table>
  <table width="200" border="1">
    <tr>
      <td>Name</td>
      <td>Housename</td>
      <td>Place</td>
      <td>Districts</td>
      <td>States</td>
      <td>Pin </td>
      <td>Age</td>
      <td>Vehicle type</td>
      <td>Vehicle number</td>
      <td>Contact number</td>
      <td>Email_id</td>
    </tr>
      <%
       
      
       while(rs.next())
       {
      %>
    <tr>
      <td><%= rs.getString(3) %></td>
      <td><%= rs.getString(4) %></td>
      <td><%= rs.getString(5) %></td>
      <td><%= rs.getString(6) %></td>
      <td><%= rs.getString(7) %></td>
      <td><%= rs.getString(8) %></td>
      <td><%= rs.getString(9) %></td>
      <td><%= rs.getString(10) %></td>
      <td><%= rs.getString(11) %></td>
      <td><%= rs.getString(12) %></td>
      <td><%= rs.getString(14) %></td>
    </tr>
      <%}%>
  </table>
  <p>&nbsp;</p>
</form>
</body>
 <jsp:include page="footer1.jsp"/> 
</html>