<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  

<html>
    <head>
        <title>
            Subject Details
        </title>
    </head>
    <body>
        <h1>Subject Details</h1>
        <form method="POST" action="/subjects/${sub.getSubjectId()}/edit" >
        <!-- <errors name="*" cssClass="errorblock" element="div" /> -->
        <table style="width: 50%">
            <tr>
                <td>Subject Name</td>
                <td><input type="text" name="subjectName" value = "${sub.subjectName}"/></td>
            </tr>
            <tr>
                <td>Teacher</td>
                <td>
                    <select name="teacherId">
                        <c:forEach var="emp" items="${employees}">
                            <c:choose >
                                <c:when test="${emp.getEmployeeId() == sub.getTeacherId()}">
                                    <option value="${emp.getEmployeeId()}" selected>${emp.getFname()} ${emp.getLname()}</option>
                                </c:when>
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
                <td><input type="Number" name="weightage"  value = '${sub.getWeightage()}'/></td>
            </tr>
        </table>
            <br>
            <input type="submit" value="Submit" />
        </form>
    </body>
</html>