<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<html>
<head>
	<title>Home</title>
	
</head>
<body>
<h1>
	Hello Stream!!  
</h1>

<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
<script type="text/javascript">
	window.onload = ()=>{
		alert('hello stream!');
		$.ajax({
			url: "/myapp/stream/study",
			type: "POST",
			success(result){
				console.log(result);
			}
		})
	}
</script>
</body>
</html>
