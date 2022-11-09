<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : singleProduct
    Created on : Jun 21, 2022, 3:42:40 PM
    Author     : toten
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx" class="no-js">

    <head>
        <!-- Mobile Specific Meta -->
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Favicon-->
        <link rel="shortcut icon" href="img/fav.png">
        <!-- Author Meta -->
        <meta name="author" content="CodePixar">
        <!-- Meta Description -->
        <meta name="description" content="">
        <!-- Meta Keyword -->
        <meta name="keywords" content="">
        <!-- meta character set -->
        <meta charset="UTF-8">
        <!-- Site Title -->
        <title>Karma Shop</title>
        <!--
                        CSS
                        ============================================= -->
        <link rel="stylesheet" href="css/linearicons.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="css/themify-icons.css">
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/owl.carousel.css">
        <link rel="stylesheet" href="css/nice-select.css">
        <link rel="stylesheet" href="css/nouislider.min.css">
        <link rel="stylesheet" href="css/ion.rangeSlider.css" />
        <link rel="stylesheet" href="css/ion.rangeSlider.skinFlat.css" />
        <link rel="stylesheet" href="css/main.css">
        <style>
            *{
                margin: 0;
                padding: 0;
            }
            .rate {
                float: left;
                height: 46px;
                padding: 0 10px;
            }
            .rate:not(:checked) > input {
                position:absolute;
                top:-9999px;
            }
            .rate:not(:checked) > label {
                float:right;
                width:1em;
                overflow:hidden;
                white-space:nowrap;
                cursor:pointer;
                font-size:24px;
                color:#ccc;
            }
            .rate:not(:checked) > label:before {
                content: '★ ';
            }
            .rate > input:checked ~ label {
                color: #fbd600;    
            }
            .rate:not(:checked) > label:hover,
            .rate:not(:checked) > label:hover ~ label {
                color: #fbd600;  
            }
            .rate > input:checked + label:hover,
            .rate > input:checked + label:hover ~ label,
            .rate > input:checked ~ label:hover,
            .rate > input:checked ~ label:hover ~ label,
            .rate > label:hover ~ input:checked ~ label {
                color: #fbd600;
            }

            /* Modified from: https://github.com/mukulkant/Star-rating-using-pure-css */
        </style>
    </head>

    <body>

        <!-- Start Header Area -->
        <header class="header_area sticky-header">
            <div class="main_menu">
                <nav class="navbar navbar-expand-lg navbar-light main_box">
                    <div class="container">
                        <!-- Brand and toggle get grouped for better mobile display -->
                        <a class="navbar-brand logo_h" href="index.html"><img src="img/logo.png" alt=""></a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <!-- Collect the nav links, forms, and other content for toggling -->
                        <div class="collapse navbar-collapse offset" id="navbarSupportedContent">
                            <ul class="nav navbar-nav menu_nav ml-auto">
                                <li class="nav-item"><a class="nav-link" href="welcome">Home</a></li>
                                <li class="nav-item submenu dropdown active">
                                    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                                       aria-expanded="false">Shop</a>
                                    <ul class="dropdown-menu">
                                        <li class="nav-item"><a class="nav-link" href="home">Shop Category</a></li>
                                        <li class="nav-item"><a class="nav-link" href="carts">Shopping Cart</a></li>
                                    </ul>
                                </li>


                                <li class="nav-item submenu dropdown">
                                    <c:choose>
                                        <c:when test="${sessionScope.account !=null}">
                                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                                               aria-expanded="false">${sessionScope.account.displayName}</a>
                                            <ul class="dropdown-menu">
                                                <c:choose>
                                                    <c:when test="${(sessionScope.account.role) == 'ADMIN'}">
                                                        <li class="nav-item"><a class="nav-link" href="dashboard">Dashboard</a></li>
                                                        <li class="nav-item"><a class="nav-link" href="new-product">Add new product</a></li>
                                                        <li class="nav-item"><a class="nav-link" href="tracking.html">My Account</a></li>
                                                        </c:when>
                                                        <c:otherwise>
                                                        <li class="nav-item"><a class="nav-link" href="tracking.html">My Account</a></li>
                                                        </c:otherwise>
                                                    </c:choose>
                                                <li class="nav-item"><a class="nav-link" href="logout">Logout</a></li>
                                            </ul>
                                        </c:when>
                                        <c:otherwise>
                                            <a class="nav-link" href="login">Login</a>
                                        </c:otherwise>
                                    </c:choose>


                                </li>

                            </ul>
                            <ul class="nav navbar-nav navbar-right">
                                <li class="nav-item" ><a href="carts" class="cart" style="display: flex; justify-content: center; align-items: center">
                                        <span class="ti-bag" style="font-size: 20px; font-weight: 800"></span>
                                        <span id="cart_number" class="badge" style="padding: 5px; border-radius: 50%; line-height:6px; margin-left: 3px; background: linear-gradient(90deg, #ffba00 0%, #ff6c00 100%); color: white; display: flex; justify-content: center; align-items: center">${sessionScope.carts.size()}</span>
                                    </a></li>
                                <li class="nav-item">
                                    <button class="search"><span class="lnr lnr-magnifier" id="search"></span></button>
                                </li>

                            </ul>
                        </div>
                    </div>
                </nav>
            </div>
            <div class="search_input" id="search_input_box">
                <div class="container">
                    <form class="d-flex justify-content-between">
                        <input type="text" class="form-control" id="search_input" placeholder="Search Here">
                        <button type="submit" class="btn"></button>
                        <span class="lnr lnr-cross" id="close_search" title="Close Search"></span>
                    </form>
                </div>
            </div>
        </header>
        <!-- End Header Area -->

        <!-- Start Banner Area -->
        <section class="banner-area organic-breadcrumb">
            <div class="container">
                <div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
                    <div class="col-first">
                        <h1>Product Details Page</h1>
                        <nav class="d-flex align-items-center">
                            <a href="index.html">Home<span class="lnr lnr-arrow-right"></span></a>
                            <a href="#">Shop<span class="lnr lnr-arrow-right"></span></a>
                            <a href="single-product.html">product-details</a>
                        </nav>
                    </div>
                </div>
            </div>
        </section>
        <!-- End Banner Area -->

        <!--================Single Product Area =================-->
        <div class="product_image_area">
            <div class="container">
                <div class="row s_product_inner">
                    <div class="col-lg-6">
                        <div class="s_Product_carousel">
                            <div class="single-prd-item">
                                <img class="img-fluid" src="${product.getImageUrl()}" alt="">
                            </div>
                            <div class="single-prd-item">
                                <img class="img-fluid" src="${product.getImageUrl()}" alt="">
                            </div>
                            <div class="single-prd-item">
                                <img class="img-fluid" src="${product.getImageUrl()}" alt="">
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-5 offset-lg-1">
                        <div class="s_product_text">
                            <h3>${product.getProductName()}</h3>
                            <h2>$${product.getPrice()}</h2>
                            <ul class="list">
                                <li><a class="active" href="#"><span>Category</span> : ${categoryName}</a></li>
                                <li><a href="#"><span>Availibility</span> : In Stock</a></li>
                            </ul>
                            <p>${product.getDescription()}</p>
                            <div class="product_count">
                                <label for="qty">Quantity:</label>
                                <!--                                <input type="text" name="qty" id="sst" maxlength="12" value="1" title="Quantity:" class="input-text qty">-->
                                <input id="quantity_product_${product.getProductID()}" class="input-text qty" min="1" type="number" name="quantity" value="1">
                            </div>
                            <div class="card_area d-flex align-items-center">
                                <a class="primary-btn" onclick="addToCartDetailAsync(${product.getProductID()}, 1)">Add to Cart</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--================End Single Product Area =================-->

        <!--================Product Description Area =================-->
        <section class="product_description_area">
            <div class="container">
                <ul class="nav nav-tabs" id="myTab" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Description</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile"
                           aria-selected="false">Specification</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link active" id="review-tab" data-toggle="tab" href="#review" role="tab" aria-controls="review"
                           aria-selected="false">Comments</a>
                    </li>
                </ul>
                <div class="tab-content" id="myTabContent">
                    <div class="tab-pane fade" id="home" role="tabpanel" aria-labelledby="home-tab">
                        <p>Beryl Cook is one of Britain’s most talented and amusing artists .Beryl’s pictures feature women of all shapes
                            and sizes enjoying themselves .Born between the two world wars, Beryl Cook eventually left Kendrick School in
                            Reading at the age of 15, where she went to secretarial school and then into an insurance office. After moving to
                            London and then Hampton, she eventually married her next door neighbour from Reading, John Cook. He was an
                            officer in the Merchant Navy and after he left the sea in 1956, they bought a pub for a year before John took a
                            job in Southern Rhodesia with a motor company. Beryl bought their young son a box of watercolours, and when
                            showing him how to use it, she decided that she herself quite enjoyed painting. John subsequently bought her a
                            child’s painting set for her birthday and it was with this that she produced her first significant work, a
                            half-length portrait of a dark-skinned lady with a vacant expression and large drooping breasts. It was aptly
                            named ‘Hangover’ by Beryl’s husband and</p>
                        <p>It is often frustrating to attempt to plan meals that are designed for one. Despite this fact, we are seeing
                            more and more recipe books and Internet websites that are dedicated to the act of cooking for one. Divorce and
                            the death of spouses or grown children leaving for college are all reasons that someone accustomed to cooking for
                            more than one would suddenly need to learn how to adjust all the cooking practices utilized before into a
                            streamlined plan of cooking that is more efficient for one person creating less</p>
                    </div>
                    <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                        <div class="table-responsive">
                            <table class="table">
                                <tbody>
                                    <tr>
                                        <td>
                                            <h5>Width</h5>
                                        </td>
                                        <td>
                                            <h5>128mm</h5>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <h5>Height</h5>
                                        </td>
                                        <td>
                                            <h5>508mm</h5>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <h5>Depth</h5>
                                        </td>
                                        <td>
                                            <h5>85mm</h5>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <h5>Weight</h5>
                                        </td>
                                        <td>
                                            <h5>52gm</h5>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <h5>Quality checking</h5>
                                        </td>
                                        <td>
                                            <h5>yes</h5>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <h5>Freshness Duration</h5>
                                        </td>
                                        <td>
                                            <h5>03days</h5>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <h5>When packeting</h5>
                                        </td>
                                        <td>
                                            <h5>Without touch of hand</h5>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <h5>Each Box contains</h5>
                                        </td>
                                        <td>
                                            <h5>60pcs</h5>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">

                    </div>
                    <div class="tab-pane fade show active" id="review" role="tabpanel" aria-labelledby="review-tab">
                        <div class="row">
                            <div class="col-lg-6">
                                <ul id="comment_list">
                                    <c:forEach var="D" items="${listCmt}">

                                        <li class="review_item">
                                            <div class="media">
                                                <div class="d-flex">
                                                    <img src="img/blankAvatar.jpg" style="border-radius: 50%" width="70" height="70" alt="">
                                                </div>
                                                <div class="media-body">
                                                    <h4>${D.getDisplayName()}</h4>
                                                    <h5>${D.getPostedDate()}</h5>
                                                    <!--                                                    <a class="reply_btn" href="#">Reply</a>-->
                                                </div>
                                            </div>
                                            <p>${D.getContent()}</p>
                                        </li>






                                    </c:forEach>


                                </ul>
                            </div>
                            <div class="col-lg-6">
                                <div class="review_box">
                                    <h4>Post a comment</h4>
                                    <c:choose>
                                        <c:when test="${sessionScope.account !=null}">
                                            <form class="row contact_form" action="comment" method="post"  >
                                                <div class="col-md-12">

                                                    <div class="form-group">
                                                        <textarea class="form-control" id="message" name="message" rows="1" placeholder="Message"></textarea>
                                                    </div>
                                                </div>
                                                <input type="hidden" name="productIdComment" class="productIdComment" value="${product.getProductID()}" />
                                                <input type="hidden"  class="displayNameComment" value="${sessionScope.account.displayName}" />
                                                <input type="hidden"  class="" value="${product.getProductID()}" />
                                                <div class="col-md-12 text-right">
                                                    <a type="button" onclick="addCommentAsync('', ${product.getProductID()})" value="submit" class="btn primary-btn">Post comment</a>
                                                </div>
                                            </form>
                                        </c:when>
                                        <c:otherwise>
                                            <a class="nav-link" href="login">Login to comment</a>
                                        </c:otherwise>
                                    </c:choose>


                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--================End Product Description Area =================-->

        <!-- Start related-product Area -->
        <section class="related-product-area section_gap_bottom">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-6 text-center">
                        <div class="section-title">
                            <h1>Related Products</h1>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore
                                magna aliqua.</p>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-9">
                        <div class="row">
                            <c:forEach var="D" items="${relatedProducts}">
                                <div class="col-lg-4 col-md-4 col-sm-6 mb-20">
                                    <div class="single-related-product d-flex">
                                        <a href="#"><img src="${D.getImageUrl()}" width="70" height="70" alt=""></a>
                                        <div class="desc">
                                            <a href="#" class="title">${D.getProductName()}</a>
                                            <div class="price">
                                                <h6>$${D.getPrice()}</h6>
                                                <h6 class="l-through">$${D.getPrice()+50}</h6>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>

                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="ctg-right">
                            <a href="#" target="_blank">
                                <img class="img-fluid d-block mx-auto" src="img/category/c5.jpg" alt="">
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End related-product Area -->

        <!-- start footer Area -->
        <footer class="footer-area section_gap">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3  col-md-6 col-sm-6">
                        <div class="single-footer-widget">
                            <h6>About Us</h6>
                            <p>
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore dolore
                                magna aliqua.
                            </p>
                        </div>
                    </div>
                    <div class="col-lg-4  col-md-6 col-sm-6">
                        <div class="single-footer-widget">
                            <h6>Newsletter</h6>
                            <p>Stay update with our latest</p>
                            <div class="" id="mc_embed_signup">

                                <form target="_blank" novalidate="true" action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01"
                                      method="get" class="form-inline">

                                    <div class="d-flex flex-row">

                                        <input class="form-control" name="EMAIL" placeholder="Enter Email" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Email '"
                                               required="" type="email">


                                        <button class="click-btn btn btn-default"><i class="fa fa-long-arrow-right" aria-hidden="true"></i></button>
                                        <div style="position: absolute; left: -5000px;">
                                            <input name="b_36c4fd991d266f23781ded980_aefe40901a" tabindex="-1" value="" type="text">
                                        </div>

                                        <!-- <div class="col-lg-4 col-md-4">
                                                                <button class="bb-btn btn"><span class="lnr lnr-arrow-right"></span></button>
                                                        </div>  -->
                                    </div>
                                    <div class="info"></div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3  col-md-6 col-sm-6">
                        <div class="single-footer-widget mail-chimp">
                            <h6 class="mb-20">Instragram Feed</h6>
                            <ul class="instafeed d-flex flex-wrap">
                                <li><img src="img/i1.jpg" alt=""></li>
                                <li><img src="img/i2.jpg" alt=""></li>
                                <li><img src="img/i3.jpg" alt=""></li>
                                <li><img src="img/i4.jpg" alt=""></li>
                                <li><img src="img/i5.jpg" alt=""></li>
                                <li><img src="img/i6.jpg" alt=""></li>
                                <li><img src="img/i7.jpg" alt=""></li>
                                <li><img src="img/i8.jpg" alt=""></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-6 col-sm-6">
                        <div class="single-footer-widget">
                            <h6>Follow Us</h6>
                            <p>Let us be social</p>
                            <div class="footer-social d-flex align-items-center">
                                <a href="#"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-dribbble"></i></a>
                                <a href="#"><i class="fa fa-behance"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="footer-bottom d-flex justify-content-center align-items-center flex-wrap">
                    <p class="footer-text m-0"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    </p>
                </div>
            </div>
        </footer>
        <!-- End footer Area -->

        <script src="js/vendor/jquery-2.2.4.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
        crossorigin="anonymous"></script>
        <script src="js/vendor/bootstrap.min.js"></script>
        <script src="js/jquery.ajaxchimp.min.js"></script>
        <script src="js/jquery.nice-select.min.js"></script>
        <script src="js/jquery.sticky.js"></script>
        <script src="js/nouislider.min.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <!--gmaps Js-->
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjCGmQ0Uq4exrzdcL6rvxywDDOvfAu6eE"></script>
        <script src="js/gmaps.min.js"></script>
        <script src="js/main.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
        <script>

                            function addToCartDetailAsync(productId, quantity) {
                                quantity = document.getElementById("quantity_product_" + productId).value;
                                console.log(quantity);
                                axios.get('add-cart-detail-async', {
                                    params: {
                                        productId: productId,
                                        quantity: quantity
                                    }
                                }).then((response) => {
                                    console.log(response);
                                    document.getElementById("cart_number").innerHTML = response.data;
                                });
                            }

                            function addCommentAsync(message, productId) {
                                message = document.getElementById("message").value;
                                axios.get('comment-async', {
                                    params: {
                                        message: message,
                                        productId: productId
                                    }
                                }).then((response) => {
                                    console.log(response);
                                    var result = response.data;
                                    const arrayResult = result.split("|");
                                    var displayName = arrayResult[0];
                                    var postedDate = arrayResult[1];
                                    const commentList = document.getElementById('comment_list');

                                    var newMessage = document.getElementById("message").value;
                                    const newComment = document.createElement("li");
                                    newComment.classList.add("review_item");
                                    newComment.innerHTML = "<div class='media'><div class='d-flex'><img src='img/product/review-1.png' alt=''></div><div class='media-body'><h4>" + displayName + "</h4><h5>" + postedDate + "</h5></div></div><p>" + newMessage + "</p>"


                                    console.log(newComment);
                                    commentList.prepend(newComment);
                                    document.getElementById("message").value = "";

                                })
                            }

                            function replyCommentAsync() {

                            }
        </script>

    </body>

</html>
