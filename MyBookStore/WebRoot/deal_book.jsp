<%@page import="javax.swing.JSpinner.ListEditor"%>
<%@ page language="java"
	import="java.util.*,java.sql.*,dao.*,entity.*,java.text.*,java.util.Date"
	pageEncoding="GBK"%>
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

<title>My JSP 'del_book.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="styles/book.css">
</head>

<body background="picture/back/center.png">
	<%
		/* ��ȡ��ҳ�еĶ��󻺴�  �鿴 */
		Object object = request.getSession().getAttribute("objectUser");
		int bookId = 0;
		if (object == null) {
			/* δ��¼����� */
		out.println("<script language = 'javascript'>alert('���ȵ�¼...');window.location.href='login.jsp?loginType=user';</script>");
		} else {

			int count_buy = Integer.parseInt(request
					.getParameter("count_buy"));
			bookId = Integer.parseInt(request.getParameter("bookId"));

			/* �� object ת���� user �����ȡ�û��� id ֵ  */
			User user = (User) object;
			int userId = 0;
			String sql = "select * from user where account='"
					+ user.getAccount() + "'";
			ResultSet rs = Dao.searchDate(sql);
			while (rs.next()) {
				userId = rs.getInt("id");
			}

			/* �ж��û�������Ƿ��ܹ�����   */
			sql = "select * from user where id = " + userId;
			rs = Dao.searchDate(sql);
			double userMoney = 0;
			while (rs.next()) {
				userMoney = rs.getDouble("money");
			}

			/*  ���ҵ���ǰ���ʣ����   */

			sql = "select * from book where id = " + bookId;
			int allowance = 0; /* �������   */
			double bookPrice = 0; /* ��ĵ���   */

			try {
				rs = Dao.searchDate(sql);
				while (rs.next()) {
					allowance = rs.getInt("count");
					bookPrice = rs.getDouble("price");

				}
				boolean canBuy = true;
				if (count_buy > allowance) {
					canBuy = false;
					out.println("<script language = 'javascript'>alert('��  ��  ͼ  ��  ��  ��  ��  ��....');window.location.href='book_buy.jsp?bookId=" + bookId + "';</script>");
		}
				/*  ���Ǯ����    */
				if (userMoney < (count_buy * bookPrice)) {
					canBuy = false;
	out.println("<script language = 'javascript'>alert('�˻�����...');window.location.href='book_buy.jsp?bookId=" + bookId + "';</script>");
		}
				if (canBuy == true) {
					/*  ����������������ݿ��н����޸�   ���û������    */
					sql = "update book set count = "
							+ (allowance - count_buy) + " where id = "
							+ bookId;
					Dao.operateDate(sql);

					sql = "update user set money = "
							+ (userMoney - (count_buy * bookPrice))
							+ " where id = " + userId;
					Dao.operateDate(sql);
					/*  ���ö�����Ϣ��ӵ����Ӧ�û�������Ķ�����¼��    */
					/*  ����ʱ��     */
					Date date = new Date();
					SimpleDateFormat sdf = new SimpleDateFormat(
							"yyyy-MM-dd HH:mm:ss");
					String dateNowStr = sdf.format(date);

					sql = "insert into orderform_" + userId
							+ " (time,bookId,count) values ('" + dateNowStr
							+ "'," + bookId + "," + count_buy + ")";
					Dao.operateDate(sql);
	%><script type="text/javascript">
				alert("��  ��  ��  �� ! ! !");
			</script>
	<%
		} else {
	out.println("<script language = 'javascript'>alert('����ʧ��...');window.location.href='book_buy.jsp?bookId=" + bookId + "';</script>");
		}
			} catch (Exception e) {
	out.println("<script language = 'javascript'>alert(''����ʧ��...');window.location.href='book_buy.jsp?bookId=" + bookId + "';</script>");
		}
		}
	%>
	<div class="floatLogo">
		<img src="picture/back/logo2.png">
	</div>
</body>
</html>
