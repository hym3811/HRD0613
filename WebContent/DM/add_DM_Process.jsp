<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../DBConn.jsp" %>
<%
	String dmno=request.getParameter("dmno");
	String custid=request.getParameter("custid");
	String maildate=request.getParameter("maildate");
	String contents=request.getParameter("contents");
	String dept=request.getParameter("dept");
	String grade=request.getParameter("grade");
	String campain=request.getParameter("campain");
	try{
		sql="insert into dm0613 values(?,?,?,?,?,?,?)";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, dmno);
		pstmt.setString(2, custid);
		pstmt.setString(3, maildate);
		pstmt.setString(4, contents);
		pstmt.setString(5, dept);
		pstmt.setString(6, grade);
		pstmt.setString(7, campain);
		pstmt.executeUpdate();
%>
<script>
alert("DM정보 등록 완료");
location.href="add_DM.jsp";
</script>
<%
	}catch(Exception e){
		e.printStackTrace();
	}
%>