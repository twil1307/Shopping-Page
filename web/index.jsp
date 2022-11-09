<%-- 
    Document   : index
    Created on : Apr 21, 2022, 9:32:23 AM
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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="/css/myCss.css" rel="stylesheet" />
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
        <nav class="navbar navbar-expand-lg navbar-light bg-light" style="sticky">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="#!">Start Bootstrap</a>
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
                            <div class="btn-group">
                                <button type="button" class="btn btn-outline-dark dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                                    ${sessionScope.account.displayName}
                                </button>
                                <ul class="dropdown-menu">
                                    <c:choose>
                                        <c:when test="${(sessionScope.account.role) == 'ADMIN'}">
                                            <li><a class="dropdown-item" href="dashboard">Dashboard</a></li>
                                            </c:when>
                                            <c:otherwise>
                                            <li><a class="dropdown-item" href="#">My Account</a></li>
                                            </c:otherwise>
                                        </c:choose>
                                    <li><a class="dropdown-item" href="carts">My cart</a></li>
                                    <li><hr class="dropdown-divider"></li>
                                    <li><a class="dropdown-item" href="logout">Logout</a></li>
                                </ul>
                            </div>
                            
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
        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row">
                    <div class="col-md-2 mb-sm-5">
                        <h3>List category</h3>
                        <!-- active bg-dark border-dark -->
                        <div class="list-group">
                            <c:forEach items="${listCategory}" var="D">
                                <a href="filter-category?categoryId=${D.categoryID}" class="list-group-item list-group-item-action ${D.categoryID==categoryIDFilter?"active bg-dark border-dark":""}">${D.getCategoryName()}</a>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="col-md-10">
                        <h3>List Product</h3>
                        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                            <c:forEach items="${listProduct}" var="D">
                                <div class="col-md-3 mb-5">
                                    <div class="card h-100">
                                        <!-- Product image-->
                                        <a href="detail?productId=${D.productID}">
                                            <img class="card-img-top" style="height: 15rem" src="${D.getImageUrl()}" alt="..." />
                                        </a>

                                        <!-- Product details-->
                                        <div class="card-body p-4">
                                            <div class="text-center">
                                                <!-- Product name-->
                                                <h5 class="fw-bolder">${D.getProductName()}</h5>
                                                <!-- Product price-->
                                                ${D.getPrice()}
                                            </div>
                                        </div>
                                        <!-- Product actions-->
                                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                            <div class="text-center"><a class="btn btn-outline-dark mt-auto" onclick="addToCartAsync(${D.productID})">Add to cart</a></div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>

                        </div>
                        <nav aria-label="Page navigation example" class="d-flex justify-content-end">
                            <ul class="pagination" total-items="5" item-per-page="3" max-size="3">
                                <li class="page-item "><a class="page-link" href="#">Previous</a></li>
                                <li class="page-item"><a class="page-link" href="home?page=1">1</a></li>
                                <li class="page-item"><a class="page-link" href="home?page=2">2</a></li>
                                <li class="page-item"><a class="page-link" href="home?page=3">3</a></li>
                                <li class="page-item"><a class="page-link" href="home?page=4">4</a></li>
                                <li class="page-item"><a class="page-link" href="home?page=5">5</a></li>
                                <li class="page-item"><a class="page-link" href="#">Next</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </section>
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2022</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script>
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
        </script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>

