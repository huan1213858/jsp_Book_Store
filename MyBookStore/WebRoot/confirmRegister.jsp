<%@ page language="java" import="java.util.*,java.sql.*,dao.*,entity.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	response.setContentType("text/html;charset=GBK");
 	request.setCharacterEncoding("GBK");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'confirmRegister.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="styles/book.css">

  </head>
  
  <body background="picture/back/center.png">
  <%
 	 /*  ��ȡ��ע��ҳ��ı��д���������Ϣ   */
  	String newAccount = request.getParameter("userAccount");
  	String password = request.getParameter("userPassword");
  	String confirmPassword = request.getParameter("passwordConfim");
  	String name = request.getParameter("name");
  	String birthday = request.getParameter("birthday");
  	String sex = request.getParameter("sex");
  	String telephoneNumber = request.getParameter("tel");
  	String address = request.getParameter("address");
  	String email = request.getParameter("email");
  	String moneyStr = request.getParameter("money");
  	double money = Double.parseDouble(moneyStr);
  	
  	
  		if(newAccount.equals("")||password.equals("")||confirmPassword.equals("")||name.equals("")||telephoneNumber.equals("")||address.equals("")||email.equals("")||moneyStr.equals("")) {
  		out.println("<script language = 'javascript'>alert('��Ϣδ����,ע �� ʧ �� ������');window.location.href='userRegister.jsp';</script>");
  	}else {
  	/*  �ж��Ƿ������ȷ��������ͬ  */
  	if(!password.equals(confirmPassword)) {
  	out.println("<script language = 'javascript'>alert('ȷ �� �� �� �� �� ,ע �� ʧ ��...');window.location.href='userRegister.jsp';</script>");
  	}else {
  		/* ����Ƿ��������˺��ظ�  */
  		String sql = "select * from user";
  		ResultSet rs = Dao.searchDate(sql);
  		boolean exit = false;
  		while(rs.next()) {
  			String oldAccount = rs.getString("account");
  			if(newAccount.equals(oldAccount)) {
  				exit = true;
  				break;
  			} 
  		}
  		/* ����˺��Ѿ�����  */
 		if(exit) {
 		out.println("<script language = 'javascript'>alert('�� �� �� �� �� �� ,ע �� ʧ ��...');window.location.href='userRegister.jsp';</script>");
 			
  		}else {
	  		try{
	  			/* ע��ɹ�  */
	 			sql = "INSERT INTO USER (account,password,name,birthday,sex,telephone,address,email,money) values ('" + newAccount + "','" + password + "','" + name + "','" + birthday + "','" + sex + "','" + telephoneNumber + "','" + address + "','" + email + "'," + money + ")";
	 			System.out.println("Sql :" + sql);
	 			Dao.operateDate(sql);
	 			sql = "SELECT * FROM USER where account='" + newAccount + "'";
	 			int id = 0;
	 			rs = Dao.searchDate(sql);
	 			while(rs.next()){
	 				id = rs.getInt("id");
	 			}
	 			/**
	 			 * ע��ɹ�֮��Ϊ���û�����һ�� �涩�� ��  ���ﳵ ��Ϣ�ı� 
	 			 */
	 			String sqlOrderForm = "CREATE TABLE orderform_" + id + " (id INT PRIMARY KEY NOT NULL auto_increment, time VARCHAR(50) NOT NULL, bookId INT(20) NOT NULL, count INT(20) NOT NULL)";
	 			Dao.operateDate(sqlOrderForm);
	 			String sqlShoppingCar = "CREATE TABLE shoppingcar_" + id + " (id INT PRIMARY KEY NOT NULL auto_increment, time VARCHAR(50) NOT NULL, bookId INT(20) NOT NULL, count INT(20) NOT NULL)";
	 			Dao.operateDate(sqlShoppingCar);
	 			out.println("<script language = 'javascript'>alert('ע �� �� �� ������');window.location.href='center.jsp';</script>");
	 			}catch(Exception e) {
	 			out.println("<script language = 'javascript'>alert('ע ��ʧ��...');window.location.href='center.jsp';</script>");
	 			}
	 		}
  		}
  	}
   %>
  <%--  <div class="login" style="margin-top: 90px;margin-left: 600px"><div style="font-size:30px;font-color:blue">ע����Ϣ</div>
   <from>
    	<p>��&nbsp;&nbsp;&nbsp;&nbsp;�ţ�<%=newAccount %></p>
    	<p>��&nbsp;&nbsp;&nbsp;&nbsp;�룺<%=password %></p>
    	<p>ȷ�����룺<%=confirmPassword %></p>
    	<p>��ʵ������<%=name %></p>
    	<p>�˻���ֵ��<%=money %></p>
    	<p>��&nbsp;&nbsp;&nbsp;&nbsp;�գ�<%=birthday %></p>
    	<p>��&nbsp;&nbsp;&nbsp;&nbsp;��<%=sex %></p>
    	<p>��ϵ�绰��<%=telephoneNumber %></p>
    	<p>�������룺<%=email %></p>
    	<p>��ͥסַ��<%=address %></p>
    	<br/><br/>
    	<p><font style="color:red; font-size:15px"><a href="userRegister.jsp" target="center"  style="text-decoration:none">����ע��</a>&nbsp;&nbsp;
    	<a href="center.jsp" style="text-decoration:none">������ҳ</a></font></p>
    </from>
    </div> --%>
    <div class="floatLogo">
		<img src="picture/back/logo2.png">
	</div>
  </body>
</html>
