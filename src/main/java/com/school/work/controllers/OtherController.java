package com.school.work.controllers;

import com.school.work.dao.ClassDao;
import com.school.work.dao.EmployeeDao;
import com.school.work.dao.ExamDao;
import com.school.work.dao.ResultDao;
import com.school.work.dao.SubjectDao;
import com.school.work.models.Class;
import com.school.work.models.Exam;
import com.school.work.dao.StudentDao;
import com.school.work.models.Subject;


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

    @Autowired
    ExamDao exmDao;

    @Autowired
    StudentDao stuDao;

    @Autowired
    ResultDao rsltDao;

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
        m.addAttribute("classID", classId);
        return "all_subjects";
    }

    @GetMapping("/classes/{classId}")
    public String class_detail(@PathVariable int classId,  Model m){
        m.addAttribute("cls", clsDao.getClassByClassId(classId));
        m.addAttribute("employees", empDao.getAllEmployees());
        return "edit_class";
    }

    @PostMapping("/classes/{classId}/edit")
    public String class_update(@RequestParam int classTeacherId, @RequestParam String className,@PathVariable int classId, Model m) {
        Class myclass = new Class();
        myclass.setClassId(classId);
        myclass.setClassTeacherId(classTeacherId);
        myclass.setClassName(className);
        // System.out.println(myclass.getClassTeacherId()+"HI");
        // System.out.println(student.getDOB());
        clsDao.update(myclass);
        return "redirect:/classes";
    }

    @GetMapping("/classes/new")
    public String classes_new(Model m){
        m.addAttribute("cls",new Class());
        m.addAttribute("employees", empDao.getAllEmployees());
        return "new_class";
    }

    @PostMapping("/classes/new")
    public String classes_add(@ModelAttribute Class cls, Model m){
        // System.out.println(cls.getClassTeacherId());
        int classId = clsDao.save(cls);
        // int serialNumber=1;
        m.addAttribute("cls", empDao.getAllEmployees());
        return "redirect:/classes/";
    }

    @GetMapping("/subjects/{classId}/new")
    public String subject_new(Model m, @PathVariable int classId){
        m.addAttribute("sub",new Subject());
        m.addAttribute("classId", classId);
        m.addAttribute("employees", empDao.getAllEmployees());
        return "new_subject";
    }

    @PostMapping("/subjects/{classId}/new")
    public String subject_add(@RequestParam int teacherId, @RequestParam String subjectName,@RequestParam int weightage, @PathVariable int classId, Model m){
        Subject sub = new Subject();
        sub.setSubjectName(subjectName);
        sub.setTeacherID(teacherId);
        sub.setWeightage(weightage);
        // System.out.println(sub.getTeacherId());
        // int serialNumber=1;
        sub.setClassId(classId);
        int subjectId =subDao.save(sub);
        m.addAttribute("cls", empDao.getAllEmployees());
        return "redirect:/subjects/{classId}";
    }

    @GetMapping("/subjects/{subjectId}/edit")
    public String subject_detail(@PathVariable int subjectId,  Model m){
        m.addAttribute("sub", subDao.getSubjectBySubjectId(subjectId));
        m.addAttribute("employees", empDao.getAllEmployees());
        m.addAttribute("classId",subDao.getSubjectBySubjectId(subjectId).getClassId());
        return "edit_subject";
    }

    @PostMapping("/subjects/{subjectId}/edit")
    public String subject_update(@RequestParam int teacherId, @RequestParam String subjectName,@RequestParam int weightage, @PathVariable int subjectId, Model m){
        Subject sub = subDao.getSubjectBySubjectId(subjectId);
        sub.setSubjectName(subjectName);
        sub.setTeacherID(teacherId);
        sub.setWeightage(weightage);
        // System.out.println(sub.getTeacherId());
        // int serialNumber=;
        subDao.update(sub);
        m.addAttribute("cls", empDao.getAllEmployees());
        return "redirect:/subjects/"+sub.getClassId();
    }

    @GetMapping("/exams/{subjectId}")
    public String subject_exams(@PathVariable int subjectId,  Model m){
        m.addAttribute("exams", exmDao.getAllExams());
        m.addAttribute("subjectId", subjectId);
        m.addAttribute("classId",subDao.getSubjectBySubjectId(subjectId).getClassId());
        return "all_exams";
    } 

    @GetMapping("/exams/{examId}/edit")
    public String exam_detail(@PathVariable int examId,  Model m){
        m.addAttribute("exm", exmDao.getExamByExamId(examId));
        m.addAttribute("classId", subDao.getSubjectBySubjectId(exmDao.getExamByExamId(examId).getSubjectId()).getClassId());
        return "edit_exam";
    }

    @PostMapping("/exams/{examId}/edit")
    public String class_update(@RequestParam String type, @RequestParam int year, @RequestParam int maximumMarks, @PathVariable int examId, Model m) {
        // System.out.println(myclass.getClassTeacherId()+"HI");
        // System.out.println(student.getDOB());
        Exam exm = exmDao.getExamByExamId(examId);
        int subjectId = exm.getSubjectId();
        exm.setType(type);
        exm.setYear(year);
        exm.setMaximumMarks(maximumMarks);
        exmDao.update(exm);
        return "redirect:/exams/"+subjectId;
    }

    @GetMapping("/exams/{subjectId}/new")
    public String new_exam(@PathVariable int subjectId,  Model m){
        m.addAttribute("subjectId", subjectId);
        m.addAttribute("classId",subDao.getSubjectBySubjectId(subjectId).getClassId());
        return "new_exam";
    }

    @PostMapping("/exams/{subjectId}/new")
    public String save_subject(@RequestParam String type, @RequestParam int year, @RequestParam int maximumMarks, @PathVariable int subjectId, Model m) {
        // System.out.println(myclass.getClassTeacherId()+"HI");
        // System.out.println(student.getDOB());
        Exam exm = new Exam();
        exm.setType(type);
        exm.setYear(year);
        exm.setSubjectId(subjectId);
        exm.setMaximumMarks(maximumMarks);
        exmDao.save(exm);
        return "redirect:/exams/"+subjectId;
    }

    // @GetMapping("/results/class/{examId}")
    // public String class_exam(@PathVariable int examId,  Model m){
    //     m.addAttribute("students", stuDao.getAllStudents());
    //     System.out.println("hello");
    //     System.out.println(subDao.getSubjectBySubjectId(exmDao.getExamByExamId(examId).getSubjectId()).getClassId());
    //     m.addAttribute("classID", subDao.getSubjectBySubjectId(exmDao.getExamByExamId(examId).getSubjectId()).getClassId());
    //     m.addAttribute("results", rsltDao.getAllResults());
    //     return "redirect";
    // }

}