<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>ͼ���̵��̨</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="styles/book.css">
<frameset rows="21%,*,7%" border="1">
	<frame src="backTop.jsp" name="backTop" />
	<frame src="backLogin.jsp" name="backCenter" />
	<frame src="backDown.jsp" name="down" />
</frameset>
</head>
<body>
	<%  // ���ҳ���session�Ļ���
		 session.invalidate(); 
	%>
</body>
</html>
