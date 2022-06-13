<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../DBConn.jsp" %>
<%
	String custid=request.getParameter("custid");
	String author=request.getParameter("author");
	String[] g=request.getParameterValues("goods");
	String goods=null;
	for(int i=0;i<g.length;i++){
		if(i==0){
			goods=g[0];
		}else{
			goods=goods+","+g[i];
		}
	}
	String phone1=request.getParameter("phone1");
	String phone2=request.getParameter("phone2");
	String phone3=request.getParameter("phone3");
	String phone=phone1+"-"+phone2+"-"+phone3;
	String em=request.getParameter("email");
	String domain=request.getParameter("domain");
	String email=em+"@"+domain;
	String areacode=request.getParameter("areacode");
	
	try{
		sql="insert into customer0613 values(?,?,?,?,?,?)";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, custid);
		pstmt.setString(2, author);
		pstmt.setString(3, goods);
		pstmt.setString(4, phone);
		pstmt.setString(5, email);
		pstmt.setString(6, areacode);
		pstmt.executeUpdate();
%>
<script>
alert("고객정보 등록 완료");
location.href="add_Customer.jsp";
</script>
<%
	}catch(Exception e){
		e.printStackTrace();
	}
%>