/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.erlian.mahasiswa.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import java.time.LocalDate;

/**
 *
 * @author user
 */
@Entity
@Table
public class Mahasiswa {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String nama;
    private String email;
    private LocalDate tgllahir;

    public Mahasiswa() {
    }

    public Mahasiswa(Long id, String nama, String email, LocalDate tgllahir) {
        this.id = id;
        this.nama = nama;
        this.email = email;
        this.tgllahir = tgllahir;
    }
    
    public Mahasiswa( String nama, String email, LocalDate tgllahir) {
        this.nama = nama;
        this.email = email;
        this.tgllahir = tgllahir;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNama() {
        return nama;
    }

    public void setNama(String nama) {
        this.nama = nama;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public LocalDate getTgllahir() {
        return tgllahir;
    }

    public void setTgllahir(LocalDate tgllahir) {
        this.tgllahir = tgllahir;
    }

    @Override
    public String toString() {
        return "Mahasiswa{" + "id=" + id + ", nama=" + nama + ", email=" + email + ", tgllahir=" + tgllahir + '}';
    }
    
    
}
