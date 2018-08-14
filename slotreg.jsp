<%
  response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);

  if(session.getAttribute("user_id")==null)
      response.sendRedirect("login.jsp");

  %>
<%@page import="java.io.IOException"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.File"%>
<%@page import="net.glxn.qrgen.image.ImageType"%>
<%@page import="net.glxn.qrgen.QRCode"%>
<%@page import="java.io.ByteArrayOutputStream"%>
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
        int slotno=0;
        int cslot=0;
        if(request.getParameter("button")!=null)
        {
           String parkingid=request.getParameter("select2");
           ResultSet rs2=st.executeQuery("select slot_num from parkinglocation where parking_id='"+parkingid+"'");
           if(rs2.next())
           {
                slotno=rs2.getInt(1);
           }
           
           String   slotnum=request.getParameter("textfield");
           rs2=st.executeQuery("select count(*) from slotregistration where parking_id='"+parkingid+"'");
           if(rs2.next())
           {
               cslot=rs2.getInt(1);
           }
               
           
           if(cslot<slotno)
           {
           st.executeUpdate("insert into slotregistration values(null,'"+parkingid+"','"+slotnum+"',0,0,0,0,'pending')" ,Statement.RETURN_GENERATED_KEYS );
            ResultSet r=st.getGeneratedKeys();
            String id="";
        while(r.next())
        {
            id=r.getString(1);
        }
        
           ByteArrayOutputStream out1 = QRCode.from(id).to(ImageType.PNG).stream();

		try {
			FileOutputStream fout = new FileOutputStream(new File(
					"C:\\Users\\USER\\Documents\\NetBeansProjects\\smartparker\\web\\qrcode\\"+id+"QR_Code.JPG"));

			fout.write(out1.toByteArray());

			fout.flush();
			fout.close();

		} catch (FileNotFoundException e) {
			// Do Logging
		} catch (IOException e) {
			// Do Logging
		}
           %>
             
               <script>
                  alert("Slot is Inserted successfully");
                  window.location="adminhome.jsp"
                 </script>
          <% 
           }
           else
           {
             %>
             
               <script>
                  alert("invalid");
                 </script>
          <%  }
        
    }
%>
<form id="form1" name="form1" method="post" action="">
  <table width="280" border="1" align="center">
    <tr>
      <td>Parking Location</td>
      <td><label for="textfield"></label>
        <label for="select2"></label>
        <select name="select2" id="select2" required>
            <option value="">SELECT</option>
            <%
             ResultSet rs=st.executeQuery("select * from parkinglocation");
             while(rs.next())
             {
            %>
            <option value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option>
            <%}%>
      </select></td>
    </tr>
    <tr>
      <td>Slot Name</td>
      <td><label for="select"></label>
        <label for="textfield2"></label>
      <input type="text" name="textfield" id="textfield2" required pattern="[A-Z a-z0-9]{3,25}" /></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="button" id="button" value="Register" /></td>
    </tr>
  </table>
</form>
</body>
 <jsp:include page="footer1.jsp"/> 
</html>