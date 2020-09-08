package com.kh.itworks.notice.model.vo;

public class Notice implements java.io.Serializable {

//	NOTICE_NO		VARCHAR2(30 BYTE)		공지번호관리코드
//	CID				NUMBER(30,0)			카테고리관리코드
//	NTITLE			VARCHAR2(30 BYTE)		제목
//	NDATE			VARCHAR2(30 BYTE)		작성일
//	NTIME			VARCHAR2(30 BYTE)		작성시간
//	NVIEWS			VARCHAR2(30 BYTE)		조회수
//	NCONTENT		VARCHAR2(3999 BYTE)		내용
//	NSTATUS			VARCHAR2(10 BYTE)		공개여부
//	MNO				NUMBER(20,0)			회원관리코드
//	RID				NUMBER(20,0)			권한관리코드
//	CORP_NO			NUMBER(30,0)			회사코드
	
	private String noticeNo;
	private int cId;
	private String nTitle;
	private String nDate;
	private String nTime;
	private String nViews;
	private String nContent;
	private String nStatus;
	private int mNo;
	private int rId;
	private int corpNo;
	
	public Notice() {
		
	}

	public Notice(String noticeNo, int cId, String nTitle, String nDate, String nTime, String nViews, String nContent,
			String nStatus, int mNo, int rId, int corpNo) {
		super();
		this.noticeNo = noticeNo;
		this.cId = cId;
		this.nTitle = nTitle;
		this.nDate = nDate;
		this.nTime = nTime;
		this.nViews = nViews;
		this.nContent = nContent;
		this.nStatus = nStatus;
		this.mNo = mNo;
		this.rId = rId;
		this.corpNo = corpNo;
	}

	public String getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(String noticeNo) {
		this.noticeNo = noticeNo;
	}

	public int getcId() {
		return cId;
	}

	public void setcId(int cId) {
		this.cId = cId;
	}

	public String getnTitle() {
		return nTitle;
	}

	public void setnTitle(String nTitle) {
		this.nTitle = nTitle;
	}

	public String getnDate() {
		return nDate;
	}

	public void setnDate(String nDate) {
		this.nDate = nDate;
	}

	public String getnTime() {
		return nTime;
	}

	public void setnTime(String nTime) {
		this.nTime = nTime;
	}

	public String getnViews() {
		return nViews;
	}

	public void setnViews(String nViews) {
		this.nViews = nViews;
	}

	public String getnContent() {
		return nContent;
	}

	public void setnContent(String nContent) {
		this.nContent = nContent;
	}

	public String getnStatus() {
		return nStatus;
	}

	public void setnStatus(String nStatus) {
		this.nStatus = nStatus;
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	public int getrId() {
		return rId;
	}

	public void setrId(int rId) {
		this.rId = rId;
	}

	public int getCorpNo() {
		return corpNo;
	}

	public void setCorpNo(int corpNo) {
		this.corpNo = corpNo;
	}

	@Override
	public String toString() {
		return "Notice [noticeNo=" + noticeNo + ", cId=" + cId + ", nTitle=" + nTitle + ", nDate=" + nDate + ", nTime="
				+ nTime + ", nViews=" + nViews + ", nContent=" + nContent + ", nStatus=" + nStatus + ", mNo=" + mNo
				+ ", rId=" + rId + ", corpNo=" + corpNo + "]";
	}
	
}