<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="row">
   <table class="table">
     <tr>
       <td height=500>
         <h5>예약페이지</h5>
         <table class="table">
   <c:forEach var="vo" items="${list }">
           <tr>
             <td>${vo.coach_no }</td>
             <td>${vo.schedule_no }</td>
             <td>${vo.id }</td>
             <td>${vo.reserve_no }</td>
           </tr>
         </c:forEach>
         </table>
         </td>
         </tr>
         </table>
      </div>
</body>
</html>