<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*,java.util.*,java.io.*"%>
	
<!DOCTYPE html>
<html>   
<head>  
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body> 
  <div class="row">
   <h1 class="text-center">인증 올리기</h1>
   <form method="post" action="Certified_ok.do?challenge_no=${challenge_no }" enctype="multipart/form-data">
   <table class="table table-hover">
     <tr>
       <th class="danger text-right" width=15%>첨부파일</th>
       <td width=85%> 번호!! ${challenge_no }
         <input type=file name=upload size=20 class="input-sm">
         
       </td>
     </trc>
     <tr>
       <td colspan="2" class="text-center">
         <input type=submit value=글쓰기 class="btn btn-sm btn-primary">
         <input type=button value=취소 class="btn btn-sm btn-primary"
           onclick="javascript:history.back()">
<%--            <input type="hidden" name="challenge_no" value="${challenge_no }"> --%>
       </td>
     </tr>
   </table>
   </form>
  </div> 
</body>  
</html>