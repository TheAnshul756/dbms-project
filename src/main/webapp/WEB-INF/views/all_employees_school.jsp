<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  


<!DOCTYPE HTML>
<html>

<head>
  <title>All Employees</title>
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
          <li class="selected"><a href="/">Home</a></li>
          <li><a href="/classes">All Classes</a></li>
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
        <h1>All Employees</h1>
        <table style="width:100%; border-spacing:0;">
            <tr>
                <th>S.No.</th>
                <th>Employee Id</th>
                <th>Name</th>
                <th>Designation</th>
            </tr>
            <c:forEach varStatus = "i" var="emp" items="${employees}">
                <tr>
                    <td>${i.index+1}</td>
                    <td>${emp.getEmployeeId()}</td>
                    <td><a href="/empoyees/${emp.getEmployeeId()}">${emp.getFname()} &nbsp;${emp.getLname()}</a></td>
                    <td>${emp.getDesignation()}</td>
                </tr>
            </c:forEach>
        </table>
      </div>
    </div>
    <jsp:include page="footer.jsp"/>
</body>
</html>