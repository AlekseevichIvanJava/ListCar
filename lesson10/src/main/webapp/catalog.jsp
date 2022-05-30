<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	function getModels(id) {
		var str = "id="+id;
		$.ajax({
			type: "GET",
			url: "Catalog",
			data: str,
			success: function(answer){
				$("#info").empty();
				$("#models").empty();
				$("#models").append(answer);
			}
		});
	}
	

	function f(){
		$.ajax({
			type: "GET",
			url: "Catalog",
			success: function(answer){
				
				$("#marki").append(answer);
			}
		});

	}
	
	function getInfo(id) {
		var str = "id="+id+"&info=1";
		$.ajax({
			type: "GET",
			url: "Catalog",
			data: str,
			success: function(answer){
				$("#info").empty();
				$("#info").append(answer);
			}
		});
	}
</script>

</head>
<body onload="f()">
	<h2>Выбирите марку и модель автомобиля</h2>
	<select id="marki" onchange="getModels(value)">
		
	</select>
	<select id="models" onchange="getInfo(value)">
		
	</select>
	
	<div id="info">
	
	</div>
	
		
</body>
</html>