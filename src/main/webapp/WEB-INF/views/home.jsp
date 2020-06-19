<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
<style>
table {
	border: 1px solid black;
}

tr, th, td {
	border: 1px solid black;
}
</style>
</head>
<body>
	<h1>Hello world!</h1>

	<P>The time on the server is ${serverTime}.</P>
	<div class="col-md-12">
					<!-- general form elements disabled -->
					<div class="card card-warning">
						<div class="card-header">
							<h3 class="card-title">회원등록</h3>
						</div>
						<!-- /.card-header -->
						<div class="card-body">
							<form role="form" action="/admin/member/create" method="post">
								<div class="row">
									<div class="col-sm-6">
										<!-- text input -->
										<div class="form-group">
											<label>아이디</label> <input name="userid" type="text" class="form-control"
												placeholder="Enter ...">
										</div>
									</div>

									<div class="col-sm-6">
										<!-- text input -->
										<div class="form-group">
											<label>암호</label> <input name="userpw" type="text" class="form-control"
												placeholder="Enter ...">
										</div>
									</div>

									<div class="col-sm-6">
										<!-- text input -->
										<div class="form-group">
											<label>이름</label> <input name="username" type="text" class="form-control"
												placeholder="Enter ...">
										</div>
									</div>

									<div class="col-sm-6">
										<!-- text input -->
										<div class="form-group">
											<label>이메일</label> <input name="email" type="text" class="form-control"
												placeholder="Enter ...">
										</div>
									</div>
									<button type="submit" class="btn btn-block btn-info btn-lg">회원등록</button>
								</div>
							</form>
						</div>
						<!-- /.content-header -->

						<!-- Main content -->
						<div class="content"></div>
						<!-- .content  -->
					</div>
				</div>
				
				
				
	<table class="bbsListTbl" summary="번호,제목,조회수,작성일 등을 제공하는 표">
		<caption class="hdd">회원정보 목록:제작자-${jspMaker}</caption>
		<thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col">사용자ID</th>
				<th scope="col">사용자암호</th>
				<th scope="col">사용자이름</th>
				<th scope="col">사용자이메일</th>
				<th scope="col">사용자등록일</th>
				<th scope="col">사용자수정일</th>
				<th scope="col">수정</th>
				<th scope="col">삭제</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${memberList}" var="memberVO" varStatus="status">
		<tr>
				<td>${status.count}</td>
				<form action="/admin/member/update" method="post">
				<td>${memberVO.userid}<input type="hidden" name="userid" value="${memberVO.userid}"></td>
				<td><input type="text" name="userpw" value="${memberVO.userpw}"></td>
				<td><input type="text" name="username" value="${memberVO.username}"></td>
				<td><input type="text" name="email" value="${memberVO.email}"></td>
				<td>${memberVO.regdate}</td>
				<td>${memberVO.updatedate}</td>
				<td><input type="submit" value="수정"></td>
				</form>
				<td>
				<form action="/admin/member/delete" method="post">
				<input type="hidden" value="${memberVO.userid}" name="userid">
				<input type="submit" value="삭제">
				</form>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</body>
</html>
