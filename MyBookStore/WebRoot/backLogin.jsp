<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
response.setContentType("text/html;charset=GBK");
request.setCharacterEncoding("GBK");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>��̨��¼</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="styles/book.css">
	</head>
  
  <body class="backgroundcolor" background="picture/back/Bg.png">
  <%
  request.getSession().setAttribute("login", true);
  request.getSession().setAttribute("loginType", "admin");
  %>
  
  <div class="login" style="background:url(picture/back/backLogin.png); width:350px;height:250px;">
  <form name="loginForm" method="post" action="backTop.jsp" target="backTop" >
  <p class="text"> 
  
  		&nbsp;&nbsp;&nbsp;��&nbsp;̨
  	<% 
  	/* ��session��ӵ�½���͵Ļ�����Ϣ  */
  	request.getSession().setAttribute("loginType", "admin"); 
  	%>
  	&nbsp;&nbsp;&nbsp;��&nbsp;¼
  	</p>
  	<p>
	  	<label>&nbsp;&nbsp&nbsp;&nbsp;;��&nbsp;&nbsp;�ţ�
	  		<input type="text" name="account"  placeholder="�����û���" style="height:30px;"/>
	  	</label>
	</p>
  	<p>
  		<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;�룺
  			<input type="password" name="password"  placeholder="�����û�����" style="height:30px;"/>
  		</label>
  	</p>
  	<br />
  	<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  		<label>
  			<input type="submit" name="Submit" value="�ύ" style="height:30px;"/>
  		</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  		<label>
  			<input type="reset" name="Reset" value="����" style="height:30px;"/>
  		</label>
  	</p>
  	<br/><br/>
  </form>
  </div>
</html>
