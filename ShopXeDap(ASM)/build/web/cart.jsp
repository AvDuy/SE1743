<%-- 
    Document   : cart
    Created on : Jul 9, 2023, 7:01:10 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Cart | E-Shopper</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
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

    <section id="cart_items">
        <div class="container">
            <div class="breadcrumbs">
                <ol class="breadcrumb">
                    <li><a href="#">Home</a></li>
                    <li class="active">Shopping Cart</li>
                </ol>
            </div>
            <div class="table-responsive cart_info">
                <!--<table class="table table-condensed">-->
<!--                    <thead>
                        <tr class="cart_menu">
                            <td class="image">Item</td>
                            <td class="description"></td>
                            <td class="price">Price</td>
                            <td class="quantity">Quantity</td>
                            <td class="total">Total</td>
                            <td></td>
                        </tr>
                    </thead>-->
<!--                    <tbody>-->
                        <div class="row" style="background-color: #FE980F;border: 1px;border-style: solid;display: flex; color: #fff; border-color: #000">
                            <div class="col-sm-1" style="border-right: 1px solid;display: flex;justify-content: center;align-items: center;border-color: #000">
                                <h4>Hình Ảnh</h4>
                            </div>
                            <div class="col-sm-3" style="border-right: 1px solid;display: flex;justify-content: center;align-items: center;border-color: #000">
                                <h4>Tên sản phẩm</h4>
                            </div>
                            <div class="col-sm-2" style="border-right: 1px solid;display: flex;justify-content: center;align-items: center;border-color: #000">
                                <h4>Giá sản phẩm</h4>
                            </div>
                            <div class="col-sm-2" style="border-right: 1px solid;display: flex;justify-content: center;align-items: center;border-color: #000">
                                <h4>Số lượng</h4>
                            </div>
                            <div class="col-sm-3" style="border-right: 1px solid;display: flex;justify-content: center;align-items: center;border-color: #000">
                                <h4>Tổng tiền</h4>
                            </div>
                            <div class="col-sm-1" style="display: flex;justify-content: center;align-items: center;border-color: #000">
                                <h4>Xoá</h4>
                            </div>
                        </div>
                        <c:forEach items="${sessionScope.order.items}" var="item">
                            <div class="row" style="height: 100px;border: 1px;border-style: solid;display: flex;">
                                <div class="col-sm-1" style="border-right: 1px solid">
                                    <img src="${item.product.image}" class="img-fluid" style="object-fit: contain;height: 100%;width: 100%;padding: 5px" alt="" />
                                </div>
                                <div class="col-sm-3" style="border-right: 1px solid; display: flex">
                                    <h4 style="align-self: center;">${item.product.name}</h4>
                                </div>
                                <div class="col-sm-2" style="border-right: 1px solid;  display: flex; justify-content: flex-end">
                                    <h2 style="align-self: center;">${item.product.price}₫</h2>
                                </div>
                                <div class="col-sm-2" style="border-right: 1px solid;display: flex;flex-direction: column;justify-content: center;">
                                    <div class="cart_quantity_button" style="align-self: center;">
                                        <a class="cart_quantity_up" href="addToCart?productId=${item.product.id}"> + </a>
                                        <input class="cart_quantity_input" type="text" name="quantity" value="${item.quantity}" autocomplete="off" size="2">
                                        <a class="cart_quantity_down" href=""> - </a>
                                    </div>
                                </div>
                                <div class="col-sm-3" style="border-right: 1px solid;display: flex; justify-content: flex-end;">
                                    <div class="choose" style="display: flex;flex-direction: column;justify-content: center;">
                                        <h2 style="align-self: center;">${item.getTotalPrice()}₫</h2>
                                    </div>
                                </div>
                                <div class="col-sm-1" style="display: flex; justify-content: flex-end;">
                                    <div class="cart_delete" style="display: flex;flex-direction: column;justify-content: center;">
                                        <a class="cart_quantity_delete" href=""><i class="fa fa-times"></i></a>
                                    </div>
                                </div>
                            </div>
<!--                            <tr>
                                <td class="" style="width: 100%;">
                                    <a href=""><img src="${item.product.image}" alt="" style="object-fit: contain;width: 20%;"></a>
                                </td>

                                <td class="cart_description">
                                        <h4><a href=""><c:out value="${item.product.name}" /></a></h4>
                                </td>
                                <td class="cart_price">
                                        <p>${item.product.price}</p>
                                </td>
                                <td class="cart_quantity">
                                    <div class="cart_quantity_button">
                                        <a class="cart_quantity_up" href="addToCart?productId=${item.product.id}"> + </a>
                                        <input class="cart_quantity_input" type="text" name="quantity" value="${item.quantity}" autocomplete="off" size="2">
                                        <a class="cart_quantity_down" href=""> - </a>
                                    </div>
                                </td>
                                <td class="cart_total">
                                    
                                    <p class="cart_total_price">${item.getTotalPrice()}₫</p>
                                </td>
                                <td class="cart_delete">
                                        <a class="cart_quantity_delete" href=""><i class="fa fa-times"></i></a>
                                </td>
                            </tr>-->
                        </c:forEach>
                        
<!--                    </tbody>-->
<!--                </table>-->
            </div>
            <h2>Tổng tiền: ${order.getTotalPrice()}₫</h2>
        </div>
    </section> <!--/#cart_items-->

	<section id="do_action">
		<div class="container">
			<div class="heading">
				<h3>What would you like to do next?</h3>
				<p>Choose if you have a discount code or reward points you want to use or would like to estimate your delivery cost.</p>
			</div>
			<div class="row">
				<div class="col-sm-6">
					<div class="chose_area">
						<ul class="user_option">
							<li>
								<input type="checkbox">
								<label>Use Coupon Code</label>
							</li>
							<li>
								<input type="checkbox">
								<label>Use Gift Voucher</label>
							</li>
							<li>
								<input type="checkbox">
								<label>Estimate Shipping & Taxes</label>
							</li>
						</ul>
						<ul class="user_info">
							<li class="single_field">
								<label>Country:</label>
								<select>
									<option>United States</option>
									<option>Bangladesh</option>
									<option>UK</option>
									<option>India</option>
									<option>Pakistan</option>
									<option>Ucrane</option>
									<option>Canada</option>
									<option>Dubai</option>
								</select>
								
							</li>
							<li class="single_field">
								<label>Region / State:</label>
								<select>
									<option>Select</option>
									<option>Dhaka</option>
									<option>London</option>
									<option>Dillih</option>
									<option>Lahore</option>
									<option>Alaska</option>
									<option>Canada</option>
									<option>Dubai</option>
								</select>
							
							</li>
							<li class="single_field zip-field">
								<label>Zip Code:</label>
								<input type="text">
							</li>
						</ul>
						<a class="btn btn-default update" href="">Get Quotes</a>
						<a class="btn btn-default check_out" href="">Continue</a>
					</div>
				</div>
				<div class="col-sm-6">
					<div class="total_area">
						<ul>
							<li>Tổng tiền<span>${order.getTotalPrice()}₫</span></li>
							<li>Eco Tax <span>$2</span></li>
							<li>Shipping Cost <span>Free</span></li>
							<li>Total <span>$61</span></li>
						</ul>
							<a class="btn btn-default update" href="">Update</a>
							<a class="btn btn-default check_out" href="">Check Out</a>
					</div>
				</div>
			</div>
		</div>
	</section><!--/#do_action-->

	<jsp:include page="footer.jsp"></jsp:include>
	


    <script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.scrollUp.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
</body>
</html>
