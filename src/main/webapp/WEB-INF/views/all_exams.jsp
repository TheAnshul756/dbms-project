<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  


<!DOCTYPE HTML>
<html>

<head>
  <title>Exams</title>
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
        <h1><a href="/classes">Classes</a> / <a href="/subjects/${classId}">Subjects</a> / Exams</h1>
        <table style="width:100%; border-spacing:0;">
            <tr>
                <th>S.No.</th>
                <th>Exam Type</th>
                <th>Year</th>
                <th>Maximum Marks</th>
                <th></th>
                <th></th>
            </tr>
            <%! int i=0; %>
            <c:forEach var="exm" items="${exams}">
                <c:choose>
                    <c:when test="${exm.getSubjectId()==subjectId}">
                        <tr>
                            <% i=i+1; %>
                            <td><% out.println(i); %></td>
                            <td>${exm.getType()}</td>
                            <td>${exm.getYear()}</td>
                            <td>${exm.getMaximumMarks()}</td>
                            <td><a href="/results/class/${exm.getExamId()}/"> Results</a></td>
                            <td><a href="/exams/${exm.getExamId()}/edit"> Edit</a></td>
                            <!-- <td><a href="/results/class/${exm.getExamId()}/"> Add results (To Do)</a></td> -->
                        </tr>
                    </c:when>
                </c:choose>
            </c:forEach>
            <% i = 0; %>
        </table>
        <div class="form_settings">
            <p style="padding-top: 15px"><span>&nbsp;</span><a href="/exams/${subjectId}/new"><button class ="submit" >Add Exam</button></a></p>
        </div>
      </div>
    </div>
    <jsp:include page="footer.jsp"/>
  </div>
</body>
</html>