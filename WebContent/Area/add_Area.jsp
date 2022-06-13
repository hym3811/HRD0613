<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>거주지 등록 화면</title>
</head>
<body>
<%@ include file="../Main/header.jsp" %>
<%@ include file="../Main/nav.jsp" %>
<section>
<form name=form>
	<br>
	<h3 id="title">거주지 정보 등록 화면</h3>
	<br>
	<hr>
	<table border=1 id="tab" style="width:40%;">
	<%
		String areacode=null;
		String areaname=null;
		if(request.getParameter("areacode")!=null&&request.getParameter("areacode")!=""){
			areacode=request.getParameter("areacode");
		}
		if(request.getParameter("areacode")!=null&&request.getParameter("areacode")!=""){
			try{
				sql="select areacode,areaname from area0613 where areacode=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, areacode);
				rs=pstmt.executeQuery();
				if(rs.next()){
					areaname=rs.getString(2);
	%>
	<script>
	alert("거주지코드: <%=areacode%>\n거주지 이름: <%=areaname%>\n중복되는 거주지 코드입니다.");
	</script>
	<%
					areacode="";
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	%>
		<tr>
			<th>거주지 코드</th>
			<td><input type=text name=areacode style="width:100%;" value="<%=areacode==null||areacode=="" ? "" : areacode %>" onchange=search()></td>
		</tr>
		<tr>
			<th>거주지 이름</th>
			<td><input type=text name=areaname style="width:100%;"></td>
		</tr>
		<tr>
			<td colspan=2 id="btntr">
				<input type=button value="등록" onclick=add() id="btn">
				<input type=button value="취소" onclick=reset() id="btn">
			</td>
		</tr>
	</table>
</form>
</section>
<%@ include file="../Main/footer.jsp" %>
<script>
function add(){
	var doc=document.form;
	if(doc.areacode.value==""){
		alert("[거주지 코드]\n거주지 코드를 입력하세요.");
		doc.areacode.focus();
	}else if(doc.areacode.value.length!=3){
		alert("[거주지 코드]\n거주지 코드는 숫자3자리로 입력하세요.");
		doc.areacode.focus();
	}else if(doc.areaname.value==""){
		alert("[거주지 이름]\n거주지 이름을 입력하세요.");
		doc.areaname.focus();
	}else{
		doc.action="add_Area_Process.jsp";
		doc.submit();
	}
}
</script>
</body>
<script>
function search(){
	document.form.action="add_Area.jsp";
	document.form.submit();
}
</script>
</html>