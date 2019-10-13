<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  

<html>
    <head>
        <title>
            Student Details
        </title>
    </head>
    <body>
        <h1>Student Details</h1>
        <form:form method="POST" action="/students/${student.serialNumber}/edit" modelAttribute="student">
        <form:errors path="*" cssClass="errorblock" element="div" />
        <table style="width: 50%">
            <tr>
                <td>Serial Number</td>
                <td>${student.serialNumber}</td>
            </tr>
            <tr>
                <td>First Name</td>
                <td><form:input type="text" path="Fname" value="${student.getFname()}" /></td>
            </tr>
            <tr>
                <td>Last Name</td>
                <td><form:input type="text" path="Lname" value="${student.getLname()}" /></td>
            </tr>
            <tr>
                <td>Address</td>
                <td><form:input type="text" path="address" value="${student.getAddress()}" /></td>
            </tr>
            <tr>
                <td>Contact No.</td>
                <td><form:input type="tel" path="contact" value="${student.getContact()}" /></td>
            </tr>
            <tr>
                <td>Gender</td>
                <td>
                    <c:choose >
                        <c:when test="${student.getGender()=='M'}">
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
                <td><form:input type="date" path="DOB" value="${student.getDOB()}" /></td>
            </tr>
            <tr>
                <td>Mother Name</td>
                <td><form:input type="text" path="motherName" value="${student.getMotherName()}" /></td>
            </tr>
            <tr>
                <td>Father Name</td>
                <td><form:input type="text" path="fatherName" value="${student.getFatherName()}" /></td>
            </tr>
            <tr>
                <td>Class</td>
                <td>
                    <form:select path="classId">
                        <c:forEach var="cls" items="${classes}">
                            <c:choose >
                                <c:when test="${cls.getClassId() == student.getClassId()}">
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
            <input type="submit" value="Update" />
        </form:form>
        <h3> <a href="/students/${student.serialNumber}/results">Results</a></h3>
    </body>
</html>