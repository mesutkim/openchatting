<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅 리스트</title>

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
	.displayFlex {
		display : flex;
	}
</style>

</head>
<body>
	
	<div class="outer" style="width : 700px; margin : auto;">
		
		<div class="searchForm displayFlex" style="width : 400px; margin : auto; margin-top : 30px;">
			<input type="text" class="form-control form-control" style="width : 300px;">
			<button class="btn btn-secondary">검색</button>
		</div>
		
		<div id="listArea">
			
			<div class="oneContent displayFlex" style="display : flex; height:100px; margin-top : 20px;">
 				<div class="imgArea" style="width:90px; height:90px; padding : 5px;">
					<image src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fimg.icons8.com%2Fcolor%2F480%2Fno-image.png&type=sc960_832" width="90" height="90">
				</div>
				<div class="contentArea" style="width : 600px">
					<div id="content" class="clickArea">
						<p>여기에는 각종 내용이 들어갑니다 근데 뭐 어떻게 해야할지 모르겠네요</p>
					</div>
					<div id="writer">
						작성자^^
					</div>
				</div>
			</div>	
			
		</div>
	</div>
	
	<script>
		$(function(){
			$(document).on('click', '.clickArea', function(){
				location.href='detail.ch'; //?cno='+ $(this).find('.boardNo').val();
			})
		})
		
	</script>
</body>
</html>