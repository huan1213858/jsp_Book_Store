<%@page import="javax.swing.JSpinner.ListEditor"%>
<%@ page language="java" import="java.util.*,java.sql.*,dao.*,entity.*"
	pageEncoding="GBK"%>
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

<title>My JSP 'deleteOrder.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="styles/book.css">

</head>

<body background="picture/back/center.png">
	<%
  		/*  ����û��ģɣĺͶ����ģɣġ�ɾ������������¼��*/
  		String deleteType = request.getParameter("type");
  		String userIdString = request.getParameter("userId");
  		int userId = Integer.parseInt(userIdString);
  		String type = "";
  		int orderORcarId = 0;
  		String sql = "";
  		String tend = "";
  		
  		if(deleteType.equals("order")) {
  			type = "orderform_";
  			tend = "userOrder.jsp?orderId=" + userId;
  			String orderIdString = request.getParameter("orderId");
  			orderORcarId = Integer.parseInt(orderIdString);
  		}else if(deleteType.equals("car")) {
  			tend = "userCar.jsp?carId=" + userId;
			type = "shoppingcar_";
			String carIdString = request.getParameter("carId");
			orderORcarId = Integer.parseInt(carIdString);  			
  		}
  		
  		try{
  			sql = "delete from " + type + userId + " where id =" + orderORcarId;
  			Dao.operateDate(sql);
  			out.println("<script language = 'javascript'>alert('�� �� ɾ �� �� �� �� Ϣ  ! ! !');window.location.href='" + tend + "';</script>");
  		}catch(Exception e) {
	  		e.printStackTrace();
	  		out.println("<script language = 'javascript'>alert('ɾ  �� �� �� �� Ϣ ʧ ��....');window.location.href='" + tend + "';</script>");
  		}

  		/*  ��ȡ����½�ɹ����û���id */
  	/* 	String userIdStr = request.getParameter("orderId");
  		System.out.println("UserId: " + userIdStr);
  		userId = Integer.parseInt(userIdStr); */
  		
  		/*  ������ID  */
  		int orderId = 0;
  		
  		sql = "select * from " + type + userId;
  		
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
							alert("�� �� û �� �� �� �� Ϣ....");
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
	<table style="margin-left:7px" height="30px" border="0" width="1350px"
		 cellspacing="4px" cellpadding="6px">
		<%
	    		int j = 0;
	    		for(j = 0 ; j < list2.size() ; j++) {
	    			%>
		<tr>
			<td><a
				href="book_buy.jsp?bookId=<%=list2.get(j).getBookId() %>"><img
					src="<%=list2.get(j).getImageAddress() %>">
			</a></td>
			<td><a href="book_buy.jsp?bookId=<%=list2.get(j).getBookId() %>" style="text-decoration:none">������ <%=list2.get(j).getBookName() %></a></td>
			<td>���ߣ� <%=list2.get(j).getBookAuthor() %></td>
			<td>�۸񣺣� <%=list2.get(j).getBookPrice() %></td>
			<td>������ <%=list2.get(j).getCount() %></td>
			<td>����ʱ�䣺 <%=list2.get(j).getTime() %></td>
			<td><a href="deleteOrder.jsp?userId=<%=userId %>&orderId=<%=list2.get(j).getOrderId() %>&type=order" style="text-decoration:none">ɾ������</a></td>
		</tr>
		<%
	    			}
	    		}
	    	%>
	</table>
</body>
</html>
