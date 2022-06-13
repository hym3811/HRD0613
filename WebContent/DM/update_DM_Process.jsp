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
		sql="update dm0613 set custid=?,maildate=?,contents=?,dept=?,grade=?,campain=? where dmno=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, custid);
		pstmt.setString(2, maildate);
		pstmt.setString(3, contents);
		pstmt.setString(4, dept);
		pstmt.setString(5, grade);
		pstmt.setString(6, campain);
		pstmt.setString(7, dmno);
		pstmt.executeUpdate();
%>
<script>
alert("DM정보 수정 완료");
location.href="select_DM.jsp";
</script>
<%
	}catch(Exception e){
		e.printStackTrace();
	}
%>