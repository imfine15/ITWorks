package com.kh.itworks.atManagement.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.itworks.atManagement.model.exception.SelectATManagementFailedException;
import com.kh.itworks.atManagement.model.vo.ATManagement;

@Repository
public class ATManagementDaoImpl implements ATManagementDao {

	

	@Override
	public ATManagement selectAtBt(SqlSessionTemplate sqlSession, ATManagement at) throws SelectATManagementFailedException {

		ATManagement selectAtBt = sqlSession.selectOne("ATManagement.selectAtBt", at.getCorpNo());
		
		System.out.println("selectAtBt : " + selectAtBt);
		
		if(selectAtBt == null) {
			
			throw new SelectATManagementFailedException("근태 기본정보 조회 실패!");
		}
		
		return selectAtBt;
	}

	@Override
	public ArrayList<ATManagement> selectWorkingStatus(SqlSessionTemplate sqlSession, ATManagement at) throws SelectATManagementFailedException {

		ArrayList<ATManagement> selectWorkingStatus = (ArrayList)sqlSession.selectList("ATManagement.selectWorkingStatus", at.getCorpNo());
		
		System.out.println("selectWorkingStatus : " + selectWorkingStatus);
		
		if(selectWorkingStatus == null) {
			
			throw new SelectATManagementFailedException("근태 기본정보 조회 실패!");
		}
		
		return selectWorkingStatus;
	}

	@Override
	public ArrayList<ATManagement> selectWorkTimeSet(SqlSessionTemplate sqlSession, ATManagement at) throws SelectATManagementFailedException {

		ArrayList<ATManagement> selectWorkTimeSet = (ArrayList)sqlSession.selectList("ATManagement.selectWorkTimeSet", at.getCorpNo());
		
		System.out.println("selectWorkTimeSet : " + selectWorkTimeSet);
		
		if(selectWorkTimeSet == null) {
			
			throw new SelectATManagementFailedException("근태 기본정보 조회 실패!");
		}
		
		return selectWorkTimeSet;
	}

}
