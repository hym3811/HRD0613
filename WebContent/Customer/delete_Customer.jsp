<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../DBConn.jsp" %>
<%
	String custid=request.getParameter("custid");
	try{
		sql="delete from customer0613 where custid=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, custid);
		pstmt.executeUpdate();
%>
<script>
alert("고객아이디:<%=custid%>\n삭제 완료");
location.href="select_Customer.jsp";
</script>
<%
	}catch(Exception e){
		e.printStackTrace();
	}
%>