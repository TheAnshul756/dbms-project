<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  

<html>
    <head>
        <title>
            All Students
        </title>
    </head>
    <body>
        <h1>All Students</h1>
        <table style="width: 50%">
            <th>
                <td>Name</td>
            </th>
            <c:forEach var="stud" items="${students}">
                <c:choose>
                    <c:when test="${stud.getClassId()==classId}">
                        <tr>
                            <td>chlskdbck</td>
                            <td>${stud.getFname()}&nbsp; ${stud.getLname()}</td>
                            <td><a href="/results/${examId}/${serialNumber}/edit">Update</a></td>
                        </tr>
                    </c:when>
                </c:choose>
            </c:forEach>
        </table>
    </body>
</html>