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
<title>top</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" type="text/css" href="styles/book.css">
</head>
<body background="picture/back/top.png">
	<table width="100%">
		<tr>
			<td><img src="picture/back/logo.png">
			</td>
			<td width="35%" align="center"><h1>
					<font style="font-size:80px;color:#AD5A5A">Book Store</font>
				</h1>
			</td>
			<td><table cellspacing="2px" cellpadding="2px" border="1"
					bordercolor="red" align="center">
					<tr>
						<td rowspan="2"><font style="color:red">ͼ�����:</font></td>
						<td><a href="center.jsp?bookType=art" target="center"
							style="text-decoration:none">������</a></td>
						<td><a href="center.jsp?bookType=movie" target="center"
							style="text-decoration:none">��Ӱ��</a></td>
						<td><a href="center.jsp?bookType=encouragement"
							target="center" style="text-decoration:none">�ɹ���־��</a></td>
					</tr>
					<tr>
						<td><a href="center.jsp?bookType=novel" target="center"
							style="text-decoration:none">С˵��</a></td>
						<td><a href="center.jsp?bookType=computer" target="center"
							style="text-decoration:none">�������</a></td>
					</tr>
				</table>
			</td>
			<!-- �ж��Ƿ��¼ ������Ѿ���¼����ʾ�û�����������ʾ  -->
			<td align="right"><b><font color="blue"> <%
 	/* ���ڴ�����������͹��ﳵ�����id  */
 	int userId = 0;
 	String account = "";
	
	/** ����˵�½��Ť   */
 	if (session.getAttribute("loginType") != null  && session.getAttribute("loginType") != "") {
 		boolean loginSuccess = false;
 		String sql = "select * from ";
 		String loginType = (String) session.getAttribute("loginType");
 		if (loginType.equals("admin")) {
 			sql += "admin";
 		} else if (loginType.equals("user")) {
 			sql += "user";
 		}
 		account = request.getParameter("account");
 		String password = request.getParameter("password");
 		/* �������ݿ�  */
 		ResultSet rs = Dao.searchDate(sql);
 		while (rs.next()) {
 			int id = rs.getInt("id");
 			String Account = rs.getString("account");
 			String Password = rs.getString("password");
 			if (Account.equals(account) && Password.equals(password)) {
 				loginSuccess = true;
 				userId = rs.getInt("id");
 				break;
 			}
 		}
 		if (loginSuccess) {
 		session.setAttribute("loginType", "");
 %> <script type="text/javascript">
		alert("��  ½  ��  ��  ! ! !");
	</script> <font><a href="showUserMessage.jsp?userName=<%=account%>"
							target="center" style="text-decoration:none;color:red"><%=account%></a>
					</font> <a href="userOrder.jsp?orderId=<%=userId%>" target="center"
						style="color:gray;text-decoration:none">�ҵĶ���</a> <a
						href="userCar.jsp?carId=<%=userId%>" target="center"
						style="color:gray;text-decoration:none">�ҵĹ��ﳵ</a> <a
						href="center.jsp" target="center"
						style="text-decoration:none;color:gray">��ҳ</a> <a
						href="userRegister.jsp" target="center"
						style="text-decoration:none;color:gray">ע��</a> <a
						href="Cancellation" style="text-decoration:none;color:gray">ע��</a>
						<%
 			/* ��½�ɹ���Ϊsession����һ������  ���㹺����ߴ�������ʱ�ж��Ƿ��½  */
 			 if (loginType.equals("user")) {
 				User user = new User(account, password);
 				/*  ��ҳ����Ӷ���Ļ���   */
 				request.getSession().setAttribute("objectUser", user);
 				request.setAttribute("enter", "true");
 			}
 		} else {
 %><script type="text/javascript">
							alert("��  ½  ʧ  �� ....");
						</script><a href="login.jsp?loginType=user" target="center"
						style="text-decoration:none;color:gray"><font color="#F75000">�ף����ȵ�½</font>
					</a> <a href="center.jsp" target="center"
						style="text-decoration:none;color:gray">��ҳ</a> <a
						href="userRegister.jsp" target="center"
						style="text-decoration:none;color:gray">ע��</a> <%
 	}
							} else {
						%> <a href="login.jsp?loginType=user" target="center"
						style="text-decoration:none;color:gray"><font color="#F75000">�ף����ȵ�½</font>
					</a> <a href="center.jsp" target="center"
						style="text-decoration:none;color:gray">��ҳ</a> <a
						href="userRegister.jsp" target="center"
						style="text-decoration:none;color:gray">ע��</a>
				</font> </b>
			</td>
		</tr>

		<%
			}
		%>
	</table>
</body>
</html>
