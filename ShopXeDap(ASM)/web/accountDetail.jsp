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
    
    <c:if test="${empty sessionScope.acc}">
        <script>
            window.location.href = "404.jsp";
        </script>
    </c:if>
    
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
                    <h2 class="title text-center">ĐƠN HÀNG (${loop.index + 1}) của gmail</h2>
                    <h4 style="align-self: center;">Email: ${address.email}</h4>
                    <h4 style="align-self: center;">Họ tên: ${address.lastName} ${address.firstName}</h4>
                    <h4 style="align-self: center;">Địa chỉ chính: ${address.mainAddress}</h4>
                    <h4 style="align-self: center;">Địa chỉ 2: ${address.getAddress2()}</h4>
                    <h4 style="align-self: center;">Số điện thoại: ${address.phone}</h4>
                    <div class="table-responsive cart_info">
                        <div class="row" style="background-color: #FE980F;border: 1px;border-style: solid;display: flex; color: #fff; border-color: #000">
                            <div class="col-sm-1" style="border-right: 1px solid;display: flex;justify-content: center;align-items: center;border-color: #000">
                                <h4>Hình Ảnh</h4>
                            </div>
                            <div class="col-sm-3" style="border-right: 1px solid;display: flex;justify-content: center;align-items: center;border-color: #000">
                                <h4>Tên sản phẩm</h4>
                            </div>
                            <div class="col-sm-3" style="border-right: 1px solid;display: flex;justify-content: center;align-items: center;border-color: #000">
                                <h4>Giá sản phẩm</h4>
                            </div>
                            <div class="col-sm-2" style="border-right: 1px solid;display: flex;justify-content: center;align-items: center;border-color: #000">
                                <h4>Số lượng</h4>
                            </div>
                            <div class="col-sm-3" style="display: flex;justify-content: center;align-items: center;border-color: #000">
                                <h4>Tổng tiền</h4>
                            </div>
                        </div>
                        <c:forEach items="${address.items}" var="item">
                            <div class="row" style="height: 100px;border: 1px;border-style: solid;display: flex;">
                                <div class="col-sm-1" style="border-right: 1px solid">
                                    <img src="${item.image}" class="img-fluid" style="object-fit: contain;height: 100%;width: 100%;padding: 5px" alt="" />
                                </div>
                                <div class="col-sm-3" style="border-right: 1px solid; display: flex">
                                    <h4 style="align-self: center;">${item.name}</h4>
                                </div>
                                <div class="col-sm-3" style="border-right: 1px solid;  display: flex; justify-content: flex-end">
                                    <h2 style="align-self: center;">${item.getProductPrice()}₫</h2>
                                </div>
                                <div class="col-sm-2" style="border-right: 1px solid;display: flex;flex-direction: column;justify-content: center;">
                                    <h2 style="align-self: center;">${item.quantity}</h2>
                                </div>
                                <div class="col-sm-3" style="display: flex; justify-content: flex-end;">
                                    <h2 style="align-self: center;">${item.getTotalPrice()}₫</h2>

                                </div>
                            </div>
                            
                        </c:forEach>
                        <c:choose>
                            <c:when test="${address.status == 0}">
                              <h5>Trạng thái: Chờ xử lý</h5>
                              <a href="updatecartclient?billId=${address.id}&status=3&uid=${sessionScope.acc.id}"><button class="submit-btn" style="margin-bottom: 2%;">Huỷ bỏ đơn hàng</button></a><br>
                            </c:when>
                            <c:when test="${address.status == 1}">
                              <h5>Trạng thái: Đang giao hàng</h5>
                              <a href="updatecartclient?billId=${address.id}&status=2&uid=${sessionScope.acc.id}"><button class="submit-btn" style="margin-bottom: 2%;">Xác nhận giao hàng thành công</button></a>
                              <a href="updatecartclient?billId=${address.id}&status=3&uid=${sessionScope.acc.id}"><button class="submit-btn" style="margin-bottom: 2%;">Huỷ bỏ đơn hàng</button></a><br>
                            </c:when>
                            <c:when test="${address.status == 2}">
                              <h5>Trạng thái: Giao hàng thành công, Cảm ơn quý khách</h5>
                            </c:when>
                            <c:when test="${address.status == 3}">
                              <h5>Trạng thái: Đã bị huỷ</h5>
                              <a href="updatecartclient?billId=${address.id}&status=0&uid=${sessionScope.acc.id}"><button class="submit-btn" style="margin-bottom: 2%;">Đặt lại</button></a><br>
                            </c:when>
                            <c:otherwise>
                              <h5>Trạng thái: Unknown</h5>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <h2>Tổng giá trị đơn hàng: ${address.getTotalPrice()}₫</h2>
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