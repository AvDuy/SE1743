<%-- 
    Document   : thankForShopping
    Created on : Jul 14, 2023, 3:25:16 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Home | E-Shopper</title>
    
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/prettyPhoto.css" rel="stylesheet">
    <link href="css/price-range.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
	<link href="css/main.css" rel="stylesheet">
	<link href="css/responsive.css" rel="stylesheet">
        
    <!--MY CSS ><![endif]-->
    <link href="css/loginLogo.css" rel="stylesheet">
    <link href="css/pagination.css" rel="stylesheet">
    
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->       
    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
</head><!--/head-->

<body>
    <jsp:include page="header.jsp"></jsp:include>

    <div class="container" style="margin-bottom: 5%;">
        <c:choose>
            <c:when test="${empty addressList}">
                <h2 class="title text-center">Tài khoản này chưa có địa chỉ giao hàng nào cả</h2>
                <div style="display: flex;justify-content: center;">
                    <img src="https://upload.wikimedia.org/wikipedia/commons/4/4c/Found_nothing.png" style="width: 30%;">
                </div>
            </c:when>
            <c:otherwise>
                <c:forEach items="${addressList}" var="address" varStatus="loop">
                    <h2 class="title text-center">Địa chỉ (${loop.index + 1}) của gmail</h2>
                    <h4 style="align-self: center;">Email: ${address.email}</h4>
                    <h4 style="align-self: center;">Họ tên: ${address.lastName} ${address.firstName}</h4>
                    <h4 style="align-self: center;">Địa chỉ chính: ${address.mainAddress}</h4>
                    <h4 style="align-self: center;">Địa chỉ 2: ${address.getAddress2()}</h4>
                    <h4 style="align-self: center;">Số điện thoại: ${address.phone}</h4>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>

  
    <script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.scrollUp.min.js"></script>
	<script src="js/price-range.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
    
    
    
    <!-- MY JS -->
    <script src="js/sliderJS.js"></script>
    
</body>
</html>