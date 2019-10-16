<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  


<!DOCTYPE HTML>
<html>

<head>
  <title>Student Details</title>
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
        <h1>Student Details</h1>
        <form:form action="/students/${student.serialNumber}/edit" method="POST" modelAttribute="student">
          <div class="form_settings">
              <p><span>Serial Number</span>${student.serialNumber}</p>
            <p><span>First Name</span><form:input type="text" path="Fname" value="${student.getFname()}" /></p>
            <p><span>Last Name</span><form:input type="text" path="Lname" value="${student.getLname()}" /></p>
            <p><span>Address</span><form:input type="text" path="address" value="${student.getAddress()}" /></p>
            <p><span>Contact No.</span><form:input type="tel" path="contact" value="${student.getContact()}" /></p>
            <p><span>Gender</span>
                <form:select id="id" path="gender">
                    <c:choose >
                        <c:when test="${student.getGender()=='M'}">
                            <option value="M" selected>Male</option>
                            <option value="F" >Female</option>
                        </c:when>
                        <c:otherwise>
                            <option value="M" >Male</option>
                            <option value="F" selected>Female</option>
                        </c:otherwise>
                    </c:choose>  
                </form:select>
            </p>
            <p><span>Date of Birth</span><form:input type="date" path="DOB" value="${student.getDOB()}" /></p>
            <p><span>Mother Name</span><form:input type="text" path="motherName" value="${student.getMotherName()}" /></p>
            <p><span>Father Name</span><form:input type="text" path="fatherName" value="${student.getFatherName()}" /></p>
            <p><span>Class</span><form:select path="classId">
                <c:forEach var="cls" items="${classes}">
                    <c:choose >
                        <c:when test="${cls.getClassId() == student.getClassId()}">
                            <option value="${cls.getClassId()}" selected>${cls.getClassName()}</option>
                        </c:when>
                        <c:otherwise>
                            <option value="${cls.getClassId()}" >${cls.getClassName()}</option>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </form:select></p>
            <p style="padding-top: 15px"><span>&nbsp;</span><form:input class="submit" type="submit" value="update" path="" /></p>
          </div>
        </form:form>
        <h2>Results</h2>
        <table style="width:100%; border-spacing:0;">
            <tr>
                <th>S.No.</th>
                <th>Subject</th>
                <th>Type</th>
                <th>Class</th>
                <th>Year</th>
                <th>Weightage</th>
                <th>Maximum Marks</th>
                <th>Obtained Marks</th>
            </tr>
            <%! int i=0; %>
            <c:forEach varStatus = "i" var="rslt" items="${result}">
                <c:forEach var="sub" items="${subjects}">
                    <c:choose>
                        <c:when test="${rslt.get('subjectId')==sub.get('subjectId')}">
                          <tr>
                                <% i=i+1; %>
                                <td><% out.println(i); %></td>
                              <td>${sub.get('subjectName')}</td>
                              <td>${rslt.get('type')}</td>
                              <td>${sub.get('className')}</td>
                              <td>${rslt.get('year')}</td>
                              <td>${sub.get('weightage')}</td>
                              <td>${rslt.get('maximumMarks')}</td>
                              <td>${rslt.get('obtainedMarks')}</td>
                          </tr>
                        </c:when>
                    </c:choose>
                </c:forEach>
            </c:forEach>
            <% i = 0; %>
        </table>
      </div>
    </div>
    <jsp:include page="footer.jsp"/>
</body>
</html>