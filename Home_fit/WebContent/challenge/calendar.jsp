<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</style> -->
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">

// 시작일
	$(function() {
		$('.select_ok').hover(function() {
			$(this).css("cursor", "pointer");
		}, function() {
			$(this).css("cursor", "");
		})
		$('#year').change(function() {
			let year = $(this).val();
			$.ajax({
				type : 'post',
				url : '../challenge/calendar.do',
				data : {
					"year" : year
				},
				success : function(result) {
					$('#calendar').html(result);
				}
			})
		})
		$('#month').change(function() {
			let month = $(this).val();
			$.ajax({
				type : 'post',
				url : '../challenge/calendar.do',
				data : {
					"month" : month
				},
				success : function(result) {
					$('#calendar').html(result);
				}
			})
		});

		$('.select_ok').click(function() {
			let year = $(this).attr("data-year");
			let month = $(this).attr("data-month");
			let day = $(this).text();
			let date = year + "년도 " + month + "월 " + day + "일";

			$('#selyear').text(year);
			$('#selmonth').text(month);
			$('#selday').text(day);

			// 		$.ajax({
			// 			type:'post',
			// 			url:'../challenge/insert.do',
			// 			data:{"date":date},
			// 			success:function(result)
			// 			{
			// 				$('#start_day').html(result);
			// 			}
			// 		})
		})
	});

// 종료일
$(function(){
	$('.select_ok2').hover(function(){
		$(this).css("cursor","pointer");
	},function(){
		$(this).css("cursor","");
	})
	$('#year2').change(function(){
		let year=$(this).val();
		$.ajax({
			type:'post',
			url:'../challenge/calendar2.do',
			data:{"year":year},
			success:function(result)
			{
				$('#calendar2').html(result);
			}
		})
	})
	$('#month2').change(function(){
		let month=$(this).val();
		$.ajax({
			type:'post',
			url:'../challenge/calendar2.do',
			data:{"month":month},
			success:function(result)
			{
				$('#calendar2').html(result);
			}
		})
	});
	
	
	$('.select_ok2').click(function(){
		let year=$(this).attr("data-year");
		let month=$(this).attr("data-month");
		day=$(this).text();
		let date=year+"년도 "+month+"월 "+day+"일";
		
		$('#selyear2').text(year);
		$('#selmonth2').text(month);
		$('#selday2').text(day);
		
// 		$.ajax({
// 			type:'post',
// 			url:'../challenge/insert.do',
// 			data:{"date":date},
// 			success:function(result)
// 			{
// 				$('#end_day').html(result);
// 			}
// 		})
	})
});
</script>
</head>
<body>

<tr>
<td id="calendar">
	<th class="danger text-right" width=30%>도전 시작일</th>
	<h3 class="text-center">
		<span id="selyear"></span>년도<span id="selmonth"></span>월<span
			id="selday"></span>일
	</h3>
	<table class="table">
		<tr>
			<td colspan="7"><select name="year" id="year">
					<c:forEach var="i" begin="2020" end="2030">
						<option ${i==year?"selected":"" }>${i }</option>
					</c:forEach>
			</select>년도&nbsp; <select name="month" id="month">
					<c:forEach var="i" begin="1" end="12">
						<option ${i==month?"selected":"" }>${i }</option>
					</c:forEach>
			</select>월</td>
		</tr>
<!-- 	</table> -->
<!-- 	<table id="calendar"> -->
		<tr>
			<c:if test="${dayOfWeek!=0}">
				<c:forEach var="i" begin="1" end="${dayOfWeek }">
					<td>&nbsp;</td>
				</c:forEach>
			</c:if>
			<c:forEach var="i" begin="1" end="${lastDay }" step="1"
				varStatus="status">
				<td><span class="select_ok" data-year=${year } data-month="${month }"> ${status.count } </span></td>
				<c:if test="${(dayOfWeek+status.count)%7==0 }">
					</tr><tr>
				</c:if>
			</c:forEach>
		<c:if test="${(7-(dayOfWeek+lastDay)%7)<7 }">
			<c:forEach var="i" begin="1" end="${7-(dayOfWeek+lastDay)%7 }">
				<td>&nbsp;</td>
			</c:forEach>
		</c:if>
	</table>
	
	<h3 class="text-center"><span id="selyear2"></span>년도<span id="selmonth2"></span>월<span id="selday2"></span>일 </h3>
	<table class="table">
		<tr>
			<td colspan="7"><select name="year2" id="year2">
					<c:forEach var="i" begin="2020" end="2030">
						<option ${i==year?"selected":"" }>${i }</option>
					</c:forEach>
			</select>년도&nbsp; <select name="month2" id="month2">
					<c:forEach var="i" begin="1" end="12">
						<option ${i==month?"selected":"" }>${i }</option>
					</c:forEach>
			</select>월</td>
		</tr>
		<tr>
			<c:if test="${dayOfWeek!=0}">
				<c:forEach var="i" begin="1" end="${dayOfWeek }">
					<td>&nbsp;</td>
				</c:forEach>
			</c:if>
			<c:forEach var="i" begin="1" end="${lastDay }" step="1"
				varStatus="status">
				<td><span class="select_ok2" data-year=${year } data-month="${month }"> ${status.count } </span></td>
				<c:if test="${(dayOfWeek+status.count)%7==0 }">
					</tr><tr>
				</c:if>
			</c:forEach>
		<c:if test="${(7-(dayOfWeek+lastDay)%7)<7 }">
			<c:forEach var="i" begin="1" end="${7-(dayOfWeek+lastDay)%7 }">
				<td>&nbsp;</td>
			</c:forEach>
		</c:if>

	</table>
<td>
</tr>
<!------------------------------------------------종료일------------------------------------------>
<tr>
								<th class="danger text-right" width=30%>도전 종료일</th>	
<td id="calendar2">

h3 class="text-center"><span id="selyear2"></span>년도<span id="selmonth2"></span>월<span id="selday2"></span>일 </h3>
	<table class="table">
		<tr>
			<td colspan="7"><select name="year2" id="year2">
					<c:forEach var="i" begin="2020" end="2030">
						<option ${i==year?"selected":"" }>${i }</option>
					</c:forEach>
			</select>년도&nbsp; <select name="month2" id="month2">
					<c:forEach var="i" begin="1" end="12">
						<option ${i==month?"selected":"" }>${i }</option>
					</c:forEach>
			</select>월</td>
		</tr>
		<tr>
			<c:if test="${dayOfWeek!=0}">
				<c:forEach var="i" begin="1" end="${dayOfWeek }">
					<td>&nbsp;</td>
				</c:forEach>
			</c:if>
			<c:forEach var="i" begin="1" end="${lastDay }" step="1"
				varStatus="status">
				<td><span class="select_ok2" data-year=${year } data-month="${month }"> ${status.count } </span></td>
				<c:if test="${(dayOfWeek+status.count)%7==0 }">
					</tr><tr>
				</c:if>
			</c:forEach>
		<c:if test="${(7-(dayOfWeek+lastDay)%7)<7 }">
			<c:forEach var="i" begin="1" end="${7-(dayOfWeek+lastDay)%7 }">
				<td>&nbsp;</td>
			</c:forEach>
		</c:if>

	</table>


<td>
							</tr>	
	
</body>
</html>