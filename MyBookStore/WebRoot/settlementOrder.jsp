<%@page import="javax.swing.JSpinner.ListEditor"%>
<%@ page language="java" import="java.util.*,java.sql.*,dao.*,entity.*,java.text.*,java.util.Date"
	pageEncoding="GBK"
%>
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
    
    <title>My JSP 'settlementOrder.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="styles/book.css">

  </head>
  
  <body background="picture/back/center.png">
  <%
  	String userIdString = request.getParameter("userId");
  	int userId = Integer.parseInt(userIdString);
  	String orderIdString = request.getParameter("orderId");
  	int orderId = Integer.parseInt(orderIdString);
  	String bookIdString = request.getParameter("bookId");
  	int bookId = Integer.parseInt(bookIdString);
  	int count = 0;
 // 	double bookPrice = 0;
  	
  	/* ��ѯ�����ﳵ�иö������鱾����  */
  	String sql = "select * from shoppingcar_" + userId + " where id=" + orderId;
  	ResultSet rs = Dao.searchDate(sql);
  	
  	while(rs.next()) {
  		count = rs.getInt("count");
  		
  	}
  	/* �ж��û�������Ƿ��ܹ�����   */
/* 	  	sql = "select * from user where id = " + userId;
	  	rs = Dao.searchDate(sql);
	  	double userMoney = 0;
	  	while(rs.next()){
	  		userMoney = rs.getDouble("money");
	  	} */
  	
  	/*  ��ѯ���޸����ݿ��и��鱾��Ϣ������    */
  	try {
  		/* ���ݿ��и��������   */
  		int allowance = 0;
  		sql = "select * from book where id=" + bookId;
  		System.out.println(sql);
	  	rs = Dao.searchDate(sql);
	  	
	  	while(rs.next()) {
	  		allowance = rs.getInt("count");
	  	}
	  	
	  	System.out.println("����;" + allowance);
	  	System.out.println("����" + count);
	  	if(count > allowance) {
	  	%><script type="text/javascript">
					alert("��  ��  ��  ��  ����   ��   ͼ  ��  ��  ��  ��  �� ....");
				  </script>
				  <%
	  	}/*  ���Ǯ����    */
	//  	if(userMoney < (count_buy*bookPrice)){
	 	
	//  	}
	  	else {
	  	/*  ����������������ݿ��н����޸�    */
	 	sql = "update book set count = " + (allowance-count) + " where id = " + bookId;
	 	Dao.operateDate(sql);
	 	
	 	/*  ���ö�����Ϣ��ӵ����Ӧ�û�������Ķ�����¼��    */
	 	/*  ����ʱ��     */
	 	Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String dateNowStr = sdf.format(date);
		
	 	sql = "insert into orderform_" + userId + " (time,bookId,count) values ('" + dateNowStr + "'," + bookId + "," + count + ")";
	 	Dao.operateDate(sql);
	 	
	 	/* ɾ�����ﳵ�еĸö�����Ϣ   */
	 	sql = "delete from shoppingcar_" + userId + " where id=" + orderId;
	 	Dao.operateDate(sql);
	 	
	 	%><script type="text/javascript">
					alert("��  ��   ��   �� ! ! !");
				  </script><%}
	 }catch(Exception e) {
		 e.printStackTrace();
	 	%><script type="text/javascript">
					alert("��  ��  ʧ  ��....");
				  </script><%
	 	}
  %>
  <%
  /*  ��ȡ����½�ɹ����û���id */
  		/* String userIdStr = request.getParameter("carId");
  		System.out.println("UserId: " + userIdStr);
  		int userId = Integer.parseInt(userIdStr);  */
  		
  		/*  ������ID  */
  		orderId = 0;
  		
  		sql = "select * from shoppingcar_" + userId;
  		
		ArrayList<Order> list = new ArrayList<Order>();
		ArrayList<OrderMessage> list2 = new ArrayList<OrderMessage>();
		
		rs = Dao.searchDate(sql);
  		while(rs.next()) {
	  		orderId = rs.getInt("id");
	  		String time = rs.getString("time");
	  		bookId = rs.getInt("bookId");
	  		count = rs.getInt("count");
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
  			count = list.get(i).getCount();
  			
  			sql = "select * from book where id =" + list.get(i).getBookId();	
  			rs = Dao.searchDate(sql);
  			while(rs.next()) {
  				bookId = rs.getInt("id");
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
	<table style="margin-left:3px" height="30px" border="0" width="1320px"
		 cellspacing="3px" cellpadding="3px">
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
			<td>���빺�ﳵʱ�䣺 <%=list2.get(j).getTime() %></td>
			<td><a href="settlementOrder.jsp?userId=<%=userId %>&orderId=<%=list2.get(j).getOrderId() %>&bookId=<%=list2.get(j).getBookId() %>" style="text-decoration:none">���㶩��</a>&nbsp;
			<a href="deleteOrder.jsp?userId=<%=userId %>&carId=<%=list2.get(j).getOrderId() %>&type=car" style="text-decoration:none">ɾ������</a></td>
		</tr>
		<%
	    			}
	    		}
	    	%>
	</table>
  <p style="margin-left:600px;margin-top:400px">
		<font style="color:red; font-size:15px"><a href="center.jsp"
			style="text-decoration:none">������ҳ</a> </font>
	</p>
	<div class="floatLogo">
		<img src="picture/back/logo2.png">
	</div>
  </body>
</html>
