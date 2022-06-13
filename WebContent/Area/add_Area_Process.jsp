<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../DBConn.jsp"%>
<%
	String areacode=request.getParameter("areacode");
	String areaname=request.getParameter("areaname");
	try{
		sql="insert into area0613 values(?,?)";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, areacode);
		pstmt.setString(2, areaname);
		pstmt.executeUpdate();
%>
<script>
alert("거주지코드: <%=areacode%>\n거주지명: <%=areaname%>\n거주지 정보 등록 완료");
location.href="add_Area.jsp";
</script>
<%
	}catch(Exception e){
		e.printStackTrace();
	}
%>