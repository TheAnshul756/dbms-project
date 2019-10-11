package com.school.work.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import com.school.work.models.Subject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Repository
public class SubjectDao{
    private JdbcTemplate template;

    @Autowired
    public void setTemplate(JdbcTemplate template){
        this.template = template;
    }

    public Subject getSubjectBySubjectId(int subjectId){
        String sql = "select * from subject where subjectId=?";
        return template.queryForObject(sql,
        new Object[]{subjectId},
        new BeanPropertyRowMapper<Subject>(Subject.class));
    }

    public int save(Subject sub){
        String sql = "insert into subject (classId,subjectName,teacherId,weightage) values (" + sub.getClassId() + ",'" + sub.getSubjectName() 
        + "'," + sub.getTeacherId() + "," + sub.getWeightage() + ")";

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

    public void update(Subject sub){
        String sql = "update subject set classId=" + sub.getClassId() + ", subjectName = '" + sub.getSubjectName() + "', teacherId=" + sub.getTeacherId() + ", weightage=" + sub.getWeightage() + " where subjectId = " + sub.getSubjectId();
        template.update(sql);
    }

    public List<Subject> getAllSubjects(){
        String sql="select * from subject";
        return template.query(sql,
        new SubjectRowMapper());
    }

}