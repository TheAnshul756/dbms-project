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
            <%! int i=0; %>
            <c:forEach var="sub" items="${subjects}">
                <c:forEach var="emp" items="${employees}">
                    <c:choose>
                        <c:when test="${sub.teacherId==emp.employeeId}">
                          <tr>
                                <% i=i+1; %>
                                <td><% out.println(i); %></td>
                                <td>${sub.getSubjectName()}</td>
                                <td><a href="/employees/${emp.employeeId}">${emp.getFname()}&nbsp; ${emp.getLname()}</a></td>
                                <td>${sub.getWeightage()}</td>
                                <td><a  href="/subjects/${sub.subjectId}/edit">Edit</a></td>
                                <td><a href="/exams/${sub.subjectId}">Exams</a></td>
                          </tr>
                        </c:when>
                    </c:choose>
                </c:forEach>
            </c:forEach>
            <% i = 0; %>
        </table>
        <br>
        &emsp;<a href="/subjects/${classId}/new"><button>Add Subject</button></a>
    </body>
</html>