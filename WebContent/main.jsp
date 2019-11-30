<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <!-- bootstrap -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<style>
    /* @media all and (min-width: 960px){ */
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
        #title_1>img{
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
        
        #nav_1{
            display: grid;
            grid-template-rows: repeat(1,1fr);
            grid-template-columns: repeat(2, 1fr);
            background-color: #64BD02;
            border-radius: 160px 160px;
        }
        #nav_img{
            grid-row-start: 1;
            grid-row-end: 2;
        }
        .navigation{
            display: grid;
            grid-template-columns: repeat(7,1fr);
            grid-template-rows: repeat(7,1fr);
        }
        .caroucel_image{
            width: 40px;
        }
        ol{
          margin-bottom: 5rem;
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
        .navigation_01{
          grid-column-start: 2;
          grid-column-end: 7;
          grid-row-start: 2;
          grid-row-end: 7;
          margin-top: 3rem;
        }
        #body_body{
          display: flex;
          flex-direction: column;
        }
    /* } */
	</style>
</head>
<body>
  <%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
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
    <div class="container">        
        <div id="nav_1">
            <div id="nav_img">
                <image src="images/bin.png"></image>
            </div>    
            <div id="carouselExampleIndicators" class="carousel slide carousel-fade navigation" data-ride="carousel">
                    <ol class="carousel-indicators margin-bottom: 100px!important;">
                      <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                      <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                      <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                    </ol>
                    <div class="carousel-inner navigation_01">
                      <div class="carousel-item active">
                        <img src="images/cafe_image.jpg" class="d-block w-100" alt="...">
                      </div>\
                      <div class="carousel-item">
                        <img src="images/city_image.jpg" class="d-block w-100" alt="...">
                      </div>
                      <div class="carousel-item">
                        <img src="images/space_image.jpg" class="d-block w-100" alt="...">
                      </div> 
                    </div>
                    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                      <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                      <span class="carousel-control-next-icon" aria-hidden="true"></span>
                      <span class="sr-only">Next</span>
                    </a>
                  </div>
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