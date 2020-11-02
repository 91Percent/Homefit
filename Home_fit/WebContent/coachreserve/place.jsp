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
	$('.place').hover(function(){
		$(this).css("cursor","pointer");
	},function(){
		$(this).css("cursor","");
	})
	$('.place').click(function(){
	   let no=$(this).attr("data-value");
	   let place=$(this).attr("data-name");
	   let sno=$(this).attr("data-name2");
	   $('#coach_place').text(place);
	   $('#place').val(place);
	   $('#sno').val(sno);
	   $.ajax({
		   type:'post',
		   data:{"cno":no},
		   url:'../coachreserve/month.do',
		   success:function(result){
			   $('#month_info').html(result);
		   }
	   })
	})
});
</script>
</head>
<body>
  <table class="table table-striped">
    <c:forEach var="vo" items="${list }">
      <tr class="place" data-value="${vo.coach_no }" data-name="${vo.place }" data-name2="${vo.schedule_no }" >
       <td style="font-size:8pt">${vo.place }(${vo.schedule_no })</td>
      </tr>
    </c:forEach>
  </table>
</body>
</html>