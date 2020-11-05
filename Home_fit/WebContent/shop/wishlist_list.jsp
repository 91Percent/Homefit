<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../assets/vendors/linericon/style.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">

$(function(){
	
	// 삭제버튼 누를 시 동작
	$('.wishdelete').click(function(){
		let wishlist_no=$(this).attr("data-value");
		//$('#wishlist_no').val(wishlist_no);
		console.log(wishlist_no);
		console.log('나오겠지?');
		$.ajax({
			type:'post',
			url:'../shop/wishlist_cancel.do',
			data:{"wishlist_no":wishlist_no},
			success:function(result){
				$('#wishlist_list').html(result);
			}
		})
	});
	
	// 체크한 물건 구매하기
	$('.listpurchase').click(function(){
		$("input[name='cb']:checked").each(function () {
			let plist=$(this).val();
			console.log('체크된값:'+plist);
			$.ajax({
				type:'post',
				url:'../shop/wishlist_purchase.do',
				data:{"plist":plist},
				susccess: function(result){
					$('#wishlist_list').html(result);
				}
			})
		})
	});
	
// 	// 카운트 
	$('.plus').on('click',function(){
		let wishlist_no=$(this).attr("wish-value");
		let index=$(this).attr("data-value");
		console.log('i.index값'+index);
		let temp='#sst'+index;
		console.log('temp는'+temp);
		let count=$(temp).val();
		count=Number(count)+1;
		let c=$(temp).val();
		console.log('count출력값??'+count);
		console.log('wishlist_no값:'+wishlist_no);
		console.log('.countplus 출력값:'+c);
		console.log('====================');
		$.ajax({
			type:'post',
			url:'../shop/count_update.do',
			data:{"wishlist_no":wishlist_no,"count":count-1},
			susccess: function(result){
				$('#wishlist_list').html(result);
			}
		})
	});
	
	$('.minus').on('click',function(){
		let wishlist_no=$(this).attr("wish-value");
		let index=$(this).attr("data-value");
		console.log('i.index값'+index);
		let temp='#sst'+index;
		console.log('temp는'+temp);
		let count=$(temp).val();
		if(Number(count)>0)
			count=Number(count)-1;
		else
			alert("1개 이하의 상품은 구매할 수 없습니다");		
		console.log('count출력값??'+count);
		console.log('wishlist_no값:'+wishlist_no);			
		console.log('====================');
		$.ajax({
			type:'post',
			url:'../shop/count_update.do',
			data:{"wishlist_no":wishlist_no,"count":count+1},
			susccess: function(result){
			$('#wishlist_list').html(result);
			}
		})
	});
	

	
	// 전체체크
	$('#check_all').click( function() {
         $('.cb').prop( 'checked', this.checked );
    });
	
	// 전체체크 풀림
	$('.cb').click(function() {
		$('#check-all').prop('checked', false);
	});
	
	// 체크한 물건 삭제
	$('#listdelete').click(function(){
		let len = $('.cb:checked').length;
		if(len == 0) {
			alert("삭제할 대상을 선택하세요!!");
		} else {
			$('#frm').submit();//submit효과 => form태그의 action에등록 파일로 데이터 전송
		}
	});
	

	
});
</script>
</head>
<body >



			<form id="frm" method="post" action="../shop/wishlist_all_ok.do">
				<table class="table">
					<thead>
                          <tr>
                          	  <th scope="col" style="width:15%">
                          	  <h7>전체선택 </h7><input type="checkbox" id="check_all"/>
          					  </th>
                              <th scope="col" style="width:40%">제품</th>
                              <th scope="col" style="width:15%">가격</th>
                              <th scope="col" style="width:10%">수량</th>
                              <th scope="col" style="width:15%">합계</th>
                              <th scope="col" style="width:5%"></th>
                          </tr>
                      </thead>
					<tbody>
                      	<c:forEach var="vo" items="${list }" varStatus="i" begin="0" step="1">
                          <tr>
                          	  <td class="text-center">
				                <c:if test="${vo.iswish=='n' }">
				                  <input type="checkbox" value="${vo.wishlist_no }" class="cb" name=cb>
				                </c:if>
				              </td>
                              <td style="width:50%">
                                  <div class="media">
                                      <div class="d-flex" style="width:20%">
                                      	<a href="../shop/shop_detail.do?shop_no=${vo.shop_no }">
                                          <img src="${vo.svo.poster }" style="width:90%">
                                        </a>
                                      </div>
                                      <div class="media-body" style="width:70%">
                                      	<a href="../shop/shop_detail.do?shop_no=${vo.shop_no }">${vo.svo.title }</a>
                                      </div>
                                  </div>
                              </td>
                              <td style="width:15%">
                                  <h5>${vo.svo.price }</h5>
                              </td>
                              <td>           
                                  <td>
                                      <input type="text" name="qty" id="sst${i.index }" value="${vo.count }" wish-value="${vo.wishlist_no }" title="Quantity:" class="input-text qty" style="width:30px;height:20px;text-align:center;">
                                      </td>
                                      <td colspan="2">                                      
                                      <img src="../shop/up.jpg" onclick="var result = document.getElementById('sst${i.index }'); var sst${i.index } = result.value; if( !isNaN( sst${i.index } )) result.value++;return false;"
                                          class="plus" width="20" height="15" style="cursor: pointer;" data-value="${i.index }" wish-value="${vo.wishlist_no }" price-value="${vo.svo.price }">
                                      <img src="../shop/down.jpg" onclick="var result = document.getElementById('sst${i.index }'); var sst${i.index } = result.value; if( !isNaN( sst${i.index } ) &amp;&amp; sst${i.index } > 0 ) result.value--;return false;"
                                          class="minus" width="20" height="15" style="cursor: pointer;" data-value="${i.index }" wish-value="${vo.wishlist_no }" price-value="${vo.svo.price }">
                                  </td>
                         	</td>
                              <td style="width:15%" >
                              	${vo.total}
                              </td>
                              <td style="width:5%">
                                 <c:if test="${vo.iswish=='n' }">
                                 	<input type="button" class="wishdelete" value="삭제" data-value="${vo.wishlist_no}"/>
					             </c:if>
                              </td>
                          </tr>
                          </c:forEach>
                          

                      </tbody>
              </table>
       
			  <input type="button" class="btn" id="listdelete" value="삭제" />
<!--               <input src="../shop/purchase.do" type="button" class="listpurchase" value="구매하기" /> -->
              
         </form>
         <button onclick="location.href='../shop/purchase.do'" class="listpurchase" price-value="${vo.total}">구매하기</button>
         <button onclick="location.href='../shop/shop.do'" class="btn btn-sm btn-primary">목록</button>
              
</body>
</html>