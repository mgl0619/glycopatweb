<%@page language="java" contentType="text/html;charset=UTF-8" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*, glycopat.model.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>MS/MS Analysis</title>
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
    	<!-- Services Section -->
	<section id="tandemms" class="digest-section">
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<br> <br> <br> <br> <br>
				</div>
			</div>

			<div class="row">
				<div class="col-sm-6">
					<div class="form-group">
						<label for="inputmzxmlfile"> 1. Select an mzXML file: </label> <input
							id="mzxmlfile" type="file" name="mzxmlfilename"
							data-show-preview="false" multiple class="file-loading">
						<script>
									$("#mzxmlfile").fileinput(
											{
												uploadUrl : "FileUpload",
												uploadAsync : true,
												maxFileCount : 5,
												allowedFileExtensions : [
														"mzXML", "xml" ]
											});
								</script>
					</div>
				</div>

				<div class="col-md-6">
					<div class="form-group">
						<label for="inputdatabasefile"> 2. Select a peptide
							database file: </label> <input id="databasefile" type="file"
							name="databasefile" data-show-preview="false" multiple
							class="file-loading">
						<script>
									$("#databasefile").fileinput({
										uploadUrl : "FileUpload",
										uploadAsync : true,
										maxFileCount : 5,
										allowedFileExtensions : [ "txt" ]
									});
								</script>
					</div>
				</div>
			</div>


			<div class="form-group">
				<label for="fragmode"> 3. Fragmentation Mode </label>
				<div class="panel panel-default" id="fragmode">
					<div class="panel-body">
						<div class="row">
							<div class="col-md-3">
								<div class="form-group">
									<input type="radio" name="etdchoice" id="etdchoice" value="ETD">
									<label for="etdchoice"> ETD Default </label>
									<table class="table table-bordered table-condensed">
										<thead>
											<tr>
												<th>Parameter</th>
												<th>Value</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>nmFrag</td>
												<td>0</td>
											</tr>
											<tr>
												<td>ngFrag</td>
												<td>0</td>
											</tr>
											<tr>
												<td>npFrag</td>
												<td>1</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>

							<div class="col-md-3">
								<div class="form-group">
									<input type="radio" name="cidetdchoice" id="cidetdchoice"
										value="CIDHCD"> <label for="cidetdchoice">
										CID/HCD Default </label>
									<table class="table table-bordered table-condensed">
										<thead>
											<tr>
												<th>Monosaccharide No.</th>
												<th>=0</th>
												<th>&lt;4</th>
												<th>&ge;4</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>nmFrag</td>
												<td>0</td>
												<td>0</td>
												<td>0</td>
											</tr>
											<tr>
												<td>ngFrag</td>
												<td>0</td>
												<td>2</td>
												<td>2</td>
											</tr>
											<tr>
												<td>npFrag</td>
												<td>1</td>
												<td>1</td>
												<td>0</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>

							<div class="col-md-3">
								<form class="form-inline" role="form">
									<div class="form-group">
										<input type="radio" name="custom" id="custom" value="custom">
										<label for="custom"> Custom Fragmentation </label>
									</div>
								</form>

								<form class="form-inline" role="form">
									<div class="form-group">
										<label for="customselect" class="control-label">Frag.
											Mode:</label> <select class="form control" id="customselect">
											<option>CID</option>
											<option>HCD</option>
											<option>ETD</option>
										</select>
									</div>
								</form>

								<form class="form-inline" role="form">
									<div class="form-group">
										<label for="customnmfrag" class="sr-only">nmFrag:</label> <input
											type="text" class="form-control" id="customnmfrag"
											placeholder="nmFrag: Enter 0" name="customnmfrag">
									</div>
								</form>

								<form class="form-inline" role="form">
									<div class="form-group">
										<label for="customngFrag" class="sr-only">ngFrag:</label> <input
											type="text" class="form-control" id="customngfrag"
											placeholder="ngFrag: Enter 0" name="customngfrag">
									</div>
								</form>

								<form class="form-inline" role="form">
									<div class="form-group">
										<label for="customnpfrag" class="sr-only">npfrag:</label> <input
											type="text" class="form-control" id="customnpfrag"
											placeholder="npFrag: Enter 0" name="customnpfrag">
									</div>
								</form>
							</div>

							<div class="col-md-3">
								<div class="form-group">
									<input type="radio" name="auto" id="auto" value="auto">
									<label for="auto"> Auto Select Fragmentation </label>
									<table class="table table-bordered table-condensed">
										<thead>
											<tr>
												<th>Mode</th>
												<th>AutoSelect</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>nmFrag</td>
												<td>See Left</td>
											</tr>
											<tr>
												<td>ngFrag</td>
												<td>See Left</td>
											</tr>
											<tr>
												<td>npFrag</td>
												<td>See Left</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-md-3">
					<div class="form-group">
						<label for="ms1tol" class="control-label"> 4. MS1 Tol: </label> <input
							type="text" class="form-control" id="ms1tol" placeholder="1"
							name="ms1tol">
					</div>
				</div>

				<div class="col-md-3">
					<div class="form-group">
						<label for="ms1tolunit"> 5. MS1 Unit: </label> <select
							id="ms1tolunit" class="form-control" name="ms1tolunit">
							<option>Da</option>
							<option>ppm</option>
						</select>
					</div>
				</div>

				<div class="col-md-3">
					<div class="form-group">
						<label for="ms2tol"> 6. MS2 Tol: </label> <input type="text"
							class="form-control" id="ms1tol" placeholder="20" name="ms2tol">
					</div>
				</div>

				<div class="col-md-3">
					<div class="form-group">
						<label for="ms2tolunit"> 7. MS2 Unit: </label> <select
							id="ms2tolunit" class="form-control" name="ms2tolunit">
							<option>ppm</option>
							<option>Da</option>
						</select>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-md-3">
					<div class="form-group">
						<label for="cutoffmedian"> 8. Cut-off median value: </label> <input
							type="text" class="form-control" id="cutoffmed" placeholder="2"
							name="cutoffmed">
					</div>
				</div>

				<div class="col-md-3">
					<div class="form-group">
						<label for="cutoffpervalue"> 9. Cut-off % value: </label> <input
							type="text" class="form-control" id="cutoffpervalue"
							placeholder="0.02" name="cutoffperc">
					</div>
				</div>

				<div class="col-md-3">
					<div class="form-group">
						<label for="maxlag"> 10. Maximum Lag: </label> <input type="text"
							class="form-control" id="maxlag" placeholder="50" name="maxlag">
					</div>
				</div>

				<div class="col-md-3">
					<div class="form-group">
						<label for="peakselect"> 11. Searching Peak: </label> <input
							type="text" class="form-control" id="peakselect"
							placeholder="366" name="peakselect">
					</div>
				</div>
			</div>

			<div class="row">
				<br>
				<div class="col-md-12">
					<div class="form-group">
						<div class="span 6 text-center">
							<button type="submit" class="btn btn-primary">Score All
								Spectra !</button>
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-md-12">
					<div class="form-group">
						<label for="scorestatus">Scoring Status:</label>
						<textarea class="form-control" rows="3" id="scorestatus">					         	  
         	  			</textarea>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-md-12">
					<div class="form-group">
						<div class="span 6 text-center">
							<a class="btn btn-primary" href="#protdigest">Click Me to
								View the Results!</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section> 
	</body>
</html>