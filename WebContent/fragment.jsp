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

	<!-- Fragmentation Section -->
	<section id="frag" class="frag-section">
		<div class="container">
			<form role="form" action="FragmentControl" method="post">
				<div class="row">
				  <div class="form-group text-left">
					<div class="col-md-9">
						<div class="form-group">
							<label for="glysgp" class="text-left"> <b>1. Peptide or	glycopeptide sequence </b>
							</label> <input type="text" class="form-control" id="glysgp"
								placeholder="Copy or paste sequence here " name="glysgp">
						</div>
					</div>

					<div class="col-md-3">
						<div class="form-group">
							<label for="ioncharge" class="control-label"> <b>2. Ion Charge</b>
							</label> <input type="text" class="form-control" id="ioncharge"
								placeholder="Enter 1-8" name="z">
						</div>
					</div>
				   </div>	
				</div>

				<div class="row">
					<div class="form-group text-left">
						<div class="col-md-3">
							<div class="form-group">
								<label for="npfrag"> <b>3. npFrag:</b></label> <input
									type="text" class="form-control" id="npfrag"
									placeholder="Enter 1" name="npFrag">
							</div>
						</div>

						<div class="col-md-3">
							<div class="form-group">
								<label for="ngfrag"> <b>4: ngfrag</b></label> <input type="text"
									class="form-control" id="ngfrag" placeholder="Enter 0"
									name="ngFrag">
							</div>
						</div>

						<div class="col-md-3">
							<div class="form-group">
								<label for="nmfrag"> <b>5. nmfrag</b></label> <input type="text"
									class="form-control" id="nmfrag" placeholder="Enter 0"
									name="nmFrag">
							</div>
						</div>

						<div class="col-md-3">
						  <div class="form-group">
						    <label> 6. Charge Option </label> 
							<div class="btn-group" role="group" data-toggle="buttons">
							  <label class="btn btn-default">
							    <input name="chargeopt" id="chargeopt1" type="radio" value="1">Charge&lt;Z
							  </label>
							  <label class="btn btn-default">
							    <input name="chargeopt" id="chargeopt2" type="radio" value="0">Charge&#61;Z
							  </label>							  
							</div>
						   </div>	
						</div>
					</div>
				</div>

				<div class="row">
					<div class="form-group text-center">
						<button type="submit" class="btn btn-primary">Perform
							Fragmentation!</button>
					</div>
				</div>
				</form>
				
				<div class="row">
				   <div class="col-md-12">
				        <h4 class="text-left">Fragmentation Result:</h4>
				        <hr>				        				       
				   </div>     
				</div>
				
				<div class="row">
				   <div class="col-md-12">
					   <table class="table table-striped">
						     <thead>
						       <tr>
						          <th class="text-center">Original</th>
						          <th class="text-center">Fragment</th>
						          <th class="text-center">Type</th>
						          <th class="text-center">mz</th>
						          <th class="text-center">nmFrag</th>
						          <th class="text-center">npFrag</th>
						          <th class="text-center">ngFrag</th>
						          <th class="text-center">z</th>
						       </tr>
						     </thead>  
		                 	 <tbody>
							 <c:forEach items="${fragIons}" var="ion">
							    <tr>
							        <td>
							            ${ion.original}
							        </td>
							        <td>
							            ${ion.sgp}
							        </td>
							        <td>
							            ${ion.type}
							        </td>
							        <td>
							            ${ion.mz}
							         </td>
							         <td>
							            ${ion.nmFrag}
							        </td>
							         <td>
							           ${ion.npFrag}
							        </td>
							        <td>
						                ${ion.ngFrag}
							        </td>
							        <td>
						                ${ion.charge}
							        </td>
								 </tr>
							  </c:forEach>
						  </tbody>
						 </table>
					 </div>  	 
				   </div>
			  </div>			   
	</section>	
  </body>
</html>