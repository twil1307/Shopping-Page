<%-- 
    Document   : checkout
    Created on : Apr 22, 2022, 4:48:28 PM
    Author     : toten
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
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
        <body>
            <!-- Navigation-->
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
                        <form action="search" method="POST" class="d-flex justify-content-between">
                            <input type="text" class="form-control" id="search_input" name="searchContent" placeholder="Search Here">
                            <button type="submit" class="btn"></button>
                            <span class="lnr lnr-cross" id="close_search" title="Close Search"></span>
                        </form>
                    </div>
                </div>
            </header>
            <!-- Header-->
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

            <!-- Section -->
            <section class="py-5">
                <div class="container">
                    <div class="row">
                        <div class="col-md-8" style="border: 1px solid #ccc; border-radius: 5px; padding: 1rem">

                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">Image</th>
                                        <th scope="col">Name</th>
                                        <th scope="col">Price</th>
                                        <th scope="col">Quantity</th>
                                        <th scope="col">Total price</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${carts}" var="D">
                                        <tr>
                                            <th scope="row">${D.value.product.productID}</th>
                                            <td><img src="${D.value.product.imageUrl}" width="50"/> </td>
                                            <td>${D.value.product.productName}</td>
                                            <td>${D.value.product.price}</td>
                                            <td>${D.value.quantity}</td>
                                            <td>${D.value.product.price*D.value.quantity}</td>
                                        </tr>

                                    </c:forEach>


                                </tbody>
                            </table>
                            <h3>Total Amount: ${totalAmount} $</h3>

                        </div>
                        <div class="col-md-4" style="border: 1px solid #ccc; border-radius: 5px; padding: 1rem">
                            <h3>Information of customer</h3>
                            <form action="checkout" method="POST">
                                <div class="mb-3">
                                    <label for="name" class="form-label">Name</label>
                                    <input type="text" class="form-control" id="name" name="name" aria-describedby="emailHelp">

                                </div>
                                <div class="mb-3">
                                    <label for="phone" class="form-label">Phone</label>
                                    <input type="text" class="form-control" id="phone" name="phone" aria-describedby="emailHelp">

                                </div>
                                <div class="mb-3">
                                    <label for="address" class="form-label">Address</label>
                                    <input type="text" class="form-control" id="address" name="address" aria-describedby="emailHelp">

                                </div>
                                <div class="mb-3">
                                    <label for="note" class="form-label">Note</label>
                                    <textarea class="form-control" id="note" name="note" rows="3"></textarea>

                                </div>

                                <input type="hidden" name="totalPrice" value="${totalAmount}$" />
                                <button type="submit" class="btn btn-outline-dark btn-lg btn-block">Submit</button>
                            </form>
                        </div>
                    </div>





                </div>
            </section>
            <!-- Footer-->
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
            <!-- Bootstrap core JS-->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
            <!-- Core theme JS-->
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
            <script src="js/scripts.js"></script>
        </body>
    </html>
