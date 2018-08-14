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
  <table width="200" border="1">
    <tr>
      <td><div align="center">View Complaints</div></td>
    </tr>
  </table>
  <table width="200" border="1">
    <tr>
      <td>Username</td>
      <td>Complaints</td>
      <td>Date</td>
      <td>Time</td>
      <td>&nbsp;</td>
    </tr>
       <%
         parker s=new parker();
         Connection con=s.getcon();
       Statement st=con.createStatement();
       ResultSet rs=st.executeQuery("select complaints.*,userregistration.firstname,lastname from userregistration,complaints where complaints.user_id=userregistration.user_id");
       while(rs.next())
       {
      %>
    <tr>
      <td><%= rs.getString(6)+" "+rs.getString(7) %></td>
      <td><%=rs.getString(5)%></td>
      <td><%=rs.getString(3)%></td>
      <td><%=rs.getString(4)%></td>
      <td><a href="sendreply.jsp?id=<%=rs.getString(1)%>">REPLY</a></td>
    </tr>
      <%}
       %>
  </table>
</form>
</body>
 <jsp:include page="footer1.jsp"/> 
</html>