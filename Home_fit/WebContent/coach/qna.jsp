<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	 $.ajax({
		 type:'post',
		 url:'../coach/qna.do',
		 success:function(result)
		 {
			 $('#coach_info').html(result);
		 }
	 })
});
</script>
</head>
<body>
	<div class="row">
   <table class="table">
     <tr>
       <td width=20% height=500>
         <h5>코치리스트</h5>
         <table class="table">
           <tr>
             <td>
               <div id="coach_info" style="overflow-y:auto;height:400px"></div>
             </td>
           </tr>
         </table>
       </td>
       <td>
       	<h3 class="text-center">자유게시판</h3>
		    <table class="table">
		      <tr>
		        <td class="text-left">
		          <a href="../coach/boardinsert.do" class="btn btn-sm btn-danger">새글</a>
		        </td>
		      </tr>
		    </table>
		    <table class="table table-striped">
		      <tr class="warning">
		        <th class="text-center" width=10%>번호</th>
		        <th class="text-center" width=45%>제목</th>
		        <th class="text-center" width=15%>이름</th>
		        <th class="text-center" width=20%>작성일</th>
		        <th class="text-center" width=10%>조회수</th>
		      </tr> 
		      <c:forEach var="vo" items="${list }">
		        <tr>
			        <td class="text-center btd" width=10%>${vo.coach_qna_no }</td>
			        <td class="text-left btd" width=45%>
			         <a href="../coach/boarddetail.do?no=${vo.coach_no }">${vo.subject }</a>
			        <c:if test="${today==vo.regdate }">
			          <font color=red><sup>new</sup></font>
			        </c:if>
			        </td>
			        <td class="text-center btd" width=15%>${vo.writer }</td>
			        <td class="text-center btd" width=20%>${vo.regdate }</td>
			        <td class="text-center btd" width=10%>${vo.hit }</td>
		      </tr> 
		      </c:forEach>
		    </table>
		    <table class="table">
		      <tr>
		        <td class="text-left"></td>
		        <td class="text-right">
		          <a href="#" class="btn btn-sm btn-primary">이전</a>
		            ${curpage } page / ${totalpage } pages
		          <a href="#" class="btn btn-sm btn-primary">다음</a>
		        </td>
		      </tr>
		    </table>
       </td>
       </tr>
       </table>
       </div>
</body>
</html>