<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅 목록</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
	.displayFlex {
		display : flex;
	}
	.userId-p {
		
	}
	.content-p {
		
	}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>

	<div class="outer" style="width : 700px; margin : auto;">
		<div id="listArea">
			
			<div class="oneContent displayFlex">
				<div clas="imgArea" style="width : 100px; height : 100px">
				<img src="" width="90px" height="90px" style="margin:5px">
				</div>
				<div class="textArea" style="width:600px">
					<div class="upArea displayFlex" style="height : 40%;width :100%">
						<div class="idArea" style="width:450px">
							<p class="userId-p">유저 아이디</p>
						</div>
						<div class="dateArea" style="width:150px">
							<p class="date-p">2000.00.00</p>
						</div>
					</div>
					<div class="downArea" style="height : 60%;width :100%">
						<p classs="content-p">이건내용</p>
					</div>
				</div>
				
			</div>
			
		</div>	
	</div>

</body>
</html>