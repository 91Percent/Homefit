<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 라이브러리 추가 -->
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
/*
 *   내장 객체  : 태그 추가 , 내용변경  ==> 동적   ==> DOM프로그램 
       => window => 브라우저 (창 => 팝업)
          window.open()
       => document => 브라우저안에 출력 부분 
           => document.write() : 브라우저에 출력 
           => console.log() ==> debug
       => form
           => input타입의 데이터를 읽거나 
       => history
           => back()
     =======
          태그를 제어  : selector
     ========
    	 1) 태그명 
    	 2) id ==> #movie_info
    	 3) class  ==> .table
    	 
    	 
    	 jquery(라이브러리),javascript
    	 ===============
    		  메모리에 저장이 된 상태 => 제어할 수 있다 
    		 ================
    			 window.onload=function(){}
    		     =============
    		      $(function(){
    		    	  
    		      })
 */
 $(function(){
	 $.ajax({
		 type:'post',
		 url:'../coachreserve/coach.do',
		 success:function(result)
		 {
			 $('#coach_info').html(result);
		 }
	 })
 });
</script>
</head>
<body>
<!-- ================ start banner area ================= -->	
	<section class="blog-banner-area" id="category">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1>코치정보</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="#">G반</a></li>
              <li class="breadcrumb-item active" aria-current="page">안치훈</li>
            </ol>
          </nav>
				</div>
			</div>
    </div>
	</section>
	<!-- ================ end banner area ================= -->
<section class="section-margin--small mb-5">
 <div class="container">
  <div class="row">
   <table class="table">
     <tr>
       <td width=20% rowspan="2">
         <h4 class="text-center">코치리스트</h4>
         <table class="table">
           <tr>
             <td>
               <div id="coach_info" style="overflow-y:auto;height:400px"></div>
             </td>
           </tr>
         </table>
       </td>
       <td width=15%>
         <table class="table">
          <h4 class="text-center">장소</h4>
           <tr>
             <td>
               <div id="place_info"></div>
             </td>
           </tr>
         </table>
       </td>
        <td width=15%>
         <table class="table">
           <h4 class="text-center">월별</h4>
           <tr>
             <td>
               <div id="month_info"></div>
             </td>
           </tr>
         </table>
       </td>
        <td width=15%>
         <table class="table">
           <h4 class="text-center">시간</h4>
           <tr>
             <td>
               <div id="time_info"></div>
             </td>
           </tr>
         </table>
       </td>
       <td width=35% rowspan="2">
         <table class="table">
           <h4 class="text-center">예약정보</h4>
           <tr>
             <td class="text-center" colspan="2">
               <img src="HT.png" width=200 height=200 id="coach_poster">
             </td>
           </tr>
           <tr>
             <td class="text-right" width=20%>
                         코치명:
             </td>
             <td width=80%>
               <span id="coach_name"></span>
             </td>
           </tr>
           <tr>
             <td class="text-right" width=20%>
                         장소:
             </td>
             <td width=80%>
               <span id="coach_place"></span>
             	<span id="schedule_no"></span>
             </td>
           </tr>
           <tr>
             <td class="text-right" width=20%>
                             월:
             </td>
             <td width=80%>
               <span id="coach_month"></span>
             </td>
           </tr>
           <tr>
             <td class="text-right" width=20%>
                         시간:
             </td>
             <td width=80%>
               <span id="coach_time"></span>
             </td>
           </tr>
           <tr>
             <td class="text-right" width=20%>
                         금액:
             </td>
             <td width=80%>
               <span id="coach_price"></span>
             </td>
           </tr>
           <tr style="display:none" id="okbtn">
              <td colspan="2" class="text-center">
                <form method="post" action="../coachreserve/reserve_ok.do">
                  <input type=hidden name="coach_no" id="cno">
<!--                   <input type=hidden name="place" id="place"> -->
                  <input type=hidden name="schedule_no" id="sno">
<!--                   <input type=hidden name="month" id="month"> -->
<!--                   <input type=hidden name="time" id="time"> -->
<!--                   <input type=hidden name="price" id="price"> -->
                  <input type=submit value="예약하기"
                           class="btn btn-lg btn-primary">
                </form>
              </td>
           </tr>
         </table>
       </td>
       <tr>
       	<td width=45% colspan="3">
         <table class="table">
           <h4 class="text-center">금액</h4>
           <tr>
             <td>
               <div id="price_info" style="overflow-y:auto;height:200px"></div>
             </td>
           
           </tr>
         </table>
       </td>
      </tr>
   </table>
  </div>
  </div>
  </section>
</body>
</html>