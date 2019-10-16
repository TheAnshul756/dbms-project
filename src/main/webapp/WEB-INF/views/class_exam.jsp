<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  


<!DOCTYPE HTML>
<html>

<head>
  <title>Edit Exam</title>
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
        <h1><a href ="/classes/">Classes</a> / <a href ="/subjects/${classId}/">Subjects</a> / <a href ="/exams/${subjectId}/">Exams</a> / Results</h1>
        <c:forEach var="stud" items="${students}">
            <c:set var = "f" value = "${0}"/>
            <c:forEach var="rslt" items="${results}">
                <c:choose>
                    <c:when test="${rslt.getSerialNumber()==stud.getSerialNumber() && rslt.getExamId()==examId}">
                            <c:set var = "f" value = "${1}"/>
                        <form action="/results/class/${examId}/${stud.serialNumber}/edit" method="POST">
                            <div class="form_settings">
                                <p><span>${stud.getFname()} ${stud.getLname()}</span><input type="Number" name="obtainedMarks" path ="" min="0" max="${maximumMarks}" value="${rslt.getObtainedMarks()}" /></p>
                                <p style="padding-top: 15px"><span>&nbsp;</span><input class="submit" type="submit" value="update" path="" /></p>
                            </div>
                        </form>                        
                    </c:when>
                </c:choose>
            </c:forEach>   
            <c:choose>
                <c:when test="${ f==0 }">
                    <form action="/results/class/${examId}/${stud.serialNumber}/new" method="POST">
                        <div class="form_settings">
                            <p><span>${stud.getFname()} ${stud.getLname()}</span><input type="Number" path="" min="0" max="${maximumMarks}" name="obtainedMarks" value="" /></p>
                            <p style="padding-top: 15px"><span>&nbsp;</span><input class="submit" type="submit" value="add" path="" /></p>
                        </div>
                    </form>                        
                </c:when>
            </c:choose>         
            <c:set var = "f" value = "${0}"/>
        </c:forEach>
        
      </div>
    </div>
    <jsp:include page="footer.jsp"/>
  </div>
</body>
</html>