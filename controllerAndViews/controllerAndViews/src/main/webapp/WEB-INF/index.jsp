<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>    
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Login</title>
<style>
    .container {
        margin: 200px;
        display: flex;
        justify-content: space-around;
        width: 1000px;
    }
    .btn {
        margin-top: 20px;
    }
</style>
</head>
<body>
    <div class="container">
        <div class="left">
            <h1>Register</h1>
            <form:form action="/register" method="post" modelAttribute="newUser">
                <div class="form-group">
                    <label>User Name:</label>
                    <form:input path="userName" class="form-control" />
                    <form:errors path="userName" class="text-danger" />
                </div>
                <div class="form-group">
                    <label>Email:</label>
                    <form:input path="email" class="form-control" />
                    <form:errors path="email" class="text-danger" />
                </div>
                <div class="form-group">
                    <label>Password:</label>
                    <form:password path="password" class="form-control" />
                    <form:errors path="password" class="text-danger" />
                </div>
                <div class="form-group">
                    <label>Confirm Password:</label>
                    <form:password path="confirm" class="form-control" />
                    <form:errors path="confirm" class="text-danger" />
                </div>
                <input type="submit" value="Register" class="btn btn-primary" />
            </form:form>
        </div>
        <div class="right">
            <h1>Login</h1>
            <form:form action="/login" method="post" modelAttribute="newLogin">
                <div class="form-group">
                    <label>Email:</label>
                    <form:input path="email" class="form-control" />
                    <form:errors path="email" class="text-danger" />
                </div>
                <div class="form-group">
                    <label>Password:</label>
                    <form:password path="password" class="form-control" />
                    <form:errors path="password" class="text-danger" />
                </div>
                <input type="submit" value="Login" class="btn btn-success" />
            </form:form>
        </div>
    </div>
</body>
</html>