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
                <!-- <td>S.No.</td> -->
                <td>Name</td>
            </th>
            <c:forEach varStatus = "i" var="stud" items="${students}">
                <tr>
                    <td>${i.index+1}</td>
                    <td><a href="/students/${stud.serialNumber}">${stud.getFname()} &nbsp;${stud.getLname()}</a></td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>