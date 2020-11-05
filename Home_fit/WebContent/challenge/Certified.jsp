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
   <form method="post" action="../challenge/Certified_ok.do" enctype="multipart/form-data">
   <table class="table table-hover">
     <tr>
       <th class="danger text-right" width=25%>첨부파일</th>
       <td width=85%> 
         <input type=file name=upload size=20 class="input-sm">
         	값값!!${challenge_no }
         <input type="hidden" name="challenge_no" value="${challenge_no}">
       </td>
     </tr>
     <tr>
       <td colspan="2" class="text-center">
         <input type=submit value=업로드 class="btn btn-sm btn-primary">
       </td>
     </tr>
   </table>
   </form>
  </div> 
</body>  
</html>