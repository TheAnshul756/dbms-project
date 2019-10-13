package com.school.work.models;

public class Exam{
    private int examId;
    private String type;
    private int year;
    private int maximumMarks;
    private int subjectId;

    public int getExamId(){
        return this.examId;
    }

    public void setExamId(int examId){
        this.examId = examId;
    }

    public String getType(){
        return this.type;
    }

    public void setType(String type){
        this.type = type;
    }

    public int getYear(){
        return this.year;
    }

    public void setYear(int year){
        this.year = year;
    }

    public int getMaximumMarks(){
        return this.maximumMarks;
    }

    public void setMaximumMarks(int maximumMarks){
        this.maximumMarks = maximumMarks;
    }
    
    public int getSubjectId(){
        return this.subjectId;
    }

    public void setSubjectId(int subjectId){
        this.subjectId = subjectId;
    }

}