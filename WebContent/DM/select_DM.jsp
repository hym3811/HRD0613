<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DM 발송 내역</title>
</head>
<body>
<%@ include file="../Main/header.jsp" %>
<%@ include file="../Main/nav.jsp" %>
<section>
<form name=form>
	<br>
	<h3 id="title">DM 발송 내역</h3>
	<br>
	<%
		Integer number=0;
		try{
			sql="select count(dmno) from dm0613";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()){
				number=rs.getInt(1);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	%>
	<label style="margin-left:20%;">총 <%=number %>건의 발송내역이 있습니다.</label>
	<hr>
	<table border=1 id="tab2" style="width:75%;">
		<tr>
			<th>No</th>
			<th style="width:20%;">DM발송번호</th>
			<th>고객아이디</th>
			<th>고객명</th>
			<th>발송일자</th>
			<th>DM내용</th>
			<th>발송부서</th>
			<th>고객등급</th>
			<th>캠페인구분</th>
			<th style="width:10%;">구분</th>
		</tr>
	<%
		Integer no=0;
		String dmno=null;
		String custid=null;
		String author=null;
		java.util.Date maildate=null;
		String contents=null;
		String dept=null;
		String grade=null;
		String campain=null;
		try{
			sql="select dmno,a.custid,b.author,maildate,contents,dept,grade,campain from dm0613 a join customer0613 b on a.custid=b.custid";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				no++;
				dmno=rs.getString(1);
				custid=rs.getString(2);
				author=rs.getString(3);
				maildate=rs.getDate(4);
				contents=rs.getString(5);
				dept=rs.getString(6);
				grade=rs.getString(7);
				campain=rs.getString(8);
	%>
		<tr>
			<td><%=no %></td>
			<td><a href="update_DM.jsp?dmno=<%=dmno %>"><pre style="font-size:1.2em;">     <%=dmno %>     </pre></a></td>
			<td><%=custid %></td>
			<td><%=author %></td>
			<td><%=maildate %></td>
			<td><%=contents %></td>
			<td><%=dept %></td>
			<td><%=grade %></td>
			<td><%=campain %></td>
			<td><a href=# onclick=if(confirm("DM발송번호:<%=dmno %>\n삭제하시겠습니까?")){location.href="delete_DM.jsp?dmno=<%=dmno %>"}>삭제</a></td>
		</tr>
	<%
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	%>
	</table>
</form>
</section>
<%@ include file="../Main/footer.jsp" %>
</body>
</html>