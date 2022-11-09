<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : detail
    Created on : Apr 21, 2022, 5:13:59 PM
    Author     : toten
--%>

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
        <link href="css/styles.css" rel="stylesheet" />
        <style>
            .navbar {
                position: sticky;
                top: 0;
                z-index: 9;
                box-shadow: 0 0 3px 0 #888888;
            }
        </style>
    </head>
    <body>
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="home">Start Bootstrap</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="home">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">About</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#!">All Products</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="#!">Popular Items</a></li>
                                <li><a class="dropdown-item" href="#!">New Arrivals</a></li>
                            </ul>
                        </li>
                    </ul>
                    <form action="search" method="POST" class="d-flex mx-auto">
                        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="searchContent">
                        <button class="btn btn-outline-dark" type="submit">Search</button>
                    </form>
                    <div class="d-flex my-2">
                        <a class="btn btn-outline-dark" href="carts">
                            <i class="bi-cart-fill me-1"></i>
                            Cart
                            <span id="cart_number" class="badge bg-dark text-white ms-1 rounded-pill">${sessionScope.carts.size()}</span>
                        </a>
                    </div>
                    <c:choose>
                        <c:when test="${sessionScope.account !=null}">
                            <button class="btn btn-outline-dark ms-lg-2">${sessionScope.account.displayName}</button>
                            <a class="btn btn-outline-dark ms-lg-2" href="logout">Logout</a>
                        </c:when>
                        <c:otherwise>
                            <a class="btn btn-outline-dark ms-lg-2" href="login">Login</a>
                        </c:otherwise>
                    </c:choose>


                </div>
            </div>
        </nav>
        <!-- Header-->
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">Shop in style</h1>
                    <p class="lead fw-normal text-white-50 mb-0">With this shop hompeage template</p>
                </div>
            </div>
        </header>
        <!-- Section -->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row">
                    <div class="col-md-6 mb-sm-5">
                        <h3>Id: ${productId}</h3>
                        <div class="list-group">
                            <img class="card-img-top" src="${product.getImageUrl()}" alt="..." />
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="d-flex justify-content-end">
                            <h3>Product</h3>
                        </div>
                        <div class="justify-content-center">
                            <div class="">
                                <!-- Product details-->
                                <div class="">
                                    <div class="">
                                        <!-- Product name-->

                                        <h1 class="fw-bolder">${product.getProductName()}</h1>
                                        <span class="d-flex justify-content-start align-items-center">
                                            <h5 style="padding-right: 10px">Đánh giá:</h5>
                                            <div class="d-flex justify-content-start small text-warning mb-2 ml-5">
                                                <div class="bi-star-fill"></div>
                                                <div class="bi-star-fill"></div>
                                                <div class="bi-star-fill"></div>
                                                <div class="bi-star-fill"></div>
                                                <div class="bi-star-fill"></div>
                                            </div>
                                        </span>
                                        <span class="d-flex justify-content-start align-items-center bg-dark bg-opacity-10 mb-4">
                                            <h2 style="margin: 0; padding: 5px 0px 5px 20px">${product.getPrice()}$</h2>

                                        </span>
                                        <p class="mb-4">${product.getDescription()}</p>
                                        <!-- Product reviews-->

                                        <!-- Product price-->

                                    </div>
                                </div>
                                <!-- Product actions-->
                                <div class="d-flex justify-content-start border-top-0 bg-transparent">
                                    <div class=""><a class="btn btn-outline-dark mt-auto" onclick="addToCartAsync(${product.getProductID()})">Add to cart</a></div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <pagination class="pagination" total-items="5" item-per-page="3" max-size="3">

                    </pagination>
                </div>

            </div>
        </section>
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2022</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
        <script>
            function addToCartAsync(productId) {
                axios.get('add-cart-async', {
                    params: {
                        productId: productId
                    }
                }).then((response)=>{
                    console.log(response);
                    document.getElementById("cart_number").innerHTML = response.data;
                });
            }
        </script>
    </body>
</html>
