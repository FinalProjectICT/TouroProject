package com.example.coding.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.coding.service.TourListService;
import com.example.coding.vo.tourVO;

@Controller
@RequestMapping("/touro")
public class MainPageController {

	@Autowired
	private TourListService tourListService;

	/****
	 * 메인 페이지 컨트롤러
	 */
	@RequestMapping("")
	public void main() {
	}

	/****
	 * 여행지 리스트 컨트롤러
	 */
	@RequestMapping("/tour")
	public String tour(Model m) {

		List<tourVO> List = tourListService.getTourList();
		m.addAttribute("TourList", List);
		
		return "/jsp/TourList";
	}
	
}
