<%@ page language="java" import="java.util.*"
	import="java.sql.*,dao.*,entity.*,java.io.*" pageEncoding="GBK"%>
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

<title>My JSP 'reviseUserMessage.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="styles/book.css">

</head>

<body background="picture/back/center.png" style="margin-top:220px;margin-left:600px">
	<%
   /*  ��ȡ���޸���Ϣ��ҳ��ı��д���������Ϣ   */
   	String idstr = request.getParameter("messageId");
   	
   	/* ȥ���ַ���idĩβ��б��  */
   	StringBuilder sb = new StringBuilder(idstr);
   	sb.deleteCharAt(sb.length()-1);
   	idstr = sb.toString();
   	
   	int id = Integer.parseInt(idstr);
  	String account = request.getParameter("account");
  	String password = request.getParameter("password");
  	String confirmPassword = request.getParameter("passwordConfim");
  	String name = request.getParameter("name");
  	String birthday = request.getParameter("birthday");
  	String sex = request.getParameter("sex");
  	String telephoneNumber = request.getParameter("tel");
  	String address = request.getParameter("address");
  	String email = request.getParameter("email");
  	String moneyStr = request.getParameter("money");
  	double money = Double.parseDouble(moneyStr);
  	
  	
  	if(account.equals("")||password.equals("")||confirmPassword.equals("")||name.equals("")||birthday.equals("")||sex.equals("")||telephoneNumber.equals("")||address.equals("")||email.equals("")||moneyStr.equals("")) {
  	out.println("<script language = 'javascript'>alert('��Ϣ������,�޸�ʧ��...');window.location.href='showUserMessage.jsp?userName=" + account + "';</script>");
  	}else {
  	/*  �ж��Ƿ������ȷ��������ͬ  */
  	if(!password.equals(confirmPassword)) {
	out.println("<script language = 'javascript'>alert('��Ϣ������,�޸�ʧ��...');window.location.href='showUserMessage.jsp?userName=" + account + "';</script>");
  	}else {
	  	/* �������ݿ��޸�����  */
	  	try{
	  		/* �޸ĳɹ�  */
	  		String sql = "update user set account='" + account + "',password='" + password + "',name='" + name + "',birthday='" + birthday + "',sex='" + sex + "',telephone='" + telephoneNumber + "',address='" + address + "',money=" + money + " where id="+ id;
	  		Dao.operateDate(sql);
	  		out.println("<script language = 'javascript'>alert('��Ϣ�޸ĳɹ� ������');window.location.href='center.jsp';</script>");
	  		}catch(Exception e) {
	  			%>
	<script type="text/javascript">
	  				alert("�� Ϣ �� �� ʧ ��....");
	  			</script>
	<%
	  		}
	  	}
  	}
   %>
	<p>
		<font
			style="color:red; font-size:15px"><a href="center.jsp"
			style="text-decoration:none">������ҳ</a> </font>
	</p>
</body>
</html>
