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
         parker s=new parker();
        Connection con=s.getcon();
        Statement st=con.createStatement();
        if(request.getParameter("button")!=null)
        {
            String cur_pswd=request.getParameter("textfield");
            String new_pswd=request.getParameter("textfield2");
            st.executeUpdate("update login set password='"+new_pswd+"' where password='"+cur_pswd+"'");
            
        }
            
        %>
<form id="form1" name="form1" method="post" action="">
  <table width="342" border="1">
    <tr>
      <td>Current password</td>
      <td><label for="textfield"></label>
      <input type="text" name="textfield" id="textfield" /></td>
    </tr>
    <tr>
      <td>New password</td>
      <td><label for="textfield2"></label>
      <input type="text" name="textfield2" id="textfield2" /></td>
    </tr>
    <tr>
      <td>Confirm password</td>
      <td><label for="textfield3"></label>
      <input type="text" name="textfield3" id="textfield3" /></td>
    </tr>
    <tr>
      <td colspan="2"><div align="center">
        <input type="submit" name="button" id="button" value="Submit" />
      </div></td>
    </tr>
  </table>
</form>
</body>
</html>