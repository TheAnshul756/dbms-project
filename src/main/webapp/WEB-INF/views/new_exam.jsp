<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  


<!DOCTYPE HTML>
<html>

<head>
  <title>Add Exam</title>
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
        <h1><a href ="/classes/">Classes</a> / <a href ="/subjects/${classId}/">Subjects</a> / <a href ="/exams/${subjectId}/">Exams</a> / Exam Details</h1>
        <form action="/exams/${subjectId}/new" method="POST">
          <div class="form_settings">
            <p><span>Type</span><select name="type">
                <option value="FA1" selected>FA1</option>
                <option value="FA2" >FA2</option>
                <option value="FA3" >FA3</option>
                <option value="FA4" >FA4</option>
                <option value="SA1" >SA1</option>
                <option value="SA2" >SA2</option>
                </select></p>
            <p><span>Year</span><input type="Number" name="year" value="" /></p>
            <p><span>Maximum Marks</span><input type="Number" name="maximumMarks" value="" /></p>
            <p style="padding-top: 15px"><span>&nbsp;</span><input class="submit" type="submit" value="update" path="" /></p>
          </div>
        </form>
      </div>
    </div>
    <jsp:include page="footer.jsp"/>
  </div>
</body>
</html>