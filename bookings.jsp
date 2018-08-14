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
       
      
        %>
    
<form id="form1" name="form1" method="post" action="">
  <table width="200" border="1">
    <tr>
      <td>From</td>
      <td><label for="textfield"></label>
      <input type="date" name="textfield" id="textfield" /></td>
      <td>To
        <label for="textfield2"></label></td>
      <td><label for="textfield2"></label>
      <input type="date" name="textfield2" id="textfield2" /></td>
    </tr>
    <tr>
      <td colspan="4"><div align="center">
        <input type="submit" name="button" id="button" value="Show" />
      </div></td>
    </tr>
  </table>
  <p>&nbsp;   </p>
  <%
   if(request.getParameter("button")!=null)
        {
           String fromdate=request.getParameter("textfield");
           String todate=request.getParameter("textfield2");
           ResultSet rs=st.executeQuery("select userregistration.firstname,userregistration.lastname,userregistration.contact_num,parkinglocation.location_name,slotregistration.slot,booking.booking_date,booking.booking_period from userregistration,parkinglocation,slotregistration,booking where booking.user_id=userregistration.user_id and booking.parking_id=parkinglocation.parking_id and booking.slot_id=slotregistration.slot_id and booking_date between '"+fromdate+"' and '"+todate+"'");

           %>
           
        
  <table width="393" border="1">
    <tr>
      <td colspan="6">   <div align="center">Bookings </div></td>
    </tr>
    <tr>
      <td>Username</td>
      <td>Contact number</td>
      <td>Location name</td>
      <td>Slot number</td>
      <td>Booking date</td>
      <td>Booking peroid</td>
    </tr>
    <tr>
        <% while(rs.next())
        {
            %>
      <td><%=rs.getString("firstname")+ rs.getString("lastname")%></td>
      <td><%= rs.getString("contact_num") %></td>
      <td><%= rs.getString("location_name") %></td>
      <td><%= rs.getString("slot") %></td>
      <td><%= rs.getString("booking_date") %></td>
      <td><%= rs.getString("booking_period") %></td>
    </tr>
      <%}%>
  </table>
           <% }%>
  <p>&nbsp;</p>
</form>
</body>
 <jsp:include page="footer1.jsp"/>
</html>