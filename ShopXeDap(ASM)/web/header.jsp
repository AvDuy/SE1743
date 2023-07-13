<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<header id="header"><!--header-->
    <div class="header_top"><!--header_top-->
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <div class="contactinfo">
                        <ul class="nav nav-pills">
                            <li><a href="#"><i class="fa fa-phone"></i> +2 95 01 88 821</a></li>
                            <li><a href="#"><i class="fa fa-envelope"></i> info@domain.com</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="social-icons pull-right">
                        <ul class="nav navbar-nav">
                            <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                            <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                            <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                            <li><a href="#"><i class="fa fa-dribbble"></i></a></li>
                            <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div><!--/header_top-->
    <div class="header-middle"><!--header-middle-->
        <div class="container">
            <div class="row">
                <div class="col-sm-4">
                    <div class="logo pull-left logoImage">
                        <a href="<%= request.getContextPath() %>/home"><img src="images/home/logo.png" alt="" /></a>
                    </div>
                    <div class="btn-group pull-right">
                        <div class="btn-group">
                            <button type="button" class="btn btn-default dropdown-toggle usa" data-toggle="dropdown">
                                    VietNam
                                <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu">
                                <li><a href="#">Việt Nam</a></li>
                                <li><a href="#">UK</a></li>
                            </ul>
                        </div>

                        <div class="btn-group">
                            <button type="button" class="btn btn-default dropdown-toggle usa" data-toggle="dropdown">
                                    Đồng
                                    <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu">
                                <li><a href="#">Đồng</a></li>
                                <li><a href="#">Pound</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-sm-8">
                    <div class="shop-menu pull-right">
                        <ul class="nav navbar-nav">
                            <c:choose>
                                <c:when test="${not empty sessionScope.acc}">
                                    <li><a href="#"><i class="fa fa-user"></i>${sessionScope.acc.user}</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li><a href="login.jsp"><i class="fa fa-user"></i> Tài khoản</a></li>
                                </c:otherwise>
                            </c:choose>
                            <li><a href="#"><i class="fa fa-star"></i> Danh sách muốn mua</a></li>
                            <li><a href="checkout.html"><i class="fa fa-crosshairs"></i> Thanh toán</a></li>
                            <li><a href="cart.jsp"><i class="fa fa-shopping-cart"></i> Giỏ hàng</a></li>
                            <c:choose>
                                <c:when test="${not empty sessionScope.acc}">
                                    <li><a href="logout" onclick="return confirm('Bạn có chắc muốn đăng xuất?')"><i class="fa fa-unlock"></i>Đăng xuất</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li><a href="login.jsp"><i class="fa fa-lock"></i> Đăng nhập</a></li>
                                </c:otherwise>
                            </c:choose>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div><!--/header-middle-->
    <div class="header-bottom"><!--header-bottom-->
        <div class="container">
            <div class="row">
                <div class="col-sm-9">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                    </div>
                    <div class="mainmenu pull-left">
                        <ul class="nav navbar-nav collapse navbar-collapse">
                            <li><a href="<%= request.getContextPath() %>/home">Trang chủ</a></li>
                            <li class="dropdown"><a href="#">Shop<i class="fa fa-angle-down"></i></a>
                                <ul role="menu" class="sub-menu">
                                    
                                    <li><a href="allproduct">Tất cả sản phẩm</a></li>
                                    <li><a href="cart.jsp">Giỏ hàng</a></li>
                                    <li><a href="checkout.jsp">Thanh Toán</a></li>
                                </ul>
                            </li>
                            <li class="dropdown"><a href="#">Tin tức<i class="fa fa-angle-down"></i></a>
                                <ul role="menu" class="sub-menu">
                                    <li><a href="blog.html">Blog List</a></li>
                                    <li><a href="blog-single.html">Blog Single</a></li>
                                </ul>
                            </li> 
                            <li><a href="404.jsp">404</a></li>
                            <li><a href="contact-us.html">Liên Hệ</a></li>
                            <c:if test="${sessionScope.acc.isSell == 1}">
                                <li class="dropdown"><a href="#">Quản lý<i class="fa fa-angle-down"></i></a>
                                    <ul role="menu" class="sub-menu">
                                        <c:if test="${sessionScope.acc.isSell == 1}">
                                            <li><a href="managing">Sản phẩm</a></li>
                                        </c:if>
                                        <c:if test="${sessionScope.acc.isAdmin == 1}">
                                            <li><a href="shop.html">Tài khoản</a></li>
                                        </c:if>
                                        <c:if test="${sessionScope.acc.isSell == 1}">
                                            <li><a href="invoice">Đơn hàng</a></li>
                                        </c:if>
                                    </ul>
                                </li>
                            </c:if>
                        </ul>
                    </div>
                </div>
                <div class="col-sm-3">
                    <form action="search" method="get">
                    <div class="search_box pull-right">
                        <input value="${txtS}" name="txt" type="text" placeholder="Tìm kiếm"/>
                    </div>
                    </form>
                </div>
            </div>
        </div>
    </div><!--/header-bottom-->
</header><!--/header-->
