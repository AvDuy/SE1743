<%-- 
    Document   : login
    Created on : Jun 24, 2023, 11:34:42 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Login | E-Shopper</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/prettyPhoto.css" rel="stylesheet">
    <link href="css/price-range.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
	<link href="css/main.css" rel="stylesheet">
	<link href="css/responsive.css" rel="stylesheet">
        
    <!--MY CSS ><![endif]-->
    <link href="css/loginLogo.css" rel="stylesheet">
    <link rel="stylesheet" href="css/loginCss.css"/>

    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->       
    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
    <link rel="stylesheet" href="https://cdn.materialdesignicons.com/5.4.55/css/materialdesignicons.min.css">

</head><!--/head-->

<body>
    <jsp:include page="header.jsp"></jsp:include>
    <% if (request.getAttribute("warning") != null) { %>
        <div class='warning' style="padding-left: 35%; padding-right: 35%">
            <div class='content' >
              <div class="alert alert-danger alert-white rounded">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                <strong>Error!</strong> ${warning}.
              </div>
            </div>
        </div>
    <% } %>
    
    <div style="display: flex;justify-content: center;padding-block: 2%;">
        <div style="width: 70%;padding-block: 35px;background-image: url(https://wallpaperset.com/w/full/d/2/b/115638.jpg); background-repeat: no-repeat;background-size: cover;display: flex;justify-content: center;">
            
            <div class="form-structor">
                    <div class="signup">
                            <h2 class="form-title" id="signup">Đăng ký</h2>
                            <form action="signup" method="post">
                                <div class="form-holder">
                                    <input name="user" type="text" class="input" required placeholder="Tên tài khoản" />
                                    <input name="email" type="email" class="input" placeholder="Email" />
                                    <input name="pass" type="password" class="input" required placeholder="Mật khẩu" />
                                    <input name="repass" type="password" class="input" required placeholder="Xác nhận mật khẩu" />

                                </div>
                                <button class="submit-btn">Tạo tài khoản</button>
                            </form>
                    </div>
                    <div class="login slide-up">
                        <div class="center">
                            <h2 class="form-title" id="login">Đã có tài khoản</h2>
                            <div class="form-holder">
                                <div class="login-form"><!--login form-->
                                    <form action="login" method="post">
                                            <input name="user" type="text" placeholder="Email" />
                                            <input name="pass" type="password" placeholder="Mật khẩu" />
                                            <span>
                                            <input type="checkbox" class="checkbox"> 
                                            Lưu tài khoản đăng nhập
                                        </span>
                                        <button class="submit-btn">Đăng nhập</button>
                                    </form>
                                </div><!--/login form-->
                            </div>
                        </div>
                    </div>
            </div>
        </div>
    </div>
        
	
	
    <jsp:include page="footer.jsp"></jsp:include>
	

  
    <script src="js/jquery.js"></script>
    <script src="js/price-range.js"></script>
    <script src="js/jquery.scrollUp.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
    
    <script src="js/loginJS.js"></script>
    
</body>
</html>
