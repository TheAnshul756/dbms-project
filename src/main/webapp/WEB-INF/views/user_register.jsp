<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  


<!DOCTYPE HTML>
<html>

<head>
  <title>Register User</title>
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
          <li><a href="/students/new">Add Student</a></li>
          <li class="selected"><a href="/employees/new">Add Employee</a></li>
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
          <h1>Register User</h1>
          <p>${message}</p>
          <form action="/credentials/${employeeId}/new" method="POST">
              <div class="form_settings">
                  <p><span>username</span><input type="text" name="username" path="" value="" /></p>
                  <p><span>Role</span>
                    <select id="id" path="" name="role">
                        <option value="ROLE_ADMIN" selected>ROLE_ADMIN</option>
                        <option value="ROLE_EMPLOYEE" >ROLE_EMPLOYEE</option>
                        <option value="NONE" >NONE</option>
                    </select>
                  </p>
                  <p><span>password</span><input type="text" name="password" path="" value="" /></p>
                  <p style="padding-top: 15px"><span>&nbsp;</span><input class="submit" type="submit" value="Register" path="" /></p>
              </div>
          </form>                        
      </div>
    </div>
    <jsp:include page="footer.jsp"/>
  </div>
</body>
</html>