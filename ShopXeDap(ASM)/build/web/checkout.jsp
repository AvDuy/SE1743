<%-- 
    Document   : checkout
    Created on : Jul 12, 2023, 12:46:02 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Checkout | E-Shopper</title>
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
    <link rel="stylesheet" href="css/billinfo.css" />
    
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
        <form action="checkout">
            <div class="breadcrumbs">
                <ol class="breadcrumb">
                    <li><a href="#">Home</a></li>
                    <li class="active">Check out</li>
                </ol>
            </div><!--/breadcrums-->

            <div class="step-one">
                <h2 class="heading">Step1</h2>
            </div>
            <div class="checkout-options">
                <h3>New User</h3>
                <p>Checkout options</p>
                <ul class="nav">
                    <li>
                        <label><input type="checkbox"> Register Account</label>
                    </li>
                    <li>
                        <label><input type="checkbox">Thanh toán nhanh</label>
                    </li>
                    <li>
                        <a href=""><i class="fa fa-times"></i>Cancel</a>
                    </li>
                </ul>
            </div><!--/checkout-options-->

            <div class="register-req">
                <p>Hãy sử dụng tài khoản để có thể thấy lịch sử đặt hàng hoặc sử dụng thanh toán nhanh để thanh toán luôn!</p>
            </div><!--/register-req-->

            <div class="shopper-informations">
                <div class="row">
<!--                    <div class="col-sm-3">
                        <div class="shopper-info">
                            <p>Shopper Information</p>
                            <form>
                                <input type="text" placeholder="Display Name">
                                <input type="text" placeholder="User Name">
                                <input type="password" placeholder="Password">
                                <input type="password" placeholder="Confirm password">
                            </form>
                            <a class="btn btn-primary" href="">Get Quotes</a>
                            <a class="btn btn-primary" href="">Continue</a>
                        </div>
                    </div>-->
                    <div class="col-sm-5 clearfix">
                        <div class="bill-to">
                            <p>Gửi đến địa chỉ:</p>
                            <div class="billInfo">
                                    <input type="email" name="email" placeholder="Email*" required style="background:#F0F0E9;border: 0 none;margin-bottom:10px;padding: 10px;width: 100%;font-weight: 300">
                                    <input type="text" name="firstName" placeholder="Tên*" required style="background:#F0F0E9;border: 0 none;margin-bottom:10px;padding: 10px;width: 100%;font-weight: 300">
                                    <input type="text" name="LastName" placeholder="Họ*" required style="background:#F0F0E9;border: 0 none;margin-bottom:10px;padding: 10px;width: 100%;font-weight: 300">
                                    <input type="text" name="address1" placeholder="Địa chỉ chính*" required style="background:#F0F0E9;border: 0 none;margin-bottom:10px;padding: 10px;width: 100%;font-weight: 300">
                                    <input type="text" name="address2" placeholder="Địa chỉ phụ" style="background:#F0F0E9;border: 0 none;margin-bottom:10px;padding: 10px;width: 100%;font-weight: 300">
                            </div>
                            <div class="form-two">
                                    <input type="text" placeholder="Zip / Postal Code" style="background:#F0F0E9;border: 0 none;margin-bottom:10px;padding: 10px;width: 100%;font-weight: 300;">
                                    <select>
                                        <option>-- Đất nước --</option>
                                        <option>United States</option>
                                        <option>Bangladesh</option>
                                        <option>UK</option>
                                        <option>India</option>
                                        <option>Pakistan</option>
                                        <option>Ucrane</option>
                                        <option>Canada</option>
                                        <option>Dubai</option>
                                        <option>Việt Nam</option>
                                    </select>
                                    <select>
                                        <option>-- Thành Phố / Tỉnh / Thành --</option>
                                        <option>Hồ Chí Minh</option>
                                        <option>Vĩnh Phúc</option>
                                        <option>Hạ Long</option>
                                        <option>Đắc Lắc</option>
                                        <option>Buôn Mê Thuật</option>
                                        <option>Nha Trang</option>
                                        <option>Vũng Tàu</option>
                                        <option>Hà Nội</option>
                                    </select>
                                    <input type="tel" name="phone" placeholder="Số điện thoại (xxx xxx xxxx)*" pattern="[0-9]{3} [0-9]{3} [0-9]{4}" style="margin-top: 4%;background:#F0F0E9;border: 0 none;margin-bottom:10px;padding: 10px;width: 100%;font-weight: 300" required>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="order-message">
                            <p>Ghi chú cho đơn hàng</p>
                            <textarea name="message"  placeholder="Viết ghi chú của bạn cho shop hay shipper vào đây" rows="16"></textarea>
                            <label><input type="checkbox">Gửi đơn hàng theo địa chỉ trên</label>
                        </div>	
                    </div>
                </div>
            </div>
            <div class="review-payment">
                <h2>Xem trước & Chi trả</h2>
            </div>
            <c:choose>
                <c:when test="${not empty sessionScope.order.items}">
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
<!--                                <form action="quantityControl">-->
                                    <input type="hidden" name="itemId" value="${item.id}">
                                    <div class="row" >
                                        <div class="counter">
<!--                                            <span class="down" onClick='decreaseCount(event, this)'>-</span>-->
                                            <input type="text"  name="quantity" value="${item.quantity}">
<!--                                            <span class="up" onClick='increaseCount(event, this)'>+</span>-->
                                        </div> 
    <!--                                <button class="col-md-4 plus-btn" id="plus">+</button>
                                        <input class="col-md-4 cart_quantity_input" type="text" id="input" name="quantity" value="${item.quantity}" autocomplete="off" size="2">
                                        <button class="col-md-4 minus-btn" id="minus">−</button>-->
                                    </div>

                                    <div style="display: flex;justify-content: center;">
<!--                                        <button class="submit-btn">Xác nhận</button>-->
                                    </div>
                                        <div></div>
<!--                                </form>-->
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
            <div>
                <span>
                    <label><input type="checkbox"> Chuyển tiền qua ngân hàng</label>
                </span>
                <span>
                    <label><input type="checkbox"> Thanh toán COD</label>
                </span>
                <span>
                    <label><input type="checkbox"> Momo</label>
                </span>
            </div>
            <button class="submit-btn" type="submit" style="margin: 2%;">Xác nhận thông tin và thanh toán</button>
                </c:when>
                <c:otherwise>
                    <h2>Bạn chưa có sản phẩm nào trong giỏ hàng cả</h2>
                </c:otherwise>
            </c:choose>
            
        </form>
    </div>
    </section> <!--/#cart_items-->
    

	

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
    <script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.scrollUp.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
</body>
</html>