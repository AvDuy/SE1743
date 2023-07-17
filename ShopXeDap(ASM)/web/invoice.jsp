<%-- 
    Document   : invoice
    Created on : Jul 12, 2023, 11:31:56 AM
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
    
    <div class="container" style="margin-bottom: 5%;">
        <c:choose>
            <c:when test="${OrderStatus == 0}">
                <h2 class="title text-center">ĐƠN HÀNG CHƯA CẬP NHẬP</h2>
            </c:when>
            <c:when test="${OrderStatus == 1}">
                <h2 class="title text-center">ĐƠN HÀNG ĐANG GIAO</h2>
            </c:when>
            <c:when test="${OrderStatus == 2}">
                <h2 class="title text-center">ĐƠN HÀNG ĐÃ GIAO THÀNH CÔNG</h2>
            </c:when>
            <c:when test="${OrderStatus == 3}">
                <h2 class="title text-center">ĐƠN HÀNG BỊ HUỶ HOẶC KHÔNG THÀNH CÔNG</h2>
            </c:when>
            <c:otherwise>
                <h2 class="title text-center">TẤT CẢ ĐƠN HÀNG</h2>
            </c:otherwise>
        </c:choose>
            <div class="dropdown">
                    <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown" style="margin-bottom: 2%;">Trạng thái đơn
                <span class="caret"></span></button>
                <ul class="dropdown-menu">
                    <c:if test="${sessionScope.acc.isSell == 1}">
                        <li><a href="invoice?status=0">Chưa xử lý</a></li>
                    </c:if>
                    <c:if test="${sessionScope.acc.isAdmin == 1}">
                        <li><a href="invoice?status=1">Đang giao</a></li>
                    </c:if>
                    <c:if test="${sessionScope.acc.isSell == 1}">
                        <li><a href="invoice?status=2">Giao thành công</a></li>
                    </c:if>
                    <c:if test="${sessionScope.acc.isSell == 1}">
                        <li><a href="invoice?status=3">Bị huỷ</a></li>
                    </c:if>
                    <c:if test="${sessionScope.acc.isSell == 1}">
                        <li><a href="invoice">Tất cả</a></li>
                    </c:if>
                </ul>
            </div>
        <div class="table-responsive cart_info">
            <div class="row" style="background-color: #FE980F;border: 1px;border-style: solid;display: flex; color: #fff; border-color: #000">
                <div class="col-sm-2" style="border-right: 1px solid;display: flex;justify-content: center;align-items: center;border-color: #000; width: 11%;
                flex: 0 0 11%;max-width: 11%;">
                    <h5>Thời Gian</h5>
                </div>
                <div class="col-sm-3" style="border-right: 1px solid;display: flex;justify-content: center;align-items: center;border-color: #000; width: 21%; flex: 0 0 21%;max-width: 21%;">
                    <h5>Email</h5>
                </div>
                <div class="col-sm-1" style="border-right: 1px solid;display: flex;justify-content: center;align-items: center;border-color: #000; width: 10%; flex: 0 0 10%;max-width: 10%;">
                    <h5>Họ</h5>
                </div>
                <div class="col-sm-1" style="border-right: 1px solid;display: flex;justify-content: center;align-items: center;border-color: #000;width: 9%; flex: 0 0 9%;max-width: 9%;">
                    <h5>Tên</h5>
                </div>
                <div class="col-sm-3" style="border-right: 1px solid;display: flex;justify-content: center;align-items: center;border-color: #000">
                    <h5>Địa chỉ chính</h5>
                </div>
                <div class="col-sm-1" style="border-right: 1px solid; display: flex;justify-content: center;align-items: center;border-color: #000;width: 10.5%; flex: 0 0 10.5%;max-width: 10.5%;">
                    <h5>Điện thoại</h5>
                </div>
                <div class="col-sm-1" style="border-right: 1px solid; display: flex;justify-content: center;align-items: center;border-color: #000;flex-end;width: 12%; flex: 0 0 12%;max-width: 12%;">
                    <h5>Giá trị đơn hàng</h5>
                </div>
                <div class="col-sm-1" style="display: flex;justify-content: center;align-items: center;border-color: #000">
                    <h5>Mã đơn</h5>
                </div>
            </div>
            <c:forEach items="${listOrder}" var="o">
                <div class="row" style="height: 100px;border: 1px;border-style: solid;display: flex;">
                    <div class="col-sm-1" style="border-right: 1px solid;display: flex; justify-content: flex-end; width: 11%; flex: 0 0 11%;max-width: 11%;">
                        <h4 style="align-self: center;">${o.getDate()}</h4>
                    </div>
                    <div class="col-sm-3" style="border-right: 1px solid; display: flex; width: 21%; flex: 0 0 21%;max-width: 21%;">
                        <a href="orderdetail?billId=${o.id}" style="align-self: center;">
                        <h5>${o.email}</h5>
                        </a>
                    </div>
                    <div class="col-sm-1" style="border-right: 1px solid;  display: flex; justify-content: flex-start; width: 10%; flex: 0 0 10%;max-width: 10%;">
                        <h5 style="align-self: center;">${o.lastName}</h5>
                    </div>
                    <div class="col-sm-1" style="border-right: 1px solid;display: flex;flex-direction: column;justify-content: center; width: 9%; flex: 0 0 9%;max-width: 9%;">
                        <h5 style="align-self: center;">${o.firstName}</h5>
                    </div>
                    <div class="col-sm-3" style="border-right: 1px solid;display: flex; justify-content: flex-end;">
                        <h5 style="align-self: center;">${o.mainAddress}</h5>
                    </div>
                    <div class="col-sm-1" style="border-right: 1px solid;display: flex; justify-content: flex-end; width: 10.5%; flex: 0 0 10.5%;max-width: 10.5%;">
                        <h5 style="align-self: center;">${o.phone}</h5>
                    </div>
                    <div class="col-sm-1" style="border-right: 1px solid;display: flex; justify-content: flex-end;width: 12%; flex: 0 0 12%;max-width: 12%;">
                        <h5 style="align-self: center;">${o.getTotalPrice()} ₫</h5>
                    </div>
                    <div class="col-sm-1" style="display: flex; justify-content: center; justify-content: center;">
                        <h5 style="align-self: center;">${o.id}</h5>
                    </div>
                </div>
            </c:forEach>
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