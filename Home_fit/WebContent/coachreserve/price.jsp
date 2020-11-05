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
	$('.price').hover(function(){
		$(this).css("cursor","pointer");
	},function(){
		$(this).css("cursor","");
	})
	$('.price').click(function(){
		let no=$(this).attr("data-value");
		let price=$(this).text();
		$('#coach_price').text(price);
		$('#price').val(price);
		$('#okbtn').show();
	})
})
</script>
</head>
<body>
  <table class="table table-striped">
    <c:forEach var="vo" items="${list }">
      <tr class="price" data-value="${vo.coach_no }" data-name="${vo.price }">
       <td style="font-size:12pt"><center>${vo.price }</center></td>
      </tr>
    </c:forEach>
  </table>
</body>
</html>