<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: white; 
        color: #333; 
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 70vh;
    }

    form {
        background-color: white;
        padding: 30px;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        width: 600px;
        height:600px   
        text-align: center;
    }
   
    

    h2 {
        color: #333;
        margin-bottom: 20px;
        text-align: center;
        font-size: 29px;
    }

    input[type="text"] {
        width: 100%;
        padding: 10px;
        margin: 10px 0;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
    }

    input[type="radio"] {
        margin: 0 10px;
        
        
    }

    label {
        font-size: 14px;
        margin-right: 10px;
        color: #333;
    }

    input[type="radio"] + label {
        margin-right: 20px;
    }

    input[type="submit"] {
        background-color: #4CAF50; 
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 16px;
        margin-top: 50px;
        width: 50%;
    }

    input[type="submit"]:hover {
        background-color: #45a049;
    }
     .btn {
            padding: 8px 16px;
            border-radius: 4px;
            border: none;
            cursor: pointer;
            font-size: 14px;
            margin: 5px;
            color: white;
        }
         a{
        	text-decoration: none;
        	
        }

        .back:hover {
            background: #218838;
        }

        .back {
            background: #6c757d;
        }

        .back:hover {
            background: #5a6268;
        }
    
</style>
</head>
<body>

    <form action="PlaceOrders">
        <h2>Enter Address and Payment Details</h2>

        <label for="address" style="font-weight: bold">Delivery address:</label><br>
        <input type="text" id="address" name="address" placeholder="Enter your address" required>

        <div>
            <label style="font-weight: bold;margin-bottom:100px ">Payment mode:</label><br>
            <input type="radio" name="paymentMode" value="Cash" id="cash"required><label for="cash">Cash</label>
            <input type="radio" name="paymentMode" value="UPI" id="upi" required><label for="upi">UPI</label>
            <input type="radio" name="paymentMode" value="Card" id="card" required><label for="card">Card</label>
        </div>
         <a href="cart.jsp" class="btn  back " style="margin-right: 100px">&larr;  Back</a>
        <input type="submit" value="Place Order">
        
    </form>

</body>
</html>
