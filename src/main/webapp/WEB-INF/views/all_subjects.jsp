<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  


<!DOCTYPE HTML>
<html>

<head>
  <title>Subjects</title>
  <meta name="description" content="website description" />
  <meta name="keywords" content="website keywords, website keywords" />
  <meta http-equiv="content-type" content="text/html; charset=windows-1252" />
  <link rel="stylesheet" type="text/css" href="/style/style.css" />
</head>

<body>
  <div id="main">
    <div id="header">
        <jsp:include page="logo.jsp"/>
      <div id="menubar">
        <ul id="menu">
          <!-- put class="selected" in the li tag for the selected page - to highlight which page you're on -->
          <li><a href="/">Home</a></li>
          <li class="selected"><a href="/classes">All Classes</a></li>
          <li><a href="/students/new">Add Student</a></li>
          <li><a href="/employees/new">Add Employee</a></li>
          <c:choose>
            <c:when test="${pageContext.request.userPrincipal.name != null}">
              <li><a href="/logout">Log Out ( ${pageContext.request.userPrincipal.name} )</a></li>
            </c:when>
            <c:otherwise>
              <li><a href="/login">Log In</a></li>
            </c:otherwise>
          </c:choose>
        </ul>
      </div>
    </div>
    <div id="content_header"></div>
    <div id="site_content">
      <jsp:include page="sidebar.jsp"/>
      <div id="content">
        <!-- insert the page content here -->
        <h1><a href="/classes">Classes</a> / Subjects</h1>
        <table style="width:100%; border-spacing:0;">
            <tr>
                <th>S.No.</th>
                <th>Name</th>
                <th>Teacher</th>
                <th>weightage</th>
                <th></th>
                <th></th>
            </tr>
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
        <div class="form_settings">
            <p style="padding-top: 15px"><span>&nbsp;</span><a href="/subjects/${classId}/new"><button class ="submit" >Add Subject</button></a></p>
        </div>
      </div>
    </div>
    <jsp:include page="footer.jsp"/>
</body>
</html>