package com.school.work.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.school.work.models.Student;

import org.springframework.jdbc.core.RowMapper;

public class StudentRowMapper implements RowMapper<Student>{

    @Override
    public Student mapRow(ResultSet rs, int row) throws SQLException{
        Student e = new Student();
        e.setSerialNumber(rs.getInt("serialNUmber"));
        e.setFname(rs.getString("Fname"));
        e.setLname(rs.getString("Lname"));
        e.setGender(rs.getString("gender"));
        e.setDOB(rs.getDate("DOb"));
        e.setAddress(rs.getString("address"));
        e.setContact(rs.getString("contact"));
        e.setMotherName(rs.getString("motherName"));
        e.setFatherName(rs.getString("fatherName"));
        e.setClassId(rs.getInt("classId"));
        return e;
    }
}