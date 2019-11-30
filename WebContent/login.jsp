<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        #title_2 img{
            grid-row-start: 2;
            grid-row-end: 3;
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
	<div id="body_body">
    <div id="title_1">
        <div class="title_font">Re:Re</div>
        <div id="title_2">
            <image src="images/rogo1.png"></image>
        </div>
    </div>
    <nav class="navbar navbar-expand-lg navbar-light bg-danger justify-content-end" >  
      <div id="navbarSupportedContent">
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
	<div class="container">
		<div class="col-lg-4"></div>
		<div>
			<div class="jumbotron" style="margin-top: 2rem; padding-top: 20px;">
				<form method="post" action="loginAction.jsp">
					<h3 style="text-align: center;">로그인 화면</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20">						
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="패스워드" name="userPassword" maxlength="20">					
					</div>
					<input type="submit" class="btn btn-primary form-control" value="로그인">
				</form>
			</div>
		</div>
		<div class="col-lg-4"></div>
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