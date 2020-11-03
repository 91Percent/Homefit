<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript"> 
$(function(){
	$('.qna_insert').click(function(){
        var coach_no = $(this).attr("data-value");
        console.log('코치 번호'+coach_no)
        $.ajax({
            type:'post',
            url:'../coach/coach_qna_insert.do?coach_no='+coach_no,
            success:function(result)
            {
               $('.qna_list').html(result);
            }
         })
   });
	$('.coach_detail_btn').click(function(){
        var coach_no = $(this).attr("data-name");
        var coach_qna_no = $(this).attr("data-value");
            console.log('coach_no는 '+coach_no);
            console.log('coach_qna_no는'+coach_qna_no);
        $.ajax({
            type:'post',
            url:'../coach/coach_qna_detail.do?coach_no=${vo.coach_no}',
//             data:{"coach_no":coach_no},
            data:{"coach_qna_no":coach_qna_no},
            success:function(result)
            {
               $('.qna_list').html(result);
            }
         })
   });
 }); 
</script>
</head>
<body>
<div class="row row1">
    <h3 class="text-center">${vo.coach_name }님의 QNA</h3>
    <table class="table">
      <tr>
        <td class="text-left">
          <a href="#" class="btn btn-sm btn-danger qna_insert" data-value="${vo.coach_no }">새글</a>
        </td>
      </tr>
    </table>
    <table class="table table-striped">
      <tr class="warning">
        <th class="text-center" width=10%>문의 번호</th>
        <th class="text-center" width=45%>문의 내용</th>
        <th class="text-center" width=15%>이름</th>
        <th class="text-center" width=20%>작성일</th>
        <th class="text-center" width=10%>조회수</th>
      </tr> 

    </table>
    <table class="table">
          <c:forEach var="vo" items="${list }">
        <tr>
	        <td class="text-center btd" width=10%>${vo.group_id }</td>
	        <td class="text-left btd" width=45%>
	        <c:if test="${vo.group_tab>0 }">
	         <a href="#" data-value="${vo.coach_qna_no }" data-name="${vo.coach_no}"  class="coach_detail_btn">
	        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;※ ${vo.name }님의 답변 입니다.
	        	</a>
	        </c:if>
	        <c:if test="${vo.group_tab==0 }">
	         <a href="#" data-value="${vo.coach_qna_no }" data-name="${vo.coach_no}"  class="coach_detail_btn">${vo.subject }</a>
	        <c:if test="${today==vo.dbday }">
	          <font color=red><sup>new</sup></font>
	        </c:if>
	        </c:if>
	        </td>
	        <td class="text-center btd" width=15%>${vo.name }</td>
	        <td class="text-center btd" width=20%>${vo.dbday }</td>
	        <td class="text-center btd" width=10%>${vo.hit }</td>
      </tr> 
     	 </c:forEach>
      <tr>
        <td class="text-left"></td>
        <td class="text-right">
          <a href="#" class="btn btn-sm btn-primary">이전</a>
<%--             ${curpage } page / ${totalpage } pages --%>
          <a href="#" class="btn btn-sm btn-primary">다음</a>
        </td>
      </tr>
    </table>
  </div>
</body>
</html>