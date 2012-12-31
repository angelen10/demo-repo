<%@ page language="java" import="java.util.*" contentType="text/html; charset=gbk"%>
<%@page import="com.vvvv.entity.BookInfo"%>

<html>
  <head>
    <title>ͼ����Ϣ�б�-vvvv�����̳�</title>
    <link rel="styleSheet" href="<%=request.getContextPath()%>/background/css/body.css" type="text/css" media="all" />
  </head>
  
  <body onload="init()">
    	<%
    		//��pageCountҳ
    		int pageCount=Integer.parseInt(request.getAttribute("pageCount").toString());
    		//��nowPageҳ
    		int nowPage=Integer.parseInt(request.getAttribute("nowPage").toString());
    		//pageSize ÿҳ��ʾ������
    		int pageSize=Integer.parseInt(request.getAttribute("pageSize").toString());
    		//
    		List<BookInfo> books = (List<BookInfo>)request.getAttribute("books");
    	%>
    	<table>
    		<caption>ͼ����Ϣ�б�</caption>
    		<tr>
    			<th>bookId</th>
    			<th>bookName</th>
    			<th>author</th>
    			<th>bookTypeId</th>
    			<th>pbName</th>
    			<th>price</th>
    			<th>ygcPrice</th>
    			<th>pbDate</th>
    			<th>״̬</th>
    			<th>�޸�</th>
    			<th>������</th>
    			<th>ɾ��</th>
    		</tr>
    		<%
    		for (BookInfo book: books) {%>
    			<tr onmouseover="this.bgColor='#E6EB00'" onmouseout="this.bgColor='white'">
    				<td><%=book.getBookId()%></td>
    				<td><%=book.getBookName()%></td>
    				<td><%=book.getAuthor()%></td>
    				<td><%=book.getBooktypeId()%></td>
    				<td><%=book.getPbName()%></td>
    				<td><%=book.getPrice()%></td>
    				<td><%=book.getVvvvprice()%></td>
    				<td><%=book.getPbdate()%></td>
    				<td><%=book.getBookStatus()%></td>
    				<td><a href="FindBookInfoByIdServlet?bookId=<%=book.getBookId()%>">�޸�</a></td>
    				<td><a href="SetBookUnavailableServlet?bookId=<%=book.getBookId()%>">������</a></td>
    				<td><a href="DeleteBookInfoServlet?bookId=<%=book.getBookId()%>" 
    					title="ɾ��ͼ����Ϣ" onclick="return isDelete('<%=book.getBookName() %>')">ɾ��</a></td>
    			</tr>
    		<%}%>
    		<tr>
    			<td colspan="1" >
    				<a href="<%=request.getContextPath() %>/InitBookTypeServlet">����</a>
    			</td>
    			<td colspan="2" >
    				<a id="unShelf" href="#" onclick=changeStatus(1)>δ�ϼ�</a>&nbsp;&nbsp;
    				<a id="shelfed" href="#" onclick=changeStatus(2)>���ϼ�</a>&nbsp;&nbsp;
    				<a id="unable" href="#" onclick=changeStatus(3)>������</a>&nbsp;&nbsp;
    				<a id="showAll" href="#" onclick=changeStatus(4)>����</a>
    			</td>
    			<% //String bookStatus=request.getAttribute("bookStatus").toString(); 
    				//String pageSize=request.getAttribute("pageSize").toString();
    			%>
    			<td colspan="9" >
    				��<%=pageCount %>ҳ &nbsp;��<%=nowPage %>ҳ&nbsp;&nbsp;
    				<%if(nowPage==1){%>
    					��һҳ&nbsp;��һҳ&nbsp;
    				<%} else{ %>
    					<a href="#" onclick="gotoNowPage(1)">��һҳ</a>
    					<a href="#" onclick="gotoNowPage(<%=nowPage-1 %>)">��һҳ</a>
    				
    				<%}%>
    				<%if(nowPage==pageCount){%>
    					��һҳ&nbsp;���ҳ&nbsp;
    				<%} else{ %>
    					<a href="#" onclick="gotoNowPage(<%=nowPage+1 %>)">��һҳ</a>
    					<a href="#" onclick="gotoNowPage(<%=pageCount %>)">���ҳ</a>
    				<%}%>
    				<select id="selectNowPage" onchange="gotoNowPage(this.value)">
    				<% 
    					for(int i=1;i<=pageCount;i++){%>
    						<option value=<%=i %>>��<%=i %>ҳ</option>
    				<%}
    				%>		
    				</select>&nbsp;&nbsp;
    				<input id="pageSize" value="<%=pageSize %>" type="text" size="1"/>
    				<input type="button" onclick="gotoNowPage(<%=nowPage %>)" value="pageSize"/>
    			</td>
    		</tr>
    	</table>
  </body>
  <script type="text/javascript">
  	var bookStatus='<%=request.getAttribute("bookStatus").toString()%>';
  	function isDelete(bookName){
		return confirm("��ȷ��Ҫɾ��"+bookName+"��");	
  	}
  	function gotoNowPage(nowPage){
  		var pageSize=document.getElementById("pageSize").value;
		var url="<%=request.getContextPath()%>/FindAllBookInfoServlet?bookStatus="
			+bookStatus+"&nowPage="+nowPage+"&pageSize="+pageSize;
		window.location=url;
  	}
  	function changeStatus(MyStatus){
		bookStatus=MyStatus;
		gotoNowPage(1);
  	}
  	function init(){
  	  	var tag="showAll";
		if(bookStatus=='1'){
			tag="unShelf";
		}
		else if(bookStatus=='2'){
			tag="shelfed";
		}
		else if(bookStatus=='3'){
			tag="unable";
		}
		document.getElementById(tag).style.backgroundColor='yellow';
		document.getElementById("selectNowPage").value="<%=nowPage %>";//�����½��б��ѡ�еĲ���
  	}
  </script>
</html>
