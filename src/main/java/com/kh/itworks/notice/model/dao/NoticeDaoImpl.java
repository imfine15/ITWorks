package com.kh.itworks.notice.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.itworks.notice.model.exception.NoticeSelectListException;
import com.kh.itworks.notice.model.vo.Notice;
import com.kh.itworks.notice.model.vo.NoticePageInfo;

@Repository
public class NoticeDaoImpl implements NoticeDao{

	@Override
	public int insertNo(SqlSessionTemplate sqlSession, Notice notice) {
		
		return sqlSession.insert("Notice.insertNo", notice);
	}
	
	@Override
	public int getListCount(SqlSessionTemplate sqlSession) {
		
		int result = sqlSession.selectOne("Notice.selectListCount");
		
		if(result < 0) {
			sqlSession.close();
		}
		
		return result;
	}

	@Override
	public ArrayList<Notice> selectNoticeList(SqlSessionTemplate sqlSession, NoticePageInfo pi, int i) throws NoticeSelectListException {

		ArrayList<Notice> list = null;
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		list = (ArrayList) sqlSession.selectList("Notice.selectNoticeList", i, rowBounds);
		
		if(list == null) {
			sqlSession.close();
			throw new NoticeSelectListException("공지사항 리스트 출력 실패"); 
		}
		
		return list;
	}

	@Override
	public Notice selectOneBoard(SqlSessionTemplate sqlSession, String noticeNo) {
		
		System.out.println("daoImpl noticeNo : " + noticeNo);
		Notice notice2 = sqlSession.selectOne("Notice.noticeDetail", noticeNo);
		
		return notice2;
	}

	@Override
	public int deleteNo(SqlSessionTemplate sqlSession, Notice notice) {
		
		//System.out.println("daoImpl : " + notice);
		
		return sqlSession.update("Notice.deleteNo", notice);
	}

	@Override
	public int updateNo(SqlSessionTemplate sqlSession, Notice notice) {

		System.out.println("daoImpl : " + notice);
		return sqlSession.update("Notice.updateNo", notice);
	}

}













