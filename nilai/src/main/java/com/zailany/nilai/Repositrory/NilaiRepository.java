/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.zailany.nilai.Repositrory;

 
import com.zailany.nilai.Entity.Nilai;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Uncle.haesbe
 */
@Repository
public interface NilaiRepository extends JpaRepository<Nilai, Long>{
    
}
