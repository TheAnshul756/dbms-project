<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  

<html>
    <head>
        <title>
            New Class Registration
        </title>
    </head>
    <body>
        <h1>New Class Registration</h1>
        <form:form method="POST" action="/classes/new" modelAttribute="cls">
        <form:errors path="*" cssClass="errorblock" element="div" />
        <table style="width: 50%">
            <tr>
                <td>Class Name</td>
                <td><form:input type="text" path="className" /></td>
            </tr>
            <tr>
                <td>Class Teacher</td>
                <td>
                    <form:select path="classTeacherId">
                        <c:forEach var="emp" items="${employees}">
                            <c:choose >
                                <c:when test="${emp.getDesignation() == 'Teacher'}">
                                    <option value="${emp.getEmployeeId()}" >${emp.getFname()} ${emp.getLname()}</option>
                                </c:when>
                            </c:choose>
                        </c:forEach>
                    </form:select>
                </td>
            </tr>
        </table>
            <br>
            <input type="submit" value="Submit" />
        </form:form>
    </body>
</html>