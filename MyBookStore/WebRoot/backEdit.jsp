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

<title>My JSP 'manage.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="styles/book.css">

</head>
<body background="picture/back/Bg.png">
	<%
		String sql = "";
		ResultSet rs = null;
		int id = 0;
		
		/* �û�����Ϣ  */
		String account = "";
		String sex = "";
		String birthday = "";
		String telephone = "";
		String email = "";
		String address = "";
		String name = "";
		
		/* ��Ʒ����Ϣ  */
		String bookName = "";
		String bookAuthor = "";
		String imageAddress = "";
		int bookCount = 0;
		double bookPrice = 0;
		String bookIntroduce = "";
		String bookType = "";
		
		/*  �жϱ༭������     */
		String editType = request.getParameter("editType");
		if(editType.equals("user")) {
			id = Integer.parseInt(request.getParameter("backID"));
			sql = "select * from user where id = " + id;
			rs = Dao.searchDate(sql);
			
			while(rs.next()) {
				account = rs.getString("account");
			    sex = rs.getString("sex");
				birthday = rs.getString("birthday");
			    telephone = rs.getString("telephone");
			    email = rs.getString("email");
				address = rs.getString("address");
				name = rs.getString("name");
			}
			%>
				<div class="login" style="margin-top: 40px">
		<form name="form1" method="post" action="backSaveMessage.jsp?saveType=user&IDD=<%=id %>">
			<P class="text">&nbsp;��&nbsp;��&nbsp;��&nbsp;��</p>
			<p>
				<label>��&nbsp;&nbsp;&nbsp;&nbsp;�ţ� <input type="text"
					name="account" value="<%=account %>" /> </label>
			</p>
			<p>
				<label>��ʵ������ <input type="text" name="name" value="<%=name %>" /> </label>
			</p>
			<p>
				<label>��&nbsp;&nbsp;&nbsp;&nbsp;�� <input type="text" name="sex" value="<%=sex %>" /></label>
			</p>
			<p>
				<label>��&nbsp;&nbsp;&nbsp;&nbsp;�գ� <input type="text"
					name="birthday" value="<%=birthday %>" /> </label>
			</p>
			<p>
				<label>��ϵ�绰�� <input type="text" name="tel" value="<%=telephone %>" /> </label>
			</p>
			<p>
				<label>�������룺 <input type="text"
					name="email" value="<%=email %>" /> </label>
			</p>
			<p>
				<label>��ͥ��ַ�� <input type="text" name="address" value="<%=address %>" /></label>
			</p>
			<p>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>
					<input type="submit" name="Submit" value="�ύ" style="height:30px"/> </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<label> <input type="reset" name="Reset" value="����" style="height:30px"/> </label>
			</p>
		</form>
	</div>
			<% 
		}else if(editType.equals("goods")) {
			id = Integer.parseInt(request.getParameter("backID"));
			sql = "select * from book where id = " + id;
			rs = Dao.searchDate(sql);
			
			while(rs.next()) {
				bookName = rs.getString("name");
				bookAuthor = rs.getString("author");
				bookPrice = rs.getDouble("price");
				bookCount = rs.getInt("count");
				imageAddress = rs.getString("imageAddress");
				bookIntroduce = rs.getString("introduce");
				bookType = rs.getString("bookType");
			}
			
			%>
				<div class="login" style="margin-top: 40px">
		<form name="form1" method="post" action="backSaveMessage.jsp?saveType=goods&IDD=<%=id %>">
			<P class="text">&nbsp;��&nbsp;��&nbsp;��&nbsp;��</p>
			<p>
				<label>��&nbsp;&nbsp;&nbsp;&nbsp;�� �� <input type="text"
					name="bookName" value="<%=bookName %>" /> </label>
			</p>
			<p>
				<label>��&nbsp;&nbsp;&nbsp;&nbsp;�� �� <input type="text"
					name="bookAuthor" value="<%=bookAuthor %>" /> </label>
			</p>
			<p>
				<label>��&nbsp;&nbsp;&nbsp;&nbsp;�� �� <input type="text"
					name="bookPrice" value="<%=bookPrice %>" /> </label>
			</p>
			<p>
				<label>ͼƬ·�� �� <input type="text"
					name="imageAddress" value="<%=imageAddress %>" /> </label>
			</p>
			<p>
				<label>�鼮���� �� <input type="text"
					name="bookCount" value="<%=bookCount %>" /> </label>
			</p>
			<p>
				<label>�鼮���� �� <input type="text"
					name="bookType" value="<%=bookType %>" /> </label>
			</p>
			<p>
				<label>�鼮��� �� <input type="text"
					name="bookIntroduce" value="<%=bookIntroduce %>" /> </label>
			</p>
			<p>
				<label>ͼ����� ��<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<img src="<%=imageAddress %>"></label>
			</p>
			<p>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>
					<input type="submit" name="Submit" value="�ύ" style="height:30px" /> </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<label> <input type="reset" name="Reset" value="����" style="height:30px" /> </label>
			</p>
			</form>
			</div>
			<% 
		} 
	%>
  </body>
</html>
