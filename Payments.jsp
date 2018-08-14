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
  <div align="center">
    <table width="200" border="1">
      <tr>
        <td>From</td>
        <td><label for="textfield"></label>
        <input type="date" name="textfield" id="textfield" /></td>
        <td>To</td>
        <td><label for="textfield2"></label>
        <input type="date" name="textfield2" id="textfield2" /></td>
      </tr>
      <tr>
        <td colspan="4"><div align="center">
          <input type="submit" name="button" id="button" value="show" />
        </div></td>
      </tr>
    </table>
    <p>&nbsp;</p>
    <%
   if(request.getParameter("button")!=null)
        {
           String fromdate=request.getParameter("textfield");
           String todate=request.getParameter("textfield2");
           ResultSet rs=st.executeQuery("select booking.booking_id,userregistration.firstname,userregistration.lastname,parkinglocation.location_name,slotregistration.slot,payment.account_num,payment.amount,payment.date from booking,userregistration,parkinglocation,slotregistration,payment where payment.booking_id=booking.booking_id and userregistration.user_id=booking.user_id and booking.parking_id=parkinglocation.parking_id and booking.slot_id=slotregistration.slot_id and parkinglocation.parking_id=slotregistration.parking_id and  payment.date between '"+fromdate+"' and '"+todate+"'");
           %>
    <table width="200" border="1">
      <tr>
        <td colspan="7"> <div align="center">Payments</div></td>
      </tr>
      <tr>
        <td>Bookingid</td>
        <td>Username</td>
        <td>Location name</td>
        <td>Slot number</td>
        <td>Account number</td>
        <td>Amount</td>
        <td>Date</td>
      </tr>
        
      <tr>
          <% while(rs.next())
        {
            %>
        <td><%=rs.getString(1)%></td>
        <td><%= rs.getString(2)+" "+rs.getString(3) %></td>
        <td><%=rs.getString(4)%></td>
        <td><%=rs.getString(5)%></td>
        <td><%=rs.getString(6)%></td>
        <td><%=rs.getString(7)%></td>
        <td><%=rs.getString(8)%></td>
      </tr>
        <%
        }
          %>
    </table>
          <%}%>
  </div>
</form>
</body>
 <jsp:include page="footer1.jsp"/> 
</html>