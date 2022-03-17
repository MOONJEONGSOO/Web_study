<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="kim" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css" type="text/css" />
</head>
<body>
<!-- <script type="text/javascript">
	function newMember(){
		window.open(
			"signup.jsp","newMember","width=500,height=300"
		);
	}
</script> -->

<header>
	<h1>댓글과 대댓글 실습예제</h1>
	<nav>
		<ul>
			<li><a href="main.do">로고</a></li>
			<li><kim:login /></li>
		</ul>
	</nav>
</header>

<div id="wrapper">
	<section id="main">
		<br><hr>
		<form action="insertBoard.do?a=${a}&b=${b}" method="post">
			<kim:board type="board" />
			<input type="hidden" name="mid" value="${member.mid}">
			<input type="submit" value="글 작성하기">
		</form>
		<hr>
		<h2>게시글 목록</h2>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><a href="main.do?a=${a}&b=${b+2}">더보기&nbsp;&gt;&gt;</a></strong>
		<c:forEach var="bs" items="${datas}">
		<c:set var="vo" value="${bs.boardVO}" />
			<div class="board">
				<h3>[${vo.bid}] ${vo.mid} >> ${vo.content} [댓글수 ${vo.rpcnt} | 좋아요 ${vo.favcnt}] [${vo.bdate}] <kim:bmenu mid="${vo.mid}" bid="${vo.bid}" /> </h3>
			</div>
			<div class="reply">
				<form action="insertReply.do?a=${a}&b=${b}" method="post">
					<kim:board type="reply" />
					<input type="hidden" name="mid" value="${member.mid}">
					<input type="hidden" name="bid" value="${vo.bid}">
					<input type="submit" value="댓글 작성하기">
				</form>
			</div>
			<div class="replylist">
				<c:forEach var="r" items="${bs.replyList}">
					<h4>${r.mid} >> ${r.msg} [${r.rdate}] <kim:rmenu mid="${r.mid}" rid="${r.rid}" /></h4>
				</c:forEach>
			</div>
		</c:forEach>
	</section>
</div>

<footer>
	<p>ⓒCOPYRIGHT</p>
</footer>

</body>
</html>