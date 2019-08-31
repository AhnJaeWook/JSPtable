<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="java.io.PrintWriter" %>  <!-- 아래에서 javascript 문장을 사용하기 위해 불렀습니다 -->
<% request.setCharacterEncoding("UTF-8"); %> <!-- 들어오는 데이터를 다 UTF-8형태로 받아옵니다. -->
<jsp:useBean id="bbs" class="bbs.Bbs" scope="page" /> <!-- 자바빈즈를 사용하겠다. scope 현재페이지안에서만 빈즈가 사용되게합니다 -->
<jsp:setProperty property="bbsTitle" name="bbs" /> <!-- 현재페이지에 데이터가 들어옵니다 -->
<jsp:setProperty property="bbsContent" name="bbs" /> <!-- 현재페이지에 데이터가 들어옵니다 -->
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
		if (userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		}
		else{
			if(bbs.getBbsTitle() == null || bbs.getBbsContent() == null){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안 된 사항이 있습니다.')");
				script.println("history.back()");//이전페이지로이동
				script.println("</script>");
			} else{
				BbsDAO bbsDAO = new BbsDAO();
				int result = bbsDAO.write(bbs.getBbsTitle(), userID, bbs.getBbsContent()); //받아온 함수를 login 함수에다가 보냅니다.
				if (result == -1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기에 실패했습니다.')");
					script.println("history.back()");
					script.println("</script>");
				}
				else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href = 'read.jsp'"); 
					script.println("</script>");
				}	
			}
				
		}
	
		
	%>
</body>
</html>