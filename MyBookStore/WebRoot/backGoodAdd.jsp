<%@page import="javax.swing.JSpinner.ListEditor"%>
<%@ page language="java" import="java.util.*,java.sql.*,dao.*,entity.*"
	pageEncoding="GBK"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!-- ������ҳ�е��ַ������Լ���������ʹ���ı���  -->
<%
	response.setContentType("text/html;charset=GBK");
	request.setCharacterEncoding("GBK");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'backGoodAdd.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="styles/book.css">

  </head>
  
  <body class="backgroundcolor" background="picture/back/Bg.png">
  		<div class="login" style="margin-top: 40px">
		<form name="form1" method="post" action="addGoods.jsp">
			<P class="text">&nbsp;ͼ&nbsp;��&nbsp;��&nbsp;��</p>
			<p>
				<label>�鼮���ƣ� <input type="text"
					name="bookName" style="height:30px"/> </label>
			</p>
			<p>
				<label>�鼮���ߣ� <input type="text"
					name="bookAuthor"  style="height:30px"/> </label>
			</p>
			<p>
				<label>����·���� <input type="text" name="imageAddress"  style="height:30px"/>
				</label>
			</p>
			<p>
				<label>�鼮���ۣ� <input type="text" name="price"  style="height:30px"/> </label>
			</p>
			<p>
				<label>�ϼ������� <input type="text" name="count"  style="height:30px"/> </label>
			</p>
			<p>
				<label>�鼮���ͣ� <input type="text" name="bookType"  style="height:30px"/></label>
			</p>
			<p>
				<label>�鼮��飺 <input type="text" name="introduce"  style="height:30px"/></label>
			</p>
			<p>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label>
					<input type="submit" name="Submit" value="�ύ"  style="height:30px"/> </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<label> <input type="reset" name="Reset" value="����"  style="height:30px"/> </label>
			</p>
		</form>
	</div>
  </body>
</html>
