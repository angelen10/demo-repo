<!--������ -->
<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Main.jsp' starting page</title>
    
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
  <center>
	<!-- ����һ��ͼƬ -->
    <img src="imgs/1.gif"/>
    <hr>
    <h1>��ѡ�����</h1>
     <a href="UserClServlet?pageNow=1&flag=fenye&username=<%=u %>" >�����û�</a><br/>
     <!-- flag��־���߿����������з�ҳ -->
     <!-- ע���������<%=u %>Ҫ����˫������ߣ�ֱ�Ӹ���username -->
     <a href="addUser.jsp?username=<%=u %>">����û�</a><br/>
     <a href="#">�����û�</a><br/>
     <a href="#">ע���û�</a><br/>

    <hr>
    <!-- ����һ��ͼƬ -->
    <img src="imgs/logo.gif"/>
    </center>
  </body>
</html>
