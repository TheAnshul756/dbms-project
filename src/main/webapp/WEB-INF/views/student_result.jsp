<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  

<html>
    <head>
        <title>
            Student Results
        </title>
    </head>
    <body>
        <h1>Student Results</h1>
        <table style="width: 50%">
            <th>
                <!-- <td>S.No.</td> -->
                <td>Subject</td>
                <td>Type</td>
                <td>Class</td>
                <td>Year</td>
                <td>Weightage</td>
                <td>Maximum Marks</td>
                <td>Obtained Marks</td>
            </th>
            <c:forEach varStatus = "i" var="rslt" items="${result}">
                <c:forEach var="sub" items="${subjects}">
                    <c:choose>
                        <c:when test="${rslt.get('subjectId')==sub.get('subjectId')}">
                          <tr>
                              <td>${i.index+1}</td>
                              <td>${sub.get('subjectName')}</td>
                              <td>${rslt.get('type')}</td>
                              <td>${sub.get('className')}</td>
                              <td>${rslt.get('year')}</td>
                              <td>${sub.get('weightage')}</td>
                              <td>${rslt.get('maximumMarks')}</td>
                              <td>${rslt.get('obtainedMarks')}</td>
                          </tr>
                        </c:when>
                    </c:choose>
                </c:forEach>
            </c:forEach>
        </table>
    </body>
</html>