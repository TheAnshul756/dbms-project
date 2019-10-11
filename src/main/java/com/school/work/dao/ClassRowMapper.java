package com.school.work.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.school.work.models.Class;

import org.springframework.jdbc.core.RowMapper;

public class ClassRowMapper implements RowMapper<Class>{

    @Override
    public Class mapRow(ResultSet rs, int row) throws SQLException{
        Class e = new Class();
        e.setClassId(rs.getInt("classId"));
        e.setClassName(rs.getString("className"));
        e.setClassTeacherID(rs.getInt("classTeacherId"));
        return e;
    }
}