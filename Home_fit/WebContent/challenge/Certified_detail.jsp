<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>  
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="http://fonts.googleapis.com/earlyaccess/nanumpenscript.css" rel="stylesheet">

</head> 
<body>			
	<!-- DAO에서 값을 가지고 온다 : board-mapper.xml에서 SQL문장을 작성 -->
	<div class="row">
		<h1 class="text-center">내용 보기</h1>
			<table class="table table-striped">
				<tr>
			         <td colspan="5" class="text-right">
			           <%-- ../main/main.jsp?mode=6 --%>
			           <%-- ../board/update.jsp --%>
			           <a href="../main/main.jsp?mode=12&no=${vo.challenge_no}" class="btn btn-xs btn-primary">수정</a>
			           <%-- ../board/delete.jsp --%>
			          <input type="button" class="btn btn-xs btn-success" id="delBtn" value="삭제">
			           <%-- ../board/list.jsp --%>
			           <a href="../main/main.jsp?mode=9" class="btn btn-xs btn-danger">목록</a>
			         </td>
				</tr>
				
				<tr id="del" style="display:none">
					<td colspan="4" class="text-right">
					비밀번호:<input type="password" class="input-sm" size=10 id="pwd">
						   <input type="submit" value="삭제하기" class="btn btn-sm btn-danger"> 
					</td>
				</tr>
				
				<tr>
					<td rowspan="4" class="text-left" valign="top" height=200>
					<%-- 한줄 문자열 --%>
					 <img src="${vo.poster}" alt="Lights" width=400px, height=300px>
					</td>
				</tr>
			
				<tr>
					<th class="text-center danger" width=20%>방 번호</th>
					<td class="text-center" width=30%>${vo.challenge_no}</td>
					<th class="text-center danger" width=20%>도전 기간</th>
					<td class="text-center" width=30%>${vo.cate}</td>
				</tr>
				
				<tr>
					<th class="text-center danger" width=20%>방 제목</th>
					<td class="text-center" width=30%>${vo.title}</td>
					<th class="text-center danger" width=20%>인원 수</th>
					<td class="text-center" width=30%>${vo.limit}</td>
				</tr>
				
				<tr>
					<th class="text-center danger" width=20%>도전 내용</th>
					<td colspan="3">${vo.content}</td>
				</tr>
				
				<tr>
					<td colspan="5" class="text-left" valign="top" height=200>
					<%-- 한줄 문자열 --%>
					<pre style="white-space: pre-wrap;background-color:white; border:none">${vo.content}</pre>
					</td>
				</tr>	
							
				</table>	
				<h3 style=text-align:center>참석중인 사람들의 인증 사진</h3>
				<c:forEach var="Certifiedvo" items="${Certifiedvo }">
										<h2>번호:${vo.challenge_no } 이름 ${Certifiedvo.poster}</h2>
							             <div class="col-md-3">
            						 	 <div class="thumbnail">
							               <a href="#">
							                 <img src="/Home_fit/challenge_poster/${Certifiedvo.poster}" width=400px, height=300px>
							               </a>
							             </div>
							          	 </div>
				</c:forEach>
				 </tr>
<%-- 				        <h1> uri = <%=request.getRequestURI() %></h1> --%>
<%--        <h1> contextpath= <%=request.getContextPath() %>%></h1> --%>
			</table>
					<div class="text-center">
				     <a href="#" class="btn btn-lg btn-success">참여 하기 </a>
				     <a href="../challenge/Certified.do?challenge_no=${ vo.challenge_no}" class="btn btn-lg btn-primary">인증 하기 </a>
					</div>
	</div>		
</body>			
</html>