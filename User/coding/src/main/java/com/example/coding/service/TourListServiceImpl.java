package com.example.coding.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

import com.example.coding.dao.TourListDAO;
import com.example.coding.vo.tourVO;

@Service
public class TourListServiceImpl implements TourListService{
    
    @Autowired
    private TourListDAO tourListDTO;

    public List<tourVO> getTourList(){
        
        return tourListDTO.getTourList();
    }
}
