<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  


<!DOCTYPE HTML>
<html>

<head>
  <title>Edit Subject</title>
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
          <li><a href="/contact">Contact Us(To Do)</a></li>
        </ul>
      </div>
    </div>
    <div id="content_header"></div>
    <div id="site_content">
      <jsp:include page="sidebar.jsp"/>
      <div id="content">
        <!-- insert the page content here -->
        <h1><a href ="/classes">Classes</a> / <a href ="/subjects/${classId}">Subjects</a> / Add Subject</h1>
        <form action="/subjects/${classId}/edit" method="POST">
          <div class="form_settings">
            <p><span>Subject Name</span><input type="text" name="subjectName" path="" value="${sub.subjectName}" /></p>
            <p><span>Teacher</span> <select name="teacherId">
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
            </select></p>
            <p><span>Weightage</span><input type="Number" name="weightage" path="" value="${sub.getWeightage()}" /></p>
            <p style="padding-top: 15px"><span>&nbsp;</span><input class="submit" type="submit" value="update" path="" /></p>
          </div>
        </form>
      </div>
    </div>
    <jsp:include page="footer.jsp"/>
  </div>
</body>
</html>