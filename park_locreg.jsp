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
        if(request.getParameter("button")!=null)
        {
            String loc_name=request.getParameter("textfield");
            String city=request.getParameter("textfield2");
            String districts=request.getParameter("select");
            String lattitude=request.getParameter("textfield3");
            String longitude=request.getParameter("textfield4");
            String slot_num=request.getParameter("select2");
            st.executeUpdate("insert into parkinglocation values(null,'"+loc_name+"','"+city+"','"+districts+"','"+lattitude+"','"+longitude+"','"+slot_num+"')");
     %>
     <script>
         alert("parking location registered successfully");
         window.location="adminhome.jsp"
         </script>
     
     <%
        
        
        }
        %>
<form id="form1" name="form1" method="post" action="">
  <table width="294" border="1">
    <tr>
      <td width="92">Location Name</td>
      <td width="137"><label for="textfield"></label>
      <input type="text" name="textfield" id="textfield" title="Atleast 3 characters" required pattern="[A-Z a-z0-9]{3,25}"/></td>
    </tr>
    <tr>
      <td>City</td>
      <td><label for="textfield2"></label>
      <input type="text" name="textfield2" id="textfield2" title="Atleast 2 characters" required pattern="[A-Z a-z0-9]{2,25}" /></td>
    </tr>
    <tr>
      <td>Districts</td>
      <td><label for="select"></label>
        <select name="select" id="select" required>
         <option>Select</option>
          <option>kannur</option>
          <option>kozhikode</option>
          <option>kasargod</option>
          <option>vayanad</option>
          <option>malappuram</option>
      </select></td>
    </tr>
    <tr>
      <td>Longitude</td>
      <td><label for="textfield3"></label>
      <input type="text" name="textfield3" id="textfield3" required/></td>
    </tr>
    <tr>
      <td>Lattitude</td>
      <td><label for="textfield4"></label>
      <input type="text" name="textfield4" id="textfield4" required /></td>
    </tr>
    <tr>
      <td>Number of slots</td>
      <td><label for="select2"></label>
        <select name="select2" id="select2" required>
          <option>1</option>
          <option>2</option>
          <option>3</option>
          <option>4</option>
          <option>5</option>
          <option>6</option>
          <option>7</option>
          <option>8</option>
          <option>9</option>
          <option>10</option>
          <option>11</option>
          <option>12</option>
          <option>13</option>
      </select></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="button" id="button" value="Submit" /></td>
    </tr>
  </table>
</form>
</body>
<jsp:include page="footer1.jsp"/>
</html>