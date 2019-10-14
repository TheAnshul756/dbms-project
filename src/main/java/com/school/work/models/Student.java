package com.school.work.models;
import java.sql.Date;

public class Student{
    private int serialNumber;
    private String Fname;
    private String Lname;
    private String gender;
    private Date DOB;
    private String address;
    private String contact;
    private String motherName;
    private String fatherName;
    private int classId;

    public int getSerialNumber(){
        return this.serialNumber;
    }

    public void setSerialNumber(int serialNumber){
        this.serialNumber = serialNumber;
    }

    public String getFname(){
        return this.Fname;
    }

    public void setFname(String Fname){
        this.Fname = Fname;
    }

    public String getLname(){
        return this.Lname;
    }

    public void setLname(String Lname){
        this.Lname = Lname;
    }

    public String getGender(){
        return this.gender;
    }

    public void setGender(String gender){
        this.gender = gender;
    }

    public Date getDOB(){
        return this.DOB;
    }

    public void setDOB(Date DOB){
        this.DOB = DOB;
    }

    public String getAddress(){
        return this.address;
    }

    public void setAddress(String address){
        this.address = address;
    }

    public String getContact(){
        return this.contact;
    }

    public void setContact(String contact){
        this.contact = contact;
    }

    public String getMotherName(){
        return this.motherName;
    }

    public void setMotherName(String motherName){
        this.motherName = motherName;
    }

    public String getFatherName(){
        return this.fatherName;
    }

    public void setFatherName(String fatherName){
        this.fatherName = fatherName;
    }

    public int getClassId(){
        return this.classId;
    }

    public void setClassId(int classId){
        this.classId = classId;
    }

	public Object getAllStudents() {
		return null;
	}
    
}