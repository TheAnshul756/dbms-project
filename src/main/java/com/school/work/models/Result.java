package com.school.work.models;

public class Result{
    private int resultId;
    private int examId;
    private int serialNumber;
    private int obtainedMarks;

    public int getResultId(){
        return this.resultId;
    }

    public void setResultId(int resultId){
        this.resultId = resultId;
    }

    public int getExamId(){
        return this.examId;
    }

    public void setExamId(int examId){
        this.examId = examId;
    }

    public int getSerialNumber(){
        return this.serialNumber;
    }

    public void setSerialNumber(int serialNumber){
        this.serialNumber = serialNumber;
    }

    public int getObtainedMarks(){
        return this.obtainedMarks;
    }

    public void setObtainedMarks(int obtainedMarks){
        this.obtainedMarks = obtainedMarks;
    }

}