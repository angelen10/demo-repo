<%@ page language="java" import="java.util.*" contentType="text/html; charset=gbk"%>
<%@page import="com.vvvv.entity.BookInfo"%>
<%@page import="com.vvvv.entity.BookType"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>�޸�ͼ����Ϣ-vvvv�����̳�</title>
    <link rel="styleSheet" href="<%=request.getContextPath()%>/background/css/body.css" type="text/css" media="all" />
    <style type="text/css">
    	table td {
    		text-align:left;
		}
		
    </style>
  </head>
  
  <body onload="init()">&nbsp; 
  <br><br><br><br><br>
  	<%
  		BookInfo book = (BookInfo)request.getAttribute("book");
  	%>
  	
    <form action="<%=request.getContextPath()%>/UpdateBookInfoServlet" name="updateBookType" method="post">
    	<table>
    	<caption>�޸�ͼ����Ϣ</caption>
    		<tr>
    			<td>ͼ����:</td>
    			<td ><input name="bookId" size="35" value="<%=book.getBookId()%>" readonly></td>
    		</tr>
    		<tr>
    			<td>ͼ������:</td>
    			<td ><input name="bookName" size="35" value="<%=book.getBookName()%>"></td>
    		</tr>
    		<tr>
    			<td>ͼ������ţ�</td>
    			<td>
    			<select name="bookTypeId" id="bookTypeSelect" onclick="option_newBook()">
    				<%
    				List<BookType> bookTypes=(List<BookType>)request.getAttribute("bookTypes");
    				for (BookType bookType : bookTypes)
    				{
    				%>
    					<option value="<%=bookType.getBookTypeId() %>"
    				<%
    				//		if(bookType.getBookTypeId()==book.getBooktypeId()){
   					%>
   					<%// 			selected="selected"   %>
   					<%
    				//	} 
    				%>
    					><%=bookType.getBookTypeName() %></option>
    				<%
    				}
    				%>
    				<option>--����ͼ�����--</option>
    			</select>
				</td>
				<script type="text/javascript">
    			function init(){
    				document.updateBookType.bookTypeId.value='<%=book.getBooktypeId() %>';
    			}
  				</script>
    		</tr>
    		<tr>
    			<td>���������ƣ�</td>
    			<td><input name="pbName" size="35" value="<%=book.getPbName()%>">*</td>
    		</tr>
    		<tr>
    			<td>���ߣ�</td>
    			<td><input name="author" size="35" value="<%=book.getAuthor()%>">*</td>
    			
    		</tr>
    		<tr>
    			<td>��ͼƬ��</td>
    			<td><input type="file" name="bigImg" size="35" value="<%=book.getBigImg() %>">&nbsp;&nbsp;�ļ��ϴ�</td>
    		</tr>
    		<tr>
    			<td>СͼƬ��</td>
    			<td><input type="file" name="smallImg" size="35" value="<%=book.getSmallImg() %>">&nbsp;&nbsp;�ļ��ϴ�</td>
    		</tr>
    		<tr>
    			<td>��Ǯ��</td>
    			<td><input name="price" size="35" value="<%=book.getPrice() %>"></td>
    		</tr>
    		<tr>
    			<td>vvvv�ؼۣ�</td>
    			<td><input name="vvvvPrice" size="35" value="<%=book.getVvvvprice() %>"></td>
    		</tr>
    		<tr>
    			<td>�������ڣ�</td>
    			<td><input name="pbDate" size="35" value="<%=book.getPbdate() %>"></td>
    		</tr>
    		<tr>
    			<td>ͼ��״̬��</td>
    			<td><input type="radio" name="bookStates" value="1"
	    				<%if(book.getBookStatus() == 1) {%>
	    					checked		
	    				<%} %> 
    				>���� 
    				<input type="radio" name="bookStates" value="2"
	    				<%if(book.getBookStatus() == 2) {%>
		    					checked		
		    			<%} %> 
    				>�ϼ�
    				<input type="radio" name="bookStates" value="3"
	    				<%if(book.getBookStatus() == 3) {%>
		    					checked		
		    			<%} %>
    				>������
    			</td>
    		</tr>
    		<tr>
    			<td>����:</td>
    			<td><textarea rows="4" cols="35" name="context"><%=book.getContext() %>
    			</textarea></td>
    		</tr>
    		<tr>
    			<td><input type="submit" value="submit"/></td>
    			
    			<td><input type="reset" value="reset"/></td>
    		</tr>
    	</table>
    </form>
  </body>
  
</html>
