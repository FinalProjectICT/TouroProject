package com.example.coding.vo;

import lombok.Data;

@Data
public class tourVO {
    private String tour_num;
    private String tour_cate_code;
    private String tour_name;
    private String tour_content;
    private String tour_addr;
    private String tour_postnum;
    private String tour_site_addr;
    private Integer inquiry_num;
    private Integer loc_cate_code;
    private double tour_lati;
    private double tour_longi;
    private float tour_star;
}
