<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 게시판 만들기</title>
	<!-- bootstrap -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	
	<style>
		#body_body{
          display: flex;
          flex-direction: column;
        }
		.dropdown-menu{
			min-width: 5rem;
		}	
        #title_1{
            display: grid;
            grid-template-columns: repeat(5,1fr);
            grid-auto-rows: 200px;
        }
        #title_2{
            display: grid;
            grid-template-rows: 90px 1fr;
        }
        .title_font{
            grid-column-start: 3;
            grid-column-end: 4;
            font-size: 100px;
            font-weight: 500;   
            text-align: center;
            padding-top: 3rem;
            margin-bottom: 0;
        }
        #title_1>image{
            grid-column-start: 4;
            grid-column-end: 5;
        }
        #title_2 a{
            grid-row-start: 2;
            grid-row-end: 3;
        }
        .title_font a{
        	text-decoration:none;
        }
        #title_2 a img{
        	width: 100px;
        }
        nav{
          margin-left: 5%;
          margin-right: 5%;
          margin-bottom: 40px;
          border-radius: 10px 10px;
        }
        footer{
          margin-top: 30px;
        }
        #footer_grid{
          display: grid;
          grid-template-columns: repeat(4,1fr);
        }
        #footer_01{
          grid-column-start: 2;
          grid-column-end: 2;
        }
        #footer_02{
          grid-column-start: 4;
          grid-column-end: 4;
        }
        #footer_03{
          display: grid;
          grid-template-rows: repeat(5,1fr);
          grid-template-columns: repeat(7,1fr);
          height: 100px;
        }
        #footer_icon01{
          grid-row-start: 5;
          grid-row-end: 6;
          grid-column-start: 2;
          grid-column-end: 2;
        }
        #footer_icon02{
          grid-row-start: 5;
          grid-row-end: 6;
          grid-column-start: 4;
          grid-column-end: 4;
        }
        #footer_icon03{
          grid-row-start: 5;
          grid-row-end: 6;
          grid-column-start: 6;
          grid-column-end: 6;
        }
	</style>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		if (userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요')");
			script.println("location.href = 'read.jsp'");
			script.println("</script>");
		}
		int bbsID = 0;
		if (request.getParameter("bbsID") != null){
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		if (bbsID == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지않는 글입니다.')");
			script.println("location.href = 'read.jsp'");
			script.println("</script>");
		}
		Bbs bbs = new BbsDAO().getBbs(bbsID);
		if (!userID.equals(bbs.getUserID())){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'read.jsp'");
			script.println("</script>");
		}
	%>
    <div id="body_body">
	<div id="title_1">
            <div class="title_font">
            	<a style="color: black;" href="main.jsp">Re:Re</a>
			</div>
            <div id="title_2">
                <a href="main.jsp"><image src="images/rogo1.png"></image></a>
            </div>
        </div>
        <nav class="navbar navbar-expand-lg navbar-light bg-danger justify-content-end" >  
        <div id="navbarSupportedContent">
            <div style="float: left; padding-top: 9px;">
                <a style="color: white;" href="read.jsp">게시판</a>
            </div>
            <ul class="nav">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" style="color: white;" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    접속하기
                </a>
                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                <li><a class="dropdown-item" href="login.jsp">로그인</a></li>
                <li><a class="dropdown-item" href="signUp.jsp">회원가입</a></li>
                </ul>
            </li>
            </ul>
        </div>
        </nav>
	<div class="container" style="margin-top: 2rem;">
		<form method="POST" action="updateAction.jsp?bbsID=<%= bbsID %>">
			<div class="row">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd;">
					<thead>
						<tr>
							<th style="background-color: #eeeeee; text-align: center;">게시판 글수정 양식</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control" placeholder="글 제목" name="bbsTitle" maxlength="50" value="<%= bbs.getBbsTitle() %>"></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="글 내용" name="bbsContent" maxlength="2048" rows="30"><%= bbs.getBbsContent() %></textarea></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div>
				<input type="submit" class="btn btn-primary" style="float: right;" value="글수정" />
			</div>
		</form>
	</div>
	<footer>
        <div id="footer_grid" style="border-top: 2px solid black">
            <div id="footer_01">
                <div id="footer_03">
                <div id="footer_icon01">
                    <image style="width:30px;" src="images/facebook.png"></image>
                </div>
                <div id="footer_icon02">
                    <image style="width:30px;" src="images/instagram-logo.png"></image>
                </div>
                <div id="footer_icon03">
                    <image style="width:30px;" src="images/twitter.png"></image>
                </div>
                </div>
            </div>
            <div id="footer_02" style="text-align: center;">
                <image style="width:100px;" src="images/bio.png"></image>
            </div>
        </div>
    </footer>
    </div>
</body>
</html>