<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
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
	 	$('#keyword').keyup(function(){
		let k=$('#keyword').val(); 
		$('#coach-table > tbody > tr').hide();
		let temp=$('#coach-table > tbody > tr> td:nth-child(2n+2):contains("'+k+'")');
		$(temp).parent().show();
		});
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
   <table class="table">
   			<tr>
      			<td>
       				<input type=text id="keyword" size=15 placeholder="검색어 입력">
      			</td>
    		</tr>
  		 </table>
   <table class="table table-striped" id="coach-table">
       <tbody>
		     <c:forEach var="vo" items="${list }">
		       <tr class="coach" data-value="${vo.coach_no }"
		           data-poster="${vo.coach_poster }" data-name="${vo.coach_name }">
		         <td><img src="${vo.coach_poster }" width=20 height=20></td>
		         <td style="font-size:12pt"><center>${vo.coach_name }</center></td>
		       </tr>
		     </c:forEach>
     </tbody>
   </table>
</body>
</html>