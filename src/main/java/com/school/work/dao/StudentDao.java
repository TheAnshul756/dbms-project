package com.school.work.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;

import com.school.work.models.Student;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Repository
public class StudentDao{
    private JdbcTemplate template;

    @Autowired
    public void setTemplate(JdbcTemplate template){
        this.template = template;
    }

    public Student getStudentBySerialNumber(int serialNumber){
        String sql = "select * from student where serialNumber=?";
        return template.queryForObject(sql,
        new Object[]{serialNumber},
        new StudentRowMapper());
    }

    public int save(Student std){

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String date = sdf.format(std.getDOB());

        String sql = "insert into student (Fname,Lname,gender,DOB,address,contact,motherName,fatherName,classId) values ('" +
        std.getFname() + "','" + std.getLname() + "','" + std.getGender() + "','" + date + "','" + std.getAddress() +
        "','" + std.getContact() + "','" + std.getMotherName() + "','" + std.getFatherName() + "'," + std.getClassId() + ")";

        KeyHolder keyHolder = new GeneratedKeyHolder();
        template.update(
            new PreparedStatementCreator(){
            
                @Override
                public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
                    PreparedStatement ps = con.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
                    return ps;
                }
            },keyHolder
        );
        return keyHolder.getKey().intValue();
    }

    public void update(Student std){

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String date = sdf.format(std.getDOB());

        String sql = "update student set Fname='" + std.getFname() + "', Lname='" + std.getLname() + "', gender='" + std.getGender() +
        "', address='" + std.getAddress() + "', contact='" + std.getContact() + "',DOB='" + date + "', motherName='" + std.getMotherName() + "', fatherName='" +
        std.getFatherName() + "', classId="+ std.getClassId() + " where serialNumber = " + std.getSerialNumber();
        template.update(sql);
    }

}