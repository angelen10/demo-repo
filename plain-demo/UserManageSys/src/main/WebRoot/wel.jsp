<!--��ӭ���� -->
<%@ page language="java" import="java.util.*,java.sql.*,user.model.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'wel.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
	<!--
		function msg()
		{
			return window.confirm("��ȷ��Ҫɾ����");
		}
	-->
	</script>
  </head>
  
  <body bgcolor="ff9900"> 
  	<% 
  		String u=request.getParameter("username"); 
  		//System.out.println("UserClServlet�õ���username="+u);
  		//u=new String(u.getBytes("gb2312"),"iso-8859-1"); //ת�� 
	  	//��ֹ�û��Ƿ���¼ 
  		String userName=(String)session.getAttribute("myName"); 
  		//����û�û�е�¼ 
  		if(userName==null) 
  		{ 
  			//���ص�¼���� 
  			response.sendRedirect("login.jsp?errNo=1"); 
  			return ; 
  		} 
  		 
  	 %>
    	��¼�ɹ���άΨΪΪ��ϲ�㣡<%=u %><br/>
    	session�õ����û���Ϊ��<%=userName %><br/>
    	<a href="login.jsp">�������µ�¼</a>&nbsp;&nbsp;
    	<a href="Main.jsp?username=<%=u %>">����������</a>
    	<hr>
    	<center>
    	<h1>�û���Ϣ�б�</h1>
    	<%
    		//����UserBeanCl�ķ���(����һ��UserBeanCl��ʵ����Ȼ���������ĳ������)����ɷֲ���ʾ
   			//UserBeanCl ubc=new UserBeanCl();
   			//ArrayList al=ubc.getUserByPage(pageNow);
		   	
		   	//Ҫ��ʾ���û���Ϣ��request��ȡ
		   	ArrayList al=(ArrayList)request.getAttribute("result");
		   	
		//��ʾ
		 %>
		 <%
   	 		//�õ�pageCount
   	 		String s_pageCount=(String)request.getAttribute("pageCount");
   	 		int pageCount=Integer.parseInt(s_pageCount);
   	 		String s_pageSize=(String)request.getAttribute("pageSize");
   	 		int pageSize=Integer.parseInt(s_pageSize);
   	 		String s_pageNow=(String)request.getAttribute("pageNow");
   	 		int pageNow=Integer.parseInt(s_pageNow);
   	 	%>
	   	<table border="1">
	   		<tr bgcolor="pink"><td>�û�id</td><td>�û���</td><td>����</td>
	   		<td>����</td><td>����</td><td>�޸��û�</td><td>ɾ���û�</td></tr>
	   	<%
	   		//����һ����ɫ����
	   		String []color={"silver","pink"};
	   		for(int i=0;i<al.size();i++)
	   		{	//��al��ȡ��UserBean
	   			UserBean ub=(UserBean)al.get(i);
	   	 %>
	   			<tr bgcolor="<%=color[i%2] %>"><td><%=ub.getUserId() %></td><td><%=ub.getUsername() %></td>
	   			<td><%=ub.getPasswd() %></td><td><%=ub.getEmail() %></td>
	   			<td><%=ub.getGrade() %></td>
	   			<td><a href="updateUser.jsp?username=<%=u%>&pageNow=<%=pageNow %>&userId=<%=ub.getUserId()
	   				%>&userName=<%=ub.getUsername() %>&passWd=<%=ub.getPasswd() %>&email=<%=ub.getEmail() 
	   				%>&grade=<%=ub.getGrade() %>">�޸��û�</a></td>
	   			<td><a onclick="return msg()" href="UserClServlet?username=<%=u%>&pageNow=<%=pageNow 
	   				%>&flag=delUser&userid=<%=ub.getUserId() %>">ɾ���û�</a></td></tr>
	   	<%
	   		}
   	 	 %>
   	 	</table>

   	 	<%	
   	 		//��ҳ
   	 		out.println("<a href=UserClServlet?flag=fenye&pageNow=1&username="+u+">��ҳ</a>"); //ת����ҳ����������
   	 		//��һҳ
   	 		if(pageNow!=1)
   	 		{
   	 			out.println("<a href=UserClServlet?flag=fenye&pageNow="+(pageNow-1)+"&username="+u+">��һҳ</a>");
   	 		}
   	 		//��ʾҳ������
   	 		for(int i=pageNow;i<pageNow+pageSize&&i<=pageCount;i++)
   	 		{
   	 			out.println("<a href=UserClServlet?flag=fenye&pageNow="+i+"&username="+u+">["+i+"]</a>");
   	 		}
   	 		//��һҳ
   	 		if(pageNow!=pageCount)
   	 		{
   	 			out.println("<a href=UserClServlet?flag=fenye&pageNow="+(pageNow+1)+"&username="+u+">��һҳ</a>");
   	 		}
   	 		//βҳ
   	 		out.println("<a href=UserClServlet?flag=fenye&pageNow="+pageCount+"&username="+u+">βҳ</a>&nbsp;&nbsp;");
   	 		
   	 		//��ת
   	 		out.println("<input id=\"jumpText\" type=\"text\" size=\"4\" >");
   	 		out.println("<input type=\"button\" size=\"3\" onclick=\"jump()\" value=\"��ת\">");
   	 	 %>
   	 	 <script type="text/javascript">
   	 	 	function jump(){
   	   	 	 	var pageJump=document.getElementById("jumpText");
   	   	 	 	confirm("��ת��"+pageJump.value);
				window.open("UserClServlet?flag=fenye&pageNow="+pageJump.value+"&username='<%=u%>'","_self");
   	 	 	}
   	 	 </script>
   	 	 <hr>
   	 	 <!-- ����һ��ͼƬ -->
    	 <img src="imgs/logo.gif"/>
   	 	 </center>
  </body>
</html>
