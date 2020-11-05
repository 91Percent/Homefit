<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	   $('.deletebtn').click(function(){
		   let no = $(this).attr("data-value");
	        $.ajax({
	            type:'post',
	            url:'../coachreserve/mypage_delete.do',
	            data:{"Schedule_no":no},
	            success:function(result)
	            {
	               $('.soo').html(result);
	            }
	         })
	   });
});

</script>
</head>
<body>
	<div class="row">
   <table class="table">
     <tr>
       <td height=500>
         <h5>예약페이지</h5>
         <table class="table">
   			<tr>
   				<th>예약취소</th>
   				<th>예약번호</th>
   				<th>사용자 아이디</th>
   				<th>코치번호</th>
   				<th>스케쥴번호</th>
   			</tr>
   			<c:forEach var="vo" items="${list }" >
           <tr>
               <td>
<%--                href="../coachreserve/mypage.delete.do?Schedule_no=${vo.schedule_no }" --%>
                 <a data-value=${vo.schedule_no } class="btn btn-sm btn-danger deletebtn">취소</a>
              </td>
             <td>${vo.reserve_no }</td>
             <td>${vo.id }</td>
             <td>${vo.coach_no }</td>
             <td>${vo.schedule_no }</td>
           </tr>
         	</c:forEach>
         </table>
         </td>
         </tr>
         </table>
      </div>
</body>
</html>