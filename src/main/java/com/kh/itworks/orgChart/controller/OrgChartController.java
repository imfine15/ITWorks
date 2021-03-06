package com.kh.itworks.orgChart.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.kh.itworks.member.model.vo.Member;
import com.kh.itworks.orgChart.model.service.OrgChartService;
import com.kh.itworks.orgChart.model.vo.DeptVO;

@Controller
public class OrgChartController {
	
	@Autowired
	private OrgChartService ocs;

	@RequestMapping("orgChart.org")
	public String orgChart(HttpServletRequest request ,DeptVO dept, @SessionAttribute("loginUser") Member loginUser) {

		dept.setCorpNo(loginUser.getCorpNo());
		ArrayList<DeptVO> orgChart = ocs.selectDeptList(dept);		

		request.setAttribute("org", orgChart);

		return "orgChart/orgChart";
	}
	
	@RequestMapping("orgList.org")
	public String orgList(HttpServletRequest request,DeptVO dept, @SessionAttribute("loginUser") Member loginUser) {
		dept.setCorpNo(loginUser.getCorpNo());

		ArrayList<DeptVO> memberList = ocs.selectEmployees(dept);
		
		List<Map<String, Object>> deptlist = ocs.selectDefaultList(dept);
		
		request.setAttribute("membersList", memberList);
		request.setAttribute("dept", deptlist);
		
		return "orgChart/orgList";
	}

	@RequestMapping("orgManage.org")
	public String orgManage(HttpServletRequest request,DeptVO dept, @SessionAttribute("loginUser") Member loginUser) {
		dept.setCorpNo(loginUser.getCorpNo());

		ArrayList<DeptVO> orgManage = ocs.selectCompanyDeptList(dept);
		
		request.setAttribute("dept", orgManage);
				
		return "orgChart/orgManage";
	}
	@RequestMapping("positionManage.org")
	public String positionManage() {

		return "orgChart/positionManage";
	}
	
}