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
/*
 *    브라우저에 요청 
       XMLHttpRequest req : 생성 
       
       1) 서버연결 
          req.open("POST","URL",true/false) ==> true : 비동기
                                                false : 동기화 
 */
 $(function(){
		$('.coach').hover(function(){
			$(this).css("cursor","pointer");
		},function(){
			$(this).css("cursor","");
		})
		$('.coach').click(function(){
		   let no=$(this).attr("data-value");
		   let name=$(this).attr("data-name");
		   let poster=$(this).attr("data-poster");
		   $('#coach_poster').attr("src",poster);
		   $('#coach_name').text(name);
		   $('#cno').val(no);
		   $.ajax({
			   type:'post',
			   data:{"cno":no},
			   url:'../coachreserve/place.do',
			   success:function(result){
				   $('#place_info').html(result);
			   }
		   })
		})
	});
</script>
</head>
<body>
   <table class="table table-striped" id="coach-table">
       <tbody>
		     <c:forEach var="vo" items="${list }">
		       <tr class="coach" data-value="${vo.coach_no }"
		           data-poster="${vo.coach_poster }" data-name="${vo.coach_name }">
		         <td><img src="${vo.coach_poster }" width=20 height=20></td>
		         <td style="font-size:8pt">${vo.coach_name }</td>
		       </tr>
		     </c:forEach>
     </tbody>
   </table>
</body>
</html>