<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript"> 

</script>
<style type="text/css">
.row1 {
   margin: 0px auto;
   width:700px;
}
.btd {
  font-size: 8pt;
}
</style>
</head>
<body>
  <div class="row row1">
   <h4 class="text-center">문의 글</h4>
   <form method="post" action="../coach/coach_qna_insert_ok.do">
   <table class="table table-hover">
     <tr>
       <th class="danger text-right" width=15%>이름</th>
       <td width=85%>
         <input type=text name=name size=15 class="input-sm">
       </td>
     </tr>
     <tr>
       <th class="danger text-right" width=20%>문의 형태</th>
       <td width=85%>
			<select name="formlist">
				<option value="시간">시간</option>
				<option value="장소">장소</option>
				<option value="계획">계획</option>
				<option value="기타">기타</option>
			</select>
       </td>
     </tr>
     <tr>
       <th class="danger text-right" width=15%>제목</th>
       <td width=85%>
         <input type=text name=subject size=45 class="input-sm">
         <input type=hidden value="${coach_no }" name="coach_no">
       </td>
     </tr>
     <tr>
       <th class="danger text-right" width=15%>내용</th>
       <td width=85%>
         <textarea rows="10" cols="50" name=content></textarea>
       </td>
     </tr>
     <tr>
       <td colspan="2" class="text-center">
         <input type=submit value=글쓰기 class="btn btn-sm btn-primary" id="qna_btn">
         <input type=button value=취소 class="btn btn-sm btn-primary"
           onclick="javascript:history.back()">
       </td>
     </tr>
   </table>
   </form>
  </div>
</body>
</html>