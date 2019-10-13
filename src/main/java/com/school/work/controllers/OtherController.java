package com.school.work.controllers;

import com.school.work.dao.ClassDao;
import com.school.work.dao.EmployeeDao;
import com.school.work.dao.SubjectDao;
import com.school.work.models.Class;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class OtherController{

    @Autowired
    ClassDao clsDao;

    @Autowired
    EmployeeDao empDao;

    @Autowired
    SubjectDao subDao;

    @GetMapping("/classes")
    public String all_classes (Model m){
        m.addAttribute("employees", empDao.getAllEmployees());
        m.addAttribute("classes", clsDao.getAllClasses());
        return "view_classes";
    }

    @GetMapping("/subjects/{classId}")
    public String all_subjects(@PathVariable int classId,  Model m){
        m.addAttribute("subjects", subDao.getAllSubjectsInClass(classId));
        m.addAttribute("employees", empDao.getAllEmployees());
        return "all_subjects";
    }

    @GetMapping("/classes/${classId}")
    public String edit_class(@PathVariable int classId,  Model m){
        m.addAttribute("class", clsDao.getClassByClassId(classId));
        m.addAttribute("employees", empDao.getAllEmployees());
        return "edit_class";
    }

    @PostMapping("/classes/${classId}/edit")
    public String class_update(@ModelAttribute Class cls, @PathVariable int classId, Model m) {
        cls.setClassId(classId);
        // System.out.println(student.getDOB());
        clsDao.update(cls);
        return "redirect:/classes";
    }
}