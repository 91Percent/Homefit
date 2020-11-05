<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('.month').hover(function(){
		$(this).css("cursor","pointer");
	},function(){
		$(this).css("cursor","");
	});
	$('.month').click(function(){
	   let no=$(this).attr("data-value");
	   let month=$(this).attr("data-name");
	   $('#coach_month').text(month);
	   $('#month').val(month);
	   $.ajax({
		   type:'post',
		   data:{"cno":no},
		   url:'../coachreserve/time.do',
		   success:function(result){
			   $('#time_info').html(result);
		   }
	   })
	})
});
</script>
</head>
<body>
  <table class="table table-striped">
    <c:forEach var="vo" items="${list }">
      <tr class="month" data-value="${vo.coach_no }" data-name="${vo.month }">
       <td style="font-size:12pt"><center>${vo.month }</center></td>
      </tr>
    </c:forEach>
  </table>
</body>
</html>