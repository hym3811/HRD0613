<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>고객 정보 조회 화면</title>
</head>
<body>
<%@ include file="../Main/header.jsp" %>
<%@ include file="../Main/nav.jsp" %> 
<section>
<form name=form>
	<br>
	<h3 id="title">고객 정보 목록</h3> 
	<br>
	<%
		Integer number=0;
		try{
			sql="select count(custid) from customer0613";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()){
				number=rs.getInt(1);
			}
		}catch(Exception e){  
			e.printStackTrace();
		}
	%>
	<label style="margin-left:16%;">총 <%=number %>명의 고객정보가 있습니다.</label>
	<hr>
	<table border=1 id="tab2" style="width:70%;">
		<tr>
			<th>No</th>
			<th>고객아이디</th>
			<th>고객성명</th>
			<th>관심상품</th>
			<th>연락처</th>
			<th>이메일</th>
			<th>거주지코드</th>
			<th>거주지</th>
			<th style="width:7%;">구분</th>
		</tr>
		<%
			Integer no=0;
			String custid=null;
			String author=null;
			String goods=null;
			String phone=null;
			String email=null;
			String areacode=null;
			String areaname=null;
			try{
				sql="select custid,author,goods,phone,email,a.areacode,b.areaname from customer0613 a join area0613 b on a.areacode=b.areacode";
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				while(rs.next()){
					no++;
					custid=rs.getString(1);
					author=rs.getString(2);
					goods=rs.getString(3);
					phone=rs.getString(4);
					email=rs.getString(5);
					areacode=rs.getString(6);
					areaname=rs.getString(7);
		%>
		<tr>
			<td><%=no %></td>
			<td><a href="update_Customer.jsp?custid=<%=custid%>"><%=custid %></a></td>
			<td><%=author %></td>
			<td><%=goods %></td>
			<td><%=phone %></td>
			<td><%=email %></td>
			<td><%=areacode %></td>
			<td><%=areaname %></td>
			<td><a href=# onclick=if(confirm("고객아이디:<%=custid %>\n삭제하시겠습니까?")){location.href="delete_Customer.jsp?custid=<%=custid %>"}>삭제</a></td>
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