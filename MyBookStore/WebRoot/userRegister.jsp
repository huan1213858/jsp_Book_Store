<%@ page language="java" import="java.util.*,entity.*" pageEncoding="GBK"%>
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

<title>�û�ע��</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="styles/book.css">
</head>

<body background="picture/back/center.png">
	<div class="login" style="margin-top: 5px">
		<form name="form1" method="post" action="confirmRegister.jsp">
			<P class="text">&nbsp;��&nbsp;��&nbsp;ע&nbsp;��</p>
			<p>
				<label>��&nbsp;&nbsp;&nbsp;&nbsp;�ţ� <input type="text"
					name="userAccount" placeholder="������Ϣ" style="height:30px;"/> </label>
			</p>
			<p>
				<label>��&nbsp;&nbsp;&nbsp;&nbsp;�룺 <input type="password"
					name="userPassword" placeholder="������Ϣ" style="height:30px;"/> </label>
			</p>
			<p>
				<label>ȷ�����룺 <input type="password" name="passwordConfim" style="height:30px;" placeholder="������Ϣ"/>
				</label>
			</p>
			<p>
				<label>�˻���ֵ�� <input type="text" name="money" /> </label>
			</p>
			<p>
				<label>��ʵ������ <input type="text" name="name" placeholder="������Ϣ" style="height:30px;"/> </label>
			</p>
			<p>
				<label>��&nbsp;&nbsp;&nbsp;&nbsp;�� <input type="radio"
					checked="checked" name="sex" value="��">�� <input
					type="radio" name="sex" value="Ů">Ů </label>
			</p>
			<p>
				<label>��&nbsp;&nbsp;&nbsp;&nbsp;�գ� <input type="text"
					name="birthday" /> </label>
			</p>
			<p>
				<label>��ϵ�绰�� <input type="text" name="tel" placeholder="������Ϣ"/> </label>
			</p>
			<p>
				<label>�������룺 <input type="text"
					name="email" style="height:30px;"/> </label>
			</p>
			<p>
				<label>��ͥ��ַ�� <input type="text" name="address" placeholder="������Ϣ" style="height:30px;"/> </label>
			</p>
			<p>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label>
					<input type="submit" name="Submit" value="�ύ" style="height:30px;"/> </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<label> <input type="reset" name="Reset" value="����" style="height:30px;"/> </label>
			</p>
			<p><br/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font
					style="color:red; font-size:15px"><a href="center.jsp"
					style="text-decoration:none">������ҳ</a> </font>
			</p>
		</form>
	</div>
	<div class="floatLogo">
		<img src="picture/back/logo2.png">
	</div>
</body>
</html>
