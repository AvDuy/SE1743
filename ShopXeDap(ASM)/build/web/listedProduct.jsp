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
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/prettyPhoto.css" rel="stylesheet">
    <link href="css/price-range.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
	<link href="css/main.css" rel="stylesheet">
	<link href="css/responsive.css" rel="stylesheet">
        
    <!--MY CSS ><![endif]-->
    <link href="css/loginLogo.css" rel="stylesheet">
    <link href="css/pagination.css" rel="stylesheet">
    <link href="css/cateDesign.css" rel="stylesheet">
    
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

    <section id="slider"><!--slider-->
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="active">
                        <div class="col-sm-12" style="background-image: url('https://img.choice.com.au/-/media/383a8cc912c94fddbfe27bd238ca1d9c.ashx'); background-size: 100% auto; background-repeat: no-repeat; background-position: center">
                            <h1><span>Bicycle:</span> Freedom</h1>
                            <h2>lối sống tự do</h2>
                            <p>Thoả sức khám phá mọi đường</p><br>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section><!--/slider-->
    
    <section>
        <div class="container">
            <div class="row">
                <jsp:include page="left-side-bar.jsp"></jsp:include>
                
                <div class="col-sm-9 padding-right">
                    <div class="features_items"><!--features_items-->
                        <h2 class="title text-center">${CategoryName}</h2>
                        <div class="container-fluid">
                            <div class="row equal">
                                <c:forEach items="${data}" var="o" > <!--begin="1" end="6"-->
                                    <div class="col-sm-4">
                                        <div class="product-image-wrapper">
                                            <div class="single-products">
                                                <div class="productinfo text-center">
                                                    <img src="${o.image}" class="img-fluid" style="object-fit: contain; height: 250px;" alt="" />
                                                    <h2>${o.price}</h2>
                                                    <p><a href="detail?pid=${o.id}">${o.name}</a></p>
                                                    <a href="addToCart?productId=${o.id}" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Thêm vào giỏ</a>
                                                </div>
<!--                                                <div class="product-overlay">
                                                    <div class="overlay-content">
                                                        <h2>${o.price}</h2>
                                                        <p>${o.name}</p>
                                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Thêm vào giỏ</a>
                                                    </div>
                                                </div>-->
                                            </div>
                                            <div class="choose">
                                                <ul class="nav nav-pills nav-justified">
                                                    <li><a href="#"><i class="fa fa-plus-square"></i>Cho vào muốn mua</a></li>
                                                    <li><a href="#"><i class="fa fa-plus-square"></i>So sánh</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                                
                            </div>
                            <c:set var="page" value="${requestScope.page}"/>
                            <div class="pagination">
                                <c:forEach begin="${1}" end = "${requestScope.numb}" var="i">
                                    <a class="${i==page?"active":""}" href="category?page=${i}">${i}</a>
                                </c:forEach>
                            </div>
                        </div>
                    </div><!--features_items-->

<!--                                <div class="category-tab">category-tab
                                        <div class="col-sm-12">
                                                <ul class="nav nav-tabs">
                                                        <li class="active"><a href="#tshirt" data-toggle="tab">T-Shirt</a></li>
                                                        <li><a href="#blazers" data-toggle="tab">Blazers</a></li>
                                                        <li><a href="#sunglass" data-toggle="tab">Sunglass</a></li>
                                                        <li><a href="#kids" data-toggle="tab">Kids</a></li>
                                                        <li><a href="#poloshirt" data-toggle="tab">Polo shirt</a></li>
                                                </ul>
                                        </div>
                                        <div class="tab-content">
                                                <div class="tab-pane fade active in" id="tshirt" >
                                                        <div class="col-sm-3">
                                                                <div class="product-image-wrapper">
                                                                        <div class="single-products">
                                                                                <div class="productinfo text-center">
                                                                                        <img src="images/home/gallery1.jpg" alt="" />
                                                                                        <h2>$56</h2>
                                                                                        <p>Easy Polo Black Edition</p>
                                                                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                </div>

                                                                        </div>
                                                                </div>
                                                        </div>
                                                        <div class="col-sm-3">
                                                                <div class="product-image-wrapper">
                                                                        <div class="single-products">
                                                                                <div class="productinfo text-center">
                                                                                        <img src="images/home/gallery2.jpg" alt="" />
                                                                                        <h2>$56</h2>
                                                                                        <p>Easy Polo Black Edition</p>
                                                                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                </div>

                                                                        </div>
                                                                </div>
                                                        </div>
                                                        <div class="col-sm-3">
                                                                <div class="product-image-wrapper">
                                                                        <div class="single-products">
                                                                                <div class="productinfo text-center">
                                                                                        <img src="images/home/gallery3.jpg" alt="" />
                                                                                        <h2>$56</h2>
                                                                                        <p>Easy Polo Black Edition</p>
                                                                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                </div>

                                                                        </div>
                                                                </div>
                                                        </div>
                                                        <div class="col-sm-3">
                                                                <div class="product-image-wrapper">
                                                                        <div class="single-products">
                                                                                <div class="productinfo text-center">
                                                                                        <img src="images/home/gallery4.jpg" alt="" />
                                                                                        <h2>$56</h2>
                                                                                        <p>Easy Polo Black Edition</p>
                                                                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                </div>

                                                                        </div>
                                                                </div>
                                                        </div>
                                                </div>

                                                <div class="tab-pane fade" id="blazers" >
                                                        <div class="col-sm-3">
                                                                <div class="product-image-wrapper">
                                                                        <div class="single-products">
                                                                                <div class="productinfo text-center">
                                                                                        <img src="images/home/gallery4.jpg" alt="" />
                                                                                        <h2>$56</h2>
                                                                                        <p>Easy Polo Black Edition</p>
                                                                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                </div>

                                                                        </div>
                                                                </div>
                                                        </div>
                                                        <div class="col-sm-3">
                                                                <div class="product-image-wrapper">
                                                                        <div class="single-products">
                                                                                <div class="productinfo text-center">
                                                                                        <img src="images/home/gallery3.jpg" alt="" />
                                                                                        <h2>$56</h2>
                                                                                        <p>Easy Polo Black Edition</p>
                                                                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                </div>

                                                                        </div>
                                                                </div>
                                                        </div>
                                                        <div class="col-sm-3">
                                                                <div class="product-image-wrapper">
                                                                        <div class="single-products">
                                                                                <div class="productinfo text-center">
                                                                                        <img src="images/home/gallery2.jpg" alt="" />
                                                                                        <h2>$56</h2>
                                                                                        <p>Easy Polo Black Edition</p>
                                                                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                </div>

                                                                        </div>
                                                                </div>
                                                        </div>
                                                        <div class="col-sm-3">
                                                                <div class="product-image-wrapper">
                                                                        <div class="single-products">
                                                                                <div class="productinfo text-center">
                                                                                        <img src="images/home/gallery1.jpg" alt="" />
                                                                                        <h2>$56</h2>
                                                                                        <p>Easy Polo Black Edition</p>
                                                                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                </div>

                                                                        </div>
                                                                </div>
                                                        </div>
                                                </div>

                                                <div class="tab-pane fade" id="sunglass" >
                                                        <div class="col-sm-3">
                                                                <div class="product-image-wrapper">
                                                                        <div class="single-products">
                                                                                <div class="productinfo text-center">
                                                                                        <img src="images/home/gallery3.jpg" alt="" />
                                                                                        <h2>$56</h2>
                                                                                        <p>Easy Polo Black Edition</p>
                                                                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                </div>

                                                                        </div>
                                                                </div>
                                                        </div>
                                                        <div class="col-sm-3">
                                                                <div class="product-image-wrapper">
                                                                        <div class="single-products">
                                                                                <div class="productinfo text-center">
                                                                                        <img src="images/home/gallery4.jpg" alt="" />
                                                                                        <h2>$56</h2>
                                                                                        <p>Easy Polo Black Edition</p>
                                                                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                </div>

                                                                        </div>
                                                                </div>
                                                        </div>
                                                        <div class="col-sm-3">
                                                                <div class="product-image-wrapper">
                                                                        <div class="single-products">
                                                                                <div class="productinfo text-center">
                                                                                        <img src="images/home/gallery1.jpg" alt="" />
                                                                                        <h2>$56</h2>
                                                                                        <p>Easy Polo Black Edition</p>
                                                                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                </div>

                                                                        </div>
                                                                </div>
                                                        </div>
                                                        <div class="col-sm-3">
                                                                <div class="product-image-wrapper">
                                                                        <div class="single-products">
                                                                                <div class="productinfo text-center">
                                                                                        <img src="images/home/gallery2.jpg" alt="" />
                                                                                        <h2>$56</h2>
                                                                                        <p>Easy Polo Black Edition</p>
                                                                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                </div>

                                                                        </div>
                                                                </div>
                                                        </div>
                                                </div>

                                                <div class="tab-pane fade" id="kids" >
                                                        <div class="col-sm-3">
                                                                <div class="product-image-wrapper">
                                                                        <div class="single-products">
                                                                                <div class="productinfo text-center">
                                                                                        <img src="images/home/gallery1.jpg" alt="" />
                                                                                        <h2>$56</h2>
                                                                                        <p>Easy Polo Black Edition</p>
                                                                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                </div>

                                                                        </div>
                                                                </div>
                                                        </div>
                                                        <div class="col-sm-3">
                                                                <div class="product-image-wrapper">
                                                                        <div class="single-products">
                                                                                <div class="productinfo text-center">
                                                                                        <img src="images/home/gallery2.jpg" alt="" />
                                                                                        <h2>$56</h2>
                                                                                        <p>Easy Polo Black Edition</p>
                                                                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                </div>

                                                                        </div>
                                                                </div>
                                                        </div>
                                                        <div class="col-sm-3">
                                                                <div class="product-image-wrapper">
                                                                        <div class="single-products">
                                                                                <div class="productinfo text-center">
                                                                                        <img src="images/home/gallery3.jpg" alt="" />
                                                                                        <h2>$56</h2>
                                                                                        <p>Easy Polo Black Edition</p>
                                                                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                </div>

                                                                        </div>
                                                                </div>
                                                        </div>
                                                        <div class="col-sm-3">
                                                                <div class="product-image-wrapper">
                                                                        <div class="single-products">
                                                                                <div class="productinfo text-center">
                                                                                        <img src="images/home/gallery4.jpg" alt="" />
                                                                                        <h2>$56</h2>
                                                                                        <p>Easy Polo Black Edition</p>
                                                                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                </div>

                                                                        </div>
                                                                </div>
                                                        </div>
                                                </div>

                                                <div class="tab-pane fade" id="poloshirt" >
                                                        <div class="col-sm-3">
                                                                <div class="product-image-wrapper">
                                                                        <div class="single-products">
                                                                                <div class="productinfo text-center">
                                                                                        <img src="images/home/gallery2.jpg" alt="" />
                                                                                        <h2>$56</h2>
                                                                                        <p>Easy Polo Black Edition</p>
                                                                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                </div>

                                                                        </div>
                                                                </div>
                                                        </div>
                                                        <div class="col-sm-3">
                                                                <div class="product-image-wrapper">
                                                                        <div class="single-products">
                                                                                <div class="productinfo text-center">
                                                                                        <img src="images/home/gallery4.jpg" alt="" />
                                                                                        <h2>$56</h2>
                                                                                        <p>Easy Polo Black Edition</p>
                                                                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                </div>

                                                                        </div>
                                                                </div>
                                                        </div>
                                                        <div class="col-sm-3">
                                                                <div class="product-image-wrapper">
                                                                        <div class="single-products">
                                                                                <div class="productinfo text-center">
                                                                                        <img src="images/home/gallery3.jpg" alt="" />
                                                                                        <h2>$56</h2>
                                                                                        <p>Easy Polo Black Edition</p>
                                                                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                </div>

                                                                        </div>
                                                                </div>
                                                        </div>
                                                        <div class="col-sm-3">
                                                                <div class="product-image-wrapper">
                                                                        <div class="single-products">
                                                                                <div class="productinfo text-center">
                                                                                        <img src="images/home/gallery1.jpg" alt="" />
                                                                                        <h2>$56</h2>
                                                                                        <p>Easy Polo Black Edition</p>
                                                                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                </div>

                                                                        </div>
                                                                </div>
                                                        </div>
                                                </div>
                                        </div>
                                </div>/category-tab

                                <div class="recommended_items">recommended_items
                                        <h2 class="title text-center">recommended items</h2>

                                        <div id="recommended-item-carousel" class="carousel slide" data-ride="carousel">
                                                <div class="carousel-inner">
                                                        <div class="item active">	
                                                                <div class="col-sm-4">
                                                                        <div class="product-image-wrapper">
                                                                                <div class="single-products">
                                                                                        <div class="productinfo text-center">
                                                                                                <img src="images/home/recommend1.jpg" alt="" />
                                                                                                <h2>$56</h2>
                                                                                                <p>Easy Polo Black Edition</p>
                                                                                                <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                        </div>

                                                                                </div>
                                                                        </div>
                                                                </div>
                                                                <div class="col-sm-4">
                                                                        <div class="product-image-wrapper">
                                                                                <div class="single-products">
                                                                                        <div class="productinfo text-center">
                                                                                                <img src="images/home/recommend2.jpg" alt="" />
                                                                                                <h2>$56</h2>
                                                                                                <p>Easy Polo Black Edition</p>
                                                                                                <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                        </div>

                                                                                </div>
                                                                        </div>
                                                                </div>
                                                                <div class="col-sm-4">
                                                                        <div class="product-image-wrapper">
                                                                                <div class="single-products">
                                                                                        <div class="productinfo text-center">
                                                                                                <img src="images/home/recommend3.jpg" alt="" />
                                                                                                <h2>$56</h2>
                                                                                                <p>Easy Polo Black Edition</p>
                                                                                                <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                        </div>

                                                                                </div>
                                                                        </div>
                                                                </div>
                                                        </div>
                                                        <div class="item">	
                                                                <div class="col-sm-4">
                                                                        <div class="product-image-wrapper">
                                                                                <div class="single-products">
                                                                                        <div class="productinfo text-center">
                                                                                                <img src="images/home/recommend1.jpg" alt="" />
                                                                                                <h2>$56</h2>
                                                                                                <p>Easy Polo Black Edition</p>
                                                                                                <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                        </div>

                                                                                </div>
                                                                        </div>
                                                                </div>
                                                                <div class="col-sm-4">
                                                                        <div class="product-image-wrapper">
                                                                                <div class="single-products">
                                                                                        <div class="productinfo text-center">
                                                                                                <img src="images/home/recommend2.jpg" alt="" />
                                                                                                <h2>$56</h2>
                                                                                                <p>Easy Polo Black Edition</p>
                                                                                                <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                        </div>

                                                                                </div>
                                                                        </div>
                                                                </div>
                                                                <div class="col-sm-4">
                                                                        <div class="product-image-wrapper">
                                                                                <div class="single-products">
                                                                                        <div class="productinfo text-center">
                                                                                                <img src="images/home/recommend3.jpg" alt="" />
                                                                                                <h2>$56</h2>
                                                                                                <p>Easy Polo Black Edition</p>
                                                                                                <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                        </div>

                                                                                </div>
                                                                        </div>
                                                                </div>
                                                        </div>
                                                </div>
                                                 <a class="left recommended-item-control" href="#recommended-item-carousel" data-slide="prev">
                                                        <i class="fa fa-angle-left"></i>
                                                  </a>
                                                  <a class="right recommended-item-control" href="#recommended-item-carousel" data-slide="next">
                                                        <i class="fa fa-angle-right"></i>
                                                  </a>			
                                        </div>
                                </div>/recommended_items-->

                        </div>
                </div>
        </div>
    </section>

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