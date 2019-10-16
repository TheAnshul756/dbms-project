package com.school.work.models;

public class Userinfo{
    private String username;
    private String password;
    private int employeeId;

    public String getUserName(){
        return this.username;
    }

    public void setUserName(String username){
        this.username = username;
    }

    public String getPassword(){
        return this.password;
    }

    public void setPassword(String password){
        this.password = password;
    }

    public int getEmployeeId(){
        return this.employeeId;
    }

    public void setEmployeeId(int employeeId){
        this.employeeId = employeeId;
    }
    
}