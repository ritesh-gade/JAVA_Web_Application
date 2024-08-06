<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Calculator</title>
</head>
<body>
    <h1>Simple Calculator</h1>
    
    <form method="post" action="Demo.jsp">
        <label for="num1">Enter Number 1:</label>
        <input type="text" id="num1" name="num1"><br><br>
        
        <label for="num2">Enter Number 2:</label>
        <input type="text" id="num2" name="num2"><br><br>
        
        <label for="operation">Select Operation:</label>
        <select id="operation" name="operation">
            <option value="add">Addition (+)</option>
            <option value="subtract">Subtraction (-)</option>
            <option value="multiply">Multiplication (*)</option>
            <option value="divide">Division (/)</option>
        </select><br><br>
        
        <input type="submit" value="Calculate">
    </form>
    
    <%-- Java code to perform calculations based on user input --%>
    <%@ page import="java.io.*,java.util.*" %>
    <%
        // Check if form has been submitted
        if (request.getMethod().equalsIgnoreCase("post")) {
            try {
                // Retrieve input from form
                int number1 = Integer.parseInt(request.getParameter("num1"));
                int number2 = Integer.parseInt(request.getParameter("num2"));
                String operation = request.getParameter("operation");
                
                // Initialize result variable
                int result = 0;
                
                // Perform operation based on user selection
                switch (operation) {
                    case "add":
                        result = number1 + number2;
                        break;
                    case "subtract":
                        result = number1 - number2;
                        break;
                    case "multiply":
                        result = number1 * number2;
                        break;
                    case "divide":
                        if (number2 != 0) {
                            result = number1 / number2;
                        } else {
                            out.println("<p>Division by zero is not allowed.</p>");
                        }
                        break;
                    default:
                        out.println("<p>Invalid operation selected.</p>");
                }
                
                // Display result
    %>
                <p>Number 1: <%= number1 %></p>
                <p>Number 2: <%= number2 %></p>
                <p>Operation: <%= operation %></p>
                <p>Result: <%= result %></p>
    <%
            } catch (NumberFormatException e) {
                // Handle invalid input gracefully
    %>
                <p>Please enter valid integers for both numbers.</p>
    <%
            } catch (ArithmeticException e) {
                // Handle division by zero
    %>
                <p>Division by zero is not allowed.</p>
    <%
            }
        }
    %>
    
</body>
</html>
