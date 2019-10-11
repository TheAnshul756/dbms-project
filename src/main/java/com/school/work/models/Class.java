package com.school.work.models;

public class Class{
    private int classId;
    private String className;
    private int classTeacherId;

    public int getClassId(){
        return this.classId;
    }

    public void setClassId(int classId){
        this.classId = classId;
    }

    public String getClassName(){
        return this.className;
    }

    public void setClassName(String className){
        this.className = className;
    }

    public int getClassTeacherId(){
        return this.classTeacherId;
    }

    public void setClassTeacherID(int classTeacherId){
        this.classTeacherId = classTeacherId;
    }
    
}