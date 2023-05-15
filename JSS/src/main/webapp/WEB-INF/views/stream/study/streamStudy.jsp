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
<div id="stream_01_input_area">
	<h2>Stream 01</h2>
	<input type="text" name="stream_01_input">
	<input type="text" name="stream_01_input">
	<input type="text" name="stream_01_input">
	<input type="text" name="stream_01_input">
	<button id="stream_01">스트림_01</button>
	<div id="stream_01_content"></div>
</div>

<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
<script type="text/javascript">
	window.onload = ()=>{
		//alert('hello stream!');
		$.ajax({
			url: "/myapp/stream/study",
			type: "POST",
			success(result){
				console.log(result);
			}
		})
	}
	
	let btn1 = document.querySelector('#stream_01');
	let con1 = document.querySelector('#stream_01_content');
	btn1.addEventListener('click',()=>{
		let streamInput01 = document.querySelectorAll('input[name="stream_01_input"]');
		let data = [];
		//console.log(streamInput01);
		streamInput01.forEach(item => {
			if(item.value != '')data.push(item.value);
		})
		console.log(data);
		//alert('click!');
		$.ajax({
			url: "/myapp/stream/example",
			type: "POST",
			contentType: "application/json",
			data: JSON.stringify(data),
			success(result){
				con1.innerText = result;
			}
		})
	})
</script>
</body>
</html>
