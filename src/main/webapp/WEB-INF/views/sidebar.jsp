<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  


<div id="sidebar_container">
  <!-- <div class="sidebar">
    <div class="sidebar_top"></div>
    <div class="sidebar_item">
      <h3>Latest News</h3>
      <h4>New Website Launched</h4>
      <h5>June 1st, 2014</h5>
      <p>2014 sees the redesign of our website. Take a look around and let us know what you think.<br /><a href="#">Read more</a></p>
    </div>
    <div class="sidebar_base"></div>
  </div> -->
  <div class="sidebar">
    <div class="sidebar_top"></div>
    <div class="sidebar_item">
      <h3>Useful Links</h3>
      <ul>
        <li><a href="/students">All Students</a></li>
        <li><a href="/employees">All Employees</a></li>
      </ul>
    </div>
    <div class="sidebar_base"></div>
  </div>
  <div class="sidebar">
    <div class="sidebar_top"></div>
    <div class="sidebar_item">
      <h3>Student Search</h3>
      <form method="post" action="/students/search" id="search_form">
        <p>
          <input class="search" type="text" name="serialNumber" onfocus="this.value=''" value="Enter Serial Number....." />
          <input name="search" type="image" style="border: 0; margin: 0 0 -9px 5px;" src="/style/search.png" alt="Search" title="Search" />
        </p>
      </form>
    </div>
    <div class="sidebar_base"></div>
  </div>
  <div class="sidebar">
    <div class="sidebar_top"></div>
    <div class="sidebar_item">
      <h3>Employee Search</h3>
      <form method="post" action="/employees/search" id="search_form">
        <p>
          <input class="search" type="text" name="employeeId" onfocus="this.value=''" value="Enter Employee Id....." />
          <input name="search" type="image" style="border: 0; margin: 0 0 -9px 5px;" src="/style/search.png" alt="Search" title="Search" />
        </p>
      </form>
    </div>
    <div class="sidebar_base"></div>
  </div>
</div>