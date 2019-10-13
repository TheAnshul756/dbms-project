<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  

<html>
    <head>
        <title>
            All Subjects
        </title>
    </head>
    <body>
        <h1>All Subjects</h1>
        <table style="width: 50%">
            <th>
                <!-- <td>S.No.</td> -->
                <td>Name</td>
                <td>Teacher</td>
                <td>weightage</td>
            </th>
            <c:forEach varStatus = "i" var="sub" items="${subjects}">
                <c:forEach var="emp" items="${employees}">
                    <c:choose>
                        <c:when test="${sub.teacherId==emp.employeeId}">
                          <tr>
                              <td>${i.index+1}</td>
                              <td>${sub.getSubjectName()}</td>
                              <td><a href="/employees/${emp.employeeId}">${emp.getFname()}&nbsp; ${emp.getLname()}</a></td>
                              <td>${sub.getWeightage()}</td>
                              <td><a  href="/subjects/${sub.classId}/edit">Edit(To Do)</a></td>
                          </tr>
                        </c:when>
                    </c:choose>
                </c:forEach>
            </c:forEach>
        </table>
    </body>
</html>