<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="icon" href="${contextPath}/resources/images/favicon.ico" type="image/x-icon">
<style type="text/css">

	section{
		width: 75%;
		display: inline-block;
	}
	.inner{
        margin-top: 30px;
        width: 100%; 
        margin: 0 auto;
        padding-left: 30px;
    }
    #inner-title{
        color: #004771;
        font-family: Noto Sans KR;
        font-style: normal;
        font-weight: 500;
        font-size: 24px;
        line-height: 35px;
        margin-top: 30px;
    }
    #inner-title span{
    	margin-left: 20;
    }
    .middleTable{
    	width:100%;
        border-collapse: collapse;
        text-align:center;
    }
    .leftTable{
    	width:100%;
        border-collapse: collapse;
        margin-bottom: 10px;
        margin-top: 10px;
    }
    #managerTable tr{
    	border-bottom: 0.5px solid #9F9F9F;
		border-top: 0.5px solid #9F9F9F;
    }
    .middleName{
    	color: #004771;
        font-family: Noto Sans KR;
        font-style: normal;
        font-size: 14px;
        
    }
    #usageStatus{
    	width: 500px;
    }
    td{
    	font-family: Noto Sans KR;
		font-style: normal;
		font-weight: normal;
		font-size: 14px;
		line-height: 20px;
		color: #676767;
		height: 30px;
    }
    th{
    	font-family: Noto Sans KR;
		font-style: normal;
		font-weight: normal;
		font-size: 16px;
		line-height: 23px;
		color: #000000;
		background: white;
		width: 130px;
		height: 30px;
    }
    .line{
    	border-bottom: 0.5px solid #9F9F9F;
		border-top: 0.5px solid #9F9F9F;
    }
    .saveBtn{
    	outline: 0;
    	border : 1px solid #929292;
    	background-color: white;
    	color: #004771;
    	width: 80px;
    	margin-top: 10px;
    	margin-right: 10px;
    }
    .btn{
    	outline: 0;
    	border : 0;
    	color: #004771;
    	background-color: #fafafa;
    }
    .addBtn{
    	outline: 0;
    	border : 0;
    	background-color: #004771;
    	color: white;
    	width: 80px;
    }
    .left{
    	margin-right: 15px;
    	
    }
    .padding{
    	padding-left: 10px;
    }
    #addBtnAt{
    	float: right;
    	margin-bottom: 10px;
    }
    input[type=text]{
    	border-radius: 0;
		border: 1px solid gray;
		outline-style: none;
    }
    select{
	    border-radius: 0;
		border: 1px solid gray;
		outline-style: none;
    }
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/menubar.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/atManagement/atManagementAside.jsp"></jsp:include>
	    <section>
        <div class="inner">
            	<form action="updateInsert.at" method="post">
            	<input type="hidden" name="corpNo" value="${sessionScope.atbt.corpNo}">
            	<input type="hidden" name="breakTimeNo" value="${sessionScope.atbt.breakTimeNo}">
            <div id="inner-title">
            <span>근태 기본 설정</span>
            <br>
            <hr>
            <br>
            </div>
            <!-- 근태랑 52시간 근무 적용 여부 시작-->
            <div>
                <table id="usageStatus" class="leftTable">
                    <tr>
                        <td class="middleName">근태 사용 여부</td>
                        <td><input type="radio" name="attendence" value="Y"></td>
                        <td>사용함</td>
                        <td><input type="radio" name="attendence" value="N"></td>
                        <td>사용 안함</td>
                    </tr>
                    <tr>
                        <td class="middleName">52시간 근무 적용 여부</td>
                        <td><input type="radio" name="workTimeLimit" value="Y"></td>
                        <td>사용함</td>
                        <td><input type="radio" name="workTimeLimit" value="N"></td>
                        <td>사용 안함</td>
                    </tr>
                    <!-- <tr>
                        <td colspan="5"><button class="saveBtn">저장</button></td>
                    </tr> -->
                </table>
            	
            </div>
            <br>
            <!-- 근태랑 52시간 근무 적용 여부 끝 -->
            <div>
            	
                <label class="middleName">근태 정책 설정</label>
                <table class="leftTable">
                    <tr class="line">
                        <th>기본 근태</th>
                        <td colspan="15" class="padding">기본 근태</td>
                    </tr>
                    <tr class="line">
                        <th>적용 대상</th>
                        <td colspan="15" class="padding">전사(ALL)</td>
                    </tr>
                    <tr>
                        <th id="rowth" rowspan="${sessionScope.workTimeSet.size() + 3 }">출퇴근 설정</th>
                        <td colspan="15" class="padding">
                        	<input type="radio" id="default" name="workingSetTime" value="기본">
                        	<label class="left" for="default">출근일 및 출퇴근 시간 설정</label>
                        	<input type="radio" name="workingSetTime" id="free" value="자율">
                        	<label class="left" for="free">자율 출퇴근 설정</label></td>
                    </tr>
                    <tr>
                        <td colspan="15" class="padding">
                        	<input type="checkbox" name="dayOfTheWeek" id="mon" value="월">
                        	<label class="left" for="mon">월</label>
                        	<input type="checkbox" name="dayOfTheWeek" id="tue" value="화">
                        	<label class="left" for="tue">화</label>
                        	<input type="checkbox" name="dayOfTheWeek" id="wed" value="수">
                        	<label class="left" for="wed">수</label>
                        	<input type="checkbox" name="dayOfTheWeek" id="thu" value="목">
                        	<label class="left" for="thu">목</label>
                        	<input type="checkbox" name="dayOfTheWeek" id="fri" value="금">
                        	<label class="left" for="fri">금</label>
                        	<input type="checkbox" name="dayOfTheWeek" id="sat" value="토">
                        	<label class="left" for="sat">토</label>
                        	<input type="checkbox" name="dayOfTheWeek" id="sun" value="일">
                        	<label class="left" for="sun">일</label>
                        </td>
                    </tr>
                    <tr id="firstTr">
                        <td colspan="15" class="padding">
                        	<input type="checkbox" name="laborDay" id="laborDay">
                        	<label class="left" for="laborDay">근로자의 날(5/1)</label>
                        	<input type="checkbox" name="holidays" id="holidays">
                        	<label class="left" for="holidays">공휴일</label>
                        	<input type="checkbox" name="alternativeHolidays" id="alternativeHolidays">
                        	<label class="left" for="alternativeHolidays">대체공휴일</label>
                        </td>
                    </tr>
                    
    			<tr id="monTr">
                        <td colspan="15" class="padding">
                        	<span>월 출근</span>
                            <select name="startTime" id="monSelectTime">
                                <option value="01">01</option>
                                <option value="02">02</option>
                                <option value="03">03</option>
                                <option value="04">04</option>
                                <option value="05">05</option>
                                <option value="06">06</option>
                                <option value="07">07</option>
                                <option value="08">08</option>
                                <option value="09">09</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                                <option value="13">13</option>
                                <option value="14">14</option>
                                <option value="15">15</option>
                                <option value="16">16</option>
                                <option value="17">17</option>
                                <option value="18">18</option>
                                <option value="19">19</option>
                                <option value="20">20</option>
                                <option value="21">21</option>
                                <option value="22">22</option>
                                <option value="23">23</option>
                                <option value="24">24</option>
                            </select>
                        	<span class="left">시</span>
                            <select name="startMin" id="monSelectMin">
                            	<option value="00">00</option>
                                <option value="05">05</option>
                                <option value="10">10</option>
                                <option value="15">15</option>
                                <option value="20">20</option>
                                <option value="25">25</option>
                                <option value="30">30</option>
                                <option value="35">35</option>
                                <option value="40">40</option>
                                <option value="45">45</option>
                                <option value="50">50</option>
                                <option value="55">55</option>
                            </select>
                        	<span class="left">분</span>
                        	<span>퇴근</span>
                            <select name="endTime" id="monSelectEndTime">
                                <option value="01">01</option>
                                <option value="02">02</option>
                                <option value="03">03</option>
                                <option value="04">04</option>
                                <option value="05">05</option>
                                <option value="06">06</option>
                                <option value="07">07</option>
                                <option value="08">08</option>
                                <option value="09">09</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                                <option value="13">13</option>
                                <option value="14">14</option>
                                <option value="15">15</option>
                                <option value="16">16</option>
                                <option value="17">17</option>
                                <option value="18">18</option>
                                <option value="19">19</option>
                                <option value="20">20</option>
                                <option value="21">21</option>
                                <option value="22">22</option>
                                <option value="23">23</option>
                                <option value="24">24</option>
                            </select>
                        	<span class="left">시</span>
                            <select name="endMin" id="monSelectEndMin">
                                <option value="00">00</option>
                                <option value="05">05</option>
                                <option value="10">10</option>
                                <option value="15">15</option>
                                <option value="20">20</option>
                                <option value="25">25</option>
                                <option value="30">30</option>
                                <option value="35">35</option>
                                <option value="40">40</option>
                                <option value="45">45</option>
                                <option value="50">50</option>
                                <option value="55">55</option>
                            </select>
                        	<span class="left">분</span>
                        	<span>반차</span>
                            <select name="halfTime" id="monSelectHalfTime">
                                <option value="01">01</option>
                                <option value="02">02</option>
                                <option value="03">03</option>
                                <option value="04">04</option>
                                <option value="05">05</option>
                                <option value="06">06</option>
                                <option value="07">07</option>
                                <option value="08">08</option>
                                <option value="09">09</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                                <option value="13">13</option>
                                <option value="14">14</option>
                                <option value="15">15</option>
                                <option value="16">16</option>
                                <option value="17">17</option>
                                <option value="18">18</option>
                                <option value="19">19</option>
                                <option value="20">20</option>
                                <option value="21">21</option>
                                <option value="22">22</option>
                                <option value="23">23</option>
                                <option value="24">24</option>
                            </select>
                        	<span class="left">시</span>
                            <select name="halfMin" id="monSelectHalfMin">
                                <option value="00">00</option>
                                <option value="05">05</option>
                                <option value="10">10</option>
                                <option value="15">15</option>
                                <option value="20">20</option>
                                <option value="25">25</option>
                                <option value="30">30</option>
                                <option value="35">35</option>
                                <option value="40">40</option>
                                <option value="45">45</option>
                                <option value="50">50</option>
                                <option value="55">55</option>
                            </select>
                        	<span class="left">분</span></td>
                    </tr>
    			<tr id="tueTr"><td colspan="15" class="padding">
                        	<span>화 출근</span>
                            <select name="startTime" id="tueSelectTime">
                                <option value="01">01</option>
                                <option value="02">02</option>
                                <option value="03">03</option>
                                <option value="04">04</option>
                                <option value="05">05</option>
                                <option value="06">06</option>
                                <option value="07">07</option>
                                <option value="08">08</option>
                                <option value="09">09</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                                <option value="13">13</option>
                                <option value="14">14</option>
                                <option value="15">15</option>
                                <option value="16">16</option>
                                <option value="17">17</option>
                                <option value="18">18</option>
                                <option value="19">19</option>
                                <option value="20">20</option>
                                <option value="21">21</option>
                                <option value="22">22</option>
                                <option value="23">23</option>
                                <option value="24">24</option>
                            </select>
                        	<span class="left">시</span>
                            <select name="startMin" id="tueSelectMin">
                            	<option value="00">00</option>
                                <option value="05">05</option>
                                <option value="10">10</option>
                                <option value="15">15</option>
                                <option value="20">20</option>
                                <option value="25">25</option>
                                <option value="30">30</option>
                                <option value="35">35</option>
                                <option value="40">40</option>
                                <option value="45">45</option>
                                <option value="50">50</option>
                                <option value="55">55</option>
                            </select>
                        	<span class="left">분</span>
                        	<span>퇴근</span>
                            <select name="endTime" id="tueSelectEndTime">
                                <option value="01">01</option>
                                <option value="02">02</option>
                                <option value="03">03</option>
                                <option value="04">04</option>
                                <option value="05">05</option>
                                <option value="06">06</option>
                                <option value="07">07</option>
                                <option value="08">08</option>
                                <option value="09">09</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                                <option value="13">13</option>
                                <option value="14">14</option>
                                <option value="15">15</option>
                                <option value="16">16</option>
                                <option value="17">17</option>
                                <option value="18">18</option>
                                <option value="19">19</option>
                                <option value="20">20</option>
                                <option value="21">21</option>
                                <option value="22">22</option>
                                <option value="23">23</option>
                                <option value="24">24</option>
                            </select>
                        	<span class="left">시</span>
                            <select name="endMin" id="tueSelectEndMin">
                                <option value="00">00</option>
                                <option value="05">05</option>
                                <option value="10">10</option>
                                <option value="15">15</option>
                                <option value="20">20</option>
                                <option value="25">25</option>
                                <option value="30">30</option>
                                <option value="35">35</option>
                                <option value="40">40</option>
                                <option value="45">45</option>
                                <option value="50">50</option>
                                <option value="55">55</option>
                            </select>
                        	<span class="left">분</span>
                        	<span>반차</span>
                            <select name="halfTime" id="tueSelectHalfTime">
                                <option value="01">01</option>
                                <option value="02">02</option>
                                <option value="03">03</option>
                                <option value="04">04</option>
                                <option value="05">05</option>
                                <option value="06">06</option>
                                <option value="07">07</option>
                                <option value="08">08</option>
                                <option value="09">09</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                                <option value="13">13</option>
                                <option value="14">14</option>
                                <option value="15">15</option>
                                <option value="16">16</option>
                                <option value="17">17</option>
                                <option value="18">18</option>
                                <option value="19">19</option>
                                <option value="20">20</option>
                                <option value="21">21</option>
                                <option value="22">22</option>
                                <option value="23">23</option>
                                <option value="24">24</option>
                            </select>
                        	<span class="left">시</span>
                            <select name="halfMin" id="tueSelectHalfMin">
                                <option value="00">00</option>
                                <option value="05">05</option>
                                <option value="10">10</option>
                                <option value="15">15</option>
                                <option value="20">20</option>
                                <option value="25">25</option>
                                <option value="30">30</option>
                                <option value="35">35</option>
                                <option value="40">40</option>
                                <option value="45">45</option>
                                <option value="50">50</option>
                                <option value="55">55</option>
                            </select>
                        	<span class="left">분</span></td></tr>
                        	<tr id="wedTr"><td colspan="15" class="padding">
                        	<span>수 출근</span>
                            <select name="startTime" id="wedSelectTime">
                                <option value="01">01</option>
                                <option value="02">02</option>
                                <option value="03">03</option>
                                <option value="04">04</option>
                                <option value="05">05</option>
                                <option value="06">06</option>
                                <option value="07">07</option>
                                <option value="08">08</option>
                                <option value="09">09</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                                <option value="13">13</option>
                                <option value="14">14</option>
                                <option value="15">15</option>
                                <option value="16">16</option>
                                <option value="17">17</option>
                                <option value="18">18</option>
                                <option value="19">19</option>
                                <option value="20">20</option>
                                <option value="21">21</option>
                                <option value="22">22</option>
                                <option value="23">23</option>
                                <option value="24">24</option>
                            </select>
                        	<span class="left">시</span>
                            <select name="startMin" id="wedSelectMin">
                            	<option value="00">00</option>
                                <option value="05">05</option>
                                <option value="10">10</option>
                                <option value="15">15</option>
                                <option value="20">20</option>
                                <option value="25">25</option>
                                <option value="30">30</option>
                                <option value="35">35</option>
                                <option value="40">40</option>
                                <option value="45">45</option>
                                <option value="50">50</option>
                                <option value="55">55</option>
                            </select>
                        	<span class="left">분</span>
                        	<span>퇴근</span>
                            <select name="endTime" id="wedSelectEndTime">
                                <option value="01">01</option>
                                <option value="02">02</option>
                                <option value="03">03</option>
                                <option value="04">04</option>
                                <option value="05">05</option>
                                <option value="06">06</option>
                                <option value="07">07</option>
                                <option value="08">08</option>
                                <option value="09">09</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                                <option value="13">13</option>
                                <option value="14">14</option>
                                <option value="15">15</option>
                                <option value="16">16</option>
                                <option value="17">17</option>
                                <option value="18">18</option>
                                <option value="19">19</option>
                                <option value="20">20</option>
                                <option value="21">21</option>
                                <option value="22">22</option>
                                <option value="23">23</option>
                                <option value="24">24</option>
                            </select>
                        	<span class="left">시</span>
                            <select name="endMin" id="wedSelectEndMin">
                                <option value="00">00</option>
                                <option value="05">05</option>
                                <option value="10">10</option>
                                <option value="15">15</option>
                                <option value="20">20</option>
                                <option value="25">25</option>
                                <option value="30">30</option>
                                <option value="35">35</option>
                                <option value="40">40</option>
                                <option value="45">45</option>
                                <option value="50">50</option>
                                <option value="55">55</option>
                            </select>
                        	<span class="left">분</span>
                        	<span>반차</span>
                            <select name="halfTime" id="wedSelectHalfTime">
                                <option value="01">01</option>
                                <option value="02">02</option>
                                <option value="03">03</option>
                                <option value="04">04</option>
                                <option value="05">05</option>
                                <option value="06">06</option>
                                <option value="07">07</option>
                                <option value="08">08</option>
                                <option value="09">09</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                                <option value="13">13</option>
                                <option value="14">14</option>
                                <option value="15">15</option>
                                <option value="16">16</option>
                                <option value="17">17</option>
                                <option value="18">18</option>
                                <option value="19">19</option>
                                <option value="20">20</option>
                                <option value="21">21</option>
                                <option value="22">22</option>
                                <option value="23">23</option>
                                <option value="24">24</option>
                            </select>
                        	<span class="left">시</span>
                            <select name="halfMin" id="wedSelectHalfMin">
                                <option value="00">00</option>
                                <option value="05">05</option>
                                <option value="10">10</option>
                                <option value="15">15</option>
                                <option value="20">20</option>
                                <option value="25">25</option>
                                <option value="30">30</option>
                                <option value="35">35</option>
                                <option value="40">40</option>
                                <option value="45">45</option>
                                <option value="50">50</option>
                                <option value="55">55</option>
                            </select>
                        	<span class="left">분</span></td></tr>
                        	
                        	<tr id="thuTr"><td colspan="15" class="padding">
                        	<span>목 출근</span>
                            <select name="startTime" id="thuSelectTime">
                                <option value="01">01</option>
                                <option value="02">02</option>
                                <option value="03">03</option>
                                <option value="04">04</option>
                                <option value="05">05</option>
                                <option value="06">06</option>
                                <option value="07">07</option>
                                <option value="08">08</option>
                                <option value="09">09</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                                <option value="13">13</option>
                                <option value="14">14</option>
                                <option value="15">15</option>
                                <option value="16">16</option>
                                <option value="17">17</option>
                                <option value="18">18</option>
                                <option value="19">19</option>
                                <option value="20">20</option>
                                <option value="21">21</option>
                                <option value="22">22</option>
                                <option value="23">23</option>
                                <option value="24">24</option>
                            </select>
                        	<span class="left">시</span>
                            <select name="startMin" id="thuSelectMin">
                            	<option value="00">00</option>
                                <option value="05">05</option>
                                <option value="10">10</option>
                                <option value="15">15</option>
                                <option value="20">20</option>
                                <option value="25">25</option>
                                <option value="30">30</option>
                                <option value="35">35</option>
                                <option value="40">40</option>
                                <option value="45">45</option>
                                <option value="50">50</option>
                                <option value="55">55</option>
                            </select>
                        	<span class="left">분</span>
                        	<span>퇴근</span>
                            <select name="endTime" id="thuSelectEndTime">
                                <option value="01">01</option>
                                <option value="02">02</option>
                                <option value="03">03</option>
                                <option value="04">04</option>
                                <option value="05">05</option>
                                <option value="06">06</option>
                                <option value="07">07</option>
                                <option value="08">08</option>
                                <option value="09">09</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                                <option value="13">13</option>
                                <option value="14">14</option>
                                <option value="15">15</option>
                                <option value="16">16</option>
                                <option value="17">17</option>
                                <option value="18">18</option>
                                <option value="19">19</option>
                                <option value="20">20</option>
                                <option value="21">21</option>
                                <option value="22">22</option>
                                <option value="23">23</option>
                                <option value="24">24</option>
                            </select>
                        	<span class="left">시</span>
                            <select name="endMin" id="thuSelectEndMin">
                                <option value="00">00</option>
                                <option value="05">05</option>
                                <option value="10">10</option>
                                <option value="15">15</option>
                                <option value="20">20</option>
                                <option value="25">25</option>
                                <option value="30">30</option>
                                <option value="35">35</option>
                                <option value="40">40</option>
                                <option value="45">45</option>
                                <option value="50">50</option>
                                <option value="55">55</option>
                            </select>
                        	<span class="left">분</span>
                        	<span>반차</span>
                            <select name="halfTime" id="thuSelectHalfTime">
                                <option value="01">01</option>
                                <option value="02">02</option>
                                <option value="03">03</option>
                                <option value="04">04</option>
                                <option value="05">05</option>
                                <option value="06">06</option>
                                <option value="07">07</option>
                                <option value="08">08</option>
                                <option value="09">09</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                                <option value="13">13</option>
                                <option value="14">14</option>
                                <option value="15">15</option>
                                <option value="16">16</option>
                                <option value="17">17</option>
                                <option value="18">18</option>
                                <option value="19">19</option>
                                <option value="20">20</option>
                                <option value="21">21</option>
                                <option value="22">22</option>
                                <option value="23">23</option>
                                <option value="24">24</option>
                            </select>
                        	<span class="left">시</span>
                            <select name="halfMin" id="thuSelectHalfMin">
                                <option value="00">00</option>
                                <option value="05">05</option>
                                <option value="10">10</option>
                                <option value="15">15</option>
                                <option value="20">20</option>
                                <option value="25">25</option>
                                <option value="30">30</option>
                                <option value="35">35</option>
                                <option value="40">40</option>
                                <option value="45">45</option>
                                <option value="50">50</option>
                                <option value="55">55</option>
                            </select>
                        	<span class="left">분</span></td></tr>
                        	<tr id="friTr"><td colspan="15" class="padding">
                        	<span>금 출근</span>
                            <select name="startTime" id="friSelectTime">
                                <option value="01">01</option>
                                <option value="02">02</option>
                                <option value="03">03</option>
                                <option value="04">04</option>
                                <option value="05">05</option>
                                <option value="06">06</option>
                                <option value="07">07</option>
                                <option value="08">08</option>
                                <option value="09">09</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                                <option value="13">13</option>
                                <option value="14">14</option>
                                <option value="15">15</option>
                                <option value="16">16</option>
                                <option value="17">17</option>
                                <option value="18">18</option>
                                <option value="19">19</option>
                                <option value="20">20</option>
                                <option value="21">21</option>
                                <option value="22">22</option>
                                <option value="23">23</option>
                                <option value="24">24</option>
                            </select>
                        	<span class="left">시</span>
                            <select name="startMin" id="friSelectMin">
                            	<option value="00">00</option>
                                <option value="05">05</option>
                                <option value="10">10</option>
                                <option value="15">15</option>
                                <option value="20">20</option>
                                <option value="25">25</option>
                                <option value="30">30</option>
                                <option value="35">35</option>
                                <option value="40">40</option>
                                <option value="45">45</option>
                                <option value="50">50</option>
                                <option value="55">55</option>
                            </select>
                        	<span class="left">분</span>
                        	<span>퇴근</span>
                            <select name="endTime" id="friSelectEndTime">
                                <option value="01">01</option>
                                <option value="02">02</option>
                                <option value="03">03</option>
                                <option value="04">04</option>
                                <option value="05">05</option>
                                <option value="06">06</option>
                                <option value="07">07</option>
                                <option value="08">08</option>
                                <option value="09">09</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                                <option value="13">13</option>
                                <option value="14">14</option>
                                <option value="15">15</option>
                                <option value="16">16</option>
                                <option value="17">17</option>
                                <option value="18">18</option>
                                <option value="19">19</option>
                                <option value="20">20</option>
                                <option value="21">21</option>
                                <option value="22">22</option>
                                <option value="23">23</option>
                                <option value="24">24</option>
                            </select>
                        	<span class="left">시</span>
                            <select name="endMin" id="friSelectEndMin">
                                <option value="00">00</option>
                                <option value="05">05</option>
                                <option value="10">10</option>
                                <option value="15">15</option>
                                <option value="20">20</option>
                                <option value="25">25</option>
                                <option value="30">30</option>
                                <option value="35">35</option>
                                <option value="40">40</option>
                                <option value="45">45</option>
                                <option value="50">50</option>
                                <option value="55">55</option>
                            </select>
                        	<span class="left">분</span>
                        	<span>반차</span>
                            <select name="halfTime" id="friSelectHalfTime">
                                <option value="01">01</option>
                                <option value="02">02</option>
                                <option value="03">03</option>
                                <option value="04">04</option>
                                <option value="05">05</option>
                                <option value="06">06</option>
                                <option value="07">07</option>
                                <option value="08">08</option>
                                <option value="09">09</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                                <option value="13">13</option>
                                <option value="14">14</option>
                                <option value="15">15</option>
                                <option value="16">16</option>
                                <option value="17">17</option>
                                <option value="18">18</option>
                                <option value="19">19</option>
                                <option value="20">20</option>
                                <option value="21">21</option>
                                <option value="22">22</option>
                                <option value="23">23</option>
                                <option value="24">24</option>
                            </select>
                        	<span class="left">시</span>
                            <select name="halfMin" id="friSelectHalfMin">
                                <option value="00">00</option>
                                <option value="05">05</option>
                                <option value="10">10</option>
                                <option value="15">15</option>
                                <option value="20">20</option>
                                <option value="25">25</option>
                                <option value="30">30</option>
                                <option value="35">35</option>
                                <option value="40">40</option>
                                <option value="45">45</option>
                                <option value="50">50</option>
                                <option value="55">55</option>
                            </select>
                        	<span class="left">분</span></td></tr>
                        	<tr id="satTr"><td colspan="15" class="padding">
                        	<span>토 출근</span>
                            <select name="startTime" id="satSelectTime">
                                <option value="01">01</option>
                                <option value="02">02</option>
                                <option value="03">03</option>
                                <option value="04">04</option>
                                <option value="05">05</option>
                                <option value="06">06</option>
                                <option value="07">07</option>
                                <option value="08">08</option>
                                <option value="09">09</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                                <option value="13">13</option>
                                <option value="14">14</option>
                                <option value="15">15</option>
                                <option value="16">16</option>
                                <option value="17">17</option>
                                <option value="18">18</option>
                                <option value="19">19</option>
                                <option value="20">20</option>
                                <option value="21">21</option>
                                <option value="22">22</option>
                                <option value="23">23</option>
                                <option value="24">24</option>
                            </select>
                        	<span class="left">시</span>
                            <select name="startMin" id="satSelectMin">
                            	<option value="00">00</option>
                                <option value="05">05</option>
                                <option value="10">10</option>
                                <option value="15">15</option>
                                <option value="20">20</option>
                                <option value="25">25</option>
                                <option value="30">30</option>
                                <option value="35">35</option>
                                <option value="40">40</option>
                                <option value="45">45</option>
                                <option value="50">50</option>
                                <option value="55">55</option>
                            </select>
                        	<span class="left">분</span>
                        	<span>퇴근</span>
                            <select name="endTime" id="satSelectEndTime">
                                <option value="01">01</option>
                                <option value="02">02</option>
                                <option value="03">03</option>
                                <option value="04">04</option>
                                <option value="05">05</option>
                                <option value="06">06</option>
                                <option value="07">07</option>
                                <option value="08">08</option>
                                <option value="09">09</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                                <option value="13">13</option>
                                <option value="14">14</option>
                                <option value="15">15</option>
                                <option value="16">16</option>
                                <option value="17">17</option>
                                <option value="18">18</option>
                                <option value="19">19</option>
                                <option value="20">20</option>
                                <option value="21">21</option>
                                <option value="22">22</option>
                                <option value="23">23</option>
                                <option value="24">24</option>
                            </select>
                        	<span class="left">시</span>
                            <select name="endMin" id="satSelectEndMin">
                                <option value="00">00</option>
                                <option value="05">05</option>
                                <option value="10">10</option>
                                <option value="15">15</option>
                                <option value="20">20</option>
                                <option value="25">25</option>
                                <option value="30">30</option>
                                <option value="35">35</option>
                                <option value="40">40</option>
                                <option value="45">45</option>
                                <option value="50">50</option>
                                <option value="55">55</option>
                            </select>
                        	<span class="left">분</span>
                        	<span>반차</span>
                            <select name="halfTime" id="satSelectHalfTime">
                                <option value="01">01</option>
                                <option value="02">02</option>
                                <option value="03">03</option>
                                <option value="04">04</option>
                                <option value="05">05</option>
                                <option value="06">06</option>
                                <option value="07">07</option>
                                <option value="08">08</option>
                                <option value="09">09</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                                <option value="13">13</option>
                                <option value="14">14</option>
                                <option value="15">15</option>
                                <option value="16">16</option>
                                <option value="17">17</option>
                                <option value="18">18</option>
                                <option value="19">19</option>
                                <option value="20">20</option>
                                <option value="21">21</option>
                                <option value="22">22</option>
                                <option value="23">23</option>
                                <option value="24">24</option>
                            </select>
                        	<span class="left">시</span>
                            <select name="halfMin" id="satSelectEndMin">
                                <option value="00">00</option>
                                <option value="05">05</option>
                                <option value="10">10</option>
                                <option value="15">15</option>
                                <option value="20">20</option>
                                <option value="25">25</option>
                                <option value="30">30</option>
                                <option value="35">35</option>
                                <option value="40">40</option>
                                <option value="45">45</option>
                                <option value="50">50</option>
                                <option value="55">55</option>
                            </select>
                        	<span class="left">분</span></td></tr>
                        	<tr id="sunTr"><td colspan="15" class="padding">
                        	<span>일 출근</span>
                            <select name="startTime" id="sunSelectTime">
                                <option value="01">01</option>
                                <option value="02">02</option>
                                <option value="03">03</option>
                                <option value="04">04</option>
                                <option value="05">05</option>
                                <option value="06">06</option>
                                <option value="07">07</option>
                                <option value="08">08</option>
                                <option value="09">09</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                                <option value="13">13</option>
                                <option value="14">14</option>
                                <option value="15">15</option>
                                <option value="16">16</option>
                                <option value="17">17</option>
                                <option value="18">18</option>
                                <option value="19">19</option>
                                <option value="20">20</option>
                                <option value="21">21</option>
                                <option value="22">22</option>
                                <option value="23">23</option>
                                <option value="24">24</option>
                            </select>
                        	<span class="left">시</span>
                            <select name="startMin" id="sunSelectMin">
                            	<option value="00">00</option>
                                <option value="05">05</option>
                                <option value="10">10</option>
                                <option value="15">15</option>
                                <option value="20">20</option>
                                <option value="25">25</option>
                                <option value="30">30</option>
                                <option value="35">35</option>
                                <option value="40">40</option>
                                <option value="45">45</option>
                                <option value="50">50</option>
                                <option value="55">55</option>
                            </select>
                        	<span class="left">분</span>
                        	<span>퇴근</span>
                            <select name="endTime" id="sunSelectEndTime">
                                <option value="01">01</option>
                                <option value="02">02</option>
                                <option value="03">03</option>
                                <option value="04">04</option>
                                <option value="05">05</option>
                                <option value="06">06</option>
                                <option value="07">07</option>
                                <option value="08">08</option>
                                <option value="09">09</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                                <option value="13">13</option>
                                <option value="14">14</option>
                                <option value="15">15</option>
                                <option value="16">16</option>
                                <option value="17">17</option>
                                <option value="18">18</option>
                                <option value="19">19</option>
                                <option value="20">20</option>
                                <option value="21">21</option>
                                <option value="22">22</option>
                                <option value="23">23</option>
                                <option value="24">24</option>
                            </select>
                        	<span class="left">시</span>
                            <select name="endMin" id="sunSelectEndMin">
                                <option value="00">00</option>
                                <option value="05">05</option>
                                <option value="10">10</option>
                                <option value="15">15</option>
                                <option value="20">20</option>
                                <option value="25">25</option>
                                <option value="30">30</option>
                                <option value="35">35</option>
                                <option value="40">40</option>
                                <option value="45">45</option>
                                <option value="50">50</option>
                                <option value="55">55</option>
                            </select>
                        	<span class="left">분</span>
                        	<span>반차</span>
                            <select name="halfTime" id="sunSelectHalfTime">
                                <option value="01">01</option>
                                <option value="02">02</option>
                                <option value="03">03</option>
                                <option value="04">04</option>
                                <option value="05">05</option>
                                <option value="06">06</option>
                                <option value="07">07</option>
                                <option value="08">08</option>
                                <option value="09">09</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                                <option value="13">13</option>
                                <option value="14">14</option>
                                <option value="15">15</option>
                                <option value="16">16</option>
                                <option value="17">17</option>
                                <option value="18">18</option>
                                <option value="19">19</option>
                                <option value="20">20</option>
                                <option value="21">21</option>
                                <option value="22">22</option>
                                <option value="23">23</option>
                                <option value="24">24</option>
                            </select>
                        	<span class="left">시</span>
                            <select name="halfMin" id="sunSelectHalfMin">
                                <option value="00">00</option>
                                <option value="05">05</option>
                                <option value="10">10</option>
                                <option value="15">15</option>
                                <option value="20">20</option>
                                <option value="25">25</option>
                                <option value="30">30</option>
                                <option value="35">35</option>
                                <option value="40">40</option>
                                <option value="45">45</option>
                                <option value="50">50</option>
                                <option value="55">55</option>
                            </select>
                        	<span class="left">분</span></td></tr>
                        	
                    <c:forEach var="i" begin="0" end="${sessionScope.workTimeSet.size() -1 }">
                    <input type="hidden" name="workingSetNo" value="${sessionScope.workTimeSet.get(i).workingSetNo }">
    	<c:choose>
    		<c:when test="${sessionScope.workTimeSet.get(i).dayOfTheWeek eq '월'}">
    			<script type="text/javascript">
    				var num = 0;
    			$(document).ready(function() {
    				$("#mon").attr("checked", true);
    				
    				var startTime = "${sessionScope.workTimeSet.get(i).workingTime}";
    				var start = startTime.split(":");
    				var endTime = "${sessionScope.workTimeSet.get(i).quittingTime}";
    				var end = endTime.split(":");
    				var halfTime = "${sessionScope.workTimeSet.get(i).harfOff}";
    				var half = halfTime.split(":");

    				$('#monSelectTime option[value='+start[0]+']').attr('selected','ture');
    				$('#monSelectMin option[value='+start[1]+']').attr('selected','ture');
    				$('#monSelectEndTime option[value='+end[0]+']').attr('selected','ture');
    				$('#monSelectEndMin option[value='+end[1]+']').attr('selected','ture');
    				$('#monSelectHalfTime option[value='+half[0]+']').attr('selected','ture');
    				$('#monSelectHalfMin option[value='+half[1]+']').attr('selected','ture');
    				
    				
    				var updateStartTime = $("#monSelectTime option:selected").val();
    				var updateStartMin = $("#monSelectMin option:selected").val();
    				var updateEndTime = $("#monSelectEndTime option:selected").val();
    				var updateEndMin = $("#monSelectEndMin option:selected").val();
    				var updateHalfTime = $("#monSelectHalfTime option:selected").val();
    				var updateHalfMin = $("#monSelectHalfMin option:selected").val();
    				
    				var workingTime = updateStartTime+":"+updateStartMin+":00";
                	$("#monTr").after('<input id="workingTime${i}" type="hidden" name="workingTime" value="'+workingTime+'">');    						
    				$("select[id^='monSelect'], input:checkbox[id=mon]").change(function() {
						
    				if($("input:checkbox[id=mon]").is(":checked")){
    					updateStartTime = $("#monSelectTime option:selected").val();
    					updateStartMin = $("#monSelectMin option:selected").val();
    					updateEndTime = $("#monSelectEndTime option:selected").val();
    					updateEndMin = $("#monSelectEndMin option:selected").val();
    					updateHalfTime = $("#monSelectHalfTime option:selected").val();
    					updateHalfMin = $("#monSelectHalfMin option:selected").val();
    					workingTime = updateStartTime+":"+updateStartMin+":00";
    					if(num == 1){
    						$("#monTr").after('<input id="workingTime${i}" type="hidden" name="workingTime" value="'+workingTime+'">');
    						num = 0;
    					} else{
    						$("#workingTime${i}").val(workingTime);
    					}
    				}else{
    					$("#workingTime${i}").detach();
    					num = 1;
    				}
    				});

    				$("input:checkbox[id=mon]").change(function() {
                    	
                		if($("input:checkbox[id=mon]").is(":checked") == false){
                    		$("#monTr").after('<input id="delNo${i}" type="hidden" name="deleteWorkTimeSetNo" value="${sessionScope.workTimeSet.get(i).workingSetNo}">');
                    		$("#workingTime${i}").detach();
                		}
                		if($("input:checkbox[id=mon]").is(":checked")){
                			$("#delNo${i}").detach();
                		}
    				});
    				
    				
    				
    				
    			});
    			</script>
    		</c:when>
    		<c:when test="${sessionScope.workTimeSet.get(i).dayOfTheWeek eq '화'}">
    			<script type="text/javascript">
    			var num = 0;
    			$(document).ready(function() {
    				$("#tue").attr("checked", true);
    				var startTime = "${sessionScope.workTimeSet.get(i).workingTime}";
    				var start = startTime.split(":");
    				var endTime = "${sessionScope.workTimeSet.get(i).quittingTime}";
    				var end = endTime.split(":");
    				var halfTime = "${sessionScope.workTimeSet.get(i).harfOff}";
    				var half = halfTime.split(":");

    				$('#tueSelectTime option[value='+start[0]+']').attr('selected','ture');
    				$('#tueSelectMin option[value='+start[1]+']').attr('selected','ture');
    				$('#tueSelectEndTime option[value='+end[0]+']').attr('selected','ture');
    				$('#tueSelectEndMin option[value='+end[1]+']').attr('selected','ture');
    				$('#tueSelectHalfTime option[value='+half[0]+']').attr('selected','ture');
    				$('#tueSelectHalfMin option[value='+half[1]+']').attr('selected','ture');
    				
    				var updateStartTime = $("#tueSelectTime option:selected").val();
    				var updateStartMin = $("#tueSelectMin option:selected").val();
    				var updateEndTime = $("#tueSelectEndTime option:selected").val();
    				var updateEndMin = $("#tueSelectEndMin option:selected").val();
    				var updateHalfTime = $("#tueSelectHalfTime option:selected").val();
    				var updateHalfMin = $("#tueSelectHalfMin option:selected").val();
    				
    				var workingTime = updateStartTime+":"+updateStartMin+":00";
                	$("#tueTr").after('<input id="workingTime${i}" type="hidden" name="workingTime" value="'+workingTime+'">');    						
    				$("select[id^='tueSelect'], input:checkbox[id=tue]").change(function() {
						
    				if($("input:checkbox[id=tue]").is(":checked")){
    					updateStartTime = $("#tueSelectTime option:selected").val();
    					updateStartMin = $("#tueSelectMin option:selected").val();
    					updateEndTime = $("#tueSelectEndTime option:selected").val();
    					updateEndMin = $("#tueSelectEndMin option:selected").val();
    					updateHalfTime = $("#tueSelectHalfTime option:selected").val();
    					updateHalfMin = $("#tueSelectHalfMin option:selected").val();
    					workingTime = updateStartTime+":"+updateStartMin+":00";
    					if(num == 1){
    						$("#tueTr").after('<input id="workingTime${i}" type="hidden" name="workingTime" value="'+workingTime+'">');
    						num = 0;
    					} else{
    						$("#workingTime${i}").val(workingTime);
    					}
    				}else{
    					$("#workingTime${i}").detach();
    					num = 1;
    				}
    				
    			});
    			$("input:checkbox[id=tue]").change(function() {
            		if($("input:checkbox[id=tue]").is(":checked") == false){
                		$("#tueTr").after('<input id="delNo${i}" type="hidden" name="deleteWorkTimeSetNo" value="${sessionScope.workTimeSet.get(i).workingSetNo}">');
    				}
            		if($("input:checkbox[id=tue]").is(":checked")){
            			$("#delNo${i}").detach();
            		}
				});
    			});
    			</script>
    		</c:when>
    		<c:when test="${sessionScope.workTimeSet.get(i).dayOfTheWeek eq '수'}">
    		
    			<script type="text/javascript">
    			var num = 0;
    			$(document).ready(function() {
    				$("#wed").attr("checked", true);
    				var startTime = "${sessionScope.workTimeSet.get(i).workingTime}";
    				var start = startTime.split(":");
    				var endTime = "${sessionScope.workTimeSet.get(i).quittingTime}";
    				var end = endTime.split(":");
    				var halfTime = "${sessionScope.workTimeSet.get(i).harfOff}";
    				var half = halfTime.split(":");

    				$('#wedSelectTime option[value='+start[0]+']').attr('selected','ture');
    				$('#wedSelectMin option[value='+start[1]+']').attr('selected','ture');
    				$('#wedSelectEndTime option[value='+end[0]+']').attr('selected','ture');
    				$('#wedSelectEndMin option[value='+end[1]+']').attr('selected','ture');
    				$('#wedSelectHalfTime option[value='+half[0]+']').attr('selected','ture');
    				$('#wedSelectHalfMin option[value='+half[1]+']').attr('selected','ture');
    				
    				var updateStartTime = $("#wedSelectTime option:selected").val();
    				var updateStartMin = $("#wedSelectMin option:selected").val();
    				var updateEndTime = $("#wedSelectEndTime option:selected").val();
    				var updateEndMin = $("#wedSelectEndMin option:selected").val();
    				var updateHalfTime = $("#wedSelectHalfTime option:selected").val();
    				var updateHalfMin = $("#wedSelectHalfMin option:selected").val();
    				
    				var workingTime = updateStartTime+":"+updateStartMin+":00";
                	$("#wedTr").after('<input id="workingTime${i}" type="hidden" name="workingTime" value="'+workingTime+'">');    						
    				$("select[id^='wedSelect'], input:checkbox[id=wed]").change(function() {
						
    				if($("input:checkbox[id=wed]").is(":checked")){
    					updateStartTime = $("#wedSelectTime option:selected").val();
    					updateStartMin = $("#wedSelectMin option:selected").val();
    					updateEndTime = $("#wedSelectEndTime option:selected").val();
    					updateEndMin = $("#wedSelectEndMin option:selected").val();
    					updateHalfTime = $("#wedSelectHalfTime option:selected").val();
    					updateHalfMin = $("#wedSelectHalfMin option:selected").val();
    					workingTime = updateStartTime+":"+updateStartMin+":00";
    					if(num == 1){
    						$("#wedTr").after('<input id="workingTime${i}" type="hidden" name="workingTime" value="'+workingTime+'">');
    						num = 0;
    					} else{
    						$("#workingTime${i}").val(workingTime);
    					}
    				}else{
    					$("#workingTime${i}").detach();
    					num = 1;
    				}
    				
    			});
    			$("input:checkbox[id=wed]").change(function() {
            		if($("input:checkbox[id=wed]").is(":checked") == false){
                		$("#wedTr").after('<input id="delNo${i}" type="hidden" name="deleteWorkTimeSetNo" value="${sessionScope.workTimeSet.get(i).workingSetNo}">');
    				}
            		if($("input:checkbox[id=wed]").is(":checked")){
            			$("#delNo${i}").detach();
            		}
				});
    			});
    			</script>
    		</c:when>
    		<c:when test="${sessionScope.workTimeSet.get(i).dayOfTheWeek eq '목'}">
    		
    			<script type="text/javascript">
    			var num = 0;
    			$(document).ready(function() {
    				$("#thu").attr("checked", true);
    				var startTime = "${sessionScope.workTimeSet.get(i).workingTime}";
    				var start = startTime.split(":");
    				var endTime = "${sessionScope.workTimeSet.get(i).quittingTime}";
    				var end = endTime.split(":");
    				var halfTime = "${sessionScope.workTimeSet.get(i).harfOff}";
    				var half = halfTime.split(":");

    				$('#thuSelectTime option[value='+start[0]+']').attr('selected','ture');
    				$('#thuSelectMin option[value='+start[1]+']').attr('selected','ture');
    				$('#thuSelectEndTime option[value='+end[0]+']').attr('selected','ture');
    				$('#thuSelectEndMin option[value='+end[1]+']').attr('selected','ture');
    				$('#thuSelectHalfTime option[value='+half[0]+']').attr('selected','ture');
    				$('#thuSelectHalfMin option[value='+half[1]+']').attr('selected','ture');
    				
    				var updateStartTime = $("#thuSelectTime option:selected").val();
    				var updateStartMin = $("#thuSelectMin option:selected").val();
    				var updateEndTime = $("#thuSelectEndTime option:selected").val();
    				var updateEndMin = $("#thuSelectEndMin option:selected").val();
    				var updateHalfTime = $("#thuSelectHalfTime option:selected").val();
    				var updateHalfMin = $("#thuSelectHalfMin option:selected").val();
    				
    				var workingTime = updateStartTime+":"+updateStartMin+":00";
                	$("#thuTr").after('<input id="workingTime${i}" type="hidden" name="workingTime" value="'+workingTime+'">');    						
    				$("select[id^='thuSelect'], input:checkbox[id=thu]").change(function() {
						
    				if($("input:checkbox[id=thu]").is(":checked")){
    					updateStartTime = $("#thuSelectTime option:selected").val();
    					updateStartMin = $("#thuSelectMin option:selected").val();
    					updateEndTime = $("#thuSelectEndTime option:selected").val();
    					updateEndMin = $("#thuSelectEndMin option:selected").val();
    					updateHalfTime = $("#thuSelectHalfTime option:selected").val();
    					updateHalfMin = $("#thuSelectHalfMin option:selected").val();
    					workingTime = updateStartTime+":"+updateStartMin+":00";
    					if(num == 1){
    						$("#thuTr").after('<input id="workingTime${i}" type="hidden" name="workingTime" value="'+workingTime+'">');
    						num = 0;
    					} else{
    						$("#workingTime${i}").val(workingTime);
    					}
    				}else{
    					$("#workingTime${i}").detach();
    					num = 1;
    				}
    				
    			});
    			$("input:checkbox[id=thu]").change(function() {
            		if($("input:checkbox[id=thu]").is(":checked") == false){
                		$("#thuTr").after('<input id="delNo${i}" type="hidden" name="deleteWorkTimeSetNo" value="${sessionScope.workTimeSet.get(i).workingSetNo}">');
    				}
            		if($("input:checkbox[id=thu]").is(":checked")){
            			$("#delNo${i}").detach();
            		}
				});
    			});
    			</script>
    		</c:when>
    		<c:when test="${sessionScope.workTimeSet.get(i).dayOfTheWeek eq '금'}">
    		
    			<script type="text/javascript">
    			var num = 0;
    			$(document).ready(function() {
    				$("#fri").attr("checked", true);
    				var startTime = "${sessionScope.workTimeSet.get(i).workingTime}";
    				var start = startTime.split(":");
    				var endTime = "${sessionScope.workTimeSet.get(i).quittingTime}";
    				var end = endTime.split(":");
    				var halfTime = "${sessionScope.workTimeSet.get(i).harfOff}";
    				var half = halfTime.split(":");

    				$('#friSelectTime option[value='+start[0]+']').attr('selected','ture');
    				$('#friSelectMin option[value='+start[1]+']').attr('selected','ture');
    				$('#friSelectEndTime option[value='+end[0]+']').attr('selected','ture');
    				$('#friSelectEndMin option[value='+end[1]+']').attr('selected','ture');
    				$('#friSelectHalfTime option[value='+half[0]+']').attr('selected','ture');
    				$('#friSelectHalfMin option[value='+half[1]+']').attr('selected','ture');
    				
    				var updateStartTime = $("#friSelectTime option:selected").val();
    				var updateStartMin = $("#friSelectMin option:selected").val();
    				var updateEndTime = $("#friSelectEndTime option:selected").val();
    				var updateEndMin = $("#friSelectEndMin option:selected").val();
    				var updateHalfTime = $("#friSelectHalfTime option:selected").val();
    				var updateHalfMin = $("#friSelectHalfMin option:selected").val();
    				
    				var workingTime = updateStartTime+":"+updateStartMin+":00";
                	$("#friTr").after('<input id="workingTime${i}" type="hidden" name="workingTime" value="'+workingTime+'">');    						
    				$("select[id^='friSelect'], input:checkbox[id=fri]").change(function() {
						
    				if($("input:checkbox[id=fri]").is(":checked")){
    					updateStartTime = $("#friSelectTime option:selected").val();
    					updateStartMin = $("#friSelectMin option:selected").val();
    					updateEndTime = $("#friSelectEndTime option:selected").val();
    					updateEndMin = $("#friSelectEndMin option:selected").val();
    					updateHalfTime = $("#friSelectHalfTime option:selected").val();
    					updateHalfMin = $("#friSelectHalfMin option:selected").val();
    					workingTime = updateStartTime+":"+updateStartMin+":00";
    					if(num == 1){
    						$("#friTr").after('<input id="workingTime${i}" type="hidden" name="workingTime" value="'+workingTime+'">');
    						num = 0;
    					} else{
    						$("#workingTime${i}").val(workingTime);
    					}
    				}else{
    					$("#workingTime${i}").detach();
    					num = 1;
    				}
    				
    			});
    			$("input:checkbox[id=fri]").change(function() {
            		if($("input:checkbox[id=fri]").is(":checked") == false){
                		$("#friTr").after('<input id="delNo${i}" type="hidden" name="deleteWorkTimeSetNo" value="${sessionScope.workTimeSet.get(i).workingSetNo}">');
    				}
            		if($("input:checkbox[id=fri]").is(":checked")){
            			$("#delNo${i}").detach();
            		}
				});
    			});
    			</script>
    		</c:when>
    		<c:when test="${sessionScope.workTimeSet.get(i).dayOfTheWeek eq '토'}">
    		
    			<script type="text/javascript">
    			var num = 0;
    			$(document).ready(function() {
    				$("#sat").attr("checked", true);
    				var startTime = "${sessionScope.workTimeSet.get(i).workingTime}";
    				var start = startTime.split(":");
    				var endTime = "${sessionScope.workTimeSet.get(i).quittingTime}";
    				var end = endTime.split(":");
    				var halfTime = "${sessionScope.workTimeSet.get(i).harfOff}";
    				var half = halfTime.split(":");

    				$('#satSelectTime option[value='+start[0]+']').attr('selected','ture');
    				$('#satSelectMin option[value='+start[1]+']').attr('selected','ture');
    				$('#satSelectEndTime option[value='+end[0]+']').attr('selected','ture');
    				$('#satSelectEndMin option[value='+end[1]+']').attr('selected','ture');
    				$('#satSelectHalfTime option[value='+half[0]+']').attr('selected','ture');
    				$('#satSelectHalfMin option[value='+half[1]+']').attr('selected','ture');
    				
    				var updateStartTime = $("#satSelectTime option:selected").val();
    				var updateStartMin = $("#satSelectMin option:selected").val();
    				var updateEndTime = $("#satSelectEndTime option:selected").val();
    				var updateEndMin = $("#satSelectEndMin option:selected").val();
    				var updateHalfTime = $("#satSelectHalfTime option:selected").val();
    				var updateHalfMin = $("#satSelectHalfMin option:selected").val();
    				
    				var workingTime = updateStartTime+":"+updateStartMin+":00";
                	$("#satTr").after('<input id="workingTime${i}" type="hidden" name="workingTime" value="'+workingTime+'">');    						
    				$("select[id^='satSelect'], input:checkbox[id=sat]").change(function() {
					
    				if($("input:checkbox[id=sat]").is(":checked")){
    					updateStartTime = $("#satSelectTime option:selected").val();
    					updateStartMin = $("#satSelectMin option:selected").val();
    					updateEndTime = $("#satSelectEndTime option:selected").val();
    					updateEndMin = $("#satSelectEndMin option:selected").val();
    					updateHalfTime = $("#satSelectHalfTime option:selected").val();
    					updateHalfMin = $("#satSelectHalfMin option:selected").val();
    					workingTime = updateStartTime+":"+updateStartMin+":00";
    					if(num == 1){
    						$("#satTr").after('<input id="workingTime${i}" type="hidden" name="workingTime" value="'+workingTime+'">');
    						num = 0;
    					} else{
    						$("#workingTime${i}").val(workingTime);
    					}
    				}else{
    					$("#workingTime${i}").detach();
    					num = 1;
    				}
    				
    			});
    			$("input:checkbox[id=sat]").change(function() {
            		if($("input:checkbox[id=sat]").is(":checked") == false){
                		$("#satTr").after('<input id="delNo${i}" type="hidden" name="deleteWorkTimeSetNo" value="${sessionScope.workTimeSet.get(i).workingSetNo}">');
    				}
            		if($("input:checkbox[id=sat]").is(":checked")){
            			$("#delNo${i}").detach();
            		}
				});
    			});
    			</script>
    		</c:when>
    		<c:when test="${sessionScope.workTimeSet.get(i).dayOfTheWeek eq '일'}">
    		
    			<script type="text/javascript">
    			var num = 0;
    			$(document).ready(function() {
    				$("#sun").attr("checked", true);
    				var startTime = "${sessionScope.workTimeSet.get(i).workingTime}";
    				var start = startTime.split(":");
    				var endTime = "${sessionScope.workTimeSet.get(i).quittingTime}";
    				var end = endTime.split(":");
    				var halfTime = "${sessionScope.workTimeSet.get(i).harfOff}";
    				var half = halfTime.split(":");

    				$('#sunSelectTime option[value='+start[0]+']').attr('selected','ture');
    				$('#sunSelectMin option[value='+start[1]+']').attr('selected','ture');
    				$('#sunSelectEndTime option[value='+end[0]+']').attr('selected','ture');
    				$('#sunSelectEndMin option[value='+end[1]+']').attr('selected','ture');
    				$('#sunSelectHalfTime option[value='+half[0]+']').attr('selected','ture');
    				$('#sunSelectHalfMin option[value='+half[1]+']').attr('selected','ture');
    				
    				var updateStartTime = $("#sunSelectTime option:selected").val();
    				var updateStartMin = $("#sunSelectMin option:selected").val();
    				var updateEndTime = $("#sunSelectEndTime option:selected").val();
    				var updateEndMin = $("#sunSelectEndMin option:selected").val();
    				var updateHalfTime = $("#sunSelectHalfTime option:selected").val();
    				var updateHalfMin = $("#sunSelectHalfMin option:selected").val();
    				
    				var workingTime = updateStartTime+":"+updateStartMin+":00";
                	$("#sunTr").after('<input id="workingTime${i}" type="hidden" name="workingTime" value="'+workingTime+'">');    						
    				$("select[id^='sunSelect'], input:checkbox[id=sun]").change(function() {
					
    				if($("input:checkbox[id=sun]").is(":checked")){
    					updateStartTime = $("#sunSelectTime option:selected").val();
    					updateStartMin = $("#sunSelectMin option:selected").val();
    					updateEndTime = $("#sunSelectEndTime option:selected").val();
    					updateEndMin = $("#sunSelectEndMin option:selected").val();
    					updateHalfTime = $("#sunSelectHalfTime option:selected").val();
    					updateHalfMin = $("#sunSelectHalfMin option:selected").val();
    					workingTime = updateStartTime+":"+updateStartMin+":00";
    					if(num == 1){
    						$("#sunTr").after('<input id="workingTime${i}" type="hidden" name="workingTime" value="'+workingTime+'">');
    						num = 0;
    					} else{
    						$("#workingTime${i}").val(workingTime);
    					}
    				}else{
    					$("#workingTime${i}").detach();
    					num = 1;
    				}
    				
    			});
    			$("input:checkbox[id=sun]").change(function() {
            		if($("input:checkbox[id=sun]").is(":checked") == false){
                		$("#sunTr").after('<input id="delNo${i}" type="hidden" name="deleteWorkTimeSetNo" value="${sessionScope.workTimeSet.get(i).workingSetNo}">');
    				}
            		if($("input:checkbox[id=sun]").is(":checked")){
            			$("#delNo${i}").detach();
            		}
				});
    			});
    			</script>
    		</c:when>
    	</c:choose>
    </c:forEach>
                    
                    
                    
                    <tr class="line" id="restTr">
                        <th>휴게 시간</th>
                        <td colspan="15" class="padding">
                            <select id="restStartTime">
                                <option value="01">01</option>
                                <option value="02">02</option>
                                <option value="03">03</option>
                                <option value="04">04</option>
                                <option value="05">05</option>
                                <option value="06">06</option>
                                <option value="07">07</option>
                                <option value="08">08</option>
                                <option value="09">09</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                                <option value="13">13</option>
                                <option value="14">14</option>
                                <option value="15">15</option>
                                <option value="16">16</option>
                                <option value="17">17</option>
                                <option value="18">18</option>
                                <option value="19">19</option>
                                <option value="20">20</option>
                                <option value="21">21</option>
                                <option value="22">22</option>
                                <option value="23">23</option>
                                <option value="24">24</option>
                            </select>
                        	<span class="left">시</span>
                            <select id="restStartMin">
                                <option value="00">00</option>
                                <option value="05">05</option>
                                <option value="10">10</option>
                                <option value="15">15</option>
                                <option value="20">20</option>
                                <option value="25">25</option>
                                <option value="30">30</option>
                                <option value="35">35</option>
                                <option value="40">40</option>
                                <option value="45">45</option>
                                <option value="50">50</option>
                                <option value="55">55</option>
                            </select>
                        	<span>분 ~ </span>
                            <select id="restEndTime">
                                <option value="01">01</option>
                                <option value="02">02</option>
                                <option value="03">03</option>
                                <option value="04">04</option>
                                <option value="05">05</option>
                                <option value="06">06</option>
                                <option value="07">07</option>
                                <option value="08">08</option>
                                <option value="09">09</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                                <option value="13">13</option>
                                <option value="14">14</option>
                                <option value="15">15</option>
                                <option value="16">16</option>
                                <option value="17">17</option>
                                <option value="18">18</option>
                                <option value="19">19</option>
                                <option value="20">20</option>
                                <option value="21">21</option>
                                <option value="22">22</option>
                                <option value="23">23</option>
                                <option value="24">24</option>
                            </select>
                        	<span class="left">시</span>
                            <select id="restEndMin">
                                <option value="00">00</option>
                                <option value="05">05</option>
                                <option value="10">10</option>
                                <option value="15">15</option>
                                <option value="20">20</option>
                                <option value="25">25</option>
                                <option value="30">30</option>
                                <option value="35">35</option>
                                <option value="40">40</option>
                                <option value="45">45</option>
                                <option value="50">50</option>
                                <option value="55">55</option>
                            </select>
                        	<span class="left">분</span> 
                        	<input type="text" name="btType" value="${sessionScope.atbt.btType}">
                        	<!-- <button type="button" class="addBtn" onclick="addRest();">추가하기</button> --></td>
                    </tr>
                    <!-- <tr>
                        <td colspan="16"><button class="saveBtn">저장</button></td>
                    </tr> -->
                </table>
                <script type="text/javascript">
                	$(document).ready(function() {
                		var startTime = "${sessionScope.atbt.btStart}";
        				var start = startTime.split(":");
        				var endTime = "${sessionScope.atbt.btEnd}";
        				var end = endTime.split(":");
        				console.log(end[0]);
        				$('#restStartTime option[value='+start[0]+']').attr('selected','ture');
        				$('#restStartMin option[value='+start[1]+']').attr('selected','ture');
        				$('#restEndTime option[value='+end[0]+']').attr('selected','ture');
        				$('#restEndMin option[value='+end[1]+']').attr('selected','ture');
        				
					});
                </script>
            </div>
            <br>
            <div>
            	
                <label class="middleName">근무상태 관리</label><button type="button" class="saveBtn" id="addBtnAt" >추가</button>
                <table id="managerTable" class="middleTable">
                	<tr>
                		<th>근무상태</th>
                		<th>근무 시간 포함 여부</th>
                		<th>수정 및 삭제</th>
                	</tr>
                	<c:forEach var="i" begin="0" end="${sessionScope.workingStatus.size()-1 }">
                	<input id="hiddenNo${i}" type="hidden" name="workingStatusNo" value="${sessionScope.workingStatus.get(i).workingStatusNo }">
                	<input id="hiddenType${i}" type="hidden" name="workType" value="${sessionScope.workingStatus.get(i).workType }">
                	<input id="hiddenWork${i}" type="hidden" name="work" value="${sessionScope.workingStatus.get(i).work}">
                	<tr id="workingTr${i}">
                		<td id="type${i}"><c:out value="${sessionScope.workingStatus.get(i).workType }"/></td>
                		<c:if test="${sessionScope.workingStatus.get(i).work eq 'Y' }">
                		<td id="work${i}">포함</td>
                		</c:if>
                		<c:if test="${sessionScope.workingStatus.get(i).work eq 'N' }">
                		<td id="work${i}">미포함</td>
                		</c:if>
                		<td id="but${i}"><button type="button" class="btn" onclick="modify('${i}','${sessionScope.workingStatus.get(i).workType }');">수정</button>/<button type="button" class="btn" onclick="deleteType('${i}','${sessionScope.workingStatus.get(i).workingStatusNo }');">삭제</button></td>
                	</tr>
                	</c:forEach>
                	
                	
                </table>
                <button class="saveBtn">저장</button>
            </div>
            	</form>
        </div>
    </section>
    
    <script type="text/javascript">
    	$(document).ready(function() {
			console.log("${sessionScope.atbt.attendence}");
			console.log("${sessionScope.workTimeSet.size()}");

			
			if('${sessionScope.atbt.attendence}' == 'Y'){
				$("input:radio[name=attendence]:input[value='Y']").attr("checked", true);
			} else {
				$("input:radio[name=attendence]:input[value='N']").attr("checked", true);
			}
			
			if('${sessionScope.atbt.workTimeLimit}' == 'Y'){
				$("input:radio[name=workTimeLimit]:input[value='Y']").attr("checked", true);
			} else {
				$("input:radio[name=workTimeLimit]:input[value='N']").attr("checked", true);
			}
			
			if('${sessionScope.workTimeSet.get(0).workingSetTime}' == '기본'){
				$("input:radio[name=workingSetTime]:input[id='default']").attr("checked", true);
			} else {
				$("input:radio[name=workingSetTime]:input[id='free']").attr("checked", true);
			}
			
			if('${sessionScope.atbt.laborDay}' == 'Y'){
				$("input:checkbox[name=laborDay]").attr("checked", true);
				$("input:checkbox[name=laborDay]").attr("value", "Y");
			}
			$("input:checkbox[name=laborDay]").change(function() {
				if($("input:checkbox[name=laborDay]").is(":checked")){
					$("input:checkbox[name=laborDay]").attr("value", "Y");
				} else {
					$("input:checkbox[name=laborDay]").attr("value", "N");
				}
			});
			if('${sessionScope.atbt.holidays}' == 'Y'){
				$("input:checkbox[name=holidays]").attr("checked", true);
				$("input:checkbox[name=holidays]").attr("value", "Y");
			} 
			$("input:checkbox[name=holidays]").change(function() {
				if($("input:checkbox[name=holidays]").is(":checked")){
					$("input:checkbox[name=holidays]").attr("value", "Y");
				} else {
					$("input:checkbox[name=holidays]").attr("value", "N");
				}
			});
			if('${sessionScope.atbt.alternativeHolidays}' == 'Y'){
				$("input:checkbox[name=alternativeHolidays]").attr("checked", true);
				$("input:checkbox[name=alternativeHolidays]").attr("value", "Y");
			}
			$("input:checkbox[name=alternativeHolidays]").change(function() {
				if($("input:checkbox[name=alternativeHolidays]").is(":checked")){
					$("input:checkbox[name=alternativeHolidays]").attr("value", "Y");
				} else {
					$("input:checkbox[name=alternativeHolidays]").attr("value", "N");
				}
			});
			if($("input:checkbox[id=mon]").is(":checked")){
				$("#monTr").show();
			}
			if($("input:checkbox[id=mon]").is(":checked") == false){
				$("#monTr").hide();
			}
			if($("input:checkbox[id=tue]").is(":checked")){
				$("#tueTr").show();
			}
			if($("input:checkbox[id=tue]").is(":checked") == false){
				$("#tueTr").hide();
			}
			if($("input:checkbox[id=wed]").is(":checked")){
				$("#wedTr").show();
			}
			if($("input:checkbox[id=wed]").is(":checked") == false){
				$("#wedTr").hide();
			}
			if($("input:checkbox[id=thu]").is(":checked")){
				$("#thuTr").show();
			}
			if($("input:checkbox[id=thu]").is(":checked") == false){
				$("#thuTr").hide();
			}
			if($("input:checkbox[id=fri]").is(":checked")){
				$("#friTr").show();
			}
			if($("input:checkbox[id=fri]").is(":checked") == false){
				$("#friTr").hide();
			}
			if($("input:checkbox[id=sat]").is(":checked")){
				$("#satTr").show();
			}
			if($("input:checkbox[id=sat]").is(":checked") == false){
				$("#satTr").hide();
			}
			if($("input:checkbox[id=sun]").is(":checked")){
				$("#sunTr").show();
			}
			if($("input:checkbox[id=sun]").is(":checked") == false){
				$("#sunTr").hide();
			}
			
			$("input:checkbox[name=dayOfTheWeek]").change(function() {
				var rowadd = $("input:checkbox[name=dayOfTheWeek]:checked").length + 3;
				if($("input:checkbox[name=dayOfTheWeek]").is(":checked")){
					$("#rowth").attr("rowspan", rowadd);
				} else {
					$("#rowth").attr("rowspan", rowadd);
				}
				if($("input:checkbox[id=mon]").is(":checked")){
					$("#monTr").show();
				}
				if($("input:checkbox[id=mon]").is(":checked") == false){
					$("#monTr").hide();
				}
				if($("input:checkbox[id=tue]").is(":checked")){
					$("#tueTr").show();
				}
				if($("input:checkbox[id=tue]").is(":checked") == false){
					$("#tueTr").hide();
				}
				if($("input:checkbox[id=wed]").is(":checked")){
					$("#wedTr").show();
				}
				if($("input:checkbox[id=wed]").is(":checked") == false){
					$("#wedTr").hide();
				}
				if($("input:checkbox[id=thu]").is(":checked")){
					$("#thuTr").show();
				}
				if($("input:checkbox[id=thu]").is(":checked") == false){
					$("#thuTr").hide();
				}
				if($("input:checkbox[id=fri]").is(":checked")){
					$("#friTr").show();
				}
				if($("input:checkbox[id=fri]").is(":checked") == false){
					$("#friTr").hide();
				}
				if($("input:checkbox[id=sat]").is(":checked")){
					$("#satTr").show();
				}
				if($("input:checkbox[id=sat]").is(":checked") == false){
					$("#satTr").hide();
				}
				if($("input:checkbox[id=sun]").is(":checked")){
					$("#sunTr").show();
				}
				if($("input:checkbox[id=sun]").is(":checked") == false){
					$("#sunTr").hide();
				}
			});
			
    	});
    	/*여기까지가 document 실행끝*/
    	$("#addBtnAt").click(function() {
	    		console.log("들어옴");
				$("#managerTable").append('<tr><td><input type="text" placeholder="상태 이름 입력"></td><td><select><option>포함</option><option>미포함</option></select></td><td></td></tr>');
			
		});
			
    	
    	/* 근무 상태 관리 수정 */
    	function modify(num, type) {
			 $("#type"+num).detach();
			 $("#work"+num).detach();
			 $("#but"+num).empty();
			 $("#workingTr"+num).prepend('<td><select><option>포함</option><option>미포함</option></select></td>').prepend('<td id="type${i}"><input type="text" value="'+type+'"></td>');
			 
		}
    	
    	function deleteType(num, no) {
			var value = confirm("삭제하시겠습니까?");
			if(value == true){
				$("#managerTable").prepend('<input id="delNo'+num+'" type="hidden" name="deleteWorkingStatusNo" value="'+no+'">');
				$("#workingTr"+num).detach();
				$("#hiddenNo"+num).detach();
				$("#hiddenType"+num).detach();
				$("#hiddenWork"+num).detach();
			}
		}
    	
    	
    </script>
</body>
</html>