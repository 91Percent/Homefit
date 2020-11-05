<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.list-btn{
	margin-right: 1px;
	float: right;
}
.card-footer {
    padding: 0.50rem 0.50rem;
    background-color: rgba(0,0,0,.03);
    border-top: 1px solid rgba(0,0,0,.125);
}
.overlay
{
padding-left:5px;
position: absolute;
margin-left: 3px;
margin-top: 15px;
}
.participantx
{
    color: #fff;
    background-color: #343a40;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	$('.waiting').before('<img src="https://i.ibb.co/jftKvs8/waiting.png" class="overlay" />');
	$('.chellenging').before('<img src="https://i.ibb.co/1Yc4tbw/ing.png" class="overlay" />');
	$('.closing').before('<img src="https://i.ibb.co/yRcKdGY/closing.png" class="overlay" />');
	$('.chexceed').click(function(){
		alert("제한 인원을 초과하였습니다.");
	})
	$('.chexpired').click(function(){
		alert("이미 종료된 도전입니다.");
	});
	$('.chstand').click(function(){
		alert("아직 시작되지 않은 도전입니다.");
	});
	
	$('.haenilink').click(function(){
		let page=$(this).text();
		
		alert("page:"+page);
		$.ajax({
			type: 'post',
			url:'../challenge/sublist.do',
			data:{'page':page},
			success:function(result){
				$('.sublist').html(result);
			}
		});
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
	
</script>
</head>
<body>
	<div class="row">
		<c:forEach var="vo" items="${list }">
			<div class="col-lg-4 col-md-6 mb-4">
				<div class="card h-100">
					<a href="../challenge/Certified_detail.do?challenge_no=${vo.challenge_no }">
					<c:choose>
						<c:when test="${today < vo.db_start_day }">
							<img class="card-img-top waiting"
							src="<c:url value='/challenge_poster/${vo.poster }'/>" width=300px,
							height=150px>
						</c:when>
						<c:when test="${vo.db_end_day < today }">
							<img class="card-img-top closing"
						src="<c:url value='/challenge_poster/${vo.poster }'/>" width=300px,
						height=150px>
						</c:when>
						<c:otherwise>
						<img class="card-img-top chellenging"
						src="<c:url value='/challenge_poster/${vo.poster }'/>" width=300px,
						height=150px>
						</c:otherwise>		
					</c:choose>
					
					</a>
					<div class="card-body">
						<h4 class="card-title">
							<a href="../challenge/Certified_detail.do?challenge_no=${vo.challenge_no }">${vo.title }
							<br/>
								<c:if test="${today==vo.regdate}">
									<font color=red><sup>new</sup></font>
								</c:if> 
							</a>
						</h4>
						<h5 class="challenge_room_count"> ${vo.participantCount }명/${vo.limit }명 </h5>
						<p class="card-text">
							${vo.db_start_day } ~ ${vo.db_end_day } 
							<br>(총 ${vo.period }일)
						</p>
					</div>
					<div class="card-footer">
						<small class="text-muted">리더: ${vo.id_leader }</small>
						<c:choose>
							<c:when test="${vo.db_start_day > today }">
								<button type="button" id="notLogin"
									class="btn btn-outline-dark btn-sm list-btn participantx chstand">참여대기</button>
							</c:when>
						
							<c:when test="${vo.db_end_day < today }">
								<button type="button" id="notLogin"
									class="btn btn-outline-dark btn-sm list-btn participantx chexpired">참여불가</button>
							</c:when>
							
							<c:when test="${vo.participantCount==vo.limit || vo.participantCount>vo.limit}">
								<button type="button" id="notLogin"
									class="btn btn-outline-dark btn-sm list-btn participantx chexceed">참여불가</button>
							</c:when>
							<c:otherwise>
								<c:if test="${sessionScope.id ==null }">
									<button type="button" id="notLogin"
										class="btn btn-outline-dark btn-sm list-btn"
										onclick="location.href='../member/login.do?'">참가하기</button>
								</c:if>
								<c:if test="${sessionScope.id !=null }">
									<!--  참여중이라면? count(*) = 1 -->
									<c:if test="${vo.participantionCheck!=0 }">
										<button type="button"
											class="btn btn-outline-dark btn-sm list-btn doproof"
											onclick="location.href='../challenge/Certified.do?challenge_no=${vo.challenge_no}'">인증하기</button>
									</c:if>
									<c:if test="${vo.participantionCheck==0}">
										<!--  참여중이 아니라면? count(*) = 0 -->
										<button type="button"
											class="btn btn-outline-dark btn-sm list-btn"
											onclick="location.href='../challenge/participation.do?challenge_no=${vo.challenge_no}'">참가하기</button>
									</c:if>
								</c:if>
							</c:otherwise>
						</c:choose>
						<!-- <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small> -->
					</div>
					<!-- <div style="padding:5px 0px"> -->
					<!-- </div> -->
					
					
					
					
				</div>
			</div>
		</c:forEach>
	</div>
	
	<!-- ////////////// pagination start /////////////////////// -->
						<nav class="blog-pagination justify-content-center d-flex">
                          <ul class="pagination">
                          <c:if test="${curpage>BLOCK }">
                              <li class="page-item" page=${startPage-1 }>
                                  <a class="page-linka" aria-label="Previous">
                                    &lt;
                                  </a>
                              </li>
                              </c:if>
                              <c:forEach var="i" begin="${startPage }" end="${endPage }">
                              <c:if test="${i==curpage }">
                              <li class="page-item active" page="${i}">
                                  <a class="page-link haenilink">${i }</a>
                              </li>
                              </c:if>
                              <c:if test="${i!=curpage }">
                              	<li class="page-item" page="${i}">
                                  <a class="page-link haenilink">${i }</a>
                              </li>
                              </c:if>
                              </c:forEach>
                              <c:if test="${endPage<totalpage }">
                              <li class="page-item" page=${endPage+1 }>
                                  <a class="page-linka" aria-label="Next">
                                      &gt;
                                  </a>
                              </li>
                            </c:if>
                          </ul>
                      </nav>  
					<!-- ////////////// pagination end /////////////////////// -->
	
</body>
</html>