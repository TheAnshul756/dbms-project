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
        <form:form method="POST" action="/classes/${classId}/edit" modelAttribute="class">
        <form:errors path="*" cssClass="errorblock" element="div" />
        <table style="width: 50%">
            <tr>
                <td>Class Name</td>
                <td><form:input type="text" path="className" value="${class.getClassName()}" /></td>
            </tr>
            <tr>
                <td>Class Teacher</td>
                <td>
                    <form:select path="classTeacherId">
                        <c:forEach var="emp" items="${employees}">
                            <c:choose >
                                <c:when test="${emp.getEmployeeId() == class.getClassTeacherId()}">
                                    <option value="${emp.getEmployeeId()}" selected>${emp.getFname()} ${emp.getLname()}</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="${emp.getEmployeeId()}" selected>${emp.getFname()} ${emp.getLname()}</option>
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
    </body>
</html>