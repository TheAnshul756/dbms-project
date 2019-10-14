<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  

<html>
    <head>
        <title>
            All Exams
        </title>
    </head>
    <body>
        <h1>All Exams</h1>
        <table style="width: 50%">
            <th>
                <!-- <td>S.No.</td> -->
                <td>Exam Type</td>
                <td>Year</td>
                <td>Maximum Marks</td>
            </th>
            <%! int i=0; %>
            <c:forEach var="exm" items="${exams}">
                <c:choose>
                    <c:when test="${exm.getSubjectId()==subjectId}">
                        <tr>
                            <% i=i+1; %>
                            <td><% out.println(i); %></td>
                            <td>${exm.getType()}</td>
                            <td>${exm.getYear()}</td>
                            <td>${exm.getMaximumMarks()}</td>
                            <td><a href="/exams/${exm.getExamId()}/edit"> Edit</a></td>
                            <!-- <td><a href="/results/class/${exm.getExamId()}/"> Add results (To Do)</a></td> -->
                        </tr>
                    </c:when>
                </c:choose>
            </c:forEach>
            <% i = 0; %>
        </table>
        <br>
        &emsp;<a href="/exams/${subjectId}/new"><button>Add Exam</button></a>
    </body>
</html>