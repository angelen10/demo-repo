<%@ page language="java" import="java.util.*" contentType="text/html; charset=gbk"%>
<%@page import="com.vvvv.entity.BookType"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>vvvv�����̳�</title>
    <link rel="styleSheet" href="<%=request.getContextPath()%>/background/css/body.css" type="text/css" media="all" />
  </head>
  
  <body>
    	<%
    		List<BookType> bookTypes = (List<BookType>)request.getAttribute("bookTypes");
    	%>
    	<table>
    		<caption>ͼ�������Ϣ�б�</caption>
    		<tr>
    			<th>bookTypeId</th>
    			<th>parentId</th>
    			<th>isDelete</th>
    			<th>bookTypeName</th>
    			<th>context</th>
    		</tr>
    		<%
    		for (BookType bookType : bookTypes) {%>
    			<tr onmouseover="this.bgColor='#E6EB00'" onmouseout="this.bgColor='white'">
    				<td><%=bookType.getBookTypeId() %></td>
    				<td><a href="<%=request.getContextPath() %>/FindAllBookTypeServlet?optType=<%=bookType.getBookTypeId() %>"><%=bookType.getParentId() %></a></td>
    				<td><%=bookType.getisDelete() %></td>
    				<td><a href="<%=request.getContextPath() %>/FindAllBookTypeServlet?optType=<%=bookType.getBookTypeId() %>"><%=bookType.getBookTypeName() %></a></td>
    				<td><%=bookType.getContext() %></td>
    			</tr>
    		<%}%>
    		<tr>
    			<td colspan="1" align="left">
    				<p align="left"><a href="<%=request.getContextPath() %>/FindBookTypeByIdServlet">����</a></p>
    			</td>
    			<td colspan="2" align="left">
    				<p>
    				<a href="<%=request.getContextPath() %>/FindAllBookTypeServlet?optType=0">�������</a>&nbsp;
    				<a href="<%=request.getContextPath() %>/FindAllBookTypeServlet?optType=255">�����</a>&nbsp;
    				<% String optType=request.getParameter("optType");
    				//System.out.println((Integer.parseInt(optType))-1);
    				//String parent=String.valueOf((Integer.parseInt(optType))-1); %>
    				<a href="<%=request.getContextPath() %>/FindAllBookTypeServlet?optType=<%=1 %>">�����</a>
    				</p>
    			</td>
    			<td colspan="2" >
    				<a href="<%=request.getContextPath()%>//FindAllBookTypeServlet?nowPage=1">��1ҳ</a>&nbsp;
    				<a href="<%=request.getContextPath()%>/FindAllBookTypeServlet?nowPage=1">��һҳ</a>&nbsp;
    				<a href="<%=request.getContextPath()%>/FindAllBookTypeServlet?nowPage=1">��һҳ</a>&nbsp;
    				<a href="<%=request.getContextPath()%>/FindAllBookTypeServlet?nowPage=1">���ҳ</a>&nbsp;
    			</td>
    		</tr>
    	</table>
  </body>
</html>
