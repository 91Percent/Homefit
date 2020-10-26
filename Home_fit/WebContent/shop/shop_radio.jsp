<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">

$(function(){
	$('.filter-list').click(function(){
		var cate_no=$(this).attr("value");
		$.ajax({
			type:'post',
			url:'../shop/shop_list.do?cate_no=+cate_no',
// 			data:{"cate_no":cate_no},
			success:function(result)
			{
				$('#shop_list').html(result);
			}
		})
	});
});
</script>
</head>
<body>
<%-- 	<table class="table striped">
     <c:forEach var="vo" items="${list }">
       <tr class="filter-list" data-value="${vo.cate_no }">
         <td style="font-size:8pt">${vo.cate_no }</td>
         <td style="font-size:8pt">${vo.cate_name }</td>
       </tr>
     </c:forEach>
   </table>


 --%>

	<ul>
		
		
		<c:forEach var="vo" items="${list }" varStatus="status">	
			<li class="filter-list" value="${vo.cate_no }">
				<input class="pixel-radio" type="radio" name="cate_no" value="${vo.cate_no }" ><label for="cate1">${vo.cate_name }<span> (3600)</span></label>
			</li>
		</c:forEach>
		<!-- <li class="filter-list"><input class="pixel-radio" type="radio" id="cate1" name="cate_no" value="1" onclick="javascript:page('1')"><label for="cate1">식단<span> (3600)</span></label></li>
		<li class="filter-list"><input class="pixel-radio" type="radio" id="cate2" name="cate_no" value="2" onclick="javascript:page('2')"><label for="cate2">건강간식<span> (3600)</span></label></li>
		<li class="filter-list"><input class="pixel-radio" type="radio" id="cate3" name="cate_no" value="3" onclick="javascript:page('3')"><label for="cate3">식사대용<span> (3600)</span></label></li>
		<li class="filter-list"><input class="pixel-radio" type="radio" id="cate4" name="cate_no" value="4" onclick="javascript:page('4')"><label for="cate4">단백질보충<span> (3600)</span></label></li>
		<li class="filter-list"><input class="pixel-radio" type="radio" id="cate5" name="cate_no" value="5" onclick="javascript:page('5')"><label for="cate5">체지방관리<span> (3600)</span></label></li>
		<li class="filter-list"><input class="pixel-radio" type="radio" id="cate6" name="cate_no" value="6" onclick="javascript:page('6')"><label for="cate6">헬스케어<span> (3600)</span></label></li>
	 -->
	</ul>

</body>
</html>