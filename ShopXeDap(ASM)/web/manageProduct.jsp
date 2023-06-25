<%-- 
    Document   : index
    Created on : Jun 18, 2023, 1:51:16 AM
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
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="css/prettyPhoto.css" rel="stylesheet">
    <link href="css/price-range.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
	<link href="css/main.css" rel="stylesheet">
	<link href="css/responsive.css" rel="stylesheet">
        
    <!--MY CSS ><![endif]-->
    <link href="css/loginLogo.css" rel="stylesheet">

    
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

    <h2 class="title text-center">Quản lý sản phẩm trong cửa hàng</h2>
    <div class="container" style="padding-bottom: 3%;">
        <div class="row" style="background-color: #efbb98;border: 1px;border-style: solid;display: flex;">
            <div class="col-sm-1" style="border-right: 1px solid;display: flex;justify-content: center;align-items: center;">
                <h4>ID</h4>
            </div>
            <div class="col-sm-3" style="border-right: 1px solid;display: flex;justify-content: center;align-items: center;">
                <h4>Hình ảnh</h4>
            </div>
            <div class="col-sm-3" style="border-right: 1px solid;display: flex;justify-content: center;align-items: center;">
                <h4>Tên sản phẩm</h4>
            </div>
            <div class="col-sm-3" style="border-right: 1px solid;display: flex;justify-content: center;align-items: center;">
                <h4>Giá tiền</h4>
            </div>
            <div class="col-sm-2" style="display: flex;justify-content: center;align-items: center;">
                <h4>Thao tác</h4>
            </div>
        </div>
        <c:forEach items="${listProduct}" var="o">
            <div class="row" style="border: 1px;border-style: solid;display: flex;">
                <div class="col-sm-1" style="border-right: 1px solid; display: flex; justify-content: center;">
                    <h2 style="align-self: center">${o.id}</h2>
                </div>
                <div class="col-sm-3" style="border-right: 1px solid">
                    <img src="${o.image}" class="img-fluid" style="object-fit: contain; height: 150px;width: 100%;padding: 5px" alt="" />
                </div>
                <div class="col-sm-3" style="border-right: 1px solid; display: flex">
                    <p style="align-self: center">${o.name}</p>
                </div>
                <div class="col-sm-3" style="border-right: 1px solid;  display: flex; justify-content: flex-end">
                    <h2 style="align-self: center;">${o.getPrice()}₫</h2>
                </div>
                <div class="col-sm-2" style="display: flex; justify-content: center;">
                    <div class="choose" style="display: flex;flex-direction: column;justify-content: center;">
                        <div style="display: flex;align-items: center;height: 50%;">
                            <a href="#" style="display: flex;"><i class="fa fa-edit"></i>
                                <div style="padding-left: 8px;">  Chỉnh sửa</div>
                            </a>
                        </div>
                        <div style="display: flex;align-items: center;height: 50%;">
                            <a href="#" style="display: flex;"><i class="fa fa-trash"></i>
                                <div style="padding-left: 8px;">  Xoá</div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
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