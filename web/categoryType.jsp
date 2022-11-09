<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : category
    Created on : Jun 25, 2022, 6:41:16 PM
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
        <link rel="stylesheet" href="css/owl.carousel.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="css/themify-icons.css">
        <link rel="stylesheet" href="css/nice-select.css">
        <link rel="stylesheet" href="css/nouislider.min.css">
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/main.css">
        <style>
            .sidebar-categories .head {
                line-height: 60px;
                background: linear-gradient(90deg, #ffba00 0%, #ff6c00 100%);
                padding: 0 30px;
                font-size: 16px;
                font-weight: 400;
                color: #fff;
            }
            .filter-bar {
                padding: 0px 20px 10px 20px;
                background: linear-gradient(90deg, #ffba00 0%, #ff6c00 100%);
            }


        </style>
    </head>

    <body id="category">

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
                                        <li class="nav-item active"><a class="nav-link" href="home">Shop Category</a></li>
                                        <li class="nav-item"><a class="nav-link" href="checkout.html">Product Checkout</a></li>
                                        <li class="nav-item"><a class="nav-link" href="carts">Shopping Cart</a></li>
                                        <li class="nav-item"><a class="nav-link" href="confirmation.html">Confirmation</a></li>
                                    </ul>
                                </li>
                                <li class="nav-item submenu dropdown">
                                    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                                       aria-expanded="false">Blog</a>
                                    <ul class="dropdown-menu">
                                        <li class="nav-item"><a class="nav-link" href="blog.html">Blog</a></li>
                                        <li class="nav-item"><a class="nav-link" href="single-blog.html">Blog Details</a></li>
                                    </ul>
                                </li>
                                <li class="nav-item submenu dropdown">
                                    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                                       aria-expanded="false">Pages</a>
                                    <ul class="dropdown-menu">
                                        <li class="nav-item">

                                        </li>
                                        <li class="nav-item"><a class="nav-link" href="tracking.html">Tracking</a></li>
                                        <li class="nav-item"><a class="nav-link" href="elements.html">Elements</a></li>
                                    </ul>
                                </li>
                                <li class="nav-item"><a class="nav-link" href="contact.html">Contact</a></li>

                                <li class="nav-item submenu dropdown">
                                    <c:choose>
                                        <c:when test="${sessionScope.account !=null}">
                                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                                               aria-expanded="false">${sessionScope.account.displayName}</a>
                                            <ul class="dropdown-menu">
                                                <c:choose>
                                                    <c:when test="${(sessionScope.account.role) == 'ADMIN'}">
                                                        <li class="nav-item"><a class="nav-link" href="dashboard">Dashboard</a></li>
                                                        <li class="nav-item"><a class="nav-link" href="tracking.html">My Account</a></li>
                                                        </c:when>
                                                        <c:otherwise>
                                                        <li class="nav-item"><a class="nav-link" href="tracking.html">My Account</a></li>
                                                        </c:otherwise>
                                                    </c:choose>
                                                <li class="nav-item"><a class="nav-link" href="tracking.html">Tracking</a></li>
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
                    <form action="search" method="POST" class="d-flex justify-content-between">
                        <input type="text" class="form-control" id="search_input" name="searchContent" placeholder="Search Here">
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
                        <h1>Shop Category page</h1>
                        <nav class="d-flex align-items-center">
                            <a href="index.html">Home<span class="lnr lnr-arrow-right"></span></a>
                            <a href="#">Shop<span class="lnr lnr-arrow-right"></span></a>
                            <a href="category.html">Fashon Category</a>
                        </nav>
                    </div>
                </div>
            </div>
        </section>
        <!-- End Banner Area -->
        <div class="container">
            <div class="row">
                <div class="col-xl-3 col-lg-4 col-md-5">
                    <div class="sidebar-categories">
                        <div class="head">Browse Categories</div>
                        <ul class="main-categories">

                            <c:forEach items="${listCategory}" var="D">
                                <li class="main-nav-list">
                                    <a href="filter-category?categoryId=${D.categoryID}" class="${D.categoryID==categoryIDFilter?"active bg-warning":""}" aria-expanded="false" aria-controls=""><span
                                            class="lnr lnr-arrow-right"></span>${D.getCategoryName()}<span class="number"></span></a>
                                </li>

                            </c:forEach>

                        </ul>
                    </div>

                </div>
                <div class="col-xl-9 col-lg-8 col-md-7">
                    <!-- Start Filter Bar -->
                    <div class="filter-bar d-flex flex-wrap align-items-center">
                        <div class="sorting">

                        </div>
                        <div class="sorting mr-auto">

                        </div>
                        <div class="pagination">
                            <c:choose>
                                <c:when test="${listInteger!=null}">
                                    <a href="home?page=${pageStr-1}" class="prev-arrow"><i class="fa fa-long-arrow-left" aria-hidden="true"></i></a>
                                        <c:forEach var="D" items="${listInteger}">
                                        <a href="home?page=${D}" class="${pageStr==D?"active":""}">${D}</a>
                                    </c:forEach>


                                    <a href="home?page=${pageStr+1}" class="next-arrow"><i class="fa fa-long-arrow-right" aria-hidden="true"></i></a>
                                    </c:when>
                                    <c:otherwise>
                                    <a href="#" class="prev-arrow"><i class="fa fa-long-arrow-left" aria-hidden="true"></i></a>

                                    <a href="#" class="active">1</a>



                                    <a href="#" class="next-arrow"><i class="fa fa-long-arrow-right" aria-hidden="true"></i></a>
                                    </c:otherwise>
                                </c:choose>


                        </div>
                    </div>
                    <!-- End Filter Bar -->
                    <!-- Start Best Seller -->
                    <section class="lattest-product-area pb-40 category-list">
                        <div class="row">

                            <!-- single product -->
                            <c:forEach items="${listProduct}" var="D">
                                <div class="col-lg-4 col-md-6">
                                    <div class="single-product">
                                        <a href="detail?productId=${D.productID}">
                                            <img class="img-fluid" style="height: 18rem" src="${D.getImageUrl()}" alt="${D.getProductName()}">
                                        </a>

                                        <div class="product-details">
                                            <h6>${D.getProductName()}</h6>
                                            <div class="price">
                                                <h6>$${D.getPrice()}</h6>
                                                <h6 class="l-through">$${D.getPrice()+50}</h6>
                                            </div>
                                            <div class="prd-bottom">

                                                <a onclick="addToCartAsync(${D.productID})" class="social-info">
                                                    <span class="ti-bag" style="cursor: pointer"></span>
                                                    <p class="hover-text" style="cursor: pointer">add to cart</p>
                                                </a>

                                                <a href="detail?productId=${D.productID}" class="social-info">
                                                    <span class="lnr lnr-move"></span>
                                                    <p class="hover-text" style="cursor: pointer">view more</p>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>

                        </div>
                    </section>
                    <!-- End Best Seller -->
                    <!-- Start Filter Bar -->
                    <div class="filter-bar d-flex flex-wrap align-items-center">
                        <div class="sorting mr-auto">

                        </div>
                        <div class="pagination">
                            <c:choose>
                                <c:when test="${listInteger!=null}">
                                    <a href="home?page=${pageStr-1}" class="prev-arrow"><i class="fa fa-long-arrow-left" aria-hidden="true"></i></a>
                                        <c:forEach var="D" items="${listInteger}">
                                        <a href="home?page=${D}" class="${pageStr==D?"active":""}">${D}</a>
                                    </c:forEach>


                                    <a href="home?page=${pageStr+1}" class="next-arrow"><i class="fa fa-long-arrow-right" aria-hidden="true"></i></a>
                                    </c:when>
                                    <c:otherwise>
                                    <a href="#" class="prev-arrow"><i class="fa fa-long-arrow-left" aria-hidden="true"></i></a>

                                    <a href="#" class="active">1</a>



                                    <a href="#" class="next-arrow"><i class="fa fa-long-arrow-right" aria-hidden="true"></i></a>
                                    </c:otherwise>
                                </c:choose>
                        </div>
                    </div>
                    <!-- End Filter Bar -->
                </div>
            </div>
        </div>

        <!-- Start related-product Area -->
        <section class="related-product-area section_gap_bottom">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-6 text-center">
                        <div class="section-title">
                            <h1>Product of the month</h1>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-9">
                        <div class="row">
                            <c:forEach var="D" items="${dealOfTheMonth}">
                                 <div class="col-lg-4 col-md-4 col-sm-6 mb-20">
                                    <div class="single-related-product d-flex">
                                        <a href="detail?productId=${D.productID}"><img src="${D.getImageUrl()}" width="70" height="70" alt=""></a>
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
        <c:forEach var="D" items="${listAll}">
            <div class="itemsCategory" style="display: none">
                <div class="single-product">
                    <a href="detail?productId=${D.productID}">
                        <img class="img-fluid" style="height: 18rem" src="${D.getImageUrl()}" alt="${D.getProductName()}">
                    </a>

                    <div class="product-details">
                        <h6>${D.getProductName()}</h6>
                        <div class="price">
                            <h6>$${D.getPrice()}</h6>
                            <h6 class="l-through">$${D.getPrice()+50}</h6>
                        </div>
                        <div class="prd-bottom">

                            <a onclick="addToCartAsync(${D.productID})" class="social-info">
                                <span class="ti-bag" style="cursor: pointer"></span>
                                <p class="hover-text" style="cursor: pointer">add to cart</p>
                            </a>

                            <a href="detail?productId=${D.productID}" class="social-info">
                                <span class="lnr lnr-move"></span>
                                <p class="hover-text" style="cursor: pointer">view more</p>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>


        <!-- start footer Area -->
        <footer class="footer-area section_gap">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3  col-md-6 col-sm-6">
                        <div class="single-footer-widget">
                            <h6>About Us</h6>
                            <p>
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore dolore magna aliqua.
                            </p>
                        </div>
                    </div>
                    <div class="col-lg-4  col-md-6 col-sm-6">
                        <div class="single-footer-widget">
                            <h6>Newsletter</h6>
                            <p>Stay update with our latest</p>
                            <div class="" id="mc_embed_signup">

                                <form target="_blank" novalidate="true" action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01" method="get" class="form-inline">

                                    <div class="d-flex flex-row">

                                        <input class="form-control" name="EMAIL" placeholder="Enter Email" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Email '" required="" type="email">


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
                    <p class="footer-text m-0">
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        Copyright &copy;
                        <script>
                            document.write(new Date().getFullYear());
                        </script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    </p>
                </div>
            </div>
        </footer>
        <!-- End footer Area -->

        <!-- Modal Quick Product View -->
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="container relative">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <div class="product-quick-view">
                        <div class="row align-items-center">
                            <div class="col-lg-6">
                                <div class="quick-view-carousel">
                                    <div class="item" style="background: url(img/organic-food/q1.jpg);">

                                    </div>
                                    <div class="item" style="background: url(img/organic-food/q1.jpg);">

                                    </div>
                                    <div class="item" style="background: url(img/organic-food/q1.jpg);">

                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="quick-view-content">
                                    <div class="top">
                                        <h3 class="head">Mill Oil 1000W Heater, White</h3>
                                        <div class="price d-flex align-items-center"><span class="lnr lnr-tag"></span> <span class="ml-10">$149.99</span></div>
                                        <div class="category">Category: <span>Household</span></div>
                                        <div class="available">Availibility: <span>In Stock</span></div>
                                    </div>
                                    <div class="middle">
                                        <p class="content">Mill Oil is an innovative oil filled radiator with the most modern technology. If you are looking for something that can make your interior look awesome, and at the same time give you the pleasant warm feeling during
                                            the winter.</p>
                                        <a href="#" class="view-full">View full Details <span class="lnr lnr-arrow-right"></span></a>
                                    </div>
                                    <div class="bottom">
                                        <div class="color-picker d-flex align-items-center">Color:
                                            <span class="single-pick"></span>
                                            <span class="single-pick"></span>
                                            <span class="single-pick"></span>
                                            <span class="single-pick"></span>
                                            <span class="single-pick"></span>
                                        </div>
                                        <div class="quantity-container d-flex align-items-center mt-15">
                                            Quantity:
                                            <input type="text" class="quantity-amount ml-15" value="1" />
                                            <div class="arrow-btn d-inline-flex flex-column">
                                                <button class="increase arrow" type="button" title="Increase Quantity"><span class="lnr lnr-chevron-up"></span></button>
                                                <button class="decrease arrow" type="button" title="Decrease Quantity"><span class="lnr lnr-chevron-down"></span></button>
                                            </div>

                                        </div>
                                        <div class="d-flex mt-20">
                                            <a href="#" class="view-btn color-2"><span>Add to Cart</span></a>
                                            <a href="#" class="like-btn"><span class="lnr lnr-layers"></span></a>
                                            <a href="#" class="like-btn"><span class="lnr lnr-heart"></span></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>



        <script src="js/vendor/jquery-2.2.4.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
        <script src="js/vendor/bootstrap.min.js"></script>
        <script src="js/jquery.ajaxchimp.min.js"></script>
        <script src="js/jquery.nice-select.min.js"></script>
        <script src="js/jquery.sticky.js"></script>
        <script src="js/nouislider.min.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/Pagination.js"></script>

        <!--gmaps Js-->
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjCGmQ0Uq4exrzdcL6rvxywDDOvfAu6eE"></script>
        <script src="js/gmaps.min.js"></script>
        <script src="js/main.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
        <script>
                            let getAllItems = document.querySelectorAll('.single-product');
                            console.log(getAllItems);
                            getAllItems.forEach(function (elem, index) {
                                console.log(elem); // value
                            });

                            function addToCartAsync(productId) {
                                axios.get('add-cart-async', {
                                    params: {
                                        productId: productId
                                    }
                                }).then((response) => {

//                            Lay data thanh cong va cap nhat view
                                    document.getElementById("cart_number").innerHTML = response.data;
//                            Cập nhật view
                                });
                            }

                            function simpleTemplating(data) {
                                var html = '<div class="col-lg-4 col-md-6">';
                                $.each(data, function (index, item) {
                                    html += '<div></div>';
                                });
                                html += '</div>';
                                return html;
                            }

                            $('#demo').pagination({
                                dataSource: getAllItems,
                                pageSize: 5,
                                showPrevious: true,
                                showNext: true,
                                callback: function (data, pagination) {
                                    // template method of yourself
                                    var html = simpleTemplating(data);
                                    dataContainer.html(html);
                                }
                            })
        </script>
    </body>

</html>
