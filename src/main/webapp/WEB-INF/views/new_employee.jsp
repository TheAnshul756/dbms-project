<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  

<html>
    <head>
        <title>
            Employee Registration Form
        </title>
    </head>
    <body>
        <h1>Employee Registration Form</h1>
        <form:form method="POST" action="/employees/new" modelAttribute="employee">
        <form:errors path="*" cssClass="errorblock" element="div" />
        <table style="width: 50%">
            <tr>
                <td>First Name</td>
                <td><form:input type="text" path="Fname" /></td>
            </tr>
            <tr>
                <td>Last Name</td>
                <td><form:input type="text" path="Lname" /></td>
            </tr>
            <tr>
                <td>Address</td>
                <td><form:input type="text" path="address" /></td>
            </tr>
            <tr>
                <td>Contact No.</td>
                <td><form:input type="tel" path="contact" /></td>
            </tr>
            <tr>
                <td>Gender</td>
                <td>
                    <form:radiobutton path="gender" value="M" />Male 
                    <form:radiobutton path="gender" value="F" />Female
                </td>
                <td><form:errors path="gender" cssClass="error" /></td>
            </tr>
            <tr>
                <td>Date of Birth</td>
                <td><form:input type="date" path="DOB" /></td>
            </tr>
            <tr>
                <td>Designation </td>
                <td>
                    <form:select path="designation">
                        <option value="Teacher" selected>Teacher</option>    
                        <option value="Manager">Manager</option>
                        <option value="None">None</option>
                    </form:select>
                </td>
            </tr>
            <tr>
                <td>e-mail</td>
                <td><form:input type="email" path="email" /></td>
            </tr>
        </table>
        <br>
        <input type="submit" value="submit" />
        </form:form>
    </body>
</html>