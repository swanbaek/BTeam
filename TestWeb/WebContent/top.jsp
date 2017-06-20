<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>::MyJava Shop::</title>
<!-- viewport -------------------------------------- -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- CDN Bootstrap---------------------------------  -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- m71-344-508--------------------------------------------- -->
</head>
<body>
<%	//컨텍스트 얻어오기
	String myctx=request.getContextPath();

%>
	<div class="container-fluid">
		<header class="jumbotron">
			<h1>BootStrap Jumbotron</h1>
			<p>Jumbotron 클래스를 적용했어요</p>
		</header>
		<!-- 컨텐츠 들어가는 곳------------------ -->
		<div class="row" style="height:auto">
			<div class="col-md-3">
				<ul class="list-group">
					<li class="list-group-item">
						<a href="<%=myctx%>/index.jsp">Home</a>
					</li>
					<li class="list-group-item">
					<a href="<%=myctx%>/member/join.jsp">Join</a>
					</li>
					<li class="list-group-item">
					<a href="<%=myctx%>/member/member.jsp">Member List</a>					
					</li>
					<li class="list-group-item">menu3</li>
				</ul>
			</div>
			<div class="col-md-9">
			
			
			
			