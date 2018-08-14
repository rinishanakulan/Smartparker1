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
       ResultSet rs=st.executeQuery("select parkinglocation.location_name,parkinglocation.city,parkinglocation.districts,slotregistration.slot,slotregistration.status,slotregistration.slot_id  from slotregistration,parkinglocation where parkinglocation.parking_id=slotregistration.parking_id and slotregistration.status='theft'");
       
       
       
      
        %>
<form id="form1" name="form1" method="post" action="">
  <table width="303" border="1">
    <tr>
      <td colspan="6"><div align="center">NOTIFICATIONS</div></td>
    </tr>
    <tr>
      <td>Parking area</td>
      <td>City</td>
      <td>District</td>
      <td>Slot Name</td>
      <td>Status</td>
      <td>&nbsp;</td>
    </tr>
    <%
       while(rs.next())
       {
           
       
       
       %>
      
    <tr>
        <td><%=rs.getString(1) %></td>
      <td><%=rs.getString(2) %></td>
      <td><%=rs.getString(3) %></td>
      <td><%=rs.getString(4) %></td>
      <td><%=rs.getString(5) %></td>
      <td><a href="freeslot.jsp?id=<%=rs.getString(6)%>">Set Free</a></td>
    </tr>
      
        <%
       }%>
  </table>
</form>
</body>
 <jsp:include page="footer1.jsp"/> 
</html>