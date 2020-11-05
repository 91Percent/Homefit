<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
//시작일
$(function() {
	$('.certified_select_ok').hover(function() {
		$(this).css("cursor", "pointer");
	}, function() {
		$(this).css("cursor", "");
	});
	$('#year3').change(function() {
		let year = $(this).val();
		$.ajax({
			type : 'post',
			url : '../challenge/certifiedcalendar.do',
			data : {
				"year" : year
			},
			success : function(result) {
				$('#certifiedcalendar').html(result);
			}
		});
	});
	$('#month3').change(function() {
		let month = $(this).val();
		$.ajax({
			type : 'post',
			url : '../challenge/certifiedcalendar.do',
			data : {
				"month" : month
			},
			
			success : function(result) {
				$('#certifiedcalendar').html(result);
			}
		});
	});

	$('.certified_select_ok').click(function() {
		let year = $(this).attr("data-year");
		let month = $(this).attr("data-month");
		let day = $(this).text();
		
		let date = year + "-" + month + "-" + day;
		console.log(date);
		
		$('#seldate').text(date);
		$('#selyear').text(year);
		$('#selmonth').text(month);
		$('#selday').text(day);
		

// 		$.ajax({
// 			type:'post',
// 			url:'../challenge/mychallenge.do',
// 			data:{"date":date},
// 			success:function(result)
// 			{
// 				$('#start_day').html(result);
// 			}
// 		})
		$.ajax({
			type:'post',
			url:'../challenge/myProofDetail.do',
			data:{'year':year},
			data:{'month':month},
			data:{'day':day},
			data:{'date':date},
			success:function(result)
			{
				$('#myProofDetail').html(result);
			}
		});
	});
});

</script>
</head>
<body>


<c:forEach var="vo" items="${cfList }">
					<table class="table">
                      <thead>
                          <tr>
                          	  <th scope="col" class="mychallengeno1">NO</th>
                              <th scope="col">POSTER</th>
                              <th scope="col">ROOM</th>
                              <th scope="col">DATE</th>
                              <th scope="col" class="mychallengeno2">ID</th>
                          </tr>
                      </thead>
                      <tbody>
                          <tr>
                          <!-- NO -->
                          	<td>${vo.ccVO.mylist_no }</td>
                          <!-- 포스터 -->
                              <td>
                                  <div class="media">
                                      <div class="d-flex">
                                          <img src="${vo.getCcVO().poster }">
                                      </div>
                                  </div>
                              </td>
                          <!-- date -->
                              <td>
                                  <h5>${vo.title }</h5>
                              </td>
                          <!-- room -->
                              <td>
                                  <div class="product_count">
                                     <h5><fmt:formatDate value="${vo.ccVO.certified_date }" pattern="yyyy-MM-dd"/> </h5>
                                  </div>
                              </td>
                          <!-- ID -->
                              <td>
                                  <h5>${vo.ccVO.challenge_id }</h5>
                              </td>
                          </tr>
                      </tbody>
                  </table>
                  </c:forEach>




<!-- -------------------------------------------------------------- -->
	<table class="table text-center">
		<tr>
			<td colspan="7" style="font-size:20px; border-top:none">
				<select name="year" id="year3" class="selectpicker">
						<c:forEach var="i" begin="2020" end="2030">
							<option ${i==year?"selected":"" }>${i }</option>
						</c:forEach>
				</select><span style="margin-left:10px; margin-right:20px">YEAR</span>
				
				<select name="month" id="month3" class="selectpicker">
						<c:forEach var="i" begin="1" end="12">
							<option ${i==month?"selected":"" }>${i }</option>
						</c:forEach>
				</select><span style="margin-left:10px">MONTH</span>
			</td>
		</tr>
<!-- 	</table> -->
<!-- 	<table id="calendar"> -->
<tr style="background-color:#384aeb; color:#fff" >
				<th>일</th>
				<th>월</th>
				<th>화</th>
				<th>수</th>
				<th>목</th>
				<th>금</th>
				<th>토</th>
			</tr>
		<tr>
			<c:if test="${dayOfWeek!=0}">
				<c:forEach var="i" begin="1" end="${dayOfWeek }">
					<td>&nbsp;</td>
				</c:forEach>
			</c:if>
			
			<c:forEach var="i" begin="1" end="${lastDay }" step="1"
				varStatus="status">
				<td>
					<span class="certified_select_ok" data-year=${year } data-month="${month }"> ${status.count }
						<c:if test="${arr[i-1]!=0 }">
						<br>
							<img src="../challenge/checkchallenge.png" width=20px; height=20px;> 
						</c:if>
					</span>
				</td>
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
	<h3 class="text-left">
				[인증 목록]&nbsp;<span id="seldate"></span>
			</h3> 	
			
	
	
</body>
</html>