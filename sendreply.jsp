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
        String reply_id=request.getParameter("id");
    parker s=new parker();
        Connection con=s.getcon();
        Statement st=con.createStatement();
        if(request.getParameter("button")!=null)
        {
            String reply=request.getParameter("textarea");
            st.executeUpdate("insert into reply values(null,'"+reply_id+"','"+reply+"')");
            response.sendRedirect("viewcomplaints.jsp");
            
        }
            
            
    %>
<form id="form1" name="form1" method="post" action="">
  <div align="center">
    <table width="200" border="1">
      <tr>
        <td><a href=>Reply</td>
        <td><label for="textarea"></label>
        <textarea name="textarea" id="textarea" cols="45" rows="5" required></textarea></td>
      </tr>
      <tr>
        <td colspan="2"><div align="center">
          <input type="submit" name="button" id="button" value="Send" />
        </div></td>
      </tr>
    </table>
  </div>
</form>
</body>
 <jsp:include page="footer1.jsp"/> 
</html>