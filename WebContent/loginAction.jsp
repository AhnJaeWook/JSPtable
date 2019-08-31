<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>  <!-- 아래에서 javascript 문장을 사용하기 위해 불렀습니다 -->
<% request.setCharacterEncoding("UTF-8"); %> <!-- 들어오는 데이터를 다 UTF-8형태로 받아옵니다. -->
<jsp:useBean id="user" class="user.User" scope="page" /> <!-- 자바빈즈를 사용하겠다. scope 현재페이지안에서만 빈즈가 사용되게합니다 -->
<jsp:setProperty property="userID" name="user" /> <!-- 현재페이지에 데이터가 들어옵니다 -->
<jsp:setProperty property="userPassword" name="user" /> <!-- 현재페이지에 데이터가 들어옵니다 -->
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
	
		UserDAO userDAO = new UserDAO();
		int result = userDAO.login(user.getUserID(), user.getUserPassword()); //받아온 함수를 login 함수에다가 보냅니다.
		if (result == 1){
			session.setAttribute("userID", user.getUserID()); //session userID키 에다가 데이터 저장
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
		}
		else if (result == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 틀립니다.')");
			script.println("history.back()"); //이전페이지로이동
			script.println("</script>");
		}
		else if (result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 아이디입니다.')");
			script.println("history.back()"); 
			script.println("</script>");
		}
		else if (result == -2){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류가 발생했습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
	%>
</body>
</html>