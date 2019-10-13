<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  

<html>
    <head>
        <title>
            Add New Exam
        </title>
    </head>
    <body>
        <h1>Add New Exam</h1>
        <form method="POST" action="/exams/${subjectId}/new">
        <!-- <errors path="*" cssClass="errorblock" element="div" /> -->
        <table style="width: 50%">
                <tr>
                    <td>Type</td>
                    <td>
                        <select name="type">
                        <option value="FA1" selected>FA1</option>
                        <option value="FA2" >FA2</option>
                        <option value="FA3" >FA3</option>
                        <option value="FA4" >FA4</option>
                        <option value="SA1" >SA1</option>
                        <option value="SA2" >SA2</option>
                        </select>
                    </td>
                </tr>
            <tr>
                <td>Year</td>
                <td><input type="Number" name="year" /></td>
            </tr>
            <tr>
                <td>Mamimum Marks</td>
                <td><input type="Number" name="maximumMarks"  /></td>
            </tr>
        </table>
            <br>
            <input type="submit" value="Submit" />
        </form>
    </body>
</html>