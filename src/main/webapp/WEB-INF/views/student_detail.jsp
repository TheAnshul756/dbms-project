<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  


<!DOCTYPE HTML>
<html>

<head>
  <title>textured_orbs - examples</title>
  <meta name="description" content="website description" />
  <meta name="keywords" content="website keywords, website keywords" />
  <meta http-equiv="content-type" content="text/html; charset=windows-1252" />
  <link rel="stylesheet" type="text/css" href="/style/style.css" />
</head>

<body>
  <div id="main">
    <div id="header">
      <div id="logo">
        <div id="logo_text">
          <!-- class="logo_colour", allows you to change the colour of the text -->
          <h1><a href="index.html">textured_<span class="logo_colour">orbs</span></a></h1>
          <h2>Simple. Contemporary. Website Template.</h2>
        </div>
      </div>
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
      <div id="sidebar_container">
        <div class="sidebar">
          <div class="sidebar_top"></div>
          <div class="sidebar_item">
            <!-- insert your sidebar items here -->
            <h3>Latest News</h3>
            <h4>New Website Launched</h4>
            <h5>June 1st, 2014</h5>
            <p>2014 sees the redesign of our website. Take a look around and let us know what you think.<br /><a href="#">Read more</a></p>
          </div>
          <div class="sidebar_base"></div>
        </div>
        <div class="sidebar">
          <div class="sidebar_top"></div>
          <div class="sidebar_item">
            <h3>Useful Links</h3>
            <ul>
              <li><a href="#">link 1</a></li>
              <li><a href="#">link 2</a></li>
              <li><a href="#">link 3</a></li>
              <li><a href="#">link 4</a></li>
            </ul>
          </div>
          <div class="sidebar_base"></div>
        </div>
        <div class="sidebar">
          <div class="sidebar_top"></div>
          <div class="sidebar_item">
            <h3>Search</h3>
            <form method="post" action="#" id="search_form">
              <p>
                <input class="search" type="text" name="search_field" value="Enter keywords....." />
                <input name="search" type="image" style="border: 0; margin: 0 0 -9px 5px;" src="/style/search.png" alt="Search" title="Search" />
              </p>
            </form>
          </div>
          <div class="sidebar_base"></div>
        </div>
      </div>
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
    <div id="content_footer"></div>
    <div id="footer">
      <p><a href="index.html">Home</a> | <a href="examples.html">Examples</a> | <a href="page.html">A Page</a> | <a href="another_page.html">Another Page</a> | <a href="contact.html">Contact Us</a></p>
      <p>Copyright &copy; textured_orbs | <a href="http://validator.w3.org/check?uri=referer">HTML5</a> | <a href="http://jigsaw.w3.org/css-validator/check/referer">CSS</a> | <a href="http://www.html5webtemplates.co.uk">Website templates</a></p>
    </div>
  </div>
</body>
</html>