<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
let i=0;
let u=0;
$(function(){
	$('.rUp').click(function(){
		console.log('버튼클릭')
	  $('#qna_reply').hide();
	  if(i==0)
	  {
			$('#qna_reply').show();
			$(this).text("취소");
			i=1;
	  }
	  else
	  {
		    $('#qna_reply').hide();
		    $(this).text("답글 작성");
			i=0;
	  }
	});
});
</script>
</head>
<body>
<div class="row row1">
    <h3 class="text-center">상세보기</h3>
    <table class="table">
      <tr>
        <th width=20% class="text-center success">번호</th>
        <td width=30% class="text-center">${vo.coach_qna_no }</td>
        <th width=20% class="text-center success">작성일</th>
        <td width=40% class="text-center">${vo.dbday }</td>
      </tr>
      <tr>
        <th width=20% class="text-center success">이름</th>
        <td width=30% class="text-center">${vo.name }</td>
        <th width=20% class="text-center success">조회수</th>
        <td width=40% class="text-center">${vo.hit }</td>
      </tr>
      <tr>
        <th width=20% class="text-center success">제목</th>
        <td colspan="3" class="text-left">${vo.subject }</td>
      </tr>
      <tr>
        <td colspan="4" valign="top" height="200">${vo.content }</td>
      </tr>
      <tr>
        <td colspan="4" class="text-right">
          <a href="#" class="btn btn-xs btn-danger">수정</a>
          <a href="#" class="btn btn-xs btn-info">삭제</a>
          <a href="../board/list.do" class="btn btn-xs btn-success">목록</a>
		<c:if test="${count!=1}">
          <a href="#" class="btn btn-xs btn-success rUp">답글 작성</a>
         </c:if>
        </td>
      </tr>
    </table>
    <table class="table" style="display:none" id="qna_reply">
      <tr>
       <td>
        <form method=post action="../coach/qna_reply_insert.do">
            <input type=hidden name="group_tab" value="${vo.group_tab }">
            <input type=hidden name="coach_qna_no" value="${vo.coach_qna_no }">
            <input type=hidden name="coach_no" value="${vo.coach_no }">
            <input type=hidden name="group_id" value="${vo.group_id }">
	        <textarea rows="3" cols="80" name="content" style="float: left"></textarea>
	        <input type=submit value="댓글쓰기" style="height:70px;float: left"
	          class="btn btn-sm btn-primary">
        </form>
       </td>
      </tr>
    </table>
  </div>
</body>
</html>