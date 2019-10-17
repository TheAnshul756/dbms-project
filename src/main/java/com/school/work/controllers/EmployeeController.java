package com.school.work.controllers;

import com.school.work.dao.ClassDao;
import com.school.work.dao.EmployeeDao;
import com.school.work.dao.SubjectDao;
import com.school.work.dao.UserinfoDao;
import com.school.work.models.Employee;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class EmployeeController {

    @Autowired
    EmployeeDao empDao;

    @Autowired
    SubjectDao subDao;

    @Autowired
    ClassDao clsDao;

    @Autowired
    UserinfoDao userDao;


    @GetMapping("/employees/{id}")
    public String employee_detail (@PathVariable int id, Model m){
        m.addAttribute("employee", empDao.getEmployeeByEmployeeId(id));
        m.addAttribute("subjects",clsDao.getAllSubjects());
        m.addAttribute("classes",clsDao.getAllClasses());
        m.addAttribute("userinfo",userDao.getAllUserinfo());
        return "employee_detail";
    }

    @PostMapping("/employees/{id}/edit")
    public String employee_update(@ModelAttribute Employee employee, @PathVariable int id, Model m) {
        employee.setEmployeeId(id);
        // System.out.println(employee.getDOB());
        empDao.update(employee);
        return "redirect:/employees/"+employee.getEmployeeId();
    }

    @GetMapping("/employees/new")
    public String employee_new(Model m){
        m.addAttribute("employee",new Employee());
        return "new_employee";
    }

    @PostMapping("/employees/new")
    public String employee_add(@ModelAttribute Employee employee, Model m){
        // System.out.println(employee.getGender());
        int id = empDao.save(employee);
        // int id=1;
        return "redirect:/employees/"+id;
    }

    // @GetMapping("/employees/search")
    // public String employee_search(Model m){
    //     return "search_employee";
    // }

    @PostMapping("/employees/search")
    public String employee_info(@RequestParam String employeeId, Model m){
        if(!empDao.isEmployeeIdPresent(employeeId))
        {
            String msg = "Employee Id does not exit!!!";
            m.addAttribute("msg", msg);
            return "error_page";
        }
        return "redirect:/employees/" + employeeId;
    }

    @GetMapping("/employees")
    public String all_all_employees(Model m){
        m.addAttribute("employees", empDao.getAllEmployees());
        // m.addAttribute("classes", clsDao.getAllClasses());
        return "all_employees_school";
    }

}