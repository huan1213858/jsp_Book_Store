<%@page import="javax.swing.JSpinner.ListEditor"%>
<%@ page language="java" import="java.util.*,java.sql.*,dao.*,entity.*"
	pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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

<title>My JSP 'userOrder.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="styles/book.css">

</head>
<body background="picture/back/center.png">
	<%
  		/*  ��ȡ����½�ɹ����û���id */
  		String userIdStr = request.getParameter("carId");
  		int userId = Integer.parseInt(userIdStr);
  		
  		/*  ������ID  */
  		int orderId = 0;
  		
  		String sql = "select * from shoppingcar_" + userId;
  		
		ArrayList<Order> list = new ArrayList<Order>();
		ArrayList<OrderMessage> list2 = new ArrayList<OrderMessage>();
		
		ResultSet rs = Dao.searchDate(sql);
  		while(rs.next()) {
	  		orderId = rs.getInt("id");
	  		String time = rs.getString("time");
	  		int bookId = rs.getInt("bookId");
	  		int count = rs.getInt("count");
	  		/* ����һ����������ʵ��  */
	  		Order order = new Order(orderId,time,bookId,count);
	  		list.add(order);
  		}
  		
  		int size = list.size();
  		/* �ж��Ƿ��ж�����Ϣ  */
  		if(size == 0) {
  			%><script type="text/javascript">
							alert("�� �� û ��  �� �� �� �� Ϣ....");
						</script>
	<p style="margin-left:650px;margin-top:400px">
		<font style="color:red; font-size:15px"><a href="center.jsp"
			style="text-decoration:none">������ҳ</a> </font>
	</p>
	<%
  		}else {
  		/*  �õ���ȫ�Ĺ����鼮�Ķ�����Ϣ    */
  		for(int i = 0 ; i < size ;i++) {
  		
  			int orderID = list.get(i).getId();
  			String time = list.get(i).getTime();
  			int count = list.get(i).getCount();
  			
  			sql = "select * from book where id =" + list.get(i).getBookId();	
  			rs = Dao.searchDate(sql);
  			while(rs.next()) {
  				int bookId = rs.getInt("id");
  				String bookName = rs.getString("name");
  				String bookAuthor = rs.getString("author");
  				double bookPrice = rs.getDouble("price");
  				String imageAddress = rs.getString("imageAddress");
  				/* ����������Ϣ��ʵ�� */
  				OrderMessage orderMessage = new OrderMessage(orderID,time,bookId,bookName,bookAuthor,bookPrice,imageAddress,count);
  				list2.add(orderMessage);
  			}
  		}
  		%>
	<table style="margin-left:5px;text-align:center" height="30px" width="1350px" cellspacing="0px" cellpadding="0px" align="center" border=1 bordercolor="white">
		 <tr bgcolor="#66CD00">
				<td ><font
					style="color:#FFF;font-size:20px;">ͼ�����</font>
				</td>
				<td ><font
					style="color:#FFF;font-size:20px;">����</font>
				</td>
				<td ><font
					style="color:#FFF;font-size:20px;">����</font>
				</td>
				<td ><font
					style="color:#FFF;font-size:20px;">�۸�</font>
				</td>
				<td ><font
					style="color:#FFF;font-size:20px;">����</font>
				</td>
				<td ><font
					style="color:#FFF;font-size:20px;">���빺�ﳵʱ��</font>
				</td>
				<td colspan="2"><font
					style="color:#FFF;font-size:20px;">����</font>
				</td>
			</tr>
		<%
	    		int j = 0;
	    		for(j = 0 ; j < list2.size() ; j++) {
	    			%>
		<tr>
			<td style="border:solid 1px #FFF"><a
				href="book_buy.jsp?bookId=<%=list2.get(j).getBookId() %>"><img
					src="<%=list2.get(j).getImageAddress() %>">
			</a></td>
			<td ><a href="book_buy.jsp?bookId=<%=list2.get(j).getBookId() %>" style="text-decoration:none">������ <%=list2.get(j).getBookName() %></a></td>
			<td > <%=list2.get(j).getBookAuthor() %></td>
			<td >�� <%=list2.get(j).getBookPrice() %></td>
			<td > <%=list2.get(j).getCount() %></td>
			<td > <%=list2.get(j).getTime() %></td>
			<td ><a href="settlementOrder.jsp?userId=<%=userId %>&orderId=<%=list2.get(j).getOrderId() %>&bookId=<%=list2.get(j).getBookId() %>" style="text-decoration:none; color:green">���㶩��</a>&nbsp;&nbsp;
			<a href="deleteOrder.jsp?userId=<%=userId %>&carId=<%=list2.get(j).getOrderId() %>&type=car" style="text-decoration:none;color:red">ɾ������</a></td>
		</tr>
		<%
	    			}
	    		}
	    	%>
	</table>
</body>
</html>
