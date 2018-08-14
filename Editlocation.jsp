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
        String parking_id=request.getParameter("id");
        parker s=new parker();
        Connection con=s.getcon();
        Statement st=con.createStatement();
        if(request.getParameter("button")!=null)
        {
            String loc_name=request.getParameter("textfield");
            String city=request.getParameter("textfield2");
            String districts=request.getParameter("dis");
            String lattitude=request.getParameter("textfield3");
            String longitude=request.getParameter("textfield4");
            String slot_num=request.getParameter("select2");
            st.executeUpdate("update parkinglocation set location_name='"+loc_name+"',city='"+city+"',districts='"+districts+"',lattitude='"+lattitude+"',longitude='"+longitude+"',slot_num='"+slot_num+"' where parking_id='"+parking_id+"'");
              response.sendRedirect("viewlocation.jsp");
        }
        ResultSet rs=  st.executeQuery("select *  from parkinglocation where parking_id='"+parking_id+"'");
         if(rs.next())
            {  
        %>
<form id="form1" name="form1" method="post" action="">
  <table width="294" border="1">
    <tr>
      <td width="92">Location Name</td>
      <td width="137"><label for="textfield"></label>
      <input type="text" name="textfield" id="textfield" value="<%=rs.getString(2)%>"/></td>
    </tr>
    <tr>
      <td>City</td>
      <td><label for="textfield2"></label>
      <input type="text" name="textfield2" id="textfield2" value="<%=rs.getString(3)%>" /></td>
    </tr>
    <tr>
      <td>Districts</td>
      <td><label for="select"></label>
        <select name="dis" id="select">
         <option>Select</option>
         <option <% if(rs.getString(4).equals("kannur")){%>selected<% }%>>kannur</option>
         <option<% if(rs.getString(4).equals("kozhikode")){%>selected<% }%>>kozhikode</option>
         <option <% if(rs.getString(4).equals("kasargod")){%>selected<% }%>>kasargod</option>
         <option <% if(rs.getString(4).equals("vayanad")){%>selected<% }%>>vayanad</option>
         <option <% if(rs.getString(4).equals("malappuram")){%>selected<% }%>>malappuram</option>
      </select></td>
    </tr>
    <tr>
      <td>Longitude</td>
      <td><label for="textfield3"></label>
      <input type="text" name="textfield3" id="textfield3" value="<%=rs.getString(6)%>" /></td>
    </tr>
    <tr>
      <td>Lattitude</td>
      <td><label for="textfield4"></label>
      <input type="text" name="textfield4" id="textfield4" value="<%=rs.getString(5)%>" /></td>
    </tr>
    <tr>
      <td>Number of slots</td>
      <td><label for="select2"></label>
        <select name="select2" id="select2">
            <option <% if(rs.getString(7).equals("1")){%>selected<% }%>>1</option>
            <option <% if(rs.getString(7).equals("2")){%>selected<% }%>>2</option>
            <option <% if(rs.getString(7).equals("3")){%>selected<% }%>>3</option>
            <option <% if(rs.getString(7).equals("4")){%>selected<% }%>>4</option>
            <option <% if(rs.getString(7).equals("5")){%>selected<% }%>>5</option>
            <option <% if(rs.getString(7).equals("6")){%>selected<% }%>>6</option>
            <option <% if(rs.getString(7).equals("7")){%>selected<% }%>>7</option>
            <option <% if(rs.getString(7).equals("8")){%>selected<% }%>>8</option>
            <option <% if(rs.getString(7).equals("9")){%>selected<% }%>>9</option>
          <option <% if(rs.getString(7).equals("10")){%>selected <% }%>>10</option>
          
      </select></td>
    </tr>
          <% } %>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="button" id="button" value="UPDATE" /></td>
    </tr>
  </table>
</form>
</body>
     <jsp:include page="footer1.jsp"/> 
</html>