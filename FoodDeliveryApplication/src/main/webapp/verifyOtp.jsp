<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OTP Verification</title>

<style>
body {
    font-family: 'Arial', sans-serif;
    background-color: #f4f4f9;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
}

#main-container {
    background: #fff;
    border-radius: 12px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    padding: 25px;
    width: 550px;
    text-align: center;
}

h2 {
    color: #27ae60;
}

.error {
    color: #e74c3c;
}

/* Form Styling */
form {
    margin-top: 20px;
    display: flex;
    flex-direction: column;
    gap: 15px;
}

.form-group {
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 15px;
}

label {
    font-weight: bold;
    width: 40%;
    text-align: left;
}

input {
    width: 60%;
    padding: 10px;
    border: 2px solid #ddd;
    border-radius: 8px;
    outline: none;
    transition: 0.3s ease-in-out;
}

input:focus {
    border-color: #3498db;
    box-shadow: 0 0 5px rgba(52, 152, 219, 0.5);
}

button {
    background: #3498db;
    color: #fff;
    border: none;
    padding: 12px;
    font-size: 16px;
    border-radius: 8px;
    cursor: pointer;
    transition: 0.3s ease-in-out;
}

button:hover {
    background: #2980b9;
}

#goBack {
    display: inline-block;
    margin-top: 15px;
    color: #e74c3c;
    font-weight: bold;
    text-decoration: none;
    transition: 0.3s ease-in-out;
    border: 1px  #e74c3c ;
}

#goBack:hover {
    text-decoration: underline;
}


#newPasswordButton,#confirmPasswordButton{


cursor:pointer;
background: #3498db;
border-radius:5px;
color: #fff;
text-decoration:none;
padding: 5px 8px;
}
</style>

</head>
<body>

<%
    // Retrieve stored OTP from session
    String storedOtp = (String) session.getAttribute("otp");

    // Get user-entered OTP
    String enteredOtp = request.getParameter("otp1") +
                        request.getParameter("otp2") +
                        request.getParameter("otp3") +
                        request.getParameter("otp4");

    if (storedOtp != null && storedOtp.equals(enteredOtp)) {
%>
<div id="main-container">
    <h2>OTP Verified Successfully!</h2>
    <form action="ResetPassword" method="post">
        <div class="form-group">
            <label>Enter Username</label>
            <input type="text" name="username" required>
        </div>

        <div class="form-group" id="newPasswordBlock">
            <label>Enter New Password</label>
            <input type="password" id="newPassword" name="newPassword" required>
            <a id="newPasswordButton"  onclick="toggleNewPassword()">show</a>
        </div>

        <div class="form-group" id="confirmPasswordBlock">
            <label>Confirm Password</label>
            <input type="password" id="confirmPassword" name="confirmPassword" required>
            <a id="confirmPasswordButton"  onclick="toggleConfirmPassword()">show</a>
        </div>

        <button type="submit" >Submit</button>
    </form>
</div>
<%
    } else {
%>
<div id="main-container">
    <h2 class="error">Invalid OTP! Please try again.</h2>
    <a id="goBack" href="forgotPassword.jsp">Go Back</a>
</div>
<%
    }
%>

<script type="text/javascript">
function  toggleNewPassword() {
	const passwordField=document.getElementById("newPassword");
	const passwordButton=document.getElementById("newPasswordButton");
	if(passwordField.type==="password"){
		 passwordField.type = "text";
		 passwordButton.textContent = "Hide";
	} else {
        passwordField.type = "password";
        passwordButton.textContent = "Show"; 
      }
	
}
function  toggleConfirmPassword() {
	const passwordField=document.getElementById("confirmPassword");
	const passwordButton=document.getElementById("confirmPasswordButton");
	if(passwordField.type==="password"){
		 passwordField.type = "text";
		 passwordButton.textContent = "Hide";
	} else {
        passwordField.type = "password";
        passwordButton.textContent = "Show"; 
      }
	
}

</script>
</body>
</html>
