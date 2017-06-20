<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/top.jsp"/>

    <div class="col-md-10 col-md-offset-1">
    <h1>Member Join</h1>
    
    <form role="form" name="mf" id="mf" action="joinEnd.jsp" method="post">
    	<table class="table">
    		<tr>
    			<th>이름</th>
    			<td>
    			<div class="col-md-6">
    				<input type="text" name="name" id="name"
    				 placeholder="이름을 입력하세요"
    				 required="required"
    				  class="form-control">
    			 </div>	 
    			</td>
    		</tr>
    		<tr>
    			<th>아이디</th>
    			<td>
    			<div class="col-md-6">
    				<input type="text" name="userid" id="userid"
    				 placeholder="아이디 중복체크를 하세요" readonly
    				 required="required"
    				  class="form-control">
    			 </div>	
    			 <div class="col-md-2">
    			 	<button type="button" onclick="idCheck()" 
    			 	class="btn btn-success">아이디 중복체크</button>
    			 </div> 
    			</td>
    		</tr>
    		<tr>
    			<th>비밀번호</th>
    			<td>
    			<div class="col-md-6">
    				<input type="password" name="pwd" id="pwd"
    				 placeholder="비밀번호를 입력하세요"
    				 required="required"
    				  class="form-control">
    			 </div>	 
    			</td>
    		</tr>
    		<tr>
    			<th>비밀번호 확인</th>
    			<td>
    			<div class="col-md-6">
    				<input type="password" name="pwd2" id="pwd2"
    				 placeholder="비밀번호를 입력하세요"
    				 required="required"
    				  class="form-control">
    			 </div>	 
    			</td>
    		</tr>
    		<tr>
    			<th>연락처</th>
    			<td>
    			
    			<div class="col-md-2">
    				<input type="text" name="hp1" id="hp1"
    				 placeholder="HP1"
    				 required="required" maxlength="3"
    				  class="form-control">
    			 </div>	 
    			 
    			 <div class="col-md-2">
    				<input type="text" name="hp2" id="hp2"
    				 placeholder="HP2"  maxlength="4"
    				 required="required"
    				  class="form-control">
    			 </div>	
    			 <div class="col-md-2">
    				<input type="text" name="hp3" id="hp3"
    				 placeholder="HP3" maxlength="4"
    				 required="required"
    				  class="form-control">
    			 </div>	
    			</td>
    		</tr>
    		<tr>
    			<th>우편번호</th>
    			<td>
    			<div class="col-md-3">
    				<input type="text" name="post" id="post" 
    				 placeholder="우편번호" maxlength="5"
    				 required="required" 
    				  class="form-control">
    			 </div>	
    			 <div class="col-md-2">
    			 	<button type="button" 
    			 	class="btn btn-success" onclick="sample6_execDaumPostcode()">우편번호 찾기</button>
    			 </div> 
    			</td>
    		</tr>
    		<tr>
    			<th rowspan="2">주소</th>
    			<td>
    			<div class="col-md-6">
    				<input type="text" name="addr1" id="addr1"
    				 placeholder="주소 1"
    				 required="required"
    				  class="form-control">
    			 </div>	 
    			</td>
    		</tr>
    		<tr>
    			<td>
    			<div class="col-md-6">
    				<input type="text" name="addr2" id="addr2"
    				 placeholder="주소 2"
    				 required="required"
    				  class="form-control">
    			 </div>	 
    			</td>
    		</tr>
    		<tr>
    			<td colspan="2">
    				<div class="col-md-6 col-md-offset-2">
    				<button type="button" onclick="check()" class="btn btn-primary">회원가입</button>
    				<button type="reset" class="btn btn-danger">다시쓰기</button>
    				</div>
    			</td>
    		</tr>
    	</table>
    </form>
    <script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
    	alert('p');
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('post').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('addr1').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('addr2').focus();
            }
        }).open();
    }
</script>
    
    
    
	<script type="text/javascript">	
		/*아이디 중복체크를 위한 함수*/
		var idCheck=function(){
			var url="idCheck.jsp";
			win=window.open(url,"IDCheck","width=400, height=400, left=200, top=100");
		}//idCheck()---------------------
	
	
		var check=function(){
			if(!mf.name.value){
				alert('이름을 입력하세요');
				mf.name.focus();
				return;
			}
			if(!mf.userid.value){
				alert('아이디를 입력하세요');
				mf.userid.focus();
				return;
			}
			if(!mf.pwd.value){
				alert('비밀번호를 입력하세요');
				mf.pwd.focus();
				return;
			}
			if(mf.pwd.value != mf.pwd2.value){
				alert('비밀번호가 비밀번호 확인과 달라요');
				mf.pwd2.select();
				return;
			}
			if(!mf.hp1.value||!mf.hp2.value||!mf.hp3.value){
				alert('연락처를 모두 입력하세요');
				mf.hp1.focus();
				return;
			}
			if(isNaN(mf.hp1.value)){
				alert('연락처1은 숫자여야 해요');
				mf.hp1.select();
				return;
			}
			if(isNaN(mf.hp2.value)){
				alert('연락처2은 숫자여야 해요');
				mf.hp2.select();
				return;
			}
			if(isNaN(mf.hp3.value)){
				alert('연락처3은 숫자여야 해요');
				mf.hp3.select();
				return;
			}
			if(!mf.post.value||isNaN(mf.post.value)){
				alert('우편번호는 숫자여야 해요');
				mf.post.select();
				return;
			}
			
			
			mf.submit();
		}
	
	</script>    
    
    
    </div>
<jsp:include page="/foot.jsp"/>      







