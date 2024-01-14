package com.irfan.course2.Student;

import java.time.LocalDate;

public class Student {
    
    private Long id;

    private String name;

    private String email;

    private int age;

    private LocalDate dob; //date of birth

    public Student() {
    }

    //contructor with id
    public Student(Long id, String name, String email, int age, LocalDate dob) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.age = age;
        this.dob = dob;
    }

    //constructor without id
    public Student(String name, String email, int age, LocalDate dob) {
        this.name = name;
        this.email = email;
        this.age = age;
        this.dob = dob;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public LocalDate getDob() {
        return dob;
    }

    public void setDob(LocalDate dob) {
        this.dob = dob;
    }

    @Override
    public String toString() {
        return "Student data  id = " + id + " name = " + name + " email = " + email + " age = " + age + " Tanggal Lahir = " + dob;
    }

    
    

    


}
