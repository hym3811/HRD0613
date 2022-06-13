<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../DBConn.jsp"%>
<%
	String dmno=request.getParameter("dmno");
	try{
		sql="delete from dm0613 where dmno=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, dmno);
		pstmt.executeUpdate();
%>
<script>
alert("DM발송번호:<%=dmno%>\n삭제 완료");
location.href="select_DM.jsp";
</script>
<%
	}catch(Exception e){
		e.printStackTrace();
	}
%>