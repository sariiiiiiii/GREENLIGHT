<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Challenge Detail</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/challenge/chDetail.css" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;200;300;400;500;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<link rel="stylesheet" href="https://cdn.rawgit.com/theus/chart.css/v1.0.0/dist/chart.css"/>
<style>
  ul,li{list-style:none;}
  #slide{height:500px;position:relative;overflow:hidden;}
  #slide ul{width:400%;height:100%;transition:1s;}
  #slide ul:after{content:"";display:block;clear:both;}
  #slide li{float:left;width:25%;height:100%;}
 /*  #slide li:nth-child(1){background:#faa;}
  #slide li:nth-child(2){background:#ffa;}
  #slide li:nth-child(3){background:#faF;}
  #slide li:nth-child(4){background:#aaf;} */
  #slide input{display:none;}
  #slide label{display:inline-block;vertical-align:middle;width:10px;height:10px;border:2px solid #666;background:#fff;transition:0.3s;border-radius:50%;cursor:pointer;}
  #slide .pos{text-align:center;position:absolute;bottom:10px;left:0;width:100%;text-align:center;}
  #pos1:checked~ul{margin-left:0%;}
  #pos2:checked~ul{margin-left:-100%;}
  #pos3:checked~ul{margin-left:-200%;}
  #pos4:checked~ul{margin-left:-300%;}
  #pos1:checked~.pos>label:nth-child(1){background:#666;}
  #pos2:checked~.pos>label:nth-child(2){background:#666;}
  #pos3:checked~.pos>label:nth-child(3){background:#666;}
  #pos4:checked~.pos>label:nth-child(4){background:#666;}
  #pos5:checked~.pos>label:nth-child(5){background:#666;}
  #pos6:checked~.pos>label:nth-child(6){background:#666;}
  #donationBtn{
  	display: block;
  	margin: 0 auto;
  	margin-top: 20px;
  	padding: 10px 20px 10px 20px;
  	border: none;
  	background-color:  rgba(179, 179, 179, 0.4);
  	border-radius: 4px;
  }
  #donationBtn:hover{
  	background-color: #819789c4;
 	transform: scale(1.1);
	transition: 0.35s;
	color: white;
  }
</style>
</head>
<body>
<jsp:include page="/common/header.jsp"></jsp:include>
  <div class="container">
    <div class="contents">
	      <div class="user-div">
	        <i class="fas fa-user-circle fa-3x" style="color: gray;"></i>
	        <span class="id-div" style="margin: 10px; font-weight: 300;">${board.writerId }</span>
	        <span class="date-div" style="margin: 10px; font-weight: 300;">${board.writeDate }</span>
	        <c:if test="${userId eq 'admin' }">
		        <span style="float: right; margin: 10px; font-weight: 300;">
		        	<c:url var="donationBoardModify" value="donationBoardModifyView.do">
		        		<c:param name="boardNo" value="${board.boardNo}"></c:param>
		        	</c:url>
		        	<a href="${donationBoardModify }">수정</a>
		        </span>
	        </c:if>
	      </div>
	      <div class="title-div">
	        <span>${board.dtSubject }</span>
	      </div>
	      <div class="img-div slid">
	      	<div class="slide">
        		<div class="img-area" id="slide">
	      <!-- 이미지 들어가요오~ -->
		      <c:forEach items="${dFList }" var="donationBoardImage" varStatus="status">
	          	<input type="radio" name="pos" id="pos${status.count }" <c:if test="${status.count eq 1 }">checked</c:if>>
	          </c:forEach>
	          <ul style="padding: 0px;">
	          <c:forEach items="${dFList }" var="donationBoardImage" varStatus="index">
	            <li><img src="${pageContext.request.contextPath }/resources/donationUploadFiles/${donationBoardImage.fileName }"class="img"></li>
	          </c:forEach>
	          </ul>
	          <p class="pos">
	          <c:forEach items="${dFList }" var="donationBoardImage" varStatus="status">
	            <label for="pos${status.count }"></label>
	           </c:forEach>
	      		</div>
	     	 </div>
	      </div>
	      <div class="con-div">
	        <p> ${board.dtContents }</p>
	      </div>
	      <div>
	      	<h3>목표 금액 : ${board.dtTargetAmount } 포인트</h3>
	      </div>
	      <div class="charts" style="width: 800px; background-color:rgb(240, 236, 236); height: 40px; margin: 0 auto; margin-bottom: 50px; margin-top: 50px; border-radius: 20px;">
	      		<div class="charts__chart" style="width: ${(board.donationAmount / board.dtTargetAmount) * 100 }%; background-color: rgb(126, 187, 34); margin: 0; border-radius: 20px; z-index: 1; height: 100%;"></div>
	      		<span style="position: relative; left: 48%; font-size: 18px;">${board.achievement }%</span>
	      </div>
	      <div style="margin-bottom: 20px;">
	      		<label style="font-size: 20px; font-weight: bold; color: #455c4e;">후원 POINT </label>
	      		<input type="text" id="inputDonation" name="donationPoint" placeholder="기부 금액을 입력해주세요." style="height: 30px; position: relative;bottom: 5px; left: 12px; border-top: none; border-left: none; border-right: none; outline: none;">
	      		<input type="hidden" id="boardNo" name="boardNo" value="${board.boardNo }">
	      		<input type="button" id="donationBtn" onclick="donation();" value="후원하기">
	      </div>
	      <div>
	      	<table style="margin: 0 auto; width: 40%;">
	   			<c:forEach items="${dList }" var="dUser">
	   				<c:set var="i" value="${i+1 }"/>
	   				<tr style="text-align: center; height: 40px;">
		   				<td style="border-top: 30px;">USER ID : ${dUser.userId }</td>
		   				<td style="border-top: 30px;">후원 POINT : ${dUser.donationPoint }</td>
		   				<td style="border-top: 30px;">${i } 등</td>
	   				</tr>
	     		</c:forEach>
     		</table>
	      </div>
	      <div class="comm-div">
	        <span style="font-size: 20px; font-weight: 600;">Comments</span> <span id="rCount">${board.dtReplyCount }</span>
	        <hr> 
	        <div class="comm-user-div">
	          <i class="fas fa-user-circle fa-3x" style="color: gray;"></i>
	          <input class="user-text" type="text" name="replyContents" id="replyContents" placeholder="댓글을 입력해주세요.">
	          <button id="submitBtn" style="">등록</button>
	        </div>
	        <div class="comm-area" id="replyArea">
	          <div class="comm-inner-area" id="replyArea" style="margin: 0 auto;"> <!-- 댓글 목록 영역 -->
	          </div>
	        </div>
	      </div>
    </div>
  </div>
<jsp:include page="/common/footer.jsp"></jsp:include>
<script>
	// 댓글 쓰기
    getReplyList();
	$("#submitBtn").on("click", function() {
		var boardNo = '${board.boardNo}';
		var replyContents = $("#replyContents").val();
		$.ajax({
			url : "donationBoardAddReply.do",
			type : "post",
			data : {
				"boardNo" : boardNo,
				"dtReplyContents" : replyContents
			},
			success : function(data) {
				console.log(data)
				if(data == "success") {
					getReplyList();//댓글 리스트 불러오기
					$("#replyContents").val("");
					Swal.fire({ 
						icon: 'success',
						title: '댓글 등록',
						text: '등록이 완료되었습니다.',
						}).then(function(){
                        	location.reload();
                        })
				}else{
					alert("댓글 등록 실패!");
				}
			},
			error : function() {
				alert("submit 오류");
			}
		})
	});
	
	// 댓글 리스트 불러오기
	function getReplyList() {
		var boardNo = '${board.boardNo}';
		var userId = '${userID}';
		$.ajax({
			url : "donationReplyList.do",
			type : "get",
			data : { "boardNo" : boardNo },
			dataType : "json",
			
			success : function(data) {
				console.log(data)
				var $rdiv = $("#replyArea div");
				$rdiv.html("");
				var $innerdiv;
				var $rWriter;
				var $rContent;
				var $rDate;
				var $btnArea;
				var $icon;
				
				$("#rCount").text(data.length);
				if(data.length > 0) {
					for(var i in data) {
						$innerdiv = $("<div id='replyDiv' style='border-top: 1px solid rgb(219, 219, 219); vertical-align:middle; align-items:center; padding: 10px;'>");
						$icon = $("<i class='fas fa-user-circle fa-3x' style='color: gray; margin-right: 30px; margin-bottom: 20px;'>");
						$rWriter = $("<span style='font-size: 10px; display: block;  position: relative; left:74px;'>").text(data[i].dtReplyUserId);
						$rContent = $("<span style='line-height: 30px; position: relative; bottom: 8px;'>").text(data[i].dtReplyContents);
						$rDate = $("<span style='float: right; margin-right: 15px; position: relative; top:15px;'>").text(data[i].dtReplyDate);
						$rdiv.append($innerdiv);
						$innerdiv.append($rWriter);
						$innerdiv.append($icon);
						$innerdiv.append($rDate);
						if(userId == data[i].dtReplyUserId){
							$btnArea = $("<span style='float:right; position: relative; top:15px;'>")
							.append("<a href='#' onclick='modifyReply(this,"+boardNo+","+data[i].dtReplyNo+",\""+data[i].dtReplyContents+"\");'>수정 /</a>")
							.append("<a href='#' style='margin-right:15px;' onclick='deleteReply(this,"+boardNo+","+data[i].dtReplyNo+");'> 삭제</a>")
							$innerdiv.append($btnArea);
						}
						$innerdiv.append($rContent);
					}
				}
			}
		});
	}
	// 댓글 수정 영역
	function modifyReply(obj, chNo, replyNo, replyContents) {
// 		$(obj).focus();
		var offset = $(obj).offset();
		$('html, body').animate({scrollTop : offset.top}, 600);
		
		$divModify = $("<div>");
		$divModify.append("<input type='text' id='modifyReply' size='70' value='"+replyContents+"'>");
		$divModify.append("<div><button onclick='modifyReplyOk("+chNo+","+replyNo+")'>수정하기</button></div>");
		$(obj).parent().after($divModify);
	}
	
	// 댓글 수정 ajax
	function modifyReplyOk(boardNo, dtReplyNo) {
		var updateContent = $("#modifyReply").val();
		$.ajax({
			url : "donationBoardmodifyReply.do",
			type : "post",
			data : {
				"boardNo" : boardNo,
				"dtReplyNo" : dtReplyNo,
				"replyContents" : updateContent
			},
			success : function(data) {
				if(data == "success") {
					getReplyList();
					Swal.fire({ 
						icon: 'success',
						title: '댓글 수정', 
						text: '수정이 완료되었습니다.', 
						}).then(function(){
                        	location.reload();
                        });
				}else {
					alert("댓글 수정 실패");
				}
			},
			error : function() {
				alert("ajax 실패");
			}
		});
	}
	
	// 댓글 삭제
	function deleteReply(obj, boardNo, dtReplyNo) {
		var offset = $(obj).offset();
		$('html, body').animate({scrollTop : offset.top}, 600);
		$.ajax({
			url : "donationReplyDeleteReply.do",
			type : "get",
			data : {
				"boardNo" : boardNo,
				"dtReplyNo" : dtReplyNo
			},
			success : function(data) {
				if(data == "success") {
					Swal.fire({ 
						icon: 'success', // Alert 타입 
						title: '댓글 삭제', // Alert 제목 
						text: '삭제가 완료되었습니다.', // Alert 내용 
						}).then(function(){
                        	location.reload();
                        });
					getReplyList();
				}else {
					alert("댓글 삭제 실패");
				}
			}
		});
	}
	
	function donation(){
		var userId = '${userID}';
		console.log(userId)
		var point = parseInt('${point}');
		console.log(point)
		var donationPoint = parseInt($("#inputDonation").val());
		console.log(donationPoint)
		var boardNo = $("#boardNo").val();
		console.log(boardNo)
		if(userId == ""){
			Swal.fire({
                icon: 'error',
                title: '기부 오류',
                text: '로그인 후에 가능한 기능입니다.',
            }).then(function(){
           	 	location.href="loginView.do";
            })
		}else{
			if(donationPoint <= point){
				$.ajax({
					url : "donation.do",
					type : "post",
					data : {"donationPoint" : donationPoint,
						"boardNo" : boardNo},
					success:function(result){
						if(result == 'success'){
							 Swal.fire(
		                                '기부완료',
		                                '기부가 완료되었습니다.',
		                                'success'
	                                 ).then(function(){
	                                	 location.reload();
	                                 })
						}else{
							Swal.fire(
	                                '기부완료',
	                                '기부가 달성되어 종료됩니다.',
	                                'success'
	                             ).then(function(){
	                            	 location.href="donationBoardList.do";
	                             })
						}
					}
				})
			}else{
				Swal.fire({
	                icon: 'error',
	                title: '기부 오류',
	                text: '보유포인트가 부족합니다.',
	            })
			}
		}
	}
</script>
</body>
</html>