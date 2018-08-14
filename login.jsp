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
        String uname=request.getParameter("textfield");
        String password=request.getParameter("textfield2");
        ResultSet rs=st.executeQuery("select * from login where username='"+uname+"' and password='"+password+"' and usertype='admin'");
        if(rs.next())
        {
            session.setAttribute("user_id",rs.getString(1));
            response.sendRedirect("adminhome.jsp");
        }
        else
        {
           %>
           <script>
               alert("invalid user")
           </script>
           
        <%
        }
        }
     %> 
<form id="form1" name="form1" method="post" action="">
  <table width="200" border="1" align="center">
    <tr>
      <td>Username</td>
      <td><label for="textfield"></label>
      <input type="text" name="textfield" id="textfield"  title="Character Only" required pattern="[A-Z a-z0-9]{3,25}"/></td>
    </tr>
    <tr>
      <td>Password</td>
      <td><label for="textfield2"></label>
      <input type="text" name="textfield2" id="textfield2" title="Atleast 3 characters" required pattern="[A-Z a-z0-9]{3,25}" /></td>
    </tr>
    <tr>
      <td colspan="2"><div align="center">
        <input type="submit" name="button" id="button" value="Login" />
      </div></td>
    </tr>
  </table>
</form>
 <jsp:include page="loginfooter.jsp"/>
</body>
</html>