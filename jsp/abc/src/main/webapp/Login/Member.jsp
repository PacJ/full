<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

<head>
<script type="text/javascript" src="script.js"></script>
<title>Member</title>
<link href="css.css" rel="stylesheet" type="text/css">
</head>


<body>
   <div align="center">
      <form name="regFrm" method="post" action="memberProc.jsp">
                  <table>
                     <tr>
                        <td align="center" colspan="2" ><h2>회원 가입</h2></td>
                     </tr>
                     <tr id="n">
                        <td width="120px">아이디 <span id="star">* </span></td>
                        <td width="400px"><input name="id" size="40">
                         <input type="button" value="ID중복확인" onclick="idcheck()"></td>
                     </tr>
                     <tr id="n">
                        <td>비밀번호 <span id="star">* </span></td>
                        <td><input type="password" name="pw" size="40"></td>
                     </tr>
                     <tr id="n">
                        <td>비밀번호 확인 <span id="star">* </span></td>
                        <td><input type="password" name="repwd" size="40"></td>
                     </tr>
                     <tr id="n">
                        <td>이름 <span id="star">* </span></td>
                        <td><input name="name" size="40"></td>
                     </tr>
                     <tr id="n">
                        <td>성별 <span id="star">* </span> </td>
                        <td><input type="radio" name="gender" value="M" checked>남
                           <input type="radio" name="gender" value="F">여
                        </td>
                     </tr>
                     <tr id="n">
                        <td>생년월일 <span id="star">* </span> </td>
                        <td><input name="birth" size="25">&nbsp;&nbsp;&nbsp;&nbsp;ex)900323</td>
                     </tr>
                     <tr id="n">
                        <td>Email <span id="star">* </span> </td>
                        <td><input name="email" size="40"></td>
                     </tr>
                     <tr id="n">
                        <td>우편번호</td>
                        <td><input name="zipcode" id = "zipcode" size="20" readonly> 
                        <input type="button" value="우편번호 찾기" onClick="zipSearch()"></td>
                     </tr>
                     <tr id="n">
                        <td>주소</td>
                        <td><input name="address" id = "address" size="40"></td>
                     </tr>
                     <tr id="n">
                        <td>취미</td>
                        <td><input type="checkbox" name="hobby" value="인터넷">인터넷
                           <input type="checkbox" name="hobby" value="여행">여행
                           <input type="checkbox" name="hobby" value="게임">게임
                           <input type="checkbox" name="hobby" value="영화">영화
                           <input type="checkbox" name="hobby" value="운동">운동
                        </td>
                     </tr>
                     <tr id="n">
                        <td>직업</td>
                        <td><select name=job>
                              <option value="0" selected>선택하세요
                              <option value="회사원">회사원
                              <option value="전문직">전문직
                              <option value="일반자영업">일반자영업
                              <option value="공무원">공무원
                              <option value="의료인">의료인
                              <option value="법조인">법조인
                              <option value="종교,언론,에술인">종교/언론/예술인
                              <option value="농,축,수산,광업인">농/축/수산/광업인
                              <option value="주부">주부
                              <option value="무직">무직
                              <option value="기타">기타
                        </select></td>
                     </tr>
                     <tr id="n">
                        <td colspan="2" align="right">
                        <input type="submit" value="회원가입" onclick="return inputCheck()"> &nbsp; &nbsp; 
                        <input type="reset" value="다시쓰기"> &nbsp; &nbsp;</td>
                     </tr>
                  </table>
      </form>
   </div>
</body>
</html>