package com.school.work.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.Map;

import com.school.work.models.Userinfo;

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
public class UserinfoDao{
    private JdbcTemplate template;

    @Autowired
    public void setTemplate(JdbcTemplate template){
        this.template = template;
    }

    public Userinfo getUserinfoByUserName(String username){
        String sql = "select * from userinfo where username=?";
        return template.queryForObject(sql,
        new Object[]{username},
        new UserinfoRowMapper());
    }


    public String save(Userinfo cls){
        String sql = "insert into userinfo (username,password,employeeId) values ('" + cls.getUserName() + "','" + cls.getPassword() + "'," + cls.getEmployeeId() + ")";

        // KeyHolder keyHolder = new GeneratedKeyHolder();
        // template.update(
        //     new PreparedStatementCreator(){
            
        //         @Override
        //         public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
        //             PreparedStatement ps = con.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
        //             return ps;
        //         }
        //     },keyHolder
        // );
        // return keyHolder.getKey().intValue();
        template.update( sql);
        return cls.getUserName();
    }

    public void update(Userinfo cls, String prevUserName){
        String sql = "update userinfo set username = '" + cls.getUserName() + "',password='" + cls.getPassword() + "',employeeId = " + cls.getEmployeeId()  + " where username = " + prevUserName;
        template.update(sql);
    }

}