<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>  <!-- 아래에서 javascript 문장을 사용하기 위해 불렀습니다 -->
<% request.setCharacterEncoding("UTF-8"); %> <!-- 들어오는 데이터를 다 UTF-8형태로 받아옵니다. -->
<jsp:useBean id="user" class="user.User" scope="page" /> <!-- 자바빈즈를 사용하겠다. scope 현재페이지안에서만 빈즈가 사용되게합니다 -->
<jsp:setProperty property="userID" name="user" /> <!-- 현재페이지에 데이터가 들어옵니다 -->
<jsp:setProperty property="userPassword" name="user" /> <!-- 현재페이지에 데이터가 들어옵니다 -->
<jsp:setProperty property="userName" name="user" /> <!-- 현재페이지에 데이터가 들어옵니다 -->
<jsp:setProperty property="userGender" name="user" /> <!-- 현재페이지에 데이터가 들어옵니다 -->
<jsp:setProperty property="userEmail" name="user" /> <!-- 현재페이지에 데이터가 들어옵니다 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 게시판 만들기</title>
</head>
<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		if (userID != null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인이 되어있습니다.')");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
		}
		if(user.getUserID() == null || user.getUserPassword() == null || user.getUserName() == null || user.getUserGender() == null || user.getUserEmail() == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.')");
			script.println("history.back()");//이전페이지로이동
			script.println("</script>");
		}
		else{
			UserDAO userDAO = new UserDAO();
			int result = userDAO.join(user); //받아온 함수를 login 함수에다가 보냅니다.
			if (result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이미 있는 유저정보입니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
			else {
				session.setAttribute("userID", user.getUserID());
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'main.jsp'"); 
				script.println("</script>");
			}	
		}
	
		
	%>
</body>
</html>