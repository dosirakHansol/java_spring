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
	<div>넣은 텍스트를 , 로 조인하여 하나의 String으로 리턴</div>
	<div id="stream_01_content"></div>
</div>

<div id="stream_02_input_area">
	<h2>Stream 02</h2>
	<input type="number" name="stream_02_input">
	<input type="number" name="stream_02_input">
	<input type="number" name="stream_02_input">
	<input type="number" name="stream_02_input">
	<button id="stream_02">스트림_02</button>
	<div>넣은 값들 중 짝수만 2배 하여 합을 리턴</div>
	<div id="stream_02_content"></div>
</div>

<div id="stream_03_input_area">
	<h2>Stream 03</h2>
	<input type="text" name="stream_03_input">
	<input type="text" name="stream_03_input">
	<input type="text" name="stream_03_input">
	<input type="text" name="stream_03_input">
	<button id="stream_03">스트림_03</button>
	<div>과일을 입력받아 apple이있으면 1, banana가 있으면 2, 아무것도 없으면 0 을 리턴(대소문자 무시)</div>
	<div id="stream_03_content"></div>
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
	
	//스트림 1영역
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
	
	//스트림 2영역
	let btn2 = document.querySelector('#stream_02');
	let con2 = document.querySelector('#stream_02_content');
	btn2.addEventListener('click',()=>{
		let streamInput02 = document.querySelectorAll('input[name="stream_02_input"]');
		let data = [];
		streamInput02.forEach(item => {
			if(item.value != '')data.push(item.value);
		})
		//console.log(data);
		$.ajax({
			url: "/myapp/stream/example2",
			type: "POST",
			contentType: "application/json",
			data: JSON.stringify(data),
			success(result){
				con2.innerText = result;
			}
		})
	})
	
	//스트림 3영역
	let btn3 = document.querySelector('#stream_03');
	let con3 = document.querySelector('#stream_03_content');
	btn3.addEventListener('click',()=>{
		let streamInput03 = document.querySelectorAll('input[name="stream_03_input"]');
		let data = [];
		streamInput03.forEach(item => {
			if(item.value != '')data.push(item.value);
		})
		//console.log(data);
		$.ajax({
			url: "/myapp/stream/example3",
			type: "POST",
			contentType: "application/json",
			data: JSON.stringify(data),
			success(result){
				con3.innerText = result;
			}
		})
	})
</script>
</body>
</html>
