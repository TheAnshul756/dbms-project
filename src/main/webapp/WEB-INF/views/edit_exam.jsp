<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  

<html>
    <head>
        <title>
            Exam Details
        </title>
    </head>
    <body>
        <h1>Exam Details</h1>
        <form method="POST" action="/exams/${exm.examId}/edit">
        <!-- <errors path="*" cssClass="errorblock" element="div" /> -->
        <table style="width: 50%">
                <tr>
                    <td>Type</td>
                    <td>
                        <select name="type">
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
                        </select>
                    </td>
                </tr>
            <tr>
                <td>Year</td>
                <td><input type="Number" name="year" value = "${exm.getYear()}" /></td>
            </tr>
            <tr>
                <td>Mamimum Marks</td>
                <td><input type="Number" name="maximumMarks" value = "${exm.getMaximumMarks()}" /></td>
            </tr>
        </table>
            <br>
            <input type="submit" value="Update" />
        </form>
    </body>
</html>