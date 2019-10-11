package com.school.work.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import com.school.work.models.Exam;

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
public class ExamDao{
    private JdbcTemplate template;

    @Autowired
    public void setTemplate(JdbcTemplate template){
        this.template = template;
    }

    public Exam getExamByExamId(int examId){
        String sql = "select * from exam where examId=?";
        return template.queryForObject(sql,
        new Object[]{examId},
        new BeanPropertyRowMapper<Exam>(Exam.class));
    }

    public int save(Exam exm){
        String sql = "insert into exam (type,year,subjectId) values ('" + exm.getType() + "'," + exm.getYear() 
        + "," + exm.getSubjectId() + ")";

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

    public void update(Exam exm){
        String sql = "update exam set type='" + exm.getType() + "', year=" + exm.getYear() + ", subjectId=" + exm.getSubjectId() + " where examId = " + exm.getExamId();
        template.update(sql);
    }

}