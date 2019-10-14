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
          <li class="selected"><a href="/classes">All Classes</a></li>
          <li><a href="/students/new">Add Student</a></li>
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
        <h1><a href ="/classes/">Classes</a> / <a href ="/subjects/${classId}/">Subjects</a> / <a href ="/exams/${exm.getSubjectId()}/">Exams</a> / Exam Details</h1>
        <form action="/exams/{examId}/edit" method="POST">
          <div class="form_settings">
            <p><span>Type</span><select name="type">
                <c:choose >
                    <c:when test="${exm.getType() == 'FA1'}">
                        <option value="FA1" selected>FA1</option>
                        <option value="FA2" >FA2</option>
                        <option value="FA3" >FA3</option>
                        <option value="FA4" >FA4</option>
                        <option value="SA1" >SA1</option>
                        <option value="SA2" >SA2</option>
                    </c:when>
                    <c:when test="${exm.getType() == 'FA2'}">
                        <option value="FA1" >FA1</option>
                        <option value="FA2" selected>FA2</option>
                        <option value="FA3" >FA3</option>
                        <option value="FA4" >FA4</option>
                        <option value="SA1" >SA1</option>
                        <option value="SA2" >SA2</option>
                    </c:when>
                    <c:when test="${exm.getType() == 'FA3'}">
                        <option value="FA1" >FA1</option>
                        <option value="FA2" >FA2</option>
                        <option value="FA3" selected>FA3</option>
                        <option value="FA4" >FA4</option>
                        <option value="SA1" >SA1</option>
                        <option value="SA2" >SA2</option>
                    </c:when>
                    <c:when test="${exm.getType() == 'FA4'}">
                        <option value="FA1" >FA1</option>
                        <option value="FA2" >FA2</option>
                        <option value="FA3" >FA3</option>
                        <option value="FA4" selected>FA4</option>
                        <option value="SA1" >SA1</option>
                        <option value="SA2" >SA2</option>
                    </c:when>
                    <c:when test="${exm.getType() == 'SA1'}">
                        <option value="FA1" >FA1</option>
                        <option value="FA2" >FA2</option>
                        <option value="FA3" >FA3</option>
                        <option value="FA4" >FA4</option>
                        <option value="SA1" selected>SA1</option>
                        <option value="SA2" >SA2</option>
                    </c:when>
                    <c:when test="${exm.getType() == 'SA2'}">
                        <option value="FA1" >FA1</option>
                        <option value="FA2" >FA2</option>
                        <option value="FA3" >FA3</option>
                        <option value="FA4" >FA4</option>
                        <option value="SA1" >SA1</option>
                        <option value="SA2" selected>SA2</option>
                    </c:when>
                </c:choose>
            </select></p>
            <p><span>Year</span><input type="Number" name="year" value="${exm.getYear()}" /></p>
            <p><span>Maximum Marks</span><input type="Number" name="maximumMarks" value="${exm.getMaximumMarks()}" /></p>
            <p style="padding-top: 15px"><span>&nbsp;</span><input class="submit" type="submit" value="update" path="" /></p>
          </div>
        </form>
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