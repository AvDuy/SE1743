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
    <link rel="stylesheet" href="css/cartButton.css" />
    
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
                    <li><a href="home">Home</a></li>
                    <li class="active">Giỏ hàng</li>
                </ol>
            </div>
            <div class="table-responsive cart_info">
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
                                <form action="quantityControl">
                                    <input type="hidden" name="itemId" value="${item.id}">
                                    <div class="row" >
                                        <div class="counter">
                                            <span class="down" onClick='decreaseCount(event, this)'>-</span>
                                            <input type="text"  name="quantity" value="${item.quantity}">
                                            <span class="up" onClick='increaseCount(event, this)'>+</span>
                                        </div> 
<!--                                        <button class="col-md-4 plus-btn" id="plus">+</button>
                                        <input class="col-md-4 cart_quantity_input" type="text" id="input" name="quantity" value="${item.quantity}" autocomplete="off" size="2">
                                        <button class="col-md-4 minus-btn" id="minus">−</button>-->
                                    </div>
                                        
                                    <div style="display: flex;justify-content: center;">
                                        <button class="submit-btn">Xác nhận</button>
                                    </div>
                                        <div></div>
                                </form>
                            </div>
                        </div>
                        <div class="col-sm-3" style="border-right: 1px solid;display: flex; justify-content: flex-end;">
                            <div class="choose" style="display: flex;flex-direction: column;justify-content: center;">
                                <h2 style="align-self: center;">${item.getTotalPrice()}₫</h2>
                            </div>
                        </div>
                        <div class="col-sm-1" style="display: flex; justify-content: center;">
                            <div class="cart_delete" style="display: flex;flex-direction: column;justify-content: center;">
                                <a class="cart_quantity_delete" href="deleteitem?itemId=${item.id}" onclick="return confirm('Bạn có chắc muốn bỏ sản phẩm?')"><i class="fa fa-times"></i></a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <h2>Tổng giá trị đơn hàng: ${order.getTotalPrice()}₫</h2>
        </div>
    </section> <!--/#cart_items-->

<!--    <section id="do_action">
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
    </section>/#do_action-->

	<jsp:include page="footer.jsp"></jsp:include>
	
        <script type="text/javascript">
      function increaseCount(a, b) {
        var input = b.previousElementSibling;
        var value = parseInt(input.value, 10); 
        value = isNaN(value)? 0 : value;
        value ++;
        input.value = value;
      }
      function decreaseCount(a, b) {
        var input = b.nextElementSibling;
        var value = parseInt(input.value, 10); 
        if (value > 1) {
          value = isNaN(value)? 0 : value;
          value --;
          input.value = value;
        }
      }
    </script>
    <script src="js/cartButton.js"></script>
    <script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.scrollUp.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
</body>
</html>
