<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅 만들기</title>
<style>
    .outer{
        width : 800px;
        margin : auto;
    }
    .longdiv {
        width : 800px;
    }
    .shortdiv {
        width : 400px;
    }
    .inputdiv{
        width : 310px;
    }
    .inputdiv2{
        width : 155px;
    }
    .textdiv{
        width : 80px;
    }
    .align-side{
        display: flex;
        justify-content: space-evenly;
    }    
    .align-left{
        display: flex;
    }
    .titlediv {
        width : 710px;
    }
    .btntitle {
        margin-top: 8px;
        margin-bottom: 8px;
        margin-left: 0px;
    }
    .btnleft {
        width : 384px;
        margin-right : 10px;
        margin-top : 8px;
    }
    .btnright {
        width : 384px;
        margin-left : 10px;
        margin-top : 8px;
    }
    .textdiv>p{
        font-size: 13px;
        padding-top: 10px;
    }
</style>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>

    <div class="outer">

        <form action="insert.ch" method="post" action="insert.bo" enctype="multipart/form-data">
			<input type="hidden" value="${ loginUser.userId }" name="userId">
            <div class="longdiv align-left">
                <div class="textdiv">
                    <p>제목:</p>
                </div>
                <div class="titlediv">
                    <input type="text" class="form-control" id="title" placeholder="제목을 입력하세요" name="title" required>
                </div>
            </div>

            <div style="width : 790px;">
                <textarea class="form-control" rows="15" id="content" name="content" style="resize: none;" placeholder="내용을 입력하세요"></textarea>
            </div>
			
			 <div class="longdiv align-left">
                <div class="textdiv">
                    <p>첨부파일:</p>
                </div>
                <div class="titlediv">
                    <input type="file"  id=upFile name="upFile" style="padding-top : 6px;">
                </div>
            </div>
			
            <div class="longdiv align-left">
                <button class="btnleft btn btn-dark">
                    <p class="btntitle">등록</p>
                </button>
                <button class="btnright btn btn-secondary" type="reset">
                    <p class="btntitle ">취소</p>
                </button>
            </div>
        </form> 
    </div>

    </div>

</body>
</html>