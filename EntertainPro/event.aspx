<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="event.aspx.cs" Inherits="EntertainPro._event" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <section id="center" class="center_o pt-5">
 <div class="container">
   <div class="row center_o1 text-center">
    <div class="col-md-12">
	  <h2>EVENTS</h2>
	  <h5 class="bg_dark d-inline-block p-4 mb-0 mt-4 pt-2 pb-2 fw-normal col_red"><a class="text-white" href="#">Home</a>  <span class="me-2 ms-2 text-muted"> /</span>   Events</h5>
	</div>
   </div>
  </div>
</section>

<section id="event" class="p_3 bg-light">
 <div class="container">
   <div class="row upcome_1 text-center">
   <div class="col-md-12">
     <h3 class="mb-0">UPCOMING EVENTS</h3>
	 <hr class="line me-auto ms-auto">
   </div>
  </div>
   <div class="row event1 mt-3">
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
		  <h6>Delhi &amp; Mumbai 
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

<section id="events" class="p_3 pb-5">
 <div class="container-xl">
  <div class="row upcome_1 text-center">
   <div class="col-md-12">
     <h3 class="mb-0">FEATURED EVENTS</h3>
	 <hr class="line me-auto ms-auto">
   </div>
  </div>
  <div class="row events_1 mt-3">
   <div id="carouselExampleCaptions3" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleCaptions3" data-bs-slide-to="0" class="" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions3" data-bs-slide-to="1" aria-label="Slide 2" class="active" aria-current="true"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item">
       <div class="events_1i row">
	    <div class="col-md-4">
		 <div class="events_1i1 clearfix position-relative">
		  <div class="events_1i1i clearfix">
		    <img src="img/19.jpg" alt="abc" class="w-100">
		  </div>
		  <div class="events_1i1i1 clearfix position-absolute bottom-0 text-center w-100">
		    <h6 class="mb-0"><a class="button_1" href="#">Book Now </a></h6>
		  </div>
		 </div>
		 <div class="events_1i2 clearfix p-3 pt-4 pb-4 bg-light">
		  <h5 class="text-uppercase"><a href="#">Music Event in India</a></h5>
		  <h6>Delhi &amp; Mumbai 
			 <span class="col_red pull-right">
				 <i class="fa fa-star"></i>
				 <i class="fa fa-star"></i>
				 <i class="fa fa-star"></i>
				 <i class="fa fa-star"></i>
				 <i class="fa fa-star-o"></i>
				</span>
			 </h6>
			 <hr>
			 <h6 class="mb-0">June 09 - July 06 <span class="pull-right">09:00-13:00 pm</span></h6>
		 </div>
		</div>
		<div class="col-md-4">
		 <div class="events_1i1 clearfix position-relative">
		  <div class="events_1i1i clearfix">
		    <img src="img/20.jpg" alt="abc" class="w-100">
		  </div>
		  <div class="events_1i1i1 clearfix position-absolute bottom-0 text-center w-100">
		    <h6 class="mb-0"><a class="button_1" href="#">Book Now </a></h6>
		  </div>
		 </div>
		 <div class="events_1i2 clearfix p-3 pt-4 pb-4 bg-light">
		  <h5 class="text-uppercase"><a href="#">Music Event in India</a></h5>
		  <h6>Delhi &amp; Mumbai 
			 <span class="col_red pull-right">
				 <i class="fa fa-star"></i>
				 <i class="fa fa-star"></i>
				 <i class="fa fa-star"></i>
				 <i class="fa fa-star"></i>
				 <i class="fa fa-star-o"></i>
				</span>
			 </h6>
			 <hr>
			 <h6 class="mb-0">June 09 - July 06 <span class="pull-right">09:00-13:00 pm</span></h6>
		 </div>
		</div>
		<div class="col-md-4">
		 <div class="events_1i1 clearfix position-relative">
		  <div class="events_1i1i clearfix">
		    <img src="img/21.jpg" alt="abc" class="w-100">
		  </div>
		  <div class="events_1i1i1 clearfix position-absolute bottom-0 text-center w-100">
		    <h6 class="mb-0"><a class="button_1" href="#">Book Now </a></h6>
		  </div>
		 </div>
		 <div class="events_1i2 clearfix p-3 pt-4 pb-4 bg-light">
		  <h5 class="text-uppercase"><a href="#">Music Event in India</a></h5>
		  <h6>Delhi &amp; Mumbai 
			 <span class="col_red pull-right">
				 <i class="fa fa-star"></i>
				 <i class="fa fa-star"></i>
				 <i class="fa fa-star"></i>
				 <i class="fa fa-star"></i>
				 <i class="fa fa-star-o"></i>
				</span>
			 </h6>
			 <hr>
			 <h6 class="mb-0">June 09 - July 06 <span class="pull-right">09:00-13:00 pm</span></h6>
		 </div>
		</div>
	   </div>
    </div>
    <div class="carousel-item active">
        <div class="events_1i row">
	    <div class="col-md-4">
		 <div class="events_1i1 clearfix position-relative">
		  <div class="events_1i1i clearfix">
		    <img src="img/22.jpg" alt="abc" class="w-100">
		  </div>
		  <div class="events_1i1i1 clearfix position-absolute bottom-0 text-center w-100">
		    <h6 class="mb-0"><a class="button_1" href="#">Book Now </a></h6>
		  </div>
		 </div>
		 <div class="events_1i2 clearfix p-3 pt-4 pb-4 bg-light">
		  <h5 class="text-uppercase"><a href="#">Music Event in India</a></h5>
		  <h6>Delhi &amp; Mumbai 
			 <span class="col_red pull-right">
				 <i class="fa fa-star"></i>
				 <i class="fa fa-star"></i>
				 <i class="fa fa-star"></i>
				 <i class="fa fa-star"></i>
				 <i class="fa fa-star-o"></i>
				</span>
			 </h6>
			 <hr>
			 <h6 class="mb-0">June 09 - July 06 <span class="pull-right">09:00-13:00 pm</span></h6>
		 </div>
		</div>
		<div class="col-md-4">
		 <div class="events_1i1 clearfix position-relative">
		  <div class="events_1i1i clearfix">
		    <img src="img/23.jpg" alt="abc" class="w-100">
		  </div>
		  <div class="events_1i1i1 clearfix position-absolute bottom-0 text-center w-100">
		    <h6 class="mb-0"><a class="button_1" href="#">Book Now </a></h6>
		  </div>
		 </div>
		 <div class="events_1i2 clearfix p-3 pt-4 pb-4 bg-light">
		  <h5 class="text-uppercase"><a href="#">Music Event in India</a></h5>
		  <h6>Delhi &amp; Mumbai 
			 <span class="col_red pull-right">
				 <i class="fa fa-star"></i>
				 <i class="fa fa-star"></i>
				 <i class="fa fa-star"></i>
				 <i class="fa fa-star"></i>
				 <i class="fa fa-star-o"></i>
				</span>
			 </h6>
			 <hr>
			 <h6 class="mb-0">June 09 - July 06 <span class="pull-right">09:00-13:00 pm</span></h6>
		 </div>
		</div>
		<div class="col-md-4">
		 <div class="events_1i1 clearfix position-relative">
		  <div class="events_1i1i clearfix">
		    <img src="img/24.jpg" alt="abc" class="w-100">
		  </div>
		  <div class="events_1i1i1 clearfix position-absolute bottom-0 text-center w-100">
		    <h6 class="mb-0"><a class="button_1" href="#">Book Now </a></h6>
		  </div>
		 </div>
		 <div class="events_1i2 clearfix p-3 pt-4 pb-4 bg-light">
		  <h5 class="text-uppercase"><a href="#">Music Event in India</a></h5>
		  <h6>Delhi &amp; Mumbai 
			 <span class="col_red pull-right">
				 <i class="fa fa-star"></i>
				 <i class="fa fa-star"></i>
				 <i class="fa fa-star"></i>
				 <i class="fa fa-star"></i>
				 <i class="fa fa-star-o"></i>
				</span>
			 </h6>
			 <hr>
			 <h6 class="mb-0">June 09 - July 06 <span class="pull-right">09:00-13:00 pm</span></h6>
		 </div>
		</div>
	   </div>
    </div>
  </div>
</div>
  </div>
 </div>
</section>
</asp:Content>
