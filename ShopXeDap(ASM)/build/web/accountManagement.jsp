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

    <div class="container">
        <div class="table-responsive cart_info">
            <div class="row" style="background-color: #FE980F;border: 1px;border-style: solid;display: flex; color: #fff; border-color: #000">
                <div class="col-sm-4" style="border-right: 1px solid;display: flex;justify-content: center;align-items: center;border-color: #000;">
                    <h5>Email</h5>
                </div>
                <div class="col-sm-3" style="border-right: 1px solid;display: flex;justify-content: center;align-items: center;border-color: #000;">
                    <h5>Tên tài khoản</h5>
                </div>
                <div class="col-sm-2" style="border-right: 1px solid;display: flex;justify-content: center;align-items: center;border-color: #000">
                    <h5>Là người bán hàng</h5>
                </div>
                <div class="col-sm-2" style="border-right: 1px solid;display: flex;justify-content: center;align-items: center;border-color: #000">
                    <h5>Là Quản lý</h5>
                </div>
                <div class="col-sm-1" style="display: flex;justify-content: center;align-items: center;border-color: #000">
                    <h5>Cập nhật</h5>
                </div>
            </div>
            <c:forEach items="${ListAccount}" var="a">
                <form action="action">
                    <div class="row" style="height: 100px;border: 1px;border-style: solid;display: flex;">
                        <div class="col-sm-4" style="border-right: 1px solid; display: flex;">
                            <a href="orderdetail?billId=${o.id}" style="align-self: center;">
                            ${a.email}
                            </a>
                        </div>
                        <div class="col-sm-3" style="border-right: 1px solid;display: flex; justify-content: flex-end;">
                            <h5 style="align-self: center;">${a.user}</h5>
                        </div>

                        <div class="col-sm-2" style="border-right: 1px solid;display: flex; justify-content: center;">

                            <input type="checkbox" id="vehicle1" name="isSell" value="1" ${a.isSell == 1 ? 'checked' : ''}>
                            <label for="isSell" style="align-self: center;margin-left: 10%;"> Bán Hàng</label>
                        </div>
                        <div class="col-sm-2" style="border-right: 1px solid;display: flex; justify-content: center;">

                            <input type="checkbox" id="vehicle1" name="isAdmin" value="1" ${a.isAdmin == 1 ? 'checked' : ''}>
                            <label for="isAdmin" style="align-self: center;margin-left: 10%;"> Quản lý</label>
                        </div>
                        <div class="col-sm-1" style="display: flex;justify-content: center;align-items: center;">
                            <button class="submit-btn" type="submit">Cập nhật</button>
                        </div>
                    </div>
                </form>
            </c:forEach>
        </div>
        <c:forEach items="${ListAccount}" var="a">
            ${a.email}
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