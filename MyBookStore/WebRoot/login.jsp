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
    <title>�û���¼</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="styles/book.css">
	
	</head>
  
  <body background="picture/back/center.png">
  <%
  /* �жϵ�½������  */
  	String loginType = request.getParameter("loginType");
  	if(loginType.equals("amdin")) {
  		loginType = "admin";
  	}else if(loginType.equals("user")){
  		loginType = "user";
  	}
  	request.getSession().setAttribute("loginType", loginType);
  %>
  
  <div class="login" style="background:url(picture/back/login.png); width:350px;height:250px;">
  <form name="loginForm" method="post" action="top.jsp" target="top">
  <p class="text"> 
  <%if(loginType.equals("user")) {%>
  		&nbsp;&nbsp;&nbsp;��&nbsp;��
  	<%} else if(loginType.equals("admin")) {%>
  		&nbsp;��&nbsp;̨
  	<% } 
  	/* ��session��ӵ�½���͵Ļ�����Ϣ  */
  	session.setAttribute("loginType", loginType); 
  	%>
  	&nbsp;��&nbsp;¼
  	</p>
  	<p>
	  	<label>&nbsp;&nbsp;��&nbsp;&nbsp;�ţ�
	  		<input type="text" name="account" placeholder="�����û���" style="height:30px;"/>
	  	</label>
	</p>
  	<p>
  		<label>&nbsp;&nbsp;��&nbsp;&nbsp;�룺
  			<input type="password" name="password" placeholder="�����û�����" style="height:30px;"/>
  		</label>
  	</p>
  	<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  		<label>
  			<input type="submit" name="Submit" value="�ύ" />
  		</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  		<label>
  			<input type="reset" name="Reset" value="����" />
  		</label>
  	</p>
  	<br/><br/>
  	<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font style="color:red; font-size:15px">
  	<a href="center.jsp" style="text-decoration:none">������ҳ</a></font></p>
  </form>
  </div>
  <div class="floatLogo">
		<img src="picture/back/logo2.png">
	</div>
  </body>
</html>
