<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
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

<title>�û�ע��</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="styles/book.css">
</head>

<body background="picture/back/Bg.png">
	<div class="login" style="margin-top: 40px">
		<form name="form1" method="post" action="confirmAdminRegister.jsp">
			<P class="text">&nbsp;��&nbsp;��&nbsp;ע&nbsp;��</p>
			<p>
				<label>��&nbsp;&nbsp;&nbsp;&nbsp;�ţ� <input type="text"
					name="adminAccount" placeholder="�˻���" style="height:30px" /> </label>
			</p>
			<p>
				<label>��&nbsp;&nbsp;&nbsp;&nbsp;�룺 <input type="password"
					name="adminPassword" placeholder="�˻�����" style="height:30px" /> </label>
			</p>
			<p>
				<label>ȷ�����룺 <input type="password" name="passwordConfim"
					placeholder="ȷ������" style="height:30px" /> </label>
			</p>
			<p>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label>
					<input type="submit" name="Submit" value="�ύ" style="height:30px" />
				</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label>
					<input type="reset" name="Reset" value="����" style="height:30px" />
				</label>
			</p>
		</form>
	</div>
</body>
</html>
