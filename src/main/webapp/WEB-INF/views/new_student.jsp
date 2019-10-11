<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  

<html>
    <head>
        <title>
            Student Registration Form
        </title>
    </head>
    <body>
        <h1>Student Registration Form</h1>
        <form:form method="POST" action="/students/new" modelAttribute="student">
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
                <td>Mother Name</td>
                <td><form:input type="text" path="motherName" /></td>
            </tr>
            <tr>
                <td>Father Name</td>
                <td><form:input type="text" path="fatherName" /></td>
            </tr>
            <tr>
                <td>Class</td>
                <td>
                    <form:select path="classId">
                        <c:forEach var="cls" items="${classes}">
                            <c:choose >
                                <c:when test="${cls.getClassName() == 'None'}">
                                    <option value="${cls.getClassId()}" selected>${cls.getClassName()}</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="${cls.getClassId()}" >${cls.getClassName()}</option>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </form:select>
                </td>
            </tr>
        </table>
        <br>
        <input type="submit" value="submit" />
        </form:form>
    </body>
</html>