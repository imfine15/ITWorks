package com.kh.itworks.fileBox.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.itworks.common.PageInfo;
import com.kh.itworks.fileBox.model.dao.FileBoxDao;
import com.kh.itworks.fileBox.model.vo.FileBox;
import com.kh.itworks.member.model.vo.Member;

@Service
public class FileBoxServiceImpl implements FileBoxService {

	@Autowired
	private FileBoxDao fbd;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
//	@Override
//	public int uploadFile(FileBox fb, Member loginUser) {
//		int result = 0;
//		result = fbd.fileUpload(sqlSession, fb, loginUser);
//		System.out.println(result);
//		return fbd.fileUpload(sqlSession, fb, loginUser);
//	}

	@Override
	public int getListCount() {
		System.out.println("service 넘어오니..?");
		int listCount = fbd.getListCount(sqlSession);
		System.out.println("service : " + listCount);
		
		return listCount;
	}

	@Override
	public ArrayList<FileBox> selectFileList(PageInfo pi) {
		System.out.println("service select list 넘어오니..?");
		
		ArrayList<FileBox> list = fbd.selectFileList(sqlSession, pi);
		System.out.println("service : " + list);
		return list;
	}
	
	@Override
	public int getSearchListCount(FileBox fb) {
		System.out.println("***search service 넘어오니..?");
		int listCount = fbd.getSearchListCount(sqlSession, fb);
		System.out.println("***search service : " + listCount);
		
		return listCount;
	}
	
	@Override
	public ArrayList<FileBox> searchFileList(PageInfo pi, FileBox fb) {
		System.out.println("***search service select list 넘어오니..?");
		
		ArrayList<FileBox> list = fbd.searchFileList(sqlSession, pi, fb);
		System.out.println("***search service : " + list);
		return list;
	}

	@Override
	public int uploadFile(ArrayList<FileBox> fileArr, Member loginUser) {
		System.out.println("service fileupload 넘어오니?");
		int result = 0;
		result = fbd.fileUpload(sqlSession, fileArr, loginUser);
		System.out.println(result);
		
		return result;
	}

	@Override
	public HashMap<String, Object> selectOneFile(String fileNo) {
		System.out.println("service file Download 넘어오니?");
		HashMap<String, Object> list = fbd.selectOneFile(sqlSession, fileNo);
		return list;
	}

	@Override
	public int fileDelete(FileBox fb) {
		System.out.println("service fileNo : " + fb);
		int result = 0;
		result = fbd.fileDelete(sqlSession, fb);
		return result;
	}

	@Override
	public ArrayList<FileBox> selectTrashList(PageInfo pi) {
		System.out.println("service select list 넘어오니..?");
		
		ArrayList<FileBox> list = fbd.selectTrashList(sqlSession, pi);
		System.out.println("service : " + list);
		return list;
	}

	@Override
	public int fileRestore(FileBox fb) {
		System.out.println("service fileNo : " + fb);
		int result = 0;
		result = fbd.fileRestore(sqlSession, fb);
		return result;
	}
	
	@Override
	public int fileDeleteForever(FileBox fb) {
		System.out.println("service fileDeleteForever fileNo : " + fb);
		int result = 0;
		result = fbd.fileDeleteForever(sqlSession, fb);
		return result;
	}


}
