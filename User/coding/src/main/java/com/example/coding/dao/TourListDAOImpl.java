package com.example.coding.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.coding.vo.tourVO;

@Repository
public class TourListDAOImpl implements TourListDAO{
    
    @Autowired
	private SqlSessionTemplate mybatis;

    public List<tourVO> getTourList(){
        return mybatis.selectList("selectALL");
    };
}
