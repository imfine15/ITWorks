<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
        vertical-align: middle;
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
        #vacationTable{
    	width: 95%;
        border-collapse: collapse;
        vertical-align: middle;
    }
    #vacationTable tr{
    	border-bottom: 0.5px solid #9F9F9F;
		border-top: 0.5px solid #9F9F9F;
    }
    th{
    	font-family: Noto Sans KR;
		font-style: normal;
		font-weight: normal;
		font-size: 16px;
		line-height: 23px;
		color: #000000;
		background: white;
		
    }
    td{
    	font-family: Noto Sans KR;
		font-style: normal;
		font-weight: normal;
		font-size: 14px;
		line-height: 20px;
		color: #676767;
		height: 35px;
		padding-left: 10px;
		width: 300px;
    }
    .long{
    	height: 300px;
    }
    input[type=text]{
    	border-radius: 0;
		border: 1px solid #929292;
		outline-style: none;
    }
    select{
    	border-radius: 0;
		border: 1px solid #929292;
		outline-style: none;
    }
    textarea{
    	border-radius: 0;
		border: 1px solid #929292;
		outline-style: none;
		resize: none;
    }
    .btn{
    	outline: 0;
    	border : 0;
    	color: #004771;
    	background-color: #fafafa;
    }
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/menubar.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/atManagement/atManagementAside.jsp"></jsp:include>
	<section>
        <div class="inner">
            <div id="inner-title">
            <span>직원 근태 관리</span>
            <br>
            <hr>
            <br>
            </div>
            <div class="tableBox">
            <button class="btn">직원 근태 수정 하기</button>
            <button class="btn">취소하기</button>
            
            <table id="vacationTable">
                	<tr>
                		<th>기존 날짜</th>
                		<td>
                			<select>
                				<option>2020</option>
                				<option>2019</option>
                				<option>2018</option>
                				<option>2017</option>
                				<option>2016</option>
                				<option>2015</option>
                				<option>2014</option>
                				<option>2013</option>
                				<option>2012</option>
                				<option>2011</option>
                				<option>2010</option>
                				<option>2009</option>
                				<option>2008</option>
                				<option>2007</option>
                				<option>2006</option>
                				<option>2005</option>
                				<option>2004</option>
                				<option>2003</option>
                				<option>2002</option>
                				<option>2001</option>
                				<option>2000</option>
                			</select>
                			<span>년</span>
                			<select>
                				<option>01</option>
                				<option>02</option>
                				<option>03</option>
                				<option>04</option>
                				<option>05</option>
                				<option>06</option>
                				<option>07</option>
                				<option>08</option>
                				<option>09</option>
                				<option>10</option>
                				<option>11</option>
                				<option>12</option>
                			</select>
                			<span>월</span>
                			<select>
                				<option>01</option>
                				<option>02</option>
                				<option>03</option>
                				<option>04</option>
                				<option>05</option>
                				<option>06</option>
                				<option>07</option>
                				<option>08</option>
                				<option>09</option>
                				<option>10</option>
                				<option>11</option>
                				<option>12</option>
                				<option>13</option>
                				<option>14</option>
                				<option>15</option>
                				<option>16</option>
                				<option>17</option>
                				<option>18</option>
                				<option>19</option>
                				<option>20</option>
                				<option>21</option>
                				<option>22</option>
                				<option>23</option>
                				<option>24</option>
                				<option>25</option>
                				<option>26</option>
                				<option>27</option>
                				<option>28</option>
                				<option>29</option>
                				<option>30</option>
                				<option>31</option>
                			</select>
                			<span>일</span>
                		</td>
                		<th>신청자</th>
                		<td>관리자</td>
                	</tr>
                	<tr>
                		<th>종류</th>
                		<td>
                			<select>
                				<option>출근</option>
                				<option>퇴근</option>
                			</select>
                		</td>
                		<th>사용자</th>
                		<td>헤일리최</td>
                	</tr>
                	<tr>
                		<th>기존 시간 및 상태</th>
                		<td>9 : 10 / 지각</td>
                		<th>요청 날짜</th>
                		<td>2020/08/22</td>
                	</tr>
                	<tr>
                		<th>변경 상태</th>
                		<td>
                			<select>
                				<option>정상</option>
                				<option>지각</option>
                				<option>연장</option>
                				<option>퇴근</option>
                			</select>
                		</td>
                		<th>부서</th>
                		<td>기술지원팀</td>
                	</tr>
                	<tr>
                		<th>변경 시간</th>
                		<td colspan="3">
                			<select>
                                <option>01</option>
                                <option>02</option>
                                <option>03</option>
                                <option>04</option>
                                <option>05</option>
                                <option>06</option>
                                <option>07</option>
                                <option>08</option>
                                <option>09</option>
                                <option>10</option>
                                <option>11</option>
                                <option>12</option>
                                <option>13</option>
                                <option>14</option>
                                <option>15</option>
                                <option>16</option>
                                <option>17</option>
                                <option>18</option>
                                <option>19</option>
                                <option>20</option>
                                <option>21</option>
                                <option>22</option>
                                <option>23</option>
                                <option>24</option>
                            </select>
                        	<span>시</span>
                            <select>
                                <option>00</option>
                                <option>01</option>
                                <option>02</option>
                                <option>03</option>
                                <option>04</option>
                                <option>05</option>
                                <option>06</option>
                                <option>07</option>
                                <option>08</option>
                                <option>09</option>
                                <option>10</option>
                                <option>11</option>
                                <option>12</option>
                                <option>13</option>
                                <option>14</option>
                                <option>15</option>
                                <option>16</option>
                                <option>17</option>
                                <option>18</option>
                                <option>19</option>
                                <option>20</option>
                                <option>21</option>
                                <option>22</option>
                                <option>23</option>
                                <option>24</option>
                                <option>25</option>
                                <option>26</option>
                                <option>27</option>
                                <option>28</option>
                                <option>29</option>
                                <option>30</option>
                                <option>31</option>
                                <option>32</option>
                                <option>33</option>
                                <option>34</option>
                                <option>35</option>
                                <option>36</option>
                                <option>37</option>
                                <option>38</option>
                                <option>39</option>
                                <option>40</option>
                                <option>41</option>
                                <option>42</option>
                                <option>43</option>
                                <option>44</option>
                                <option>45</option>
                                <option>46</option>
                                <option>47</option>
                                <option>48</option>
                                <option>49</option>
                                <option>50</option>
                                <option>51</option>
                                <option>52</option>
                                <option>53</option>
                                <option>54</option>
                                <option>55</option>
                                <option>56</option>
                                <option>57</option>
                                <option>58</option>
                                <option>59</option>
                            </select>
                        	<span>분</span>
                		</td>
                	</tr>
                	<tr>
                		<th>사유</th>
                		<td colspan="3" class="long"><textarea cols="100" rows="14"></textarea></td>
                	</tr>
                </table>
                </div>
		</div>
	</section>
</body>
</html>