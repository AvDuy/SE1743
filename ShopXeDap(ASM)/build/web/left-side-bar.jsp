<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>


<div class="col-sm-3">
                    <div class="left-sidebar">
                        
                        <!--category-productsr-->
                        <h2>Danh mục sản phẩm</h2>
                            <div class="panel-group category-products" id="accordian">
                                <c:forEach items="${listCategory}" var = "cate">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title"><a href="category?cid=${cate.cid}">${cate.cname}</a></h4>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div><!--/category-products-->

<!--                            <div class="brands_products">
                                    <h2>Brands</h2>
                                    <div class="brands-name">
                                            <ul class="nav nav-pills nav-stacked">
                                                    <li><a href="#"> <span class="pull-right">(50)</span>Acne</a></li>
                                                    <li><a href="#"> <span class="pull-right">(56)</span>Grüne Erde</a></li>
                                                    <li><a href="#"> <span class="pull-right">(27)</span>Albiro</a></li>
                                                    <li><a href="#"> <span class="pull-right">(32)</span>Ronhill</a></li>
                                                    <li><a href="#"> <span class="pull-right">(5)</span>Oddmolly</a></li>
                                                    <li><a href="#"> <span class="pull-right">(9)</span>Boudestijn</a></li>
                                                    <li><a href="#"> <span class="pull-right">(4)</span>Rösch creative culture</a></li>
                                            </ul>
                                    </div>
                            </div>-->

                                <div class="price-range"><!--price-range-->
                                        <h2>Price Range</h2>
                                        <div class="well text-center">
                                                 <input type="text" class="span2" value="" data-slider-min="0" data-slider-max="600" data-slider-step="5" data-slider-value="[250,450]" id="sl2" ><br />
                                                 <b class="pull-left">$ 0</b> <b class="pull-right">$ 600</b>
                                        </div>
                                </div><!--/price-range-->

<!--                            <div class="shipping text-center">
                                        <img src="images/home/shipping.jpg" alt="" />
                                </div>-->

                    </div>
                </div>