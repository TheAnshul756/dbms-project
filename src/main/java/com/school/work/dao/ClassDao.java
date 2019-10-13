package com.school.work.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.Map;

import com.school.work.models.Class;

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
public class ClassDao{
    private JdbcTemplate template;

    @Autowired
    public void setTemplate(JdbcTemplate template){
        this.template = template;
    }

    public Class getClassByClassId(int classId){
        String sql = "select * from class where classId=?";
        return template.queryForObject(sql,
        new Object[]{classId},
        new ClassRowMapper());
    }

    public int save(Class cls){
        String sql = "insert into class (className,classTeacherId) values ('" + cls.getClassName() + "'," + cls.getClassTeacherId() + ")";

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

    public void update(Class cls){
        String sql = "update class set className = '" + cls.getClassName() + "',classTeacherId=" + cls.getClassTeacherId() + " where classId = " + cls.getClassId();
        template.update(sql);
    }

    public List<Class> getAllClasses() {
        String sql="select * from class";
        return template.query(sql,
        new ClassRowMapper());
    }

    public List<Map<String,Object> > getAllSubjects(){
        String sql="select a.classId as classId,a.className as className,b.subjectId as subjectId,b.subjectname as subjectName,b.weightage as weightage,b.teacherId as teacherId from class as a,subject as b where  b.classId =  a.classId";
        return this.template.queryForList(sql);
    }
    

}