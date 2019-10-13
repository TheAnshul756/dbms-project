<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  

<html>
    <head>
        <title>
            New Subject Registration
        </title>
    </head>
    <body>
        <h1>New Subject Registration</h1>
        <form method="POST" action="/subjects/${classId}/new">
        <!-- <errors name="*" cssClass="errorblock" element="div" /> -->
        <table style="width: 50%">
            <tr>
                <td>Subject Name</td>
                <td><input type="text" name="subjectName" /></td>
            </tr>
            <tr>
                <td>Teacher</td>
                <td>
                    <select name="teacherId">
                        <c:forEach var="emp" items="${employees}">
                            <c:choose >
                                <c:when test="${emp.getDesignation() == 'Teacher'}">
                                    <option value="${emp.getEmployeeId()}" >${emp.getFname()} ${emp.getLname()}</option>
                                </c:when>
                            </c:choose>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Weightage</td>
                <td><input type="Number" name="weightage" /></td>
            </tr>
        </table>
            <br>
            <input type="submit" value="Submit" />
        </form>
    </body>
</html>