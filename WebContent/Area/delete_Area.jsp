<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../DBConn.jsp" %>
<%
	String areacode=request.getParameter("areacode");
	String areaname=request.getParameter("areaname");
	try{
		sql="delete from area0613 where areacode=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, areacode);
		pstmt.executeUpdate();
%>
<script>
alert("거주지 코드:<%=areacode%>\n거주지명: <%=areaname%>\n삭제 완료");
location.href="select_Area.jsp";
</script>
<%
	}catch(Exception e){
		e.printStackTrace();
	}
%>