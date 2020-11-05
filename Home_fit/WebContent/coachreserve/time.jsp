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
	$('.time').hover(function(){
		$(this).css("cursor","pointer");
	},function(){
		$(this).css("cursor","");
	});
	$('.time').click(function(){
		   let no=$(this).attr("data-value");
		   let time=$(this).attr("data-name");
		   $('#coach_time').text(time);
		   $('#time').val(time);
		   $.ajax({
			   type:'post',
			   data:{"cno":no},
			   url:'../coachreserve/price.do',
			   success:function(result){
				   $('#price_info').html(result);
			   }
		   })
		})
	});
</script>
</head>
<body>
  <table class="table table-striped">
    <c:forEach var="vo" items="${list }">
      <tr class="time" data-value="${vo.coach_no }" data-name="${vo.time }">
       <td style="font-size:12pt"><center>${vo.time }</center></td>
      </tr>
    </c:forEach>
  </table>
</body>
</html>