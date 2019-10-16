<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  


<!DOCTYPE HTML>
<html>

<head>
  <title>Add Student</title>
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
          <li><a href="/classes">All Classes</a></li>
          <li class="selected"><a href="/students/new">Add Student</a></li>
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
        <h1>Add Student</h1>
        <form:form action="/students/new" method="POST" modelAttribute="student">
          <div class="form_settings">
            <p><span>First Name</span><form:input type="text" path="Fname" value="" /></p>
            <p><span>Last Name</span><form:input type="text" path="Lname" value="" /></p>
            <p><span>Address</span><form:input type="text" path="address" value="" /></p>
            <p><span>Contact No.</span><form:input type="tel" path="contact" value="" /></p>
            <p><span>Gender</span>
                <form:select id="id" path="gender">
                    <option value="M" selected>Male</option>
                    <option value="F" >Female</option>
                </form:select>
            </p>
            <p><span>Date of Birth</span><form:input type="date" path="DOB" value="" /></p>
            <p><span>Mother Name</span><form:input type="text" path="motherName" value="" /></p>
            <p><span>Father Name</span><form:input type="text" path="fatherName" value="" /></p>
            <p><span>Class</span><form:select id="id" path="classId">
                    <c:forEach var="cls" items="${classes}">
                        <c:choose >
                            <c:when test="${cls.getClassName() == 'None'}">
                                <option value="${cls.getClassId()}" selected>${cls.getClassName()}</option>
                            </c:when>
                            <c:otherwise>
                                <option value="${cls.getClassId()}" >${cls.getClassName()}</option>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </form:select></p>
            <p style="padding-top: 15px"><span>&nbsp;</span><form:input class="submit" type="submit" value="submit" path="" /></p>
          </div>
        </form:form>
      </div>
    </div>
    <jsp:include page="footer.jsp"/>
  </div>
</body>
</html>