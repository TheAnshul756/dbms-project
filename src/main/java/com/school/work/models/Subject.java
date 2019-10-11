package com.school.work.models;

public class Subject{
    private int subjectId;
    private int classId;
    private String subjectName;
    private int teacherId;
    private int weightage;

    public int getSubjectId(){
        return this.subjectId;
    }

    public void setSubjectId(int subjectId){
        this.subjectId = subjectId;
    }
    
    public int getClassId(){
        return this.classId;
    }

    public void setClassId(int classId){
        this.classId = classId;
    }

    public String getSubjectName(){
        return this.subjectName;
    }

    public void setSubjectName(String subjectName){
        this.subjectName = subjectName;
    }

    public int getTeacherId(){
        return this.teacherId;
    }

    public void setTeacherID(int teacherId){
        this.teacherId = teacherId;
    }
    
    public int getWeightage(){
        return this.weightage;
    }

    public void setWeightage(int weightage){
        this.weightage = weightage;
    }

}