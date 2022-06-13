<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../DBConn.jsp"%>
<%
	String areacode=request.getParameter("areacode");
	String areaname=request.getParameter("areaname");
	try{
		sql="update area0613 set areaname=? where areacode=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, areaname);
		pstmt.setString(2, areacode);
		pstmt.executeUpdate();
%>
<script>
alert("거주지 정보 수정 완료");
location.href="select_Area.jsp";
</script>
<%
	}catch(Exception e){
		e.printStackTrace();
	}
%>