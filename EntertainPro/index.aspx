<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="EntertainPro.index" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Entertain Pro</title>
    <link rel="apple-touch-icon" sizes="180x180" href="favicon_io/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="favicon_io/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="favicon_io/favicon-16x16.png">
    <link rel="manifest" href="favicon_io/site.webmanifest">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/global.css" rel="stylesheet">
    <link href="css/index.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <script src="js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <section id="header">
            <nav class="navbar navbar-expand-md navbar-light" id="navbar_sticky">
                <div class="container-fluid">
                    <a class="navbar-brand fs-4 p-0 fw-bold text-white text-uppercase" href="index.aspx"><i class="fa fa-video-camera me-1 col_light fs-1 align-middle"></i>Entertain Pro</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav mb-0">
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="index.aspx">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="about.aspx">About </a>
                            </li>

                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">Blog
                                </a>
                                <ul class="dropdown-menu drop_1" aria-labelledby="navbarDropdown">
                                    <li><a class="dropdown-item" href="blog.aspx">Blog</a></li>
                                    <li><a class="dropdown-item border-0" href="blog_details.aspx">Blog Detail</a></li>
                                </ul>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="event.aspx">Events</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="team.aspx">team</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="contact.aspx">Contact</a>
                            </li>
                        </ul>
                        <ul class="navbar-nav mb-0 ms-auto">

                            <!-- Search Box in Navbar -->
                            <li class="nav-item">
                                <div class="input-group" style="width: 300px;">
                                    <span class="input-group-text animated-icon" style="background: #fff; border-radius: 10px 0 0 10px; border-right: 0;">
                                        <i class="fa fa-search"></i>
                                    </span>
                                    <asp:TextBox ID="txtSearch" runat="server"
                                        CssClass="form-control"
                                        placeholder="Search Movie"
                                        Style="border-radius: 0 10px 10px 0; border-left: 0;">
                                    </asp:TextBox>
                                </div>
                            </li>
                            <li class="nav-item ms-3">
                                <asp:LinkButton ID="wishlistBtn" runat="server" CssClass="nav-link position-relative" OnClick="wishlistBtn_Click" ToolTip="Wishlist">
                                    <i class="fa fa-heart fs-5 text-white"></i>
                                    <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger" id="wishlistCount" runat="server">0</span>
                                </asp:LinkButton>
                            </li>


                            <li class="nav-item dropdown ms-3" runat="server" id="navUserItem">
                                <a class="nav-link dropdown-toggle d-flex align-items-center" href="#" id="userDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    <img id="userAvatar" runat="server" src="#" class="rounded-circle me-2" style="width: 30px; height: 30px;" alt="Avatar" />
                                    <span id="Span1" runat="server"></span>

                                    <span id="navUserName" runat="server"></span>
                                </a>
                                <ul class="dropdown-menu dropdown-menu-end shadow-lg border-0 rounded-3 py-2" aria-labelledby="userDropdown">
                                    <li>
                                        <a class="dropdown-item d-flex align-items-center gap-2 py-2 px-3" href="bookedMovies.aspx">
                                            <i class="bi bi-ticket-perforated text-primary fs-5"></i>
                                            <span>Booked Movies</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item d-flex align-items-center gap-2 py-2 px-3" href="profile.aspx">
                                            <i class="bi bi-person-circle text-success fs-5"></i>
                                            <span>Profile</span>
                                        </a>
                                    </li>
                                    <li>
                                        <hr class="dropdown-divider my-2">
                                    </li>
                                    <li>
                                        <a class="dropdown-item d-flex align-items-center gap-2 py-2 px-3 text-danger fw-semibold" href="logout.aspx">
                                            <i class="bi bi-box-arrow-right fs-5"></i>
                                            <span>Logout</span>
                                        </a>
                                    </li>
                                </ul>

                            </li>

                            <li class="nav-item ms-3" runat="server" id="navLoginItem">
                                <a class="nav-link button" href="login.aspx">Get Start</a>
                            </li>

                        </ul>
                    </div>
                </div>
            </nav>
        </section>



        <!-- Search Overlay -->
        <div id="searchOverlay">
            <button type="button" class="close-button" onclick="hideOverlay()">&times;</button>
            <div class="movie-list" id="movieContainer">
                <asp:Repeater ID="dlMovies" runat="server">
                    <ItemTemplate>
                        <div class="movie-card-layout movie-item">
                            <a href='<%# "BookingMovieDetails.aspx?Id=" + Eval("MovieId") %>' class="movie-link">
                                <img src='<%# Eval("ImageUrl") %>' alt='<%# Eval("Title") %>' class="movie-poster" />
                                <div class="movie-info">
                                    <span class="new-release">New Release</span>
                                    <h3 class="movie-title"><%# Eval("Title") %></h3>
                                    <div class="movie-meta">
                                        <span><%# Eval("Genre") %></span>
                                        <span><%# Eval("Language") %></span>
                                        <span><%# Eval("Duration") %></span>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>

                <!-- No movies message -->
                <div id="noMoviesMessage">No movies found.</div>
            </div>
        </div>


        <!-- Slide-in wishlist panel -->
        <asp:Panel ID="wishlistPanel" runat="server" CssClass="wishlist-panel" Visible="false">
            <div class="wishlist-header">
                <h5>My Wishlist</h5>
                <asp:LinkButton ID="closeWishlistBtn" runat="server" OnClick="CloseWishlist_Click" CssClass="close-wishlist-btn">
                 <i class="fa fa-times"></i>
                </asp:LinkButton>

            </div>
            <div class="wishlist-content">
                <asp:DataList ID="DataList2" runat="server" OnItemCommand="DataList2_ItemCommand">
                    <ItemTemplate>
                        <div class="wishlist-item">
                            <img src='<%# Eval("ImageUrl") %>' alt='<%# Eval("Movie_Name") %>' />
                            <div class="wishlist-item-details">
                                <strong><%# Eval("Movie_Name") %></strong>
                                <p>$<%# Eval("Language") %></p>
                            </div>
                            <!-- Trash icon -->
                            <asp:LinkButton ID="removeBtn" runat="server" CommandName="Remove" CommandArgument='<%# Eval("WishList_Id") %>' CssClass="remove-icon" ToolTip="Remove from wishlist">
                <i class="fa fa-trash"></i>
                            </asp:LinkButton>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
            </div>
        </asp:Panel>


        <section id="center" class="center_home">
            <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel" data-bs-interval="5000">
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
                    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
                </div>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <div class="carousel-img-wrapper">
                            <img src="img/1.jpg" class="d-block w-100" alt="...">
                        </div>
                        <div class="carousel-caption d-md-block">
                            <h5 class="text-uppercase bg_red d-inline-block p-2 text-white">Releasing On</h5>
                            <h1>Vestibulum Arcu Eget Aptent Semper</h1>
                            <p>
                                There are many variations of passages available but the majority have suffered
                            alteration in some form by injected humour or randomised words.
                       
                            </p>
                            <ul class="mb-0 mt-3 list-unstyled">
                                <li class="d-inline-block me-2"><a class="button_1" href="#">CONTACT US <i class="fa fa-long-arrow-right ms-1"></i></a></li>
                                <li class="d-inline-block"><a class="button_2" href="#">ABOUT US  <i class="fa fa-long-arrow-right ms-1"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <div class="carousel-img-wrapper">
                            <img src="img/2.jpg" class="d-block w-100" alt="...">
                        </div>
                        <div class="carousel-caption d-md-block">
                            <h5 class="text-uppercase bg_red d-inline-block p-2 text-white">Releasing On</h5>
                            <h1>Vestibulum Arcu Eget Aptent Semper</h1>
                            <p>
                                There are many variations of passages available but the majority have suffered
                            alteration in some form by injected humour or randomised words.
                       
                            </p>
                            <ul class="mb-0 mt-3 list-unstyled">
                                <li class="d-inline-block me-2"><a class="button_1" href="#">CONTACT US <i class="fa fa-long-arrow-right ms-1"></i></a></li>
                                <li class="d-inline-block"><a class="button_2" href="#">ABOUT US  <i class="fa fa-long-arrow-right ms-1"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <div class="carousel-img-wrapper">
                            <img src="img/3.jpg" class="d-block w-100" alt="...">
                        </div>
                        <div class="carousel-caption d-md-block">
                            <h5 class="text-uppercase bg_red d-inline-block p-2 text-white">Releasing On</h5>
                            <h1>Vestibulum Arcu Eget Aptent Semper</h1>
                            <p>
                                There are many variations of passages available but the majority have suffered
                            alteration in some form by injected humour or randomised words.
                       
                            </p>
                            <ul class="mb-0 mt-3 list-unstyled">
                                <li class="d-inline-block me-2"><a class="button_1" href="#">CONTACT US <i class="fa fa-long-arrow-right ms-1"></i></a></li>
                                <li class="d-inline-block"><a class="button_2" href="#">ABOUT US  <i class="fa fa-long-arrow-right ms-1"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
                <div class="carousel-progress">
                    <div class="carousel-progress-bar"></div>
                </div>
            </div>
        </section>
        <asp:ScriptManager ID="ScriptManager1" runat="server" />

        <asp:Label ID="lblToast" runat="server" CssClass="toast-label"></asp:Label>


        <section id="upcome" class="p_3 bg-light">
            <div class="container-xl">
                <div class="row upcome_1 text-center">
                    <div class="col-md-12">
                        <h3 class="mb-0">NOW SHOWING MOVIES</h3>
                        <hr class="line me-auto ms-auto">
                    </div>
                </div>

                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div class="row upcome_2 mt-4">
                            <asp:DataList ID="dlUpcoming" runat="server"
                                RepeatColumns="4"
                                RepeatDirection="Horizontal"
                                CellPadding="5"
                                CellSpacing="5" OnItemCommand="dlUpcoming_ItemCommand">
                                <ItemTemplate>
                                    <div class="upcome_2i1 clearfix position-relative"
                                        style="width: 270px; height: 380px; margin: auto; overflow: hidden;">
                                        <div class="upcome_2i1i clearfix">
                                            <img src='<%# Eval("ImageUrl") %>'
                                                height="380" width="270"
                                                class="w-100"
                                                alt='<%# Eval("Title") %>' />
                                        </div>

                                        <div class="upcome_2i1i1 clearfix position-absolute top-0 text-center w-100">
                                            <h6 class="text-uppercase">
                                                <a class="button_1" href="javascript:void(0);" data-trailer='<%# Eval("TrailerUrl") %>' onclick="openTrailer(this)">View Trailer</a>
                                            </h6>
                                            <h6 class="text-uppercase mb-0">
                                                <a class="button_2" href="blog_detail.html">View Details</a>
                                            </h6>
                                            <div class="position-absolute top-0 end-0 p-2">
                                                <asp:LinkButton ID="btnWishlist"
                                                    runat="server"
                                                    CommandName="AddToWishlist"
                                                    CommandArgument='<%# Eval("MovieID") %>'
                                                    CssClass="text-danger">
                                                    <i class="fa fa-heart fa-lg"></i>
                                                </asp:LinkButton>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="upcome_2i_last bg-white p-3"
                                        style="width: 270px; height: 120px; margin: auto; overflow: hidden;">
                                        <div class="row">
                                            <div class="col-md-9 col-9">
                                                <div class="upcome_2i_lastil">
                                                    <h5><a href="blog_detail.html"><%# Eval("Title") %></a></h5>
                                                    <h6 class="text-muted"><%# Eval("Genre") %></h6>
                                                    <span class="col_red">
                                                        <%# GetStars((int)Eval("Rating")) %>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="col-md-3 p-0 col-3">
                                                <div class="upcome_2i_lastir pt-3">
                                                    <span>
                                                        <a class="col_red rounded"
                                                            href='<%# "BookingMovieDetails.aspx?Id=" + Eval("MovieId") %>'>
                                                            <i class="fa fa-ticket"></i>
                                                        </a>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:DataList>
                        </div>
                        <!-- Pagination inside UpdatePanel -->
                        <div class="text-center mt-3">
                            <asp:Button ID="btnPrev" runat="server" Text="Previous" CssClass="btn btn-danger me-2" OnClick="btnPrev_Click" />
                            <asp:Button ID="btnNext" runat="server" Text="Next" CssClass="btn btn-danger" OnClick="btnNext_Click" />
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </section>


        <section id="release">
            <div class="release_m clearfix">
                <div class="container-xl">
                    <div class="row release_1">
                        <div class="col-md-7">
                            <div class="release_1i">
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="release_1i1 text-center">
                                <h6 class="text-uppercase bg_red d-inline-block p-2 pe-4 ps-4 text-white">Releasing On</h6>
                                <h3 class="text-white icon_line mt-3 text-uppercase">22 October 2026</h3>
                                <h1 class="text-uppercase font_50 text-white mt-3">KANTARA</h1>
                                <h4 class="text-white mt-3 mb-0">A Presenter Film Production</h4>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section id="popular" class="p_3 bg-light">
            <div class="container-xl">
                <div class="row upcome_1 text-center">
                    <div class="col-md-12">
                        <h3 class="mb-0">POPULAR MOVIES</h3>
                        <hr class="line me-auto ms-auto">
                        <ul class="nav nav-tabs justify-content-center border-0 mb-0 mt-4">
                            <li class="nav-item">
                                <a href="#upcoming" data-bs-toggle="tab" class="nav-link active">Upcoming</a>
                            </li>
                            <li class="nav-item">
                                <a href="#released" data-bs-toggle="tab" class="nav-link">Released</a>
                            </li>
                            <li class="nav-item">
                                <a href="#best" data-bs-toggle="tab" class="nav-link">Best of Library</a>
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="tab-content mt-4">
                    <!-- Upcoming -->
                    <div class="tab-pane fade show active" id="upcoming">
                        <div class="row upcome_2 mt-4">
                            <asp:DataList ID="DataList1" runat="server" RepeatColumns="4" RepeatDirection="Horizontal" CellPadding="5" CellSpacing="5">
                                <ItemTemplate>
                                    <div class="upcome_2i1 clearfix position-relative" style="width: 270px; height: 380px; margin: auto; overflow: hidden;">
                                        <div class="upcome_2i1i clearfix">
                                            <img src='<%# Eval("ImageUrl") %>' height="380" width="270" class="w-100" alt='<%# Eval("Title") %>' />
                                        </div>
                                        <div class="upcome_2i1i1 clearfix position-absolute top-0 text-center w-100">
                                            <h6 class="text-uppercase">
                                                <a class="button_1" href="javascript:void(0);" data-trailer='<%# Eval("TrailerUrl") %>' onclick="openTrailer(this)">View Trailer</a>
                                            </h6>
                                            <h6 class="text-uppercase mb-0">
                                                <a class="button_2" href="MovieDetails.aspx?id=<%# Eval("MovieID") %>">View Details</a>
                                            </h6>
                                        </div>
                                    </div>
                                    <div class="upcome_2i_last bg-white p-3"
                                        style="width: 270px; height: 120px; margin: auto; overflow: hidden;">
                                        <div class="row">
                                            <div class="col-md-9 col-9">
                                                <div class="upcome_2i_lastil">
                                                    <h5><a href="blog_detail.html"><%# Eval("Title") %></a></h5>
                                                    <h6 class="text-muted"><%# Eval("Genre") %></h6>
                                                    <span class="col_red">
                                                        <%# GetStars((int)Eval("Rating")) %>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="col-md-3 p-0 col-3">
                                                <div class="upcome_2i_lastir pt-3">
                                                    <span>
                                                        <a class="col_red rounded" href='<%# "BookingMovieDetails.aspx?Id=" + Eval("MovieId") %>'>
                                                            <i class="fa fa-ticket"></i>
                                                        </a>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:DataList>
                        </div>
                    </div>
                    <!-- Released -->
                    <div class="tab-pane fade" id="released">
                        <div class="row upcome_2 mt-4">
                            <asp:DataList ID="dlReleased" runat="server" RepeatColumns="4" RepeatDirection="Horizontal" CellPadding="5" CellSpacing="5">
                                <ItemTemplate>
                                    <div class="upcome_2i1 clearfix position-relative" style="width: 270px; height: 380px; margin: auto; overflow: hidden;">
                                        <div class="upcome_2i1i clearfix">
                                            <img src='<%# Eval("ImageUrl") %>' height="380" width="270" class="w-100" alt='<%# Eval("Title") %>' />
                                        </div>
                                        <div class="upcome_2i1i1 clearfix position-absolute top-0 text-center w-100">
                                            <h6 class="text-uppercase">
                                                <a class="button_1" href="javascript:void(0);" data-trailer='<%# Eval("TrailerUrl") %>' onclick="openTrailer(this)">View Trailer</a>
                                            </h6>
                                            <h6 class="text-uppercase mb-0">
                                                <a class="button_2" href="MovieDetails.aspx?id=<%# Eval("MovieID") %>">View Details</a>
                                            </h6>
                                        </div>
                                    </div>
                                    <div class="upcome_2i_last bg-white p-3"
                                        style="width: 270px; height: 120px; margin: auto; overflow: hidden;">
                                        <div class="row">
                                            <div class="col-md-9 col-9">
                                                <div class="upcome_2i_lastil">
                                                    <h5><a href="blog_detail.html"><%# Eval("Title") %></a></h5>
                                                    <h6 class="text-muted"><%# Eval("Genre") %></h6>
                                                    <span class="col_red">
                                                        <%# GetStars((int)Eval("Rating")) %>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="col-md-3 p-0 col-3">
                                                <div class="upcome_2i_lastir pt-3">
                                                    <span>
                                                        <a class="col_red rounded" href='<%# "BookingMovieDetails.aspx?Id=" + Eval("MovieId") %>'>
                                                            <i class="fa fa-ticket"></i>
                                                        </a>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:DataList>
                        </div>
                    </div>
                    <!-- Best of Library -->
                    <div class="tab-pane fade" id="best">
                        <div class="row upcome_2 mt-4">
                            <asp:DataList ID="dlBest" runat="server" RepeatColumns="4" RepeatDirection="Horizontal" CellPadding="5" CellSpacing="5">
                                <ItemTemplate>
                                    <div class="upcome_2i1 clearfix position-relative" style="width: 270px; height: 380px; margin: auto; overflow: hidden;">
                                        <div class="upcome_2i1i clearfix">
                                            <img src='<%# Eval("ImageUrl") %>' height="380" width="270" class="w-100" alt='<%# Eval("Title") %>' />
                                        </div>
                                        <div class="upcome_2i1i1 clearfix position-absolute top-0 text-center w-100">
                                            <h6 class="text-uppercase">
                                                <a class="button_1" href="javascript:void(0);" data-trailer='<%# Eval("TrailerUrl") %>' onclick="openTrailer(this)">View Trailer</a>
                                            </h6>
                                            <h6 class="text-uppercase mb-0">
                                                <a class="button_2" href="MovieDetails.aspx?id=<%# Eval("MovieID") %>">View Details</a>
                                            </h6>
                                        </div>
                                    </div>
                                    <div class="upcome_2i_last bg-white p-3"
                                        style="width: 270px; height: 120px; margin: auto; overflow: hidden;">
                                        <div class="row">
                                            <div class="col-md-9 col-9">
                                                <div class="upcome_2i_lastil">
                                                    <h5><a href="blog_detail.html"><%# Eval("Title") %></a></h5>
                                                    <h6 class="text-muted"><%# Eval("Genre") %></h6>
                                                    <span class="col_red">
                                                        <%# GetStars((int)Eval("Rating")) %>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="col-md-3 p-0 col-3">
                                                <div class="upcome_2i_lastir pt-3">
                                                    <span>
                                                        <a class="col_red rounded" href='<%# "BookingMovieDetails.aspx?Id=" + Eval("MovieId") %>'>
                                                            <i class="fa fa-ticket"></i>
                                                        </a>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:DataList>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section id="trend">
            <div class="trend_m clearfix bg_light pt-4 pb-5">
                <div class="container-xl">
                    <div class="row upcome_1 text-center">
                        <div class="col-md-12">
                            <h3 class="mb-0 text-white">TOP MOVIES</h3>
                            <hr class="line me-auto ms-auto">
                        </div>
                    </div>
                    <div class="trend_m1 row mt-3">
                        <div id="carouselExampleCaptions2" class="carousel slide" data-bs-ride="carousel">

                            <div class="carousel-indicators">
                                <asp:Repeater ID="rptTopMoviesIndicators" runat="server">
                                    <ItemTemplate>
                                        <button type="button" data-bs-target="#carouselExampleCaptions2" data-bs-slide-to="<%# Container.ItemIndex %>" class='<%# (Container.ItemIndex == 0) ? "active" : "" %>' aria-label='<%# "Slide " + (Container.ItemIndex + 1) %>'></button>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>

                            <div class="carousel-inner">
                                <asp:Repeater ID="rptTopMovies" runat="server" OnItemDataBound="rptTopMovies_ItemDataBound">
                                    <ItemTemplate>

                                        <asp:Literal ID="litSlideStart" runat="server"></asp:Literal>

                                        <div class="col-md-3">
                                            <div class="upcome_2i1 clearfix position-relative">
                                                <div class="upcome_2i1i clearfix">
                                                    <img src='<%# Eval("ImageUrl") %>' height="380" width="305" alt='<%# Eval("Title") %>'>
                                                </div>
                                                <div class="upcome_2i1i1 clearfix position-absolute top-0 text-center w-100">
                                                    <h6 class="text-uppercase"><a class="button_1" href='<%# Eval("TrailerUrl") %>'>View Trailer</a></h6>
                                                    <h6 class="text-uppercase mb-0"><a class="button_2" href='<%# "MovieDetails.aspx?id=" + Eval("MovieId") %>'>View Details</a></h6>
                                                </div>
                                            </div>
                                            <div class="upcome_2i_last bg-white p-3">
                                                <div class="upcome_2i_lasti row">
                                                    <div class="col-md-9 col-9">
                                                        <div class="upcome_2i_lastil">
                                                            <h5><a href='<%# "MovieDetails.aspx?id=" + Eval("MovieId") %>'><%# Eval("Title") %></a></h5>
                                                            <h6 class="text-muted"><%# Eval("Genre") %></h6>
                                                            <span class="col_red">
                                                                <%# GetStars((int)Eval("Rating")) %>
                                                            </span>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-3 p-0 col-3">
                                                        <div class="upcome_2i_lastir pt-3">
                                                            <span><a class="col_red rounded" href='<%# "BookingMovieDetails.aspx?id=" + Eval("MovieId") %>'><i class="fa fa-thumbs-up"></i></a></span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <asp:Literal ID="litSlideEnd" runat="server"></asp:Literal>

                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </form>

    <section id="news" class="p_3 bg-light">
        <div class="container-xl">
            <div class="row upcome_1 text-center">
                <div class="col-md-12">
                    <h3 class="mb-0">LATEST NEWS</h3>
                    <hr class="line me-auto ms-auto">
                </div>
            </div>
            <div class="row news_1 mt-3">
                <div class="col-md-6">
                    <div class="news_1l">
                        <div class="popular_m clearfix position-relative">
                            <div class="popular_m1 clearfix">
                                <img src="img/news2.jpg" class="w-100" height="519" alt="abc">
                            </div>
                            <div class="popular_m2 clearfix position-absolute w-100 top-0 bg_dark">
                                <div class="popular_m2i clearfix p-4">
                                    <span class="d-block text-center play"><a class="col_red" href="#"><i class="fa fa-play-circle"></i></a></span>
                                    <h6 class="col_red">29 Sep 2026</h6>
                                    <h2 class="text-white mt-3 text-uppercase">THE NEWS OF THEATER</h2>
                                    <h6 class="mb-0 mt-3"><i class="fa fa-thumbs-up col_red me-1"></i><a class="text-light" href="#">110 Like</a> <span class="text-muted me-2 ms-2">|</span>  <i class="fa fa-comments col_red me-1"></i><a class="text-light" href="#">32 comments</a></h6>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="news_1r">
                        <div class="news_1ri row">
                            <div class="col-md-5 pe-0">
                                <div class="news_1ril">
                                    <div class="grid clearfix">
                                        <figure class="effect-jazz mb-0">
                                            <a href="#">
                                                <img src="img/news.jpg" height="251" class="w-100" alt="abc"></a>
                                        </figure>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-7 ps-0">
                                <div class="news_1rir pt-4 pb-4 ps-3 pe-3 bg-white">
                                    <h4 class="fs-5"><a href="#">THE NEWS OF THEATER</a></h4>
                                    <h6 class="col_red">29 Dec 2026</h6>
                                    <p>Get ready for an immersive cinematic experience with motion seats, wind, rain, fog, and other exciting effects.</p>
                                    <h6 class="mb-0"><i class="fa fa-thumbs-up col_red me-1"></i><a href="#">129 Like</a> <span class="text-muted me-2 ms-2">|</span>  <i class="fa fa-comments col_red me-1"></i><a href="#">58 comments</a></h6>
                                </div>
                            </div>
                        </div>
                        <div class="news_1ri row mt-3">
                            <div class="col-md-5 pe-0">
                                <div class="news_1ril">
                                    <div class="grid clearfix">
                                        <figure class="effect-jazz mb-0">
                                            <a href="#">
                                                <img src="img/news1.jpg" height="251" class="w-100" alt="abc"></a>
                                        </figure>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-7 ps-0">
                                <div class="news_1rir pt-4 pb-4 ps-3 pe-3 bg-white">
                                    <h4 class="fs-5"><a href="#">THE NEWS OF THEATER</a></h4>
                                    <h6 class="col_red">22 May 2022</h6>
                                    <p>Enjoy our premium Gold Class seating with extra comfort, gourmet snacks, and an exclusive cinematic experience.</p>
                                    <h6 class="mb-0"><i class="fa fa-thumbs-up col_red me-1"></i><a href="#">127 Like</a> <span class="text-muted me-2 ms-2">|</span>  <i class="fa fa-comments col_red me-1"></i><a href="#">42 comments</a></h6>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section id="gallery" class="p_3 bg-light">
        <div class="container-xl">
            <div class="row upcome_1 text-center">
                <div class="col-md-12">
                    <h3 class="mb-0">VIDEO & PHOTOS</h3>
                    <hr class="line me-auto ms-auto">
                </div>
            </div>
            <div class="row gallery_1 mt-3">
                <div class="col-md-2 pe-0">
                    <div class="gallery_1lm clearfix position-relative">
                        <div class="gallery_1lm1 clearfix">
                            <img src="img/25.jpg" class="w-100" height="150" alt="abc">
                        </div>
                        <div class="gallery_1lm2 clearfix position-absolute w-100 text-center top-0 bg_light h-100">
                            <span><a class="col_red bg-white d-inline-block text-center" href="#"><i class="fa fa-search"></i></a></span>
                        </div>
                    </div>
                    <div class="gallery_1lm clearfix position-relative mt-3">
                        <div class="gallery_1lm1 clearfix">
                            <img src="img/26.jpg" class="w-100" height="150" alt="abc">
                        </div>
                        <div class="gallery_1lm2 clearfix position-absolute w-100 text-center top-0 bg_light h-100">
                            <span><a class="col_red bg-white d-inline-block text-center" href="#"><i class="fa fa-search"></i></a></span>
                        </div>
                    </div>
                    <div class="gallery_1lm clearfix position-relative mt-3">
                        <div class="gallery_1lm1 clearfix">
                            <img src="img/27.jpg" class="w-100" height="150" alt="abc">
                        </div>
                        <div class="gallery_1lm2 clearfix position-absolute w-100 text-center top-0 bg_light h-100">
                            <span><a class="col_red bg-white d-inline-block text-center" href="#"><i class="fa fa-search"></i></a></span>
                        </div>
                    </div>
                </div>
                <div class="col-md-8">
                    <div class="gallery_1m">
                        <div id="carouselExampleCaptions4" class="carousel slide" data-bs-ride="carousel">
                            <div class="carousel-indicators">
                                <button type="button" data-bs-target="#carouselExampleCaptions4" data-bs-slide-to="0" class="active" aria-label="Slide 1"></button>
                                <button type="button" data-bs-target="#carouselExampleCaptions4" data-bs-slide-to="1" aria-label="Slide 2" class="" aria-current="true"></button>
                                <button type="button" data-bs-target="#carouselExampleCaptions4" data-bs-slide-to="2" aria-label="Slide 3"></button>
                            </div>
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <img src="img/1.jpg" height="482" class="d-block w-100" alt="...">
                                </div>
                                <div class="carousel-item">
                                    <img src="img/2.jpg" height="482" class="d-block w-100" alt="...">
                                </div>
                                <div class="carousel-item">
                                    <img src="img/3.jpg" height="482" class="d-block w-100" alt="...">
                                </div>
                            </div>
                            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions4" data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                            </button>
                            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions4" data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                            </button>
                        </div>
                    </div>
                </div>
                <div class="col-md-2 ps-0">
                    <div class="gallery_1lm clearfix position-relative">
                        <div class="gallery_1lm1 clearfix">
                            <img src="img/28.jpg" class="w-100" height="150" alt="abc">
                        </div>
                        <div class="gallery_1lm2 clearfix position-absolute w-100 text-center top-0 bg_light h-100">
                            <span><a class="col_red bg-white d-inline-block text-center" href="#"><i class="fa fa-search"></i></a></span>
                        </div>
                    </div>
                    <div class="gallery_1lm clearfix position-relative mt-3">
                        <div class="gallery_1lm1 clearfix">
                            <img src="img/29.jpg" class="w-100" height="150" alt="abc">
                        </div>
                        <div class="gallery_1lm2 clearfix position-absolute w-100 text-center top-0 bg_light h-100">
                            <span><a class="col_red bg-white d-inline-block text-center" href="#"><i class="fa fa-search"></i></a></span>
                        </div>
                    </div>
                    <div class="gallery_1lm clearfix position-relative mt-3">
                        <div class="gallery_1lm1 clearfix">
                            <img src="img/30.jpg" class="w-100" height="150" alt="abc">
                        </div>
                        <div class="gallery_1lm2 clearfix position-absolute w-100 text-center top-0 bg_light h-100">
                            <span><a class="col_red bg-white d-inline-block text-center" href="#"><i class="fa fa-search"></i></a></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>


    <section id="subs" class="pt-5 pb-5 bg_red">
        <div class="container-xl">
            <div class="row subs_1">
                <div class="col-md-4">
                    <div class="subs_1l">
                        <h4 class="text-white mb-0 mt-2">GET UPDATE SIGN UP NOW !</h4>
                    </div>
                </div>
                <div class="col-md-8">
                    <div class="subs_1r">
                        <div class="input-group">
                            <input type="text" class="form-control bg-transparent" placeholder="Enter Your Email">
                            <span class="input-group-btn">
                                <button class="btn btn-primary bg-white col_red" type="button">
                                    Submit
                                </button>
                            </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section id="footer" class="p_3">
        <div class="container-xl">
            <div class="row footer_1">
                <div class="col-md-2">
                    <div class="footer_1i">
                        <h6 class="text-white fw-bold">LANGUAGE MOVIES</h6>
                        <hr class="line mb-4">
                        <div class="row footer_1i_small">
                            <h6 class="col-md-12 col-6"><i class="fa fa-circle me-1 col_red font_10"></i><a class="text-muted" href="#">English Movie</a></h6>
                            <h6 class="mt-2 col-md-12 col-6"><i class="fa fa-circle me-1 col_red font_10"></i><a class="text-muted" href="#">Tamil Movie</a></h6>
                            <h6 class="mt-2 col-md-12 col-6"><i class="fa fa-circle me-1 col_red font_10"></i><a class="text-muted" href="#">Punjabi Movie</a></h6>
                            <h6 class="mt-2 col-md-12 col-6"><i class="fa fa-circle me-1 col_red font_10"></i><a class="text-muted" href="#">Hindi Movie</a></h6>
                            <h6 class="mt-2 col-md-12 col-6"><i class="fa fa-circle me-1 col_red font_10"></i><a class="text-muted" href="#">Malyalam Movie</a></h6>
                            <h6 class="mb-0 mt-2 col-md-12 col-6"><i class="fa fa-circle me-1 col_red font_10"></i><a class="text-muted" href="#">Action Movie</a></h6>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="footer_1i">
                        <h6 class="text-white fw-bold">TAG CLOUD</h6>
                        <hr class="line mb-4">
                        <ul class="mb-0">
                            <li class="d-inline-block"><a class="d-block" href="#">Analyze</a></li>
                            <li class="d-inline-block"><a class="d-block" href="#">Audio</a></li>
                            <li class="d-inline-block"><a class="d-block" href="#">Blog</a></li>
                            <li class="d-inline-block"><a class="d-block" href="#">Business</a></li>
                            <li class="d-inline-block"><a class="d-block" href="#">Creative</a></li>
                            <li class="d-inline-block"><a class="d-block" href="#">Design</a></li>
                            <li class="d-inline-block"><a class="d-block" href="#">Experiment</a></li>
                            <li class="d-inline-block"><a class="d-block" href="#">News</a></li>
                            <li class="d-inline-block"><a class="d-block" href="#">Expertize</a></li>
                            <li class="d-inline-block"><a class="d-block" href="#">Express</a></li>
                            <li class="d-inline-block"><a class="d-block" href="#">Share</a></li>
                            <li class="d-inline-block"><a class="d-block" href="#">Sustain</a></li>
                            <li class="d-inline-block"><a class="d-block" href="#">Video</a></li>
                            <li class="d-inline-block"><a class="d-block" href="#">Youtube</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="footer_1i">
                        <h6 class="text-white fw-bold">BY PRESENTER</h6>
                        <hr class="line mb-4">
                        <div class="row footer_1i_small">
                            <h6 class="col-md-12 col-6"><i class="fa fa-circle me-1 col_red font_10"></i><a class="text-muted" href="#">Action Movie</a></h6>
                            <h6 class="mt-2 col-md-12 col-6"><i class="fa fa-circle me-1 col_red font_10"></i><a class="text-muted" href="#">Romantic Movie</a></h6>
                            <h6 class="mt-2 col-md-12 col-6"><i class="fa fa-circle me-1 col_red font_10"></i><a class="text-muted" href="#">Other Movie</a></h6>
                            <h6 class="mt-2 col-md-12 col-6"><i class="fa fa-circle me-1 col_red font_10"></i><a class="text-muted" href="#">Comedy Movie</a></h6>
                            <h6 class="mt-2 col-md-12 col-6"><i class="fa fa-circle me-1 col_red font_10"></i><a class="text-muted" href="#">Drama Movie</a></h6>
                            <h6 class="mb-0 mt-2 col-md-12 col-6"><i class="fa fa-circle me-1 col_red font_10"></i><a class="text-muted" href="#">Classical Movie</a></h6>
                        </div>

                    </div>
                </div>
                <div class="col-md-4">
                    <div class="footer_1i">
                        <h6 class="text-white fw-bold">SUBSCRIPTION</h6>
                        <hr class="line mb-4">
                        <p class="text-muted">Subscribe your Email address for latest news & updates.</p>
                        <input class="form-control bg-transparent" placeholder="Enter Email Address" type="text">
                        <h6 class="mb-0 mt-4"><a class="button_1 pt-3 pb-3" href="#">Submit <i class="fa fa-check-circle ms-1"></i></a></h6>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section id="footer_b" class="pt-3 pb-3">
        <div class="container-xl">
            <div class="row footer_b1">
                <div class="col-md-8">
                    <div class="footer_b1l">
                        <p class="mb-0 fs-6 text-muted mt-1">© 2025 Entertain Pro. All Rights Reserved | Design by <a class="col_red" href="#">Rahul Kumar Mahanta</a></p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="footer_b1r text-end">
                        <ul class="social-network social-circle mb-0">
                            <li><a href="#" class="icoRss" title="Rss"><i class="fa fa-rss"></i></a></li>
                            <li><a href="#" class="icoFacebook" title="Facebook"><i class="fa fa-pinterest"></i></a></li>
                            <li><a href="#" class="icoTwitter" title="Twitter"><i class="fa fa-twitter"></i></a></li>
                            <li><a href="#" class="icoLinkedin" title="Linkedin"><i class="fa fa-linkedin"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>


    <div class="modal fade" id="trailerModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-xl modal-dialog-centered">
            <div class="modal-content modal-trailer shadow-lg rounded-4 border-0 overflow-hidden">

                <!-- Modal Header -->
                <div class="modal-header bg-gradient-dark border-0">
                    <h5 class="modal-title text-white fw-bold">Movie Trailer</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                </div>

                <!-- Modal Body -->
                <div class="modal-body p-0 bg-dark">
                    <div class="ratio ratio-16x9">
                        <iframe id="trailerIframe" src="#" frameborder="0" allowfullscreen
                            class="rounded-bottom-4"></iframe>
                    </div>
                </div>

            </div>
        </div>
    </div>



    <script type="text/javascript">
        // JS to reset the progress bar animation on each slide change
        const myCarousel = document.getElementById('carouselExampleCaptions');
        const progressBar = myCarousel.querySelector('.carousel-progress-bar');

        myCarousel.addEventListener('slide.bs.carousel', () => {
            progressBar.classList.remove('animate');
            void progressBar.offsetWidth; // Trigger a reflow
            progressBar.classList.add('animate');
        });

        // Add animation to the first slide's progress bar on load
        progressBar.classList.add('animate');
        window.onscroll = function () { myFunction() };

        var navbar_sticky = document.getElementById("navbar_sticky");
        var sticky = navbar_sticky.offsetTop;
        var navbar_height = document.querySelector('.navbar').offsetHeight;

        function myFunction() {
            if (window.pageYOffset >= sticky + navbar_height) {
                navbar_sticky.classList.add("sticky")
                document.body.style.paddingTop = navbar_height + 'px';
            } else {
                navbar_sticky.classList.remove("sticky");
                document.body.style.paddingTop = '0'
            }
        }

        function openTrailer(el) {
            var url = el.getAttribute('data-trailer');
            var videoId = '';

            if (url.includes('youtu.be/')) {
                videoId = url.split('/').pop().split('?')[0];
            } else if (url.includes('watch?v=')) {
                videoId = url.split('v=')[1].split('&')[0];
            } else {
                videoId = url; // fallback
            }

            var embedUrl = 'https://www.youtube.com/embed/' + videoId + '?autoplay=1&mute=1';
            var iframe = document.getElementById('trailerIframe');
            iframe.src = embedUrl;

            // Show modal
            var trailerModalEl = document.getElementById('trailerModal');
            var trailerModal = new bootstrap.Modal(trailerModalEl);
            trailerModal.show();

            // Properly remove iframe and backdrop when modal hides
            trailerModalEl.addEventListener('hidden.bs.modal', function () {
                iframe.src = ''; // stop video
                trailerModalEl.classList.remove('show'); // remove 'show' class
                trailerModalEl.style.display = 'none'; // hide modal
                var modalBackdrop = document.querySelector('.modal-backdrop');
                if (modalBackdrop) modalBackdrop.remove(); // remove leftover backdrop
            }, { once: true });
        }

        let searchInput, searchOverlay, movieContainer, noMoviesMessage;

        function showOverlay() {
            searchOverlay.style.display = 'block';
        }

        function hideOverlay() {
            searchOverlay.style.display = 'none';
            searchInput.value = '';
            filterMovies('');
        }

        function filterMovies(keyword) {
            const movieItems = movieContainer.querySelectorAll('.movie-item');
            let found = false;

            movieItems.forEach(item => {
                const titleElem = item.querySelector('.movie-title');
                if (!titleElem) return;

                const title = titleElem.innerText.toLowerCase();
                if (title.includes(keyword)) {
                    item.style.display = '';
                    found = true;
                } else {
                    item.style.display = 'none';
                }
            });

            if (!found) {
                noMoviesMessage.style.display = 'block';
                setTimeout(() => noMoviesMessage.style.opacity = '1', 10);
            } else {
                noMoviesMessage.style.opacity = '0';
                setTimeout(() => noMoviesMessage.style.display = 'none', 300);
            }
        }

        window.addEventListener('load', () => {
            searchInput = document.getElementById('<%= txtSearch.ClientID %>');
            searchOverlay = document.getElementById('searchOverlay');
            movieContainer = document.getElementById('movieContainer');
            noMoviesMessage = document.getElementById('noMoviesMessage');

            // Show overlay on focus
            searchInput.addEventListener('focus', showOverlay);

            // Live filter while typing
            searchInput.addEventListener('input', () => {
                const keyword = searchInput.value.toLowerCase().trim();
                filterMovies(keyword);
            });

            // Close overlay on ESC
            document.addEventListener('keydown', e => {
                if (e.key === 'Escape') hideOverlay();
            });

            // Close overlay when clicking outside
            document.addEventListener('click', e => {
                if (!searchOverlay.contains(e.target) && e.target !== searchInput) {
                    hideOverlay();
                }
            });
        });

        function showLabelToast(message, type) {
            var lbl = document.getElementById('<%= lblToast.ClientID %>');
            lbl.innerText = message;
            lbl.style.display = 'block';
            lbl.className = 'toast-message show toast-' + type;

            // Remove after 3 seconds
            setTimeout(function () {
                lbl.classList.remove('show');
                setTimeout(function () { lbl.style.display = 'none'; }, 600);
            }, 3000);
        }
        const wishlistBtn = document.getElementById('wishlistBtn');
        const wishlistPanel = document.getElementById('wishlistPanel');
        const closeWishlist = document.getElementById('closeWishlist');

        wishlistBtn.addEventListener('click', () => {
            wishlistPanel.classList.toggle('active');
        });

        closeWishlist.addEventListener('click', () => {
            wishlistPanel.classList.remove('active');
        });

    </script>

</body>

</html>
