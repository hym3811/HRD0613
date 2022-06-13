<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>고객 정보 등록 화면</title>
</head>
<body>
<%@ include file="../Main/header.jsp" %>
<%@ include file="../Main/nav.jsp" %>
<section>
<form name=form>
	<br>
	<h3 id="title">고객 정보 등록 화면</h3>
	<hr>
	<table border=1 id="tab">
	<%
		String custid=null;
		if(request.getParameter("custid")!=null&&request.getParameter("custid")!=""){
			custid=request.getParameter("custid");
		}
		if(request.getParameter("custid")!=null&&request.getParameter("custid")!=""){
			try{
				sql="select * from customer0613 where custid=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, custid);
				rs=pstmt.executeQuery();
				if(rs.next()){
	%>
	<script>
	alert("고객 아이디: <%=custid%>\n중복되는 아이디입니다.");
	</script>
	<%
					custid="";
				}else{
					custid=request.getParameter("custid");
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	%>
		<tr>
			<th>고객 아이디</th>
			<td><input type=text name=custid style="width:100%;" value="<%=custid==null||custid=="" ? "" : custid %>" onchange=search()></td>
		</tr>
		<tr>
			<th>고객 성명</th>
			<td><input type=text name=author style="width:100%;"></td>
		</tr>
		<tr>
			<th>관심 상품</th>
			<td>
			<label style="margin-left:2%;"><input type=checkbox name=goods value="의류">의류</label>
			<label><input type=checkbox name=goods value="식료품">식료품</label>
			<label><input type=checkbox name=goods value="컴퓨터">컴퓨터</label>
			<label><input type=checkbox name=goods value="공산품">공산품</label>
			<label><input type=checkbox name=goods value="관광">관광</label>
			<label><input type=checkbox name=goods value="전자제품">전자제품</label>
			<label><input type=checkbox name=goods value="건강제품">건강제품</label>
			<label><input type=checkbox name=goods value="운동기구">운동기구</label>
			</td>
		</tr>
		<tr>
			<th>연락처</th>
			<td><input type=number name=phone1>-<input type=number name=phone2>-<input type=number name=phone3></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input type=text name=email style="width:64.5%;">@<input type=text name=domain></td>
		</tr>
		<tr>
			<th>거주지</th>
			<td><select name=areacode>
				<option value="">거주지 선택</option>
				<%
					Integer areacode=null;
					String areaname=null;
					try{
						sql="select * from area0613";
						pstmt=conn.prepareStatement(sql);
						rs=pstmt.executeQuery();
						while(rs.next()){
							areacode=rs.getInt(1);
							areaname=rs.getString(2);
				%>
				<option value="<%=areacode %>">[<%=areacode %>] <%=areaname %></option>
				<%
						}
					}catch(Exception e){
						e.printStackTrace();
					}
				%>
			</select></td>
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
</body>
<script>
function add(){
	var doc=document.form;
	var rdo=document.getElementsByName("goods");
	var ctn=0;
	for(var i=0;i<rdo.length;i++){
		if(rdo[i].checked==true){
			ctn++;
			break;
		}
	}
	
	if(doc.custid.value==""){
		alert("[고객 아이디]\n고객 아이디를 입력하세요.");
		doc.custid.focus();
	}else if(doc.author.value==""){
		alert("[고객 성명]\n고객 성명을 입력하세요.");
		doc.author.focus();
	}else if(ctn==0){
		alert("[관심 상품]\n관심 상품을 1개 이상 선택해주세요.");
	}else if(doc.phone1.value==""){
		alert("[연락처]\n연락처를 입력해주세요.");
		doc.phone1.focus();
	}else if(doc.phone1.value.length!=3){
		alert("[연락처]\n숫자 3자리 입력해주세요.");
		doc.phone1.focus();
	}else if(doc.phone2.value==""){
		alert("[연락처]\n연락처를 입력해주세요.");
		doc.phone2.focus();
	}else if(doc.phone2.value.length!=4){
		alert("[연락처]\n숫자 4자리 입력해주세요.");
		doc.phone2.focus();
	}else if(doc.phone3.value==""){
		alert("[연락처]\n연락처를 입력해주세요.");
		doc.phone3.focus();
	}else if(doc.phone3.value.length!=4){
		alert("[연락처]\n숫자 4자리 입력해주세요.");
		doc.phone3.focus();
	}else if(doc.email.value==""){
		alert("[이메일]이메일을 입력해주세요.");
		doc.email.focus();
	}else if(doc.domain.value==""){
		alert("[이메일]\n도메인을 입력해주세요.");
		doc.domain.focus();
	}else if(doc.areacode.value==""){
		alert("[거주지]\n거주지를 선택해주세요.");
		doc.areacode.focus();
	}else{
		doc.action="add_Customer_Process.jsp";
		doc.submit();
	}
}
function search(){
	document.form.action="add_Customer.jsp";
	document.form.submit();
}
</script>
</html>