<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>거주지 정보 목록</title>
</head>
<body>
<%@ include file="../Main/header.jsp" %>
<%@ include file="../Main/nav.jsp" %>
<section>
<form name=form>
	<br>
	<h3 id="title">거주지 정보 목록</h3>
	<br>
	<%
		Integer number=0;
		try{
			sql="select count(areacode) from area0613";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()){
				number=rs.getInt(1);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	%>
	<label style="margin-left:26%;">총 <%=number %>개의 거주지가 있습니다.</label>
	<hr>
	<table border=1 id="tab3" style="width:50%;">
		<tr>
			<th>No</th>
			<th>거주지 코드</th>
			<th>거주지 이름</th>
			<th style="width:20%;">구분</th>
		</tr>
	<%
		Integer no=0;
		String areacode=null;
		String areaname=null;
		try{
			sql="select * from area0613";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				no++;
				areacode=rs.getString(1);
				areaname=rs.getString(2);
	%>
		<tr>
			<td><%=no %></td>
			<td><%=areacode %></td>
			<td><%=areaname %></td>
			<td><a href="update_Area.jsp?areacode=<%=areacode%>">수정</a>/<a href="#" onclick=if(confirm("거주지코드:<%=areacode %>\n거주지명:<%=areaname %>\n삭제하시겠습니까?")){location.href="delete_Area.jsp?areacode=<%=areacode %>&areaname=<%=areaname %>"}>삭제</a></td>
		</tr>
	<%
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	%>
	</table>
	<table style="margin:0 auto;">
	<tr>
		<td>
			<input type=button id="btn" value="작성" onclick=add()>
		</td>
	</tr>
	</table>
</form>
</section>
<%@ include file="../Main/footer.jsp" %>
</body>
<script>
function add(){
	document.form.action="add_Area.jsp";
	document.form.submit();
}
</script>
</html>