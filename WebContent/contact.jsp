<%@page language="java" contentType="text/html;charset=UTF-8" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*, glycopat.model.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>Peptide Fragmentation</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="GlycoPAT Peptide Fragmentation">
<meta name="author" content="Gang Liu">
<!--import bootstrap-->
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery-2.1.3.min.js"></script>
<script src="js/jquery.easing.min.js"></script>
<script src="js/bootstrap.min.js"></script>


<!--import jasny-->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jasny-bootstrap/3.1.3/css/jasny-bootstrap.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jasny-bootstrap/3.1.3/js/jasny-bootstrap.min.js"></script>

<!--import fileinput-->
<script src="js/fileinput.min.js"></script>
<link rel="stylesheet" href="css/fileinput.min.css">

<!-- Custom CSS -->
<link href="css/scrolling-nav.css" rel="stylesheet">
<script src="js/scrolling-nav.js"></script>

<!--import select-->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.5/css/bootstrap-select.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.5/js/bootstrap-select.min.js"></script>
</head>

<body id="page-top" data-target=".navbar-fixed-top">
	<!-- Navigation -->
	<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
		<div class="container">
			<div class="navbar-header page-scroll">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="navbar-ex1-collapse">
					<span class="sr-only">Toggle navigation</span> 
					<span class="icon-bar"></span> <span class="icon-bar"></span> 
					<span class="icon-bar"></span> <span class="icon-bar"></span> 
				    <span class="icon-bar"></span> <span class="icon-bar"></span>  
					<span class="icon-bar"></span> <span class="icon-bar"></span> 
					<span class="icon-bar"></span> <span class="icon-bar"></span> 
				</button>
				<a class="navbar-brand page-scroll" href="index.html">GlycoPAT on WEB</a>
			</div>

			<!-- collect the nav links, forms and other contents from toggling -->
			<div class="collapse navbar-collapse navbar-ex1-collapse" id="">
				<ul class="nav navbar-nav navbar-right">
					<li class="hidden"><a class="page-scroll" href="index.html"></a>
					</li>
					<li><a class="page-scroll" href="digest.jsp">Protein
							Digestion</a></li>
					<li><a class="page-scroll" href="tandemms.jsp">MS/MS Analysis</a>
					</li>
					<li><a class="page-scroll" href="fragment.jsp">Theoretical
							Fragmentation</a></li>
					<li><a class="page-scroll" href="help.html">Help</a></li>
					<li><a class="page-scroll" href="contact.jsp">Contact</a></li>
				</ul>
			</div>
			<!-- collect the nav links, forms and other contents from toggling -->
		</div>
		<!-- container -->
	</nav>
	<!-- navbar -->
    	<!-- Contact Section -->
	<section id="contact" class="contact-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2 text-left">
					<h2 class="section-heading">Have questions, problems or
						comments? Write to us!</h2>
					<form name="sentMessage" id="contactForm" novalidate>
						<div class="row control-group">
							<div
								class="form-group col-xs-12 floating-label-form-group controls">
								<label>Name:</label> <input type="text" class="form-control"
									placeholder="Name" id="name" required
									data-validation-required-message="Please enter your name.">
								<p class="help-block text-danger"></p>
							</div>
						</div>
						<div class="row control-group">
							<div
								class="form-group col-xs-12 floating-label-form-group controls">
								<label>Email Address:</label> <input type="email"
									class="form-control" placeholder="Email Address" id="email"
									required
									data-validation-required-message="Please enter your email address.">
								<p class="help-block text-danger"></p>
							</div>
						</div>
						<div class="row control-group">
							<div
								class="form-group col-xs-12 floating-label-form-group controls">
								<label>Message:</label>
								<textarea rows="5" class="form-control" placeholder="Message"
									id="message" required
									data-validation-required-message="Please enter a message."></textarea>
								<p class="help-block text-danger"></p>
							</div>
						</div>
						<br>
						<div id="success"></div>
						<div class="row">
							<div class="form-group col-xs-12 text-center">
								<button type="submit" class="btn btn-primary">Send</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	</body>
</html>