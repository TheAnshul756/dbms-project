package com.school.work.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.school.work.models.Result;

import org.springframework.jdbc.core.RowMapper;

public class ResultRowMapper implements RowMapper<Result>{

    @Override
    public Result mapRow(ResultSet rs, int row) throws SQLException{
        Result e = new Result();
        e.setResultId(rs.getInt("resultId"));
        e.setExamId(rs.getInt("examId"));
        e.setSerialNumber(rs.getInt("serialNUmber"));
        e.setObtainedMarks(rs.getInt("obtainedMarks"));
        return e;
    }
}