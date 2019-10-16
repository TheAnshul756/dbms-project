package com.school.work.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import com.school.work.models.Result;

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
public class ResultDao{
    private JdbcTemplate template;

    @Autowired
    public void setTemplate(JdbcTemplate template){
        this.template = template;
    }

    public Result getResultByResultId(int resultId){
        String sql = "select * from result where resultId=?";
        return template.queryForObject(sql,
        new Object[]{resultId},
        new ResultRowMapper());
    }

    public Result getResultBySerialNumberExamId(int examId, int serialNumber){
        String sql = "select * from result where examId=? and serialNumber=?";
        return template.queryForObject(sql,
        new Object[]{examId,serialNumber},
        new ResultRowMapper());
    }



    public int save(Result rslt){
        String sql = "insert into result (examId,serialNumber,obtainedMarks) values (" + rslt.getExamId() + "," + rslt.getSerialNumber() + 
        "," + rslt.getObtainedMarks() + ")";

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

    public void update(Result rslt){
        String sql = "update result set examID=" + rslt.getExamId() + ", serialNumber=" + rslt.getSerialNumber() + ", obtainedMarks=" + 
        rslt.getObtainedMarks() + " where resultId = " + rslt.getResultId();
        template.update(sql);
    }

    public List<Result> getAllResults() {
        String sql="select * from result";
        return template.query(sql,
        new ResultRowMapper());
    }


}