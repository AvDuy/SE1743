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
    
    <c:if test="${sessionScope.acc.isSell != 1}">
        <script>
            window.location.href = "404.jsp";
        </script>
    </c:if>
    
</head><!--/head-->

<body>
    <jsp:include page="header.jsp"></jsp:include>
    
    
    <div class="container" style="display: flex;flex-direction: column;margin-bottom: 5%;">
        <div>
            <div class="dropdown">
                <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Dropdown Example
                <span class="caret"></span></button>
                <a href="#">Trạng thái đơn hàng<i class="fa fa-angle-down"></i></a>
                <ul class="dropdown-menu">
                    <li><a href="#">HTML</a></li>
                    <li><a href="#">CSS</a></li>
                    <li><a href="#">JavaScript</a></li>
                  </ul>
                <ul role="menu" class="sub-menu">
                    <c:if test="${sessionScope.acc.isSell == 1}">
                        <li><a href="managing">Sản phẩm</a></li>
                    </c:if>
                    <c:if test="${sessionScope.acc.isAdmin == 1}">
                        <li><a href="accountmanagement">Tài khoản</a></li>
                    </c:if>
                    <c:if test="${sessionScope.acc.isSell == 1}">
                        <li><a href="invoice">Đơn hàng</a></li>
                    </c:if>
                </ul>
            </div>
        <a href="invoice?status=0" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>
            <h2>
                CHƯA XỬ LÝ
            </h2>
        </a>
        <a href="invoice?status=1" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>
            <h2>
                ĐANG ĐƯỢC GIAO
            </h2>
        </a>
        <a href="invoice?status=2" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>
            <h2>
                GIAO THÀNH CÔNG
            </h2>
        </a>
        <a href="invoice?status=3" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>
            <h2>
                BỊ HUỶ BỎ HOẶC KHÔNG THÀNH CÔNG
            </h2>
        </a>
        <a href="invoice" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>
            <h2>
                TẤT CẢ ĐƠN HÀNG
            </h2>
        </a>
        </div>
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