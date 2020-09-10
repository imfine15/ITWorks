package com.kh.itworks.address.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.itworks.address.model.vo.AddressVO;
import com.kh.itworks.address.model.vo.Criteria;
import com.kh.itworks.address.model.vo.PageInfo;

public interface AddressDao {

	//주소록 신규 등록 (모든 페이지)
	int insertAddress(SqlSessionTemplate sqlSession, AddressVO address);

	//메인 주소록 리스트 
	public ArrayList<AddressVO>pageList(SqlSessionTemplate sqlSession, PageInfo pi);
	
	//메인 주소록 개수
	public int countAddressList(SqlSessionTemplate sqlSession);
	
	//공유 주소록 리스트
	public ArrayList<AddressVO>sharePageList(SqlSessionTemplate sqlSession, PageInfo pi);
	
	//공유 주소록 개수
	public int countShareAddressList(SqlSessionTemplate sqlSession);
	
	//중요 주소록 리스트
	public ArrayList<AddressVO>importantPageList(SqlSessionTemplate sqlSession, PageInfo pi);
	
	//중요 주소록 개수
	public int countImportantAddressList(SqlSessionTemplate sqlSession);
	
	//주소록 삭제
	public void deleteMainAddress(int contactsNo);
//	
//	//주소록 수정
//	public int update(AddressVO address);
//	
//	//주소록 조회하기
//	public AddressVO select(int num);
	
	
}
