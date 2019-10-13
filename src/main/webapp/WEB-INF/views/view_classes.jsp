<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  

<html>
    <head>
        <title>
            All Classes
        </title>
    </head>
    <body>
        <h1>All Classes</h1>
        <table style="width: 50%">
            <th>
                <!-- <td>S.No.</td> -->
                <td>Class Name</td>
                <td>Class Teacher</td>
                <td></td>
                <td></td>
            </th>
            <c:forEach varStatus = "i" var="cls" items="${classes}">
                <c:forEach var="emp" items="${employees}">
                    <c:choose>
                        <c:when test="${cls.classTeacherId==emp.employeeId}">
                          <tr>
                              <td>${i.index+1}</td>
                              <td>${cls.getClassName()}</td>
                              <td><a href="/employees/${emp.employeeId}">${emp.getFname()}&nbsp; ${emp.getLname()}</a></td>
                              <td><a href="/students/class/${cls.classId}">Students</a></td>
                              <td><a href="/subjects/${cls.classId}">Subjects</a></td>
                              <td><a  href="/classes/${cls.classId}/">Edit</a></td>
                          </tr>
                        </c:when>
                    </c:choose>
                </c:forEach>
            </c:forEach>
        </table>
        <br>
        &emsp;<button onclick="window.location.href = '/classes/new';">Add Class</button>
    </body>
</html>