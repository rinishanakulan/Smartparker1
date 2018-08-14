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
        
        
       %> 
       
<form id="form1" name="form1" method="post" action="">
  <div align="center">
    <table width="200" border="1">
      <tr>
        <td>Parking location Name</td>
        <td><label for="select"></label>
          <select name="select" id="select">
               <%
             rs=st.executeQuery("select * from parkinglocation");
             while(rs.next())
             {
            %>
            <option value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option>
            <%}%>
        </select></td>
      </tr>
      <tr>
        <td colspan="2"><div align="center">
          <input type="submit" name="button" id="button" value="Search" />
        </div></td>
      </tr>
    </table>
        <%
        if(request.getParameter("button")!=null)
        {
            String park_id=request.getParameter("select");
            rs=st.executeQuery("select slot,status from slotregistration where parking_id='"+park_id+"'");
        
                    %>
    <table width="200" border="1">
      <tr>
        <td>Slot Name</td>
        <td>Status</td>
      </tr>
      <%
        while(rs.next())
        {
            %>
       
      <tr>
        <td><%= rs.getString(1) %></td>
        <td><%= rs.getString(2) %></td>
      </tr>
      <%
        } %>
    </table>
    <% }%>
    <p>&nbsp;</p>
  </div>
</form>
</body>
 <jsp:include page="footer1.jsp"/> 
</html>