<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addUser.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
<body bgcolor="ff9900">
	<%
		String u=request.getParameter("username");
		//System.out.println("Main.jsp�õ���username="+u);
	 %>
	 ��ӭ����<%=u %><br>
	 <a href="Main.jsp?username=<%=u %>">����������</a>
  	<center>
  		
		<!-- ����һ��ͼƬ -->
	    <img src="imgs/1.gif"/>
	    <hr>
	    <h1>�������û���Ϣ</h1>
	    <form action="UserClServlet?pageNow=1&flag=addUser&username=<%=u %>" method="post">
	    	<table border="1">
	    		<tr bgcolor="pink"><td>�û���</td><td><input type="text" name="userName"/></td></tr>
	    		<tr bgcolor="silver"><td>����</td><td><input type="text" name="password"/></td></tr>
	    		<tr bgcolor="pink"><td>�����ʼ�</td><td><input type="text" name="email"/></td></tr>
	    		<tr bgcolor="silver"><td>����</td><td><input type="text" name="grade"/></td></tr>
	    	</table>
	    	<input type="submit" value="����û�"/>&nbsp;&nbsp;
	    	<input type="reset" value=" ��  �� "/>
	    </form>
	
	    <hr>
	    <!-- ����һ��ͼƬ -->
	    <img src="imgs/logo.gif"/>
    </center>
  </body>
</html>
