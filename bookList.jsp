<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>   
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>List</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	<style>
     a { text-decoration : none; }
     a:visited { color: blue; }
    </style>
</head>
<body>
<%
//================================
// DB접속
//================================
String url="jdbc:mysql://localhost:3306/book_d";
String user="root";
String password="";
Connection conn=DriverManager.getConnection(url,user,password);
//================================
// SQL
//================================
ResultSet rs=null;
PreparedStatement stmt = null;

//전달받은 카테고리번호로 해당카테고리의 모든책을 가져온다.
int cat_no= Integer.parseInt(request.getParameter("cat_no"));//카테고리번호
stmt = conn.prepareStatement("SELECT * FROM book_t WHERE cat_no=? ORDER BY title ASC");
stmt.setInt(1, cat_no);//카테고리번호를 SQL과 조립함
rs = stmt.executeQuery();
//================================
// 출력(헤드)
//================================
out.println("<table class='table'><thead class='table-dark'>"+
"<tr><th scope='col'>책제목</th><th scope='col'>가격</th>"+
"<th scope='col'>저자</th><th scope='col'>출판사</th>");
out.println("<tbody class='table-group-divider'>");
//================================
//출력(데이터)
//================================
while (rs.next()) { 
out.println("<tr>"); 
out.println("<td>"+rs.getString("title")+"</td>");//책제목
out.println("<td>"+rs.getString("price")+"</td>");//가격
out.println("<td>"+rs.getString("author")+"</td>");//저자
out.println("<td>"+rs.getString("publisher")+"</td>");//출판사
out.println("</tr>");
} 
out.println("</tbody>");
out.println("</table>");
%>
</body>
</html>