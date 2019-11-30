<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="java.io.PrintWriter" %>  <!-- 아래에서 javascript 문장을 사용하기 위해 불렀습니다 -->
<%@ page import="file.FileDAO" %>
<%@ page import="java.io.File" %> <!-- 기존의 파일이나 폴더를 제어하는데 사용 -->
<%@ page import="java.util.Enumeration" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %> <!-- 사용자가 올린 파일중에 이름이 같은 파일들을 자동으로 이름을 바꿔줌 -->
<%@ page import="com.oreilly.servlet.MultipartRequest" %> <!-- 파일업로드를 수행하는데사용 -->
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
		String directory = "C:/jsp/upload/";
		int maxSize = 1024 * 1024 * 100; // 100MB
		String encoding = "UTF-8";
		MultipartRequest multipartRequest = new MultipartRequest(request, directory, maxSize, encoding,
				new DefaultFileRenamePolicy());
	
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
			if(multipartRequest.getParameter("bbsTitle") == null || multipartRequest.getParameter("bbsContent") == null ||
					multipartRequest.getParameter("bbsTitle") == "" || multipartRequest.getParameter("bbsContent") == ""){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안 된 사항이 있습니다.')");
				script.println("history.back()");//이전페이지로이동
				script.println("</script>");
			} else{
				BbsDAO bbsDAO = new BbsDAO();
				int result = bbsDAO.write(multipartRequest.getParameter("bbsTitle"), userID, multipartRequest.getParameter("bbsContent")); //받아온 함수를 login 함수에다가 보냅니다.
				
				Enumeration fileNames = multipartRequest.getFileNames();//마치 for문과 같은 형식, 여러개의 파일데이터가 있을 때 하나씩 분석하기 위한 목적으로 사용
				while(fileNames.hasMoreElements()){ //파일을 하나씩 확인(파일 존재하는한)
					String parameter = (String)fileNames.nextElement(); //한개씩 파일정보를 받아옴
					String fileName = multipartRequest.getOriginalFileName(parameter);
					String fileRealName = multipartRequest.getFilesystemName(parameter);
					
					if(fileName == null) continue;
					
					if(!fileName.endsWith(".jpg") && !fileName.endsWith(".png")){
						File file = new File(directory + fileRealName);
						file.delete();
						out.write("업로드할 수 없는 확장자입니다.");
					}
					else{	
						new FileDAO().upload(fileName, fileRealName);
						out.write("파일명: " + fileName + "<br>");
						out.write("실제 파일명: " + fileRealName + "<br>");
					}
				}
				
				if (result == -1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기에 실패했습니다.')");
					script.println("history.back()");
					script.println("</script>");
				}
				else {
	/* 						
					} */
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