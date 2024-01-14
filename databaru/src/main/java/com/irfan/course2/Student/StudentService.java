package com.irfan.course2.Student;

import java.time.LocalDate;
import java.time.Month;
import java.util.List;

import org.springframework.stereotype.Service;

@Service
public class StudentService {
    
    public List<Student> getStudent(){
        return List.of(new Student(22010282012L, "Muhammad Irfan", "mhdirfan0856@gmail.com", 20, LocalDate.of(2003, Month.JUNE, 11)));
    }
}
