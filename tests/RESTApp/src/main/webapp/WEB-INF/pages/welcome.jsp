<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<style>
@import
	url(http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400);

body {
	background-color: #f5f5f5;
	margin: 0px;
	height: 1000px;
}

aside {
	position: fixed;
	top: 0px;
	width: 100%;
}

#header {
	width: 100%;
	height: 200px;
	background: #66AAFF;
	position: relative;
	height: 0px;
	overflow: hidden;
	top: 0px;
	border-bottom: 1px solid rgba(0, 0, 0, 0.08);
	transition: all 0.4s ease;
	-moz-transition: all 0.4s ease;
	-webkit-transition: all 0.4s ease;
}

h1 {
	color: #fff;
	font-family: 'Source Sans Pro', helvetica, sans-serif;
	font-weight: 300;
	font-size: 3em;
	text-align: left;
	margin: 35px 0px 0px 30px;
}

p {
	font-family: 'Source Sans Pro', helvetica, arial, sans-serif;
	font-weight: 300;
	font-size: 1.5em;
	margin: 0px 30px;
	width: 60%;
	color: #fff;
	text-align: left;
}

#close, #open {
	transition: all 0.4s ease;
	-moz-transition: all 0.4s ease;
	-webkit-transition: all 0.4s ease;
	color: #66AAFF;
	font-family: verdana, tahoma, arial;
	font-size: 1em;
	cursor: pointer;
	border: 5px solid #66AAFF;
	width: 1em;
	text-align: center;
	padding: 10px;
	border-radius: 100%;
	margin: 20px 5px;
	font-weight: 900;
	line-height: 0.9em;
	float: left;
}

.flex-container {
	width: 60%;
	position: Absolute;
	margin-top: 10%;
	margin-left: 20%;
	display: -ms-flex;
	display: -moz-flex;
	display: -webkit-flex;
	display: flex;
	-ms-flex-direction: row;
	-ms-flex-wrap: wrap;
	-moz-flex-flow: row wrap;
	-webkit-flex-flow: row wrap;
	flex-flow: row wrap;
	-ms-flex-pack: start;
	-moz-justify-content: flex-start;
	-webkit-justify-content: flex-start;
	justify-content: flex-start;
	transition: all 0.4s ease;
	-moz-transition: all 0.4s ease;
	-webkit-transition: all 0.4s ease;
}

.flex-item {
	-ms-flex: 1 0 auto;
	-moz-flex: 1 0 auto;
	-webkit-flex: 1 0 auto;
	flex: 1 0 auto;
	font-family: 'Source Sans Pro', Helvetica Neue, Helvetica, Arial,
		Sans-serif;
	font-weight: 300;
	transition: all 0.4s ease;
	-moz-transition: all 0.4s ease;
	-webkit-transition: all 0.4s ease;
	color: #fff;
	padding: 10px 30px;
	margin: 5px;
	border: 2px solid transparent;
}

.flex-item:Hover {
	border: 2px solid rgba(0, 0, 0, 0.3);
	cursor: pointer;
}

.blue {
	background-color: #0080FF;
}

.blue2 {
	background-color: cadetblue;
}

.blue3 {
	background-color: hsl(176, 59%, 59%)
}

.red {
	background-color: firebrick;
}

.orange {
	background-color: coral;
}

.orange2 {
	background-color: hsl(50, 75%, 55%);
}

.orange3 {
	background-color: peru;
}

.pink {
	background-color: salmon;
}

.yellow {
	background-color: hsl(50, 81%, 65%);
}

.yellow2 {
	background-color: hsl(30, 65%, 60%);
}

.green {
	background-color: hsl(155, 35%, 60%);
}

.green2 {
	background: hsl(104, 51%, 62%)
}
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>RESTApp welcome</title>
</head>
<body>
	<form:form method="POST" modelAttribute="user" commandName="user">
		<aside>
			<header id="header">
				<h1>Welcome to Bibliotek</h1>
				<p>This is just a collection of stories, some of which are
					written by me, others are just curated for prosperity. The standard
					of writing varies so, don't be expecting any Hemingway! Most of
					them were written with humour in mind, so try not to take any of it
					too seriously? If you use any for filler text, try to credit where
					you found it.</p>
			</header>

			<div id="open"
				onclick='header.style.height="300px"; section.style.marginTop="340px"'>∨</div>
			<div id="close"
				onclick='header.style.height="0px"; section.style.marginTop="10%"'>∧</div>
		</aside>

		<section class="flex-container" id="section">
			<c:forEach items="${allUsers }" var="allUsers">
				<a href="welcome/${allUsers.username}" style="text-decoration:none;"><div class="flex-item green">${allUsers.username}</div></a>
			</c:forEach>
			<form:input path="username" placeholder="Enter Username" />
			<c:out value="${error}"></c:out>
		</section>
	</form:form>
</body>
</html>