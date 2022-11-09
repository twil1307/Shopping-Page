<%-- 
    Document   : detail
    Created on : Apr 21, 2022, 5:13:59 PM
    Author     : toten
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Shop Homepage - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->

        <link rel="stylesheet" href="css/linearicons.css">
        <link rel="stylesheet" href="css/owl.carousel.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="css/themify-icons.css">
        <link rel="stylesheet" href="css/nice-select.css">
        <link rel="stylesheet" href="css/nouislider.min.css">
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/main.css">
        <link href="css/styles.css" rel="stylesheet" />

        <style>

            * {
                padding: 0;


                margin: 0;


                border: none;


            }

            .navbar {
                position: sticky;
                top: 0;
                z-index: 9;
                box-shadow: 0 0 3px 0 #888888;
            }

            .popUpNotification {
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(24, 100, 119, 0.5);
                display: flex;
                justify-content: center;
                align-items: center;
                z-index: 99;
                -webkit-transition:  .20s ease-in-out;
                transition: .20s ease-in-out;
                display: none;
            }
            .notificationDel {
                background-color: white;
                display: flex;
                justify-content: center;
                align-items: center;
                flex-direction: column;
                padding: 30px;
                border-radius: 10px;
            }

            .buttonConfirm {
                width: 40%;
                display: flex;
                justify-content: space-around;
            }
        </style>
    </head>
    <body>
        <!-- Start Header Area -->
        <header class="header_area sticky-header">
            <div class="main_menu">
                <nav class="navbar navbar-expand-lg navbar-light main_box">
                    <div class="container">
                        <!-- Brand and toggle get grouped for better mobile display -->
                        <a class="navbar-brand logo_h" href="welcome"><img src="img/logo.png" alt=""></a>
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
                                        <li class="nav-item"><a class="nav-link" href="cart.html">Shopping Cart</a></li>
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
                        <h1>Shopping Cart</h1>
                        <nav class="d-flex align-items-center">
                            <a href="home" style="text-decoration: none">Home<span class="lnr lnr-arrow-right"></span></a>
                            <a href="carts" style="text-decoration: none">Cart</a>
                        </nav>
                    </div>
                </div>
            </div>
        </section>

        <!-- Section -->
        <section class="py-5">
            <div class="container" >
                <c:choose>
                    <c:when test="${sessionScope.carts.size()>0 || sessionScope.carts!=null}">
                        <table class="table" id="table">
                            <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Image</th>
                                    <th scope="col">Name</th>
                                    <th scope="col">Price</th>
                                    <th scope="col">Quantity</th>
                                    <th scope="col">Total price</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${carts}" var="D">
                                <form action="update-quantity?productId=${D.value.product.productID}" method="POST">
                                    <tr id="product_${D.value.product.productID}" >
                                        <th scope="row">${D.value.product.productID}</th>
                                        <td><img src="${D.value.product.imageUrl}" width="60" height="60"/> </td>
                                        <td>${D.value.product.productName}</td>
                                        <td>${D.value.product.price}</td>
                                        <td><input id="quantity_product_${D.value.product.productID}" onchange="updateCartAsync(${D.value.product.productID}); autoDeleteCart(${D.value.product.productID})" min="0" type="number" name="quantity" value="${D.value.quantity}"></td>
                                        <td id="totalOfAProduct_${D.value.product.productID}">$${D.value.product.price*D.value.quantity}</td>
                                        <td><a class="btn btn-outline-danger" onclick="deleteCartAsync(${D.value.product.productID})"><i class="bi bi-trash"></i> Delete</a></td>
                                    </tr>
                                </form>

                            </c:forEach>
                            </tbody>
                        </table>
                        <h3>Total Amount: $<span id="totalAmount">${totalAmount}</span></h3>
                        <div class="popUpNotification">
                            <div class="notificationDel">
                                <h3>Do you want to delete</h3> <br>
                                <div class="buttonConfirm">
                                    <input class="btn btn-danger agreeDel" onclick="" type="button" value="Yes" /><input class="btn btn-success disAgree" onclick="" type="button" value="No" />
                                </div>

                            </div>
                        </div>
                        <div class="d-grid gap-2">
                            <a class="btn btn-warning" style="background: linear-gradient(90deg, #ffba00 0%, #ff6c00 100%); color: white; font-weight: 700" type="button" href="checkout">Checkout</a>



                        </div>
                    </c:when>
                    <c:otherwise>
                        <h1 style="text-align: center">Cart empty</h1>
                    </c:otherwise>
                </c:choose>
                        




            </div>



        </section>
        <!-- start footer Area -->
        <footer class="footer-area section_gap">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3  col-md-6 col-sm-6">
                        <div class="single-footer-widget">
                            <h6>About Us</h6>
                            <p style="color: #777777">
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt
                                ut labore dolore
                                magna aliqua.
                            </p>
                        </div>
                    </div>
                    <div class="col-lg-4  col-md-6 col-sm-6">
                        <div class="single-footer-widget">
                            <h6>Newsletter</h6>
                            <p style="color: #777777">Stay update with our latest</p>
                            <div class="" id="mc_embed_signup">

                                <form target="_blank" novalidate="true" action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01"
                                      method="get" class="form-inline">

                                    <div class="d-flex flex-row">

                                        <input class="form-control" name="EMAIL" placeholder="Enter Email" onfocus="this.placeholder = ''"
                                               onblur="this.placeholder = 'Enter Email '" required="" type="email">


                                        <button class="click-btn btn btn-default"><i class="fa fa-long-arrow-right"
                                                                                     aria-hidden="true"></i></button>
                                        <div style="position: absolute; left: -5000px;">
                                            <input name="b_36c4fd991d266f23781ded980_aefe40901a" tabindex="-1" value=""
                                                   type="text">
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
                            <p style="color: #777777">Let us be social</p>
                            <div class="footer-social d-flex align-items-center">
                                <a href="#"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-dribbble"></i></a>
                                <a href="#"><i class="fa fa-behance"></i></a>
                            </div>
                        </div>
                    </div>
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
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
        <script>
                                                   function deleteCartAsync(productId) {
                                                       axios.get('delete-cart-async', {
                                                           params: {
                                                               productId: productId
                                                           }
                                                       }).then((response) => {
                                                           console.log(response);
                                                           var result = response.data;
                                                           const arrayResult = result.split("|");

                                                           var element = document.getElementById("product_" + productId);
                                                           element.parentNode.removeChild(element);
                                                           document.getElementById("totalAmount").innerHTML = arrayResult[1];
                                                           document.getElementById("cart_number").innerHTML = arrayResult[0];


                                                       });
                                                   }

                                                   function updateCartAsync(productId) {
                                                       var quantity = document.getElementById("quantity_product_" + productId).value;
                                                       console.log(quantity);
                                                       console.log(productId);
                                                       axios.get('update-quantity-async', {
                                                           params: {
                                                               productId: productId,
                                                               quantity: quantity
                                                           }
                                                       }).then((response) => {
                                                           const arrayResult = response.data.split("|");

                                                           document.getElementById("totalOfAProduct_" + productId).innerHTML = arrayResult[1];
                                                           document.getElementById("totalAmount").innerHTML = arrayResult[2];
                                                       });
                                                   }

                                                   function autoDeleteCart(productId, total) {
                                                       var quantity = document.getElementById("quantity_product_" + productId).value;
                                                       if (quantity == 0) {
                                                           document.querySelector('.popUpNotification').style.display = "flex";
                                                           let yes = document.querySelector('.agreeDel');
                                                           let no = document.querySelector('.disAgree');
                                                           console.log(yes);

                                                           yes.onclick = function () {
                                                               deleteCartAsync(productId);
                                                               document.querySelector('.popUpNotification').style.display = "none";
                                                           }


                                                           no.onclick = function () {
                                                               document.querySelector('.popUpNotification').style.display = "none";
                                                               document.getElementById("quantity_product_" + productId).value = "1";
                                                               updateCartAsync(productId);

                                                           }
                                                       }
                                                       return;
                                                   }

//                                            function disapear() {
//                                                document.querySelector ('.popUpNotification').style.display = "none";
//                                                document.getElementById("quantity_product_" + productId).value = "1";
//                                            }


        </script>

        <script>


        </script>
    </body>
</html>
