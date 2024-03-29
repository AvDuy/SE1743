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
    
    <c:if test="${sessionScope.acc.isSell != 1}">
        <script>
            window.location.href = "404.jsp";
        </script>
    </c:if>
</head><!--/head-->

<body>
    <jsp:include page="header.jsp"></jsp:include>

    <h2 class="title text-center">Chỉnh sửa sản phẩm</h2>
    <div style="padding: 50px;padding-inline: 30%;">
        <form action="editProduct">
            <h1>Chỉnh sửa sản phẩm</h1>
            <label for="id">ID: </label>
            <input type="text" id="id" name="id" readonly required value="${editProduct.id}"><br>
            <div style="display: flex">
                <label for="Category">Phân loại:</label><br>
                <select id="Category" name="Category">
                    <c:forEach items="${listCategory}" var="cate">
                        <c:choose>
                            <c:when test="${cate.cid == editProduct.cateId}">
                                <option value="${cate.cid}" selected>${cate.cname}</option>
                            </c:when>
                            <c:otherwise>
                                <option value="${cate.cid}">${cate.cname}</option>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </select>
            </div>
            <label for="name">Tên sản phẩm: </label><br>
            <input type="text" id="name" name="name" value="${editProduct.name}" required><br>
            <label for="image">Ảnh:</label><br>
            <input type="text" id="image" name="image" value="${editProduct.image}" required><br>
            <label for="price">Giá tiền (Đơn vị nghìn đồng VD: điền 1 sẽ thành 1,000đ):</label><br>
            <input type="text" id="price" name="price" value="${editProduct.returnPrice()}" required><br>
            <label for="description">Mô tả chi tiết sản phẩm: </label><br>
            <textarea id="description" name="description" rows="4" cols="50" required>${editProduct.description}</textarea>
            <div style="
                display: flex;
                justify-content: center;
                padding-top: 3%;
            ">
                <input type="submit" value="Chỉnh sửa">
            </div>
        </form>
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