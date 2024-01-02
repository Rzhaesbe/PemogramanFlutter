/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.zailany.nilai.Service;
 
import com.zailany.nilai.Entity.Nilai;
import com.zailany.nilai.Repositrory.NilaiRepository;
import com.zailany.nilai.nilai.io.Mahasiswa;
import com.zailany.nilai.nilai.io.Matakuliah;
import com.zailany.nilai.nilai.io.ResponseTemplateVo;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

/**
 *
 * @author Uncle.haesbe
 */
@Service
public class NilaiService {
    @Autowired
    private NilaiRepository nilaiRepository;
    
    @Autowired
    private RestTemplate restTemplate;
    
    public List<Nilai> getAllNilai(){
        return nilaiRepository.findAll();
    }
    
    public void insert(Nilai nilai){
        nilaiRepository.save(nilai);
    }
    
    public ResponseTemplateVo getNilai(Long idnilai){
        ResponseTemplateVo vo = new ResponseTemplateVo();
        Nilai nilai = nilaiRepository.findById(idnilai).get();
        
        Mahasiswa mahasiswa = 
                restTemplate.getForObject("http://localhost:9001/api/v1/mahasiswa/"+ 
                        nilai.getIdmahasiswa() , Mahasiswa.class);
        Matakuliah matakuliah = 
                restTemplate.getForObject("http://localhost:9002/api/v1/matakuliah/"+ 
                        nilai.getIdmatakuliah(), Matakuliah.class);   
        vo.setNilai(nilai);
        vo.setMahasiswa(mahasiswa);
        vo.setMatakuliah(matakuliah);
        return vo;
    }
}
