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
<form id="form1" name="form1" method="post" action="">
  <table width="529" border="1">
    <tr>
      <td>Location Name</td>
      <td>City</td>
      <td>Districts</td>
      <td>Lattitude</td>
      <td>Longitude</td>
      <td>no of slots</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
      <%
       parker s=new parker();
         Connection con=s.getcon();
       Statement st=con.createStatement();
       ResultSet rs=st.executeQuery("select * from parkinglocation");
       while(rs.next())
       {
      %>
    <tr>
       <tr>
        <td><%= rs.getString(2) %></td>
      <td><%= rs.getString(3) %></td>
      <td><%= rs.getString(4) %></td>
      <td><%= rs.getString(5) %></td>
      <td><%= rs.getString(6) %></td>
      <td><%= rs.getString(7) %></td>
      <td><a href="Editlocation.jsp?id=<%=rs.getString(1)%>">edit</a></td>
      <td><a href="deletelocation.jsp?id=<%=rs.getString(1)%>">delete</a></td>
    </tr>
    <%
       }
    %>
    </tr>
    <tr>
      <td colspan="9"><div align="center"><a href="park_locreg.jsp">NEW LOCATION</a></div></td>
    </tr>
  </table>
</form>
</body>
 <jsp:include page="footer1.jsp"/> 
</html>