package com.school.work.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.school.work.models.Exam;

import org.springframework.jdbc.core.RowMapper;

public class ExamRowMapper implements RowMapper<Exam>{

    @Override
    public Exam mapRow(ResultSet rs, int row) throws SQLException{
        Exam e = new Exam();
        e.setExamId(rs.getInt("examId"));
        e.setType(rs.getString("type"));
        e.setYear(rs.getInt("year"));
        e.setMaximumMarks(rs.getInt("maximumMarks"));
        e.setSubjectId(rs.getInt("subjectId"));
        return e;
    }
}