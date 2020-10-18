<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*,java.util.*,java.io.*"%>
    
<%
	String no = request.getParameter("no");
	String path = "C:\\webDev\\webStudy\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\My_homework\\"+no;
 	String no1= no;
	File Folder = new File(path);
	
	if(!Folder.exists())
	{
		try{
			Folder.mkdir();
			System.out.println("폴더가 생성되었습니다.");
		}catch(Exception e){}
	}else{
		System.out.println("이미 폴더가 생성되어 있습니다.");
	}
%>		
<!DOCTYPE html>
<html>   
<head>  
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body> 
  <div class="row">
   <h1 class="text-center">인증 올리기</h1>
   <form method="post" action="Certified_ok.jsp" enctype="multipart/form-data">
   <table class="table table-hover">
     <tr>
       <th class="danger text-right" width=15%>첨부파일</th>
       <td width=85%>
         <input type=file name=upload size=20 class="input-sm">
         <input type="hidden" name="no" value=<%=no %>">
       </td>
     </tr>
     <tr>
       <td colspan="2" class="text-center">
         <input type=submit value=글쓰기 class="btn btn-sm btn-primary">
         <input type=button value=취소 class="btn btn-sm btn-primary"
           onclick="javascript:history.back()">
       </td>
     </tr>
   </table>
   </form>
  </div>
</body>
</html>