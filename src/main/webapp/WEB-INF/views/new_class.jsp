<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  


<!DOCTYPE HTML>
<html>

<head>
  <title>Add Class</title>
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
        <h1>Add Class</h1>
        <form:form action="/classes/new" method="POST" modelAttribute="cls">
          <div class="form_settings">
            <p><span>Class Name</span><form:input type="text" path="className" value="" /></p>
            <p><span>Class Teacher</span><form:select path="classTeacherId">
                <c:forEach var="emp" items="${employees}">
                    <c:choose >
                        <c:when test="${emp.getDesignation() == 'Teacher'}">
                            <option value="${emp.getEmployeeId()}" >${emp.getFname()} ${emp.getLname()}</option>
                        </c:when>
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