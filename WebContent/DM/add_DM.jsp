<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DM 등록 화면</title>
</head>
<body>
<%@ include file="../Main/header.jsp" %>
<%@ include file="../Main/nav.jsp" %>
<section>
<form name=form>
	<br>
	<h3 id=title>DM 정보 등록</h3>
	<br>
	<hr>
	<table border=1 id="tab">
	<%
		Integer dmno=null;
		java.util.Date today=null;
		String custid=request.getParameter("custid");
		try{
			sql="select max(dmno) from dm0613";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()){
				dmno=rs.getInt(1)+1;
			}
			pstmt.close();
			sql="select sysdate from dual";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()){
				today=rs.getDate(1);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	%>
		<tr>
			<th>DM 발송번호</th>
			<td colspan=3><input type=number name=dmno value="<%=dmno%>" readonly  style="width:100%;"></td>
		</tr>
	<%
		String author=null;
		if(custid!=null&&custid!=""){
			try{
				sql="select author from customer0613 where custid=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, custid);
				rs=pstmt.executeQuery();
				if(rs.next()){
					author=rs.getString(1);
				}else{
					custid="";
	%>
	<script>
	alert("등록되지 않은 고객아이디입니다.");
	</script>
	<%
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	%>
		<tr>
			<th>고객아이디</th>
			<td><input type=text name=custid onchange=search() value="<%=custid==""||custid==null ? "" : custid%>"></td>
			<th>고객명</th>
			<td><input type=text name=author value="<%=author==null||author=="" ? "" : author %>" readonly></td>
		</tr>
		<tr>
			<th>발송일자</th>
			<td><input type=text name=maildate value="<%=today%>" readonly></td>
			<th>DM내용</th>
			<td><input type=text name=contents></td>
		</tr>
		<tr>
			<th>발송부서</th>
			<td><input type=number name=dept></td>
			<th>고객등급</th>
			<td>
			<select name=grade style="width:100%;">
				<option value="">고객 등급 선택</option>
	<%
		String grade=null;
		try{
			sql="select * from grade0613 order by grade";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				grade=rs.getString(1);
	%>
				<option value="<%=grade%>"><%=grade %></option>
	<%
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	%>
			</select>
			</td>
		</tr>
		<tr>
			<th>캠페인구분</th>
			<td colspan=3><input type=text name=campain style="width:100%;"></td>
		</tr>
		<tr>
			<td colspan=4 id="btntr">
				<input type=button value="등록" onclick=add() id="btn">
				<input type=button value="취소" onclick=reset() id="btn">
			</td>
		</tr>
	</table>
</form>
</section>
<%@ include file="../Main/footer.jsp" %>
</body>
<script>
function search(){
	document.form.action="add_DM.jsp";
	document.form.submit();
}
function add(){
	var doc=document.form;
	if(doc.custid.value==""){
		alert("[고객 아이디]\n고객 아이디를 입력하세요.");
		doc.custid.focus();
	}else if(doc.contents.value==""){
		alert("[DM 내용]\nDM 내용을 입력하세요.");
		doc.contents.focus();
	}else if(doc.dept.value==""){
		alert("[발송부서]\n발송부서를 입력하세요.");
		doc.dept.focus();
	}else if(doc.grade.value==""){
		alert("[고객등급]\n고객등급을 입력하세요.");
		doc.grade.focus();
	}else if(doc.campain.value==""){
		alert("[캠페인]\n캠페인을 입력하세요.");
		doc.campain.focus();
	}else{
		doc.action="add_DM_Process.jsp";
		doc.submit();
	}
}
</script>
</html>