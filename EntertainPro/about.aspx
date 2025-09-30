<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="about.aspx.cs" Inherits="EntertainPro.about" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    	<section id="center" class="center_o pt-5">
		<div class="container">
			<div class="row center_o1 text-center">
				<div class="col-md-12">
					<h2>ABOUT US</h2>
					<h5 class="bg_dark d-inline-block p-4 mb-0 mt-4 pt-2 pb-2 fw-normal col_red"><a class="text-white" href="#">Home</a>  <span class="me-2 ms-2 text-muted"> /</span>   About Us</h5>
				</div>
			</div>
		</div>
	</section>

	<section id="about" class="p_3 bg-light">
		<div class="container">
			<div class="row about_1">
				<div class="col-md-6">
					<div class="about_1l">
						<h3>About Entertain Pro</h3>
						<hr class="line">
						<h5 class="mt-4">Welcome to Entertain Pro, your one-stop destination for a seamless online movie ticket booking experience.</h5>
						<p>We make it easy, fast, and secure to book tickets for the latest movies at your favorite cinemas—anytime, anywhere.To bring the magic of cinema closer to you by simplifying the way you discover, book, and enjoy movies.Whether it’s the latest blockbuster, a family-friendly film, or an indie masterpiece, Entertain Pro ensures that your next cinema experience is just a few clicks away,</p>
						<p class="mb-0">Our Vision, To become the most trusted online movie booking platform, connecting movie lovers to the best cinematic experiences with cutting-edge technology and user-first design.</p>

					</div>
				</div>
				<div class="col-md-6">
					<div class="about_1r">
						<div id="carouselExampleCaptions4" class="carousel slide" data-bs-ride="carousel">
							<div class="carousel-indicators">
								<button type="button" data-bs-target="#carouselExampleCaptions4" data-bs-slide-to="0" class="active" aria-label="Slide 1" aria-current="true"></button>
								<button type="button" data-bs-target="#carouselExampleCaptions4" data-bs-slide-to="1" aria-label="Slide 2" class=""></button>
								<button type="button" data-bs-target="#carouselExampleCaptions4" data-bs-slide-to="2" aria-label="Slide 3" class=""></button>
							</div>
							<div class="carousel-inner">
								<div class="carousel-item active">
									<img src="img/13.jpg" class="d-block w-100" alt="...">
								</div>
								<div class="carousel-item">
									<img src="img/14.jpg" class="d-block w-100" alt="...">
								</div>
								<div class="carousel-item">
									<img src="img/15.jpg" class="d-block w-100" alt="...">
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
			</div>
			<div class="row event1 mt-4">
				<div class="col-md-6 pe-0">
					<div class="event1l">
						<div class="grid clearfix">
							<figure class="effect-jazz mb-0">
								<a href="#"><img src="img/14.jpg" height="428" class="w-100" alt="abc"></a>
							</figure>
						</div>
					</div>
				</div>
				<div class="col-md-6 ps-0">
					<div class="event1r bg-white p-4 shadow_box">
						<h5 class="text-uppercase"><a href="#">Music Event in India</a></h5>
						<h6>
							Delhi &amp; Mumbai
							<span class="col_red pull-right">
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star-o"></i>
							</span>
						</h6>
						<hr>
						<h6>June 09 - July 06 <span class="pull-right">09:00-13:00 pm</span></h6>
						<p class="mt-3">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiud tempor incididunt ut labore et dolore magna aliqua. Ut enim ad quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo is aute irure dolor in reprehenderit in voluptate velit esse cillum fugiat nulla pariatur Excepteur sint. Read More</p>
						<ul class="mt-4 mb-0">
							<li class="text-center d-inline-block fw-normal me-3"><span class="d-inline-block bg_red text-white rounded-circle fs-2 mb-2">55</span> <br> Days</li>
							<li class="text-center d-inline-block fw-normal me-3"><span class="d-inline-block bg_red text-white rounded-circle fs-2 mb-2">18</span> <br> Hours</li>
							<li class="text-center d-inline-block fw-normal me-3"><span class="d-inline-block bg_red text-white rounded-circle fs-2 mb-2">15</span> <br> Mins</li>
							<li class="text-center d-inline-block fw-normal"><span class="d-inline-block bg_red text-white rounded-circle fs-2 mb-2">23</span> <br> Secs</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section id="schedule" class="p_3">
		<div class="container">
			<div class="row upcome_1 text-center">
				<div class="col-md-12">
					<h3 class="mb-0">Awards & Recognition</h3>
					<hr class="line me-auto ms-auto">
				</div>
			</div>
			<div class="row schedule_1 text-center mt-3">
				<div class="col-md-12">
					<ul class="nav nav-tabs justify-content-center border-0 mb-0">
						<li class="nav-item">
							<a href="#homeo" data-bs-toggle="tab" aria-expanded="false" class="nav-link active">
								<span class="d-md-block">
									<span class="fw-bold">2015</span> <br>
									June 06
								</span>
							</a>
						</li>
						<li class="nav-item">
							<a href="#profileo" data-bs-toggle="tab" aria-expanded="true" class="nav-link">
								<span class="d-md-block">
									<span class="fw-bold">2018</span> <br>
									June 07
								</span>
							</a>
						</li>
						<li class="nav-item">
							<a href="#settingso" data-bs-toggle="tab" aria-expanded="false" class="nav-link border-0">
								<span class="d-md-block">
									<span class="fw-bold">2020</span> <br>
									June 08
								</span>
							</a>
						</li>

					</ul>
				</div>
			</div>
			<div class="row schedule_2 mt-4">
				<div class="tab-content">
					<div class="tab-pane active" id="homeo">
						<div class="news_1ri row">
							<div class="col-md-2 pe-0">
								<div class="news_1ril">
									<div class="grid clearfix">
										<figure class="effect-jazz mb-0">
											<a href="#"><img src="img/4.jpg" height="218" class="w-100" alt="abc"></a>
										</figure>
									</div>
								</div>
							</div>
							<div class="col-md-10 ps-0">
								<div class="news_1rir p-4 bg-white">
									<h4 class="fs-5"><a href="#">WELCOME REGISTRATION</a></h4>
									<h6><span class="col_red me-3">29 Jan 2021</span> 08:00 - 12:00 pm</h6>
									<p>Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsum, nec sagittis sem nibh id elit. amet nibh vulputate part the maintacne of the greek name of name cursus.</p>
									<h6 class="mb-0">  <i class="fa fa-user col_red me-1"></i> <a href="#">Eget Nulla</a> <span class="text-muted me-2 ms-2">|</span>  <i class="fa fa-comments col_red me-1"></i> <a href="#"> Room No. 17</a></h6>
								</div>
							</div>
						</div>
						<div class="news_1ri row mt-4">
							<div class="col-md-2 pe-0">
								<div class="news_1ril">
									<div class="grid clearfix">
										<figure class="effect-jazz mb-0">
											<a href="#"><img src="img/5.jpg" height="218" class="w-100" alt="abc"></a>
										</figure>
									</div>
								</div>
							</div>
							<div class="col-md-10 ps-0">
								<div class="news_1rir p-4 bg-white">
									<h4 class="fs-5"><a href="#">WELCOME REGISTRATION</a></h4>
									<h6><span class="col_red me-3">29 Jan 2021</span> 08:00 - 12:00 pm</h6>
									<p>Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsum, nec sagittis sem nibh id elit. amet nibh vulputate part the maintacne of the greek name of name cursus.</p>
									<h6 class="mb-0">  <i class="fa fa-user col_red me-1"></i> <a href="#">Eget Nulla</a> <span class="text-muted me-2 ms-2">|</span>  <i class="fa fa-comments col_red me-1"></i> <a href="#"> Room No. 17</a></h6>
								</div>
							</div>
						</div>
						<div class="news_1ri row mt-4">
							<div class="col-md-2 pe-0">
								<div class="news_1ril">
									<div class="grid clearfix">
										<figure class="effect-jazz mb-0">
											<a href="#"><img src="img/6.jpg" height="218" class="w-100" alt="abc"></a>
										</figure>
									</div>
								</div>
							</div>
							<div class="col-md-10 ps-0">
								<div class="news_1rir p-4 bg-white">
									<h4 class="fs-5"><a href="#">WELCOME REGISTRATION</a></h4>
									<h6><span class="col_red me-3">29 Jan 2021</span> 08:00 - 12:00 pm</h6>
									<p>Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsum, nec sagittis sem nibh id elit. amet nibh vulputate part the maintacne of the greek name of name cursus.</p>
									<h6 class="mb-0">  <i class="fa fa-user col_red me-1"></i> <a href="#">Eget Nulla</a> <span class="text-muted me-2 ms-2">|</span>  <i class="fa fa-comments col_red me-1"></i> <a href="#"> Room No. 17</a></h6>
								</div>
							</div>
						</div>
						<div class="schedule_2_last mt-4 text-center">
							<div class="col-md-12">
								<h6 class="mb-0 mt-4"><a class="button_1 pt-3 pb-3" href="#">Download Schedule  </a></h6>
							</div>
						</div>
					</div>
					<div class="tab-pane" id="profileo">
						<div class="news_1ri row">
							<div class="col-md-2 pe-0">
								<div class="news_1ril">
									<div class="grid clearfix">
										<figure class="effect-jazz mb-0">
											<a href="#"><img src="img/7.jpg" height="218" class="w-100" alt="abc"></a>
										</figure>
									</div>
								</div>
							</div>
							<div class="col-md-10 ps-0">
								<div class="news_1rir p-4 bg-white">
									<h4 class="fs-5"><a href="#">WELCOME REGISTRATION</a></h4>
									<h6><span class="col_red me-3">29 Jan 2021</span> 08:00 - 12:00 pm</h6>
									<p>Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsum, nec sagittis sem nibh id elit. amet nibh vulputate part the maintacne of the greek name of name cursus.</p>
									<h6 class="mb-0">  <i class="fa fa-user col_red me-1"></i> <a href="#">Eget Nulla</a> <span class="text-muted me-2 ms-2">|</span>  <i class="fa fa-comments col_red me-1"></i> <a href="#"> Room No. 17</a></h6>
								</div>
							</div>
						</div>
						<div class="news_1ri row mt-4">
							<div class="col-md-2 pe-0">
								<div class="news_1ril">
									<div class="grid clearfix">
										<figure class="effect-jazz mb-0">
											<a href="#"><img src="img/8.jpg" height="218" class="w-100" alt="abc"></a>
										</figure>
									</div>
								</div>
							</div>
							<div class="col-md-10 ps-0">
								<div class="news_1rir p-4 bg-white">
									<h4 class="fs-5"><a href="#">WELCOME REGISTRATION</a></h4>
									<h6><span class="col_red me-3">29 Jan 2021</span> 08:00 - 12:00 pm</h6>
									<p>Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsum, nec sagittis sem nibh id elit. amet nibh vulputate part the maintacne of the greek name of name cursus.</p>
									<h6 class="mb-0">  <i class="fa fa-user col_red me-1"></i> <a href="#">Eget Nulla</a> <span class="text-muted me-2 ms-2">|</span>  <i class="fa fa-comments col_red me-1"></i> <a href="#"> Room No. 17</a></h6>
								</div>
							</div>
						</div>
						<div class="news_1ri row mt-4">
							<div class="col-md-2 pe-0">
								<div class="news_1ril">
									<div class="grid clearfix">
										<figure class="effect-jazz mb-0">
											<a href="#"><img src="img/9.jpg" height="218" class="w-100" alt="abc"></a>
										</figure>
									</div>
								</div>
							</div>
							<div class="col-md-10 ps-0">
								<div class="news_1rir p-4 bg-white">
									<h4 class="fs-5"><a href="#">WELCOME REGISTRATION</a></h4>
									<h6><span class="col_red me-3">29 Jan 2021</span> 08:00 - 12:00 pm</h6>
									<p>Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsum, nec sagittis sem nibh id elit. amet nibh vulputate part the maintacne of the greek name of name cursus.</p>
									<h6 class="mb-0">  <i class="fa fa-user col_red me-1"></i> <a href="#">Eget Nulla</a> <span class="text-muted me-2 ms-2">|</span>  <i class="fa fa-comments col_red me-1"></i> <a href="#"> Room No. 17</a></h6>
								</div>
							</div>
						</div>
						<div class="schedule_2_last mt-4 text-center">
							<div class="col-md-12">
								<h6 class="mb-0 mt-4"><a class="button_1 pt-3 pb-3" href="#">Download Schedule  </a></h6>
							</div>
						</div>
					</div>
					<div class="tab-pane" id="settingso">
						<div class="news_1ri row">
							<div class="col-md-2 pe-0">
								<div class="news_1ril">
									<div class="grid clearfix">
										<figure class="effect-jazz mb-0">
											<a href="#"><img src="img/10.jpg" height="218" class="w-100" alt="abc"></a>
										</figure>
									</div>
								</div>
							</div>
							<div class="col-md-10 ps-0">
								<div class="news_1rir p-4 bg-white">
									<h4 class="fs-5"><a href="#">WELCOME REGISTRATION</a></h4>
									<h6><span class="col_red me-3">29 Jan 2021</span> 08:00 - 12:00 pm</h6>
									<p>Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsum, nec sagittis sem nibh id elit. amet nibh vulputate part the maintacne of the greek name of name cursus.</p>
									<h6 class="mb-0">  <i class="fa fa-user col_red me-1"></i> <a href="#">Eget Nulla</a> <span class="text-muted me-2 ms-2">|</span>  <i class="fa fa-comments col_red me-1"></i> <a href="#"> Room No. 17</a></h6>
								</div>
							</div>
						</div>
						<div class="news_1ri row mt-4">
							<div class="col-md-2 pe-0">
								<div class="news_1ril">
									<div class="grid clearfix">
										<figure class="effect-jazz mb-0">
											<a href="#"><img src="img/11.jpg" height="218" class="w-100" alt="abc"></a>
										</figure>
									</div>
								</div>
							</div>
							<div class="col-md-10 ps-0">
								<div class="news_1rir p-4 bg-white">
									<h4 class="fs-5"><a href="#">WELCOME REGISTRATION</a></h4>
									<h6><span class="col_red me-3">29 Jan 2021</span> 08:00 - 12:00 pm</h6>
									<p>Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsum, nec sagittis sem nibh id elit. amet nibh vulputate part the maintacne of the greek name of name cursus.</p>
									<h6 class="mb-0">  <i class="fa fa-user col_red me-1"></i> <a href="#">Eget Nulla</a> <span class="text-muted me-2 ms-2">|</span>  <i class="fa fa-comments col_red me-1"></i> <a href="#"> Room No. 17</a></h6>
								</div>
							</div>
						</div>
						<div class="news_1ri row mt-4">
							<div class="col-md-2 pe-0">
								<div class="news_1ril">
									<div class="grid clearfix">
										<figure class="effect-jazz mb-0">
											<a href="#"><img src="img/4.jpg" height="218" class="w-100" alt="abc"></a>
										</figure>
									</div>
								</div>
							</div>
							<div class="col-md-10 ps-0">
								<div class="news_1rir p-4 bg-white">
									<h4 class="fs-5"><a href="#">WELCOME REGISTRATION</a></h4>
									<h6><span class="col_red me-3">29 Jan 2021</span> 08:00 - 12:00 pm</h6>
									<p>Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsum, nec sagittis sem nibh id elit. amet nibh vulputate part the maintacne of the greek name of name cursus.</p>
									<h6 class="mb-0">  <i class="fa fa-user col_red me-1"></i> <a href="#">Eget Nulla</a> <span class="text-muted me-2 ms-2">|</span>  <i class="fa fa-comments col_red me-1"></i> <a href="#"> Room No. 17</a></h6>
								</div>
							</div>
						</div>
						<div class="schedule_2_last mt-4 text-center">
							<div class="col-md-12">
								<h6 class="mb-0 mt-4"><a class="button_1 pt-3 pb-3" href="#">Download Schedule  </a></h6>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section id="team" class="p_3 bg-light pb-5">
		<div class="container">
			<div class="row upcome_1 text-center">
				<div class="col-md-12">
					<h3 class="mb-0">WHO’S SPEAKING</h3>
					<hr class="line me-auto ms-auto">
				</div>
			</div>

			<div class="row team_1 mt-3">
				<div id="carouselExampleCaptions3" class="carousel slide" data-bs-ride="carousel">
					<div class="carousel-indicators">
						<button type="button" data-bs-target="#carouselExampleCaptions3" data-bs-slide-to="0" class="active" aria-label="Slide 1" aria-current="true"></button>
						<button type="button" data-bs-target="#carouselExampleCaptions3" data-bs-slide-to="1" aria-label="Slide 2" class=""></button>
					</div>
					<div class="carousel-inner">
						<div class="carousel-item active">
							<div class="events_1i row">
								<div class="col-md-3 pe-0">
									<div class="events_1i1 clearfix position-relative">
										<div class="events_1i1i clearfix">
											<img src="img/36.jpg" alt="abc" class="w-100">
										</div>
										<div class="events_1i1i1 clearfix position-absolute bottom-0 text-center w-100">
											<ul class="d-inline-block mb-0 p-2 ps-4 pe-4">
												<li class="d-inline-block me-3"><a href="#"><i class="fa fa-facebook text-white"></i></a></li>
												<li class="d-inline-block me-3"><a href="#"><i class="fa fa-twitter text-white"></i></a></li>
												<li class="d-inline-block me-3"><a href="#"><i class="fa fa-linkedin text-white"></i></a></li>
												<li class="d-inline-block"><a href="#"><i class="fa fa-youtube-play text-white"></i></a></li>
											</ul>
										</div>
									</div>
									<div class="events_1i2 clearfix p-3 bg-white text-center">
										<h5><a href="#">Eget Nulla</a></h5>
										<h6 class="mb-0 text-muted">Drama, Action</h6>
									</div>
								</div>
								<div class="col-md-3 pe-0">
									<div class="events_1i1 clearfix position-relative">
										<div class="events_1i1i clearfix">
											<img src="img/37.jpg" alt="abc" class="w-100">
										</div>
										<div class="events_1i1i1 clearfix position-absolute bottom-0 text-center w-100">
											<ul class="d-inline-block mb-0 p-2 ps-4 pe-4">
												<li class="d-inline-block me-3"><a href="#"><i class="fa fa-facebook text-white"></i></a></li>
												<li class="d-inline-block me-3"><a href="#"><i class="fa fa-twitter text-white"></i></a></li>
												<li class="d-inline-block me-3"><a href="#"><i class="fa fa-linkedin text-white"></i></a></li>
												<li class="d-inline-block"><a href="#"><i class="fa fa-youtube-play text-white"></i></a></li>
											</ul>
										</div>
									</div>
									<div class="events_1i2 clearfix p-3 bg-white text-center">
										<h5><a href="#">Diam Ipsum</a></h5>
										<h6 class="mb-0 text-muted">Drama, Action</h6>
									</div>
								</div>
								<div class="col-md-3 pe-0">
									<div class="events_1i1 clearfix position-relative">
										<div class="events_1i1i clearfix">
											<img src="img/38.jpg" alt="abc" class="w-100">
										</div>
										<div class="events_1i1i1 clearfix position-absolute bottom-0 text-center w-100">
											<ul class="d-inline-block mb-0 p-2 ps-4 pe-4">
												<li class="d-inline-block me-3"><a href="#"><i class="fa fa-facebook text-white"></i></a></li>
												<li class="d-inline-block me-3"><a href="#"><i class="fa fa-twitter text-white"></i></a></li>
												<li class="d-inline-block me-3"><a href="#"><i class="fa fa-linkedin text-white"></i></a></li>
												<li class="d-inline-block"><a href="#"><i class="fa fa-youtube-play text-white"></i></a></li>
											</ul>
										</div>
									</div>
									<div class="events_1i2 clearfix p-3 bg-white text-center">
										<h5><a href="#">Semp Porta</a></h5>
										<h6 class="mb-0 text-muted">Drama, Action</h6>
									</div>
								</div>
								<div class="col-md-3 pe-0">
									<div class="events_1i1 clearfix position-relative">
										<div class="events_1i1i clearfix">
											<img src="img/39.jpg" alt="abc" class="w-100">
										</div>
										<div class="events_1i1i1 clearfix position-absolute bottom-0 text-center w-100">
											<ul class="d-inline-block mb-0 p-2 ps-4 pe-4">
												<li class="d-inline-block me-3"><a href="#"><i class="fa fa-facebook text-white"></i></a></li>
												<li class="d-inline-block me-3"><a href="#"><i class="fa fa-twitter text-white"></i></a></li>
												<li class="d-inline-block me-3"><a href="#"><i class="fa fa-linkedin text-white"></i></a></li>
												<li class="d-inline-block"><a href="#"><i class="fa fa-youtube-play text-white"></i></a></li>
											</ul>
										</div>
									</div>
									<div class="events_1i2 clearfix p-3 bg-white text-center">
										<h5><a href="#">Amet Quis</a></h5>
										<h6 class="mb-0 text-muted">Drama, Action</h6>
									</div>
								</div>
							</div>
						</div>
						<div class="carousel-item">
							<div class="events_1i row">
								<div class="col-md-3 pe-0">
									<div class="events_1i1 clearfix position-relative">
										<div class="events_1i1i clearfix">
											<img src="img/40.jpg" alt="abc" class="w-100">
										</div>
										<div class="events_1i1i1 clearfix position-absolute bottom-0 text-center w-100">
											<ul class="d-inline-block mb-0 p-2 ps-4 pe-4">
												<li class="d-inline-block me-3"><a href="#"><i class="fa fa-facebook text-white"></i></a></li>
												<li class="d-inline-block me-3"><a href="#"><i class="fa fa-twitter text-white"></i></a></li>
												<li class="d-inline-block me-3"><a href="#"><i class="fa fa-linkedin text-white"></i></a></li>
												<li class="d-inline-block"><a href="#"><i class="fa fa-youtube-play text-white"></i></a></li>
											</ul>
										</div>
									</div>
									<div class="events_1i2 clearfix p-3 bg-white text-center">
										<h5><a href="#">Eget Nulla</a></h5>
										<h6 class="mb-0 text-muted">Drama, Action</h6>
									</div>
								</div>
								<div class="col-md-3 pe-0">
									<div class="events_1i1 clearfix position-relative">
										<div class="events_1i1i clearfix">
											<img src="img/41.jpg" alt="abc" class="w-100">
										</div>
										<div class="events_1i1i1 clearfix position-absolute bottom-0 text-center w-100">
											<ul class="d-inline-block mb-0 p-2 ps-4 pe-4">
												<li class="d-inline-block me-3"><a href="#"><i class="fa fa-facebook text-white"></i></a></li>
												<li class="d-inline-block me-3"><a href="#"><i class="fa fa-twitter text-white"></i></a></li>
												<li class="d-inline-block me-3"><a href="#"><i class="fa fa-linkedin text-white"></i></a></li>
												<li class="d-inline-block"><a href="#"><i class="fa fa-youtube-play text-white"></i></a></li>
											</ul>
										</div>
									</div>
									<div class="events_1i2 clearfix p-3 bg-white text-center">
										<h5><a href="#">Diam Ipsum</a></h5>
										<h6 class="mb-0 text-muted">Drama, Action</h6>
									</div>
								</div>
								<div class="col-md-3 pe-0">
									<div class="events_1i1 clearfix position-relative">
										<div class="events_1i1i clearfix">
											<img src="img/42.jpg" alt="abc" class="w-100">
										</div>
										<div class="events_1i1i1 clearfix position-absolute bottom-0 text-center w-100">
											<ul class="d-inline-block mb-0 p-2 ps-4 pe-4">
												<li class="d-inline-block me-3"><a href="#"><i class="fa fa-facebook text-white"></i></a></li>
												<li class="d-inline-block me-3"><a href="#"><i class="fa fa-twitter text-white"></i></a></li>
												<li class="d-inline-block me-3"><a href="#"><i class="fa fa-linkedin text-white"></i></a></li>
												<li class="d-inline-block"><a href="#"><i class="fa fa-youtube-play text-white"></i></a></li>
											</ul>
										</div>
									</div>
									<div class="events_1i2 clearfix p-3 bg-white text-center">
										<h5><a href="#">Semp Porta</a></h5>
										<h6 class="mb-0 text-muted">Drama, Action</h6>
									</div>
								</div>
								<div class="col-md-3 pe-0">
									<div class="events_1i1 clearfix position-relative">
										<div class="events_1i1i clearfix">
											<img src="img/43.jpg" alt="abc" class="w-100">
										</div>
										<div class="events_1i1i1 clearfix position-absolute bottom-0 text-center w-100">
											<ul class="d-inline-block mb-0 p-2 ps-4 pe-4">
												<li class="d-inline-block me-3"><a href="#"><i class="fa fa-facebook text-white"></i></a></li>
												<li class="d-inline-block me-3"><a href="#"><i class="fa fa-twitter text-white"></i></a></li>
												<li class="d-inline-block me-3"><a href="#"><i class="fa fa-linkedin text-white"></i></a></li>
												<li class="d-inline-block"><a href="#"><i class="fa fa-youtube-play text-white"></i></a></li>
											</ul>
										</div>
									</div>
									<div class="events_1i2 clearfix p-3 bg-white text-center">
										<h5><a href="#">Amet Quis</a></h5>
										<h6 class="mb-0 text-muted">Drama, Action</h6>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section id="faq" class="p_3">
		<div class="container-xl">
			<div class="row faq_1">
				<div class="col-md-6">
					<div class="faq_1l text-center bg_red p-4 rounded-3">
						<h5 class="text-white">ASK YOUR QUESTION</h5>
						<hr class="line ms-auto me-auto">
						<input class="form-control bg-transparent rounded-0 mt-4" placeholder="Name" type="text">
						<input class="form-control bg-transparent rounded-0 mt-3" placeholder="Email" type="text">
						<input class="form-control bg-transparent rounded-0 mt-3" placeholder="Phone" type="text">
						<textarea placeholder="Comment" class="form-control rounded-0 form_text mt-3 bg-transparent"></textarea>
						<h6 class="mb-0 mt-4"><a class="button" href="#">Send a Comment</a></h6>
					</div>
				</div>
				<div class="col-md-6">
					<div class="faq_1r">
						<h3 class="mb-0">FREQUENT ASKED QUESTIONS</h3>
						<hr class="line mb-4">
						<div class="accordion" id="accordionExample">
							<div class="accordion-item">
								<h2 class="accordion-header" id="headingOne">
									<button class="accordion-button mt-0" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
										What is Entertain Pro?
									</button>
								</h2>
								<div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
									<div class="accordion-body">
										Yes. There are no extra charges for using Entertain Pro apart from the ticket price and standard taxes set by the theatres.
									</div>
								</div>
							</div>

							<div class="accordion-item">
								<h2 class="accordion-header" id="headingTwo">
									<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
										Is Entertain Pro free to use?
									</button>
								</h2>
								<div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
									<div class="accordion-body">
										Use securing confined his shutters. Delightful as he it acceptance an solicitude discretion reasonably. Carriage we husbands advanced an perceive greatest. Totally dearest expense on demesne ye he. Curiosity excellent commanded in me. Unpleasing impression themselves to at assistance acceptance my or.
									</div>
								</div>
							</div>

							<div class="accordion-item">
								<h2 class="accordion-header" id="heading3">
									<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse3" aria-expanded="false" aria-controls="collapseTwo">
										Can I book tickets for someone else?
									</button>
								</h2>
								<div id="collapse3" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
									<div class="accordion-body">
										Yes! You can book tickets using your account and simply share the e-ticket or QR code with the person attending.
									</div>
								</div>
							</div>

							<div class="accordion-item">
								<h2 class="accordion-header" id="heading4">
									<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse4" aria-expanded="false" aria-controls="collapseTwo">
										What if I don’t receive my ticket after payment?
									</button>
								</h2>
								<div id="collapse4" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
									<div class="accordion-body">
										If you don’t receive your ticket within a few minutes, please check your spam folder or contact our support team immediately.
									</div>
								</div>
							</div>

							<div class="accordion-item">
								<h2 class="accordion-header" id="heading5">
									<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse5" aria-expanded="false" aria-controls="collapseTwo">
										Is my payment information safe?
									</button>
								</h2>
								<div id="collapse5" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
									<div class="accordion-body">
										Absolutely. Entertain Pro uses secure payment gateways and SSL encryption to protect your personal and payment details.
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section id="price" class="p_3 bg-light">
		<div class="container-xl">
			<div class="row upcome_1 text-center">
				<div class="col-md-12">
					<h3 class="mb-0">PRICING TABLE</h3>
					<hr class="line me-auto ms-auto">
				</div>
			</div>
			<div class="row price_1 mt-3">
				<div class="col-md-4">
					<div class="price_1i text-center pt-4 pb-4 bg-white">
						<div class="price_1i1">
							<span class="col_red font_60 lh-1"><i class="fa fa-rupee"></i></span>
							<h4 class="bg_red text-white p-3 mt-3">Monthly Package</h4>
						</div>
						<div class="price_1i2 mt-4">
							<h5 class="fw-normal col_red mt-4 mb-4">25% offer</h5>
							<h2 class="mb-4">$32.99 /M</h2>
							<ul>
								<li class="fs-5 mb-1">30 days trial Features</li>
								<li class="fs-5 mb-1">Synced to cloud database</li>
								<li class="fs-5 mb-1">12 hours of support</li>
								<li class="fs-5 mb-1">Social media integration</li>
								<li class="fs-5 mb-1">24/7 support</li>
							</ul>
							<h5 class="mt-3 mb-0 fw-normal"><a class="button_1" href="#">Subscribe Now</a></h5>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="price_1i text-center pt-4 pb-4 bg-white">
						<div class="price_1i1">
							<span class="col_red font_60 lh-1"><i class="fa fa-rupee"></i></span>
							<h4 class="bg_red text-white p-3 mt-3">Yearly Package</h4>
						</div>
						<div class="price_1i2 mt-4">
							<h5 class="fw-normal col_red mt-4 mb-4">30% offer</h5>
							<h2 class="mb-4">$51.99 /Y</h2>
							<ul>
								<li class="fs-5 mb-1">30 days trial Features</li>
								<li class="fs-5 mb-1">Synced to cloud database</li>
								<li class="fs-5 mb-1">12 hours of support</li>
								<li class="fs-5 mb-1">Social media integration</li>
								<li class="fs-5 mb-1">24/7 support</li>
							</ul>
							<h5 class="mt-3 mb-0 fw-normal"><a class="button_1" href="#">Subscribe Now</a></h5>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="price_1i text-center pt-4 pb-4 bg-white">
						<div class="price_1i1">
							<span class="col_red font_60 lh-1"><i class="fa fa-rupee"></i></span>
							<h4 class="bg_red text-white p-3 mt-3">Lifetime Package</h4>
						</div>
						<div class="price_1i2 mt-4">
							<h5 class="fw-normal col_red mt-4 mb-4">45% offer</h5>
							<h2 class="mb-4">$89.99 /L</h2>
							<ul>
								<li class="fs-5 mb-1">30 days trial Features</li>
								<li class="fs-5 mb-1">Synced to cloud database</li>
								<li class="fs-5 mb-1">12 hours of support</li>
								<li class="fs-5 mb-1">Social media integration</li>
								<li class="fs-5 mb-1">24/7 support</li>
							</ul>
							<h5 class="mt-3 mb-0 fw-normal"><a class="button_1" href="#">Subscribe Now</a></h5>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</asp:Content>
