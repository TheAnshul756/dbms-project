<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  

<html>
    <head>
        <title>
            Employee Details
        </title>
    </head>
    <body>
        <h1>Employee Details</h1>
        <form:form method="POST" action="/employees/${employee.employeeId}/edit" modelAttribute="employee">
        <form:errors path="*" cssClass="errorblock" element="div" />
        <table style="width: 50%">
            <tr>
                <td>First Name</td>
                <td><form:input type="text" path="Fname" value="${employee.getFname()}" /></td>
            </tr>
            <tr>
                <td>Last Name</td>
                <td><form:input type="text" path="Lname" value="${employee.getLname()}" /></td>
            </tr>
            <tr>
                <td>Address</td>
                <td><form:input type="text" path="address" value="${employee.getAddress()}" /></td>
            </tr>
            <tr>
                <td>Contact No.</td>
                <td><form:input type="tel" path="contact" value="${employee.getContact()}" /></td>
            </tr>
            <tr>
                <td>Gender</td>
                <td>
                    <c:choose >
                        <c:when test="${employee.getGender()=='M'}">
                                <form:radiobutton path="gender" value="M" checked="checked"/>Male <form:radiobutton
                                path="gender" value="F" />Female
                        </c:when>
                        <c:otherwise>
                                <form:radiobutton path="gender" value="M" />Male <form:radiobutton
                                path="gender" value="F" checked="checked"/>Female
                        </c:otherwise>
                    </c:choose>
                </td>
				<td><form:errors path="gender" cssClass="error" /></td>
            </tr>
            <tr>
                <td>Date of Birth</td>
                <td><form:input type="date" path="DOB" value="${employee.getDOB()}" /></td>
            </tr>
            <tr>
                <td>Designation </td>
                <td>
                    <form:select path="designation">
                        <c:choose >
                            <c:when test="${employee.getDesignation()=='Teacher'}">
                                <option value="Teacher" selected>Teacher</option>
                            </c:when>
                            <c:otherwise>
                                <option value="Teacher">Teacher</option>
                            </c:otherwise>
                        </c:choose>
                        <c:choose >
                            <c:when test="${employee.getDesignation()=='Manager'}">
                                <option value="Manager" selected>Manager</option>
                            </c:when>
                            <c:otherwise>
                                <option value="Manager">Manager</option>
                            </c:otherwise>
                        </c:choose>
                        <c:choose >
                            <c:when test="${employee.getDesignation()=='None'}">
                                <option value="None" selected>None</option>
                            </c:when>
                            <c:otherwise>
                                <option value="None">None</option>
                            </c:otherwise>
                        </c:choose>
                    </form:select>
                </td>
            </tr>
            <tr>
                <td>e-mail</td>
                <td><form:input type="email" path="email" value="${employee.getEmail()}" /></td>
            </tr>
        </table>
            <br>
            <input type="submit" value="Update" />
        </form:form>
        
        <c:choose >
            <c:when test="${employee.getDesignation()=='Teacher'}">
                    <!-- Class taught by Teacher Link -->
            </c:when>
        </c:choose>
    </body>
</html>