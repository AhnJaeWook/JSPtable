<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.io.File" %>
<%@ page import="file.FileDAO" %>
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
		int bbsID = 0;
		if(request.getParameter("bbsID")!= null){
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		if(bbsID == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지않는 페이지입니다.')");
			script.println("location.href = 'read.jsp'");
			script.println("</script>");
		}
		Bbs bbs = new BbsDAO().getBbs(bbsID);
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
      <!-- <a class="navbar-brand" href="#">JSP 웹 사이트 게시판</a> -->
      <!-- <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button> -->
        
      <div id="navbarSupportedContent">
        <!-- <ul class="navbar-nav mr-auto">
          <li>
            <a class="nav-link" href="main.jsp">메인 </a>
          </li>
          <li>
            <a class="nav-link" href="read.jsp">게시판</a>
          </li>  
          <li>
            <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
          </li>
        </ul>  -->
        <div style="float: left; padding-top: 9px;">
        	<a style="color: white;" href="read.jsp">게시판</a>
        </div>
            
        <%
          if(userID == null){
        %>
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
        <%
          } else{
        %>
            
        <ul class="nav">
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" style="color: white;" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                회원관리
            </a>
            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
              <li><a class="dropdown-item" href="logout.jsp">로그아웃</a></li>
            </ul>
          </li>
        </ul>
          <%
            }
          %> 
            
      </div>
    </nav>
	<div class="container" style="margin-top: 2rem;">
			<div class="row">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd;">
					<thead>
						<tr>
							<th colspan="3" style="background-color: #eeeeee; text-align: center;">게시판 글보기</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td style="width: 20%; border: solid 1px #dddddd;">글 제목</td>
							<td colspan="2"><%= bbs.getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td><!-- 특수기호 치환, 보완상 중요 -->
						</tr>
						<tr>
							<td style="border: solid 1px #dddddd;">작성자</td>
							<td colspan="2"><%= bbs.getUserID() %></td>
						</tr>
						<tr>
							<td style="border: solid 1px #dddddd;">작성일자</td>
							<td colspan="2"><%= bbs.getBbsDate().substring(0, 11) + bbs.getBbsDate().substring(11, 13) + "시" + bbs.getBbsDate().substring(14, 16) + "분" %></td>
						</tr>
						<tr>
							<td style="font-size: 24px; border: solid 1px #dddddd;">내용</td>
							<td colspan="2" style="min-height: 200px; texte-align: left;"><%= bbs.getBbsContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
						</tr>
						<tr>
							<%
								String directory = "C:/jsp/upload/";
								String files[] = new File(directory).list();
								
								
							%>
							<td>이미지</td>
							<td><image style="width: 100px;" src="<%= directory + files[0] %>"></td>
							<%
								/* for(String file : files){
									String[] a = new FileDAO().search_file(file);
									if(a[i] == file){
										out.write("<image src=\"" + request.getContextPath() + "/downloadAction?file=" +
										java.net.URLEncoder.encode(file, "UTF"));
									}
									i++;
								} */
							%>
						</tr>
					</tbody>
				</table>
			</div>
			<div>
				<a href="read.jsp" class="btn btn-primary">목록</a>
				<%
					if(userID != null && userID.equals(bbs.getUserID())){
				%>
					<a href="update.jsp?bbsID=<%= bbsID %>" class="btn btn-primary">수정</a>
					<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="deleteAction.jsp?bbsID=<%= bbsID %>" class="btn btn-primary">삭제</a>
				<%
					}
				%>
			</div>
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