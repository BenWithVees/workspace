<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<style>
body, html {
	height: 100%;
	width: 100%;
	margin: 0;
	padding: 0;
	background-image: linear-gradient(180deg, #37375A 70%, #31315A);
	text-align: center;
	font-family: 'Segoe UI';
}

form {
	width: 40%;
	margin-left: 30%;
	padding-top: 10%;
}

input {
	width: 100%;
	background: transparent;
	border-bottom: solid 1px #7053c4;
	border-top: none;
	border-left: none;
	border-right: none;
	font-size: 1.3em;
	padding: 0.5em 0.4em;
	transition: all 0.4s;
	color: #BDBDBD;
}

input:focus {
	background: #7035c4;
	transform: scale3d(1.06, 1.06, 1.06);
}

button {
	background: transparent;
	width: 50%;
	margin-top: 2em;
	font-size: 1.3em;
	border: solid 1px #7053c4;
	padding: 1em 0;
	color: #bdc3c7;
	transition: all 0.6s;
}

button:hover {
	cursor: pointer;
	background: #7035c4;
}

h1 {
	color: #bdc3c7;
	border-bottom: solid 1px #7035c4;
	padding: 0 0 0.8em 0;
	width: 50%;
	margin-left: 25%;
	margin-bottom: 1em;
}

@media ( max-width : 550px) {
	form {
		width: 90%;
		margin-left: 3%;
		padding-top: 5%;
	}
	input {
		font-size: 1em;
	}
}
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form:form modelAttribute="user" commandName="user" method="POST">
		<h1>Add User</h1>
		<form:input placeholder="Username" path="username"></form:input>
		<form:input placeholder="Password" path="password"></form:input>
		<form:input placeholder="Email" path="email"></form:input>
		<form:input placeholder="First name" path="firstName"></form:input>
		<form:input placeholder="Last name" path="lastName"></form:input>
		<button type="submit">Add</button>
	</form:form>
</body>
</html>
