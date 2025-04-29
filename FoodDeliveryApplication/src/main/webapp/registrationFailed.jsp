<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration-Failed</title>
<style type="text/css">

body {
	font-family: 'Arial', sans-serif;
	background-color: #f4f4f9;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	margin: 0;
}

#main-container {
	background: #fff;
	border-radius: 12px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
	padding: 25px;
	width: 550px;
	text-align: center;
}

h2 {
	color: #27ae60;
}

.error {
	color: #e74c3c;
}

#goBack {
	display: inline-block;
	margin-top: 15px;
	color: #e74c3c;
	font-weight: bold;
	text-decoration: none;
	transition: 0.3s ease-in-out;
	border: 1px #e74c3c;
}

#goBack:hover {
	text-decoration: underline;
}

</style>
</head>

<body>

<div id="main-container">
    <h2 class="error">Failed in  registering details into data base</h2>
    <h3>With the given username/gmail already a user was registered</h3>
    <a id="goBack" href="registerPage.html">Go Back</a>
</div>

</body>
</html>