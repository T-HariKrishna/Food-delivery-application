<%@page import="java.awt.Window"%>
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
    width: 350px;
    text-align: center;
}

h3 {
    margin-bottom: 20px;
    color: #333;
}

.otp-input {
    width: 50px;
    height: 50px;
    font-size: 22px;
    text-align: center;
    margin: 5px;
    border: 2px solid #ddd;
    border-radius: 8px;
    outline: none;
    transition: 0.3s ease-in-out;
}

.otp-input:focus {
    border-color: #3498db;
    box-shadow: 0 0 5px rgba(52, 152, 219, 0.5);
}

button {
    background: #3498db;
    color: #fff;
    border: none;
    padding: 12px 20px;
    font-size: 16px;
    border-radius: 8px;
    cursor: pointer;
    transition: 0.3s ease-in-out;
}

button:hover {
    background: #2980b9;
}
</style>
</head>

<body>
<%
    // Generate OTP and store in session
    String otp = "";
    for(int i = 0; i < 4; i++) {
        int num = (int) Math.floor(Math.random() * 10);
        if(i==0 && num==0 ) {
			System.out.println("num=0 "+num);
			num=num+1;
		}
        otp += num;
    }
    session.setAttribute("otp", otp);
    System.out.println("Generated OTP: " + otp);  // Debugging
    
    
    
   
%>

<div id="main-container">
    <h3>Enter the OTP sent to you <%= " \" "+ otp + " \"" %></h3>
    
   
     <form id="otp-form" action="verifyOtp.jsp" method="post">
     
        <!-- <input type="text" class="otp-input" maxlength="1" oninput="moveNext(this,'otp2')"  id="otp1" name="otp1" required>
         -->
        
        <%-- <input type="text" class="otp-input" maxlength="1" value=<%=otp.charAt(0)  %> id="otp1" name="otp1" required>
        <input type="text" class="otp-input" maxlength="1" value=<%=otp.charAt(1) %> id="otp2" name="otp2" required>
        <input type="text" class="otp-input" maxlength="1" value=<%=otp.charAt(2) %> id="otp3" name="otp3" required>
        <input type="text" class="otp-input" maxlength="1" value=<%=otp.charAt(3) %> id="otp4" name="otp4" required>
         --%>
          <input type="text" class="otp-input" maxlength="1" id="otp1" name="otp1" oninput="moveNext(this,'otp2')"  required>
        <input type="text" class="otp-input" maxlength="1"  id="otp2" name="otp2" oninput="moveNext(this,'otp3')" required>
        <input type="text" class="otp-input" maxlength="1"  id="otp3" name="otp3" oninput="moveNext(this,'otp4')" required>
        <input type="text" class="otp-input" maxlength="1"  id="otp4" name="otp4"  required>
        
         <br><br>
        <button type="submit">Verify OTP</button>
        
    </form>
    
</div>

<script>
 function moveNext(current, nextFieldID) {
    if (current.value.length === 1) {
        document.getElementById(nextFieldID)?.focus();
    }
} 



window.onload = function () {
    const otp = "<%= otp %>"; // Embedded from JSP
    const confirmAutoFill = window.confirm("Do you want to auto-fill the OTP?");

    if (confirmAutoFill) {
        document.getElementById("otp1").value = otp.charAt(0);
        document.getElementById("otp2").value = otp.charAt(1);
        document.getElementById("otp3").value = otp.charAt(2);
        document.getElementById("otp4").value = otp.charAt(3);
    }
};

</script>

</body>
</html>
