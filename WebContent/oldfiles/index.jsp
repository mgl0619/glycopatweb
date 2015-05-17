<%@page language="Java" contentType="text/html;charset=UTF-8" import="java.util.*, glycopat.model.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>GlycoPAT on Web</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="GlycoPAT web application">
<meta name="author" content="Gang Liu">
<!--import bootstrap-->
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery-2.1.3.min.js"></script>

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
<script src="js/jquery.easing.min.js"></script>
<script src="js/scrolling-nav.js"></script>

<!--import select-->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.5/css/bootstrap-select.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.5/js/bootstrap-select.min.js"></script>
</head>

<body id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">
	<!-- Navigation -->
	<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
		<div class="container">
			<div class="navbar-header page-scroll">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="navbar-ex1-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
				<a class="navbar-brand page-scroll" href="#page-top">GlycoPAT on
					WEB</a>
			</div>

			<!-- collect the nav links, forms and other contents from toggling -->
			<div class="collapse navbar-collapse navbar-ex1-collapse">
				<ul class="nav navbar-nav navbar-right">
					<li class="hidden"><a class="page-scroll" href="#page-top"></a>
					</li>
					<li><a class="page-scroll" href="#protdigest">Protein
							Digestion</a></li>
					<li><a class="page-scroll" href="#tandemms">MS/MS Analysis</a>
					</li>
					<li><a class="page-scroll" href="fragment.jsp">Theoretical
							Fragmentation</a></li>
					<li><a class="page-scroll" href="#help">Help</a></li>
					<li><a class="page-scroll" href="#contact">Contact</a></li>
				</ul>
			</div>
			<!-- collect the nav links, forms and other contents from toggling -->
		</div>
		<!-- container -->
	</nav>
	<!-- navbar -->

	<!-- Intro Section -->
	<section id="intro" class="intro-section">
		<div class="container">
			<div class="jumbotron">
				<h2>GlycoProteomics Analysis Web Service</h2>
				<p>This website aims to provide an online platform for the
					streamlined analysis of traditional LC-MSn experimental data for
					the identification of site-specific N- and O-linked glycosylation
					on various proteins..</p>
				<a class="btn btn-default page-scroll" href="#protdigest">Click
					Me to Start!</a>
			</div>

			<div class="row">
				<div class="col-sm-12">
					<h4 class="text-left">
						<strong>It follows a three-step workflow that includes:<br>
							<br></strong>
					</h4>
					<ol>
						<li><h4 class="text-left">
								<strong>The in silico generation of a library of
									putative glycopeptides by protease digestion;</strong>
							</h4></li>
						<li><h4 class="text-left">
								<strong>Tandem MS analysis using a novel MS scoring
									scheme;</strong>
							</h4></li>
						<li><h4 class="text-left">
								<strong>A spectra and fragmentation viewer to visualize
									and annotate the results.</strong>
							</h4></li>
					</ol>

				</div>
			</div>

			<!-- <div class="row">
				<div class="col-lg-12">
					<h1>GlycoProteomics Analysis</h1>
					                    <br><br>
										<h4 class="bg-info "><strong>This web service aims to provide an online platform for the streamlined analysis of traditional 
										LC-MSn based proteomics experimental data for the identification of site-specific N- and O-linked glycosylation on various proteins. 
										It follows a three-step workflow that includes:<br><br>
										1) The in silico generation of a library of putative glycopeptides by protease digestion;<br>
										2) Tandem MS analysis using a novel MS scoring scheme;<br>
										3) A spectra and fragmentation viewer to visualize and annotate the results.</strong></h4>
										<br><br>
										<br><br>
					<a class="btn btn-default page-scroll" href="#protdigest">Click
						Me to Start!</a>
				</div>
			</div> -->
		</div>
	</section>

	<section id="protdigest" class="digest-section">
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<br> <br> <br> <br>
				</div>
			</div>

			<div class="row">
				<div class="col-sm-12">
					<h4 style="color: red" class="text-left">To create a list of
						glycopeptide fragments by enzymatic digestion, please provide 9
						inputs as listed below:</h4>
				</div>
			</div>
            
            <form role="form" action="DigestWebControl" method="post">
			<div class="row">			   
				<div class="col-sm-6">
					<div class="form-group">
						<label for="input1"> 1.Select Protein FASTA file: </label> <input
							id="input1" type="file" name="protseqfilename"
							data-show-preview="false" multiple class="file-loading">
						<script>
									$("#input1")
										.fileinput(
										{
											uploadUrl : "FileUpload",
																uploadAsync : true,
																maxFileCount : 5,
																allowedFileExtensions : [ "txt" ]
															});
								</script>
					</div>
				</div>

				<div class="col-md-6">
					<div class="form-group">
						<label for="input2"> 2. Select Fixed Protein Modification
							file: </label> <input id="input2" type="file" name="fixedptmfilename"
							data-show-preview="false" multiple class="file-loading">
						<script>
									$("#input2")
													.fileinput(
															{
																uploadUrl : "FileUpload",
																uploadAsync : true,
																maxFileCount : 5,
																allowedFileExtensions : [ "txt" ]
														});
						     	</script>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label for="input3"> 3. Select Variable Protein
							Modification file: </label> <input id="input3" type="file" multiple
							class="file-loading" name="variableptmfilename"
							data-show-preview="false">
						<script>
											$("#input3")
													.fileinput(
															{
																uploadUrl : "FileUpload",
																uploadAsync : true,
																maxFileCount : 5,
																allowedFileExtensions : [ "txt" ]
															});
								</script>
					</div>
				</div>

				<div class="col-md-6">
					<div class="form-group">
						<label for="enz"> 4.Select the enzyme from the list: </label> <select
							id="enz" class="form-control" name="enz">
							<option>Trypsin</option>
							<option>GluC</option>
							<option>Lys-C</option>
							<option>CNBR</option>
						</select>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-md-3">
					<div class="form-group">
						<label for="maxmisscleavage"> <b>5. Max. Missing
								Cleaveage</b>
						</label> <input type="text" class="form-control" id="maxmisscleavages"
							placeholder="Enter 0-3" name="missedMax">
					</div>
				</div>
				<div class="col-md-3">
					<div class="form-group">
						<label for="minpeplength"> <b>6. Min. Peptide Length</b>
						</label> <input type="text" class="form-control" id="minpeplength"
							placeholder="Enter 2-10" name="minPepLen">
					</div>
				</div>
				<div class="col-md-3">
					<div class="form-group">
						<label for="maxpeplength"> <b>7. Max. Peptide Length</b>
						</label> <input type="text" class="form-control" id="maxpeplength"
							placeholder="Enter 35-50" name="maxPepLen">
					</div>
				</div>
				<div class="col-md-3">
					<div class="form-group">
						<label for="maxnomod"> <b>8. Max. Number Modification</b>
						</label> <input type="text" class="form-control" id="maxnomod"
							placeholder="Enter 1-3" name="maxPTM">
					</div>
				</div>
				<div class="col-md-3">
					<div class="form-group">
						<label for="minnomod"> <b>9. Min. Number Modification</b>
						</label> <input type="text" class="form-control" id="minnomod"
							placeholder="Enter 0-1" name="minPTM">
					</div>
				</div>
			</div>

			<!-- </div>
				</div>
			</div> -->

			<div class="row">
				<div class="col-md-12">
					<div class="form-group">
						<div class="span 7 text-center">
							<button type="submit" class="btn btn-primary">Digest</button>
						</div>
					</div>
				</div>
			</div>
            </form> 

			<div class="row">
				<div class="col-md-12">
					<div class="form-group">
						<label for="digtpep">List of Digested Peptides:</label>
						<textarea class="form-control" rows="10" id="digtprot">
					         	  <%
					         	  	String display = (String) request.getAttribute("digest");
					         	  	if (display != null) {
					         	  		out.println(display);
					         	  	}
					         	  %>
         	  			</textarea>
					</div>
				</div>
			</div>

		</div>
	</section>

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
						<textarea class="form-control" rows="10" id="scorestatus">
					         	  <%
					         	  	String scorestatus = "";
					         	    scorestatus = (String) request.getAttribute("score");
					         	  	if (display != null) {
					         	  		out.println(scorestatus);
					         	  	}
					         	  %>
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

	<!-- Fragmentation Section -->
	<section id="frag" class="frag-section">
		<div class="container">
			<form role="form" action="FragmentControl" method="post">
				<div class="row">
				  <div class="form-group text-left">
					<div class="col-md-9">
						<div class="form-group">
							<label for="glysgp" class="text-left"> <b>1. Peptide sequence or
									glycopeptide sequence </b>
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
							<div class="btn-group" role="group" data-toggle="buttons-radio">
							  <label class="btn btn-default">
							    <input name="options" id="chargeopt1" autocomplete="off" type="radio">Charge&lt;Z
							  </label>
							  <label class="btn btn-default">
							    <input name="options" id="chargeopt2" autocomplete="off" type="radio">Charge&#61;Z
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
	</section>

	<!-- Help Section -->
	<section id="Help" class="help-section">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h1></h1>
				</div>
			</div>
		</div>
	</section>

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