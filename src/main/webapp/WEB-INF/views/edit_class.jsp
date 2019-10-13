<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  

<html>
    <head>
        <title>
            Class Details
        </title>
    </head>
    <body>
        <h1>Class Details</h1>
        <form id="myform" method="POST" action="/classes/${classId}/edit" >
        <!-- <errors path="*" cssClass="errorblock" element="div" /> -->
        <table style="width: 50%">
            <tr>
                <td>Class Name</td>
                <td><input id="className" type="text" name="className" value="${cls.getClassName()}" /></td>
            </tr>
            <tr>
                <td>Class Teacher</td>
                <td>
                    <select id="teacherId" name="classTeacherId">
                        <c:forEach var="emp" items="${employees}">
                            <c:choose >
                                <c:when test="${emp.getEmployeeId() == cls.getClassTeacherId()}">
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
        </table>
            <br>
            <input type="submit" value="Update" />
        </form>
    </body>
    <script
    src="https://code.jquery.com/jquery-3.4.1.min.js"
    integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
    crossorigin="anonymous"></script>
    <script>
    </script>
</html>