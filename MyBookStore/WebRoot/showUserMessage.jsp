<%@ page language="java" import="java.util.*"
	import="java.sql.*,dao.*,entity.*" pageEncoding="GBK"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	response.setContentType("text/html;charset=GBK");
	request.setCharacterEncoding("GBK");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'showUserMessage.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="styles/book.css">

</head>

<body background="picture/back/center.png">
	<%
		int id = 0;
		String userName = request.getParameter("userName");
		String password = "";
		String name = "";
		double money = 0;
		String birthday = "";
		String sex = "";
		String telephone = "";
		String email = "";
		String address = "";
		if (userName != null && !userName.equals("")) {
			String sql = "select * from user";
			boolean exit = false;
			ResultSet rs = Dao.searchDate(sql);
			while (rs.next()) {
				String dataName = rs.getString("account");
				if (dataName.equals(userName)) {
					exit = true;
					id = rs.getInt("id");
					password = rs.getString("password");
					name = rs.getString("name");
					money = rs.getDouble("money");
					birthday = rs.getString("birthday");
					sex = rs.getString("sex");
					telephone = rs.getString("telephone");
					email = rs.getString("email");
					address = rs.getString("address");
					break;
				}
			}
			/* �ҵ����û�  */
			if (exit) {
	%>
	<div class="login" style="margin-top:25px">
		<form name="loginForm" method="post" action="reviseUserMessage.jsp" target="center">
			<p style="display: none">
				<input type="text" name="messageId" value=<%=id %>/>
			</p>
			<p>
				<label><font style="color:F75000; align:center"><%=userName%>������</font> </label>
			</p>
			<p>
				<label>��&nbsp;&nbsp;&nbsp;&nbsp;�ţ� <input type="text"
					name="account" value=<%=userName%> /> </label>
			</p>
			<p>
				<label>��&nbsp;&nbsp;&nbsp;&nbsp;�룺 <input type="password"
					name="password" value=<%=password%> /> </label>
			</p>
			<p>
				<label>ȷ�����룺 <input type="password" name="passwordConfim"
					value=<%=password%> /> </label>
			</p>
			<p>
				<label>��ʵ������ <input type="text" name="name" value=<%=name%>>
				</label>
			</p>
			<p>
				<label>�˻��� <input type="text" name="money" value=<%=money%>>
				</label>
			</p>
			<p>
				<label>��&nbsp;&nbsp;&nbsp;&nbsp;�� <input type="text" name="sex" value=<%=sex%>>
				</label>
			</p>
			<p>
				<label>��&nbsp;&nbsp;&nbsp;&nbsp;�գ� <input type="text"
					name="birthday" value=<%=birthday%>> </label>
			</p>
			<p>
				<label>��ϵ�绰�� <input type="text" name="tel"
					value=<%=telephone%>> </label>
			</p>
			<p>
				<label>�������룺 <input type="text" name="email"
					value=<%=email%>> </label>
			</p>
			<p>
				<label>��ͥ��ַ�� <input type="text" name="address"
					value=<%=address%>> </label>
			</p>
			<p>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label> <input
					type="submit" name="Submit" value="ȷ���޸�" /> </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label>
					<input type="reset" name="Reset" value="����" /> </label>&nbsp;&nbsp;
			</p>
			<p>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font
					style="color:red; font-size:15px"> <a
					href="login.jsp?loginType=user" target="center"
					style="text-decoration:none">���ص�½</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
					href="center.jsp" style="text-decoration:none">������ҳ</a>
				</font>
			</p>
		</form>
	</div>
	<% 
  		}
  	}else {
  	}
  %>
	<br>
	<div class="floatLogo">
		<img src="picture/back/logo2.png">
	</div>
</body>
</html>
