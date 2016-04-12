<%-- 
    Document   : Login Module
    Created on : Apr 11, 2016, 11:10:07 AM
    Author     : Hanwei
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<title>SignUp</title>
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
		
		<style>


		.container{
			padding:20px;
			text-align: center;
		}


		.form-group{
			margin:10px 0px !important;
		}
			
		

		.container marketing{
		
		}

		.row{
			margin:0px;
		}
	
		.input-group{
			float:left !important;
			margin:10px 0px;
		}

		#register{
			width:100%;
			margin:20px auto;
			
		}
		</style>

	</head>

	<body>
		 

		<!-- container -->
	    <div class="container">
			<!--inner container-->
	    	<div class="jumbotron col-md-8 col-md-offset-2">

		    	<h3 class="form-signin-heading">Sign Up</h3>
		    	<hr>
	    		<!-- <div class="col-md-6 col-md-offset-3"style="padding:0"> -->
	    		<!--form-->
		    	<form class="form-horizontal" action="registration" method="post">
		    		<!--Name-->
		    		
		    		<div class="row">
		    			<!--firstname-->
			    		<div class="col-md-6 input-group" style="padding-right:2px">
				        	<span class="input-group-addon" id="firstName">First Name</span>
					        <input type="text" name="firstname" class="form-control" placeholder="" aria-describedby="basic-addon1" value="">
				      	</div>
						
						<!--lastname-->
				      	<div class="col-md-6 input-group" style="padding-left:2px">
				        	<span class="input-group-addon" id="lastName">Last Name</span>
					        <input type="text" name="lastname" class="form-control" placeholder="" aria-describedby="basic-addon1" value="">
				      	</div>
				    </div> <!-- row -->

			      	<!--email-->
			      	<div class="input-group">
						<span class="input-group-addon" id="basic-addon1">Email</span>
					  	<input type="email" name="email" id="inputEmail" class="form-control" placeholder="john@gmail.com" required autofocus aria-describedby="basic-addon1">
					</div>

					<!--password-->
					<div class="input-group">
						<span class="input-group-addon" id="basic-addon1">Password</span>
						<input type="password" id="inputPassword" name="password" class="form-control" placeholder="Password" required>
					</div>


					<!--Security Question 1-->
					<div>
					<label class="control-label">Security Question 1</label>
						<select name="secQue1" class="form-control">
							<option selected disabled>Security Question</option>
							<option>What is the name of your favorite book as a child?</option>
							<option>What is the name of your 1st grade teacher?</option>
							<option>What was the color of the first car you owned?</option>
							<option>What was the name of the first pet you owned?</option>
							<option>What is the name of the city where you got lost?</option>
							<option>Where were you New Year's 2000?</option>
							<option>Who was your childhood role model?</option>
							<option>When you were young, what did you want to be be when you grew up?</option>
							<option>What is the street name you lived in as a child?</option>
							<option>In what town/city did your mother and father meet?</option>
						</select>
					</div>

					<!-- answer 1-->
					<div class="form-group">
						<label class="control-label">Answer 1:</label>
						<input type="text" class="form-control" name="answer1" required placeholder="Input your answer for question 1">
					</div>



					<!--Security Question 2-->
					<div class="dropdown">
					<label class="control-label">Security Question 2</label>
						<select name="secQue2" class="form-control">
							<option selected disabled>Security Question</option>
							<option>What is the name of your favorite book as a child?</option>
							<option>What is the name of your 1st grade teacher?</option>
							<option>What was the color of the first car you owned?</option>
							<option>What was the name of the first pet you owned?</option>
							<option>What is the name of the city where you got lost?</option>
							<option>Where were you New Year's 2000?</option>
							<option>Who was your childhood role model?</option>
							<option>When you were young, what did you want to be be when you grew up?</option>
							<option>What is the street name you lived in as a child?</option>
							<option>In what town/city did your mother and father meet?</option>
						</select>
					</div>
					
					<!-- answer 2-->
					<div class="form-group">
						<label class="control-label">Answer 2:</label>
						<input type="text" class="form-control" name="answer3" required placeholder="Input your answer for question 2">
					</div>

					
					<!--Security Question 3-->
					<div class="dropdown">
					<label class="control-label">Security Question 3</label>
						<select name="secQue3" class="form-control">
							<option selected disabled>Security Question</option>
							<option>What is the name of your favorite book as a child?</option>
							<option>What is the name of your 1st grade teacher?</option>
							<option>What was the color of the first car you owned?</option>
							<option>What was the name of the first pet you owned?</option>
							<option>What is the name of the city where you got lost?</option>
							<option>Where were you New Year's 2000?</option>
							<option>Who was your childhood role model?</option>
							<option>When you were young, what did you want to be be when you grew up?</option>
							<option>What is the street name you lived in as a child?</option>
							<option>In what town/city did your mother and father meet?</option>
						</select>
					</div>

					<!-- answer 3-->
					<div class="form-group">
						<label class="control-label">Answer 3:</label>
						<input type="text" class="form-control" name="answer3" required placeholder="Input your answer for question 3">
					</div>
					
					<!--submit button-->
					<div id="register">
						<input class="btn btn-lg btn-default btn-block" name="submit" type="submit" value="Submit"></input>
					</div>
		    	</form>

		    	 <!-- FOOTER -->
				<div class="container marketing">

					<footer>
						<p>
							&copy; 2016 E-Commerce Security &middot; <a href="#">Privacy</a>
							&middot; <a href="#">Terms</a>
						</p>
					</footer>

				</div> <!-- FOOTER -->
		    	
		    </div><!--jom-->

		    
		   

	    </div><!--container-->

		
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		<!-- Latest compiled and minified JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous">
    	</script>

	</body>
</html>