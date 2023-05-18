/**
 * 
 */
/*----------------------------- 드롭다운 메뉴 구현 -----------------------------------*/
 function display_mn(){
	 let click = document.getElementById("drop_cont");
	 if(click.style.display === "none"){
		 click.style.display = "block";
	 }else{
		 click.style.display = "none";
	 }
}
 /*----------------------------- 드롭다운 메뉴 구현 끝 -----------------------------------*/
 /*----------------------------- 캐러셀 메뉴 구현 -----------------------------------*/
const flexplz = document.querySelector(".flexplz");
const slideLength = document.querySelectorAll('.flexplz li').length;
let currentSlide = 1;
const IMAGE_WIDTH = 650;

flexplz.addEventListener('wheel', click);

function click(e){
	console.log(e.target);
	if (currentSlide >= slideLength) {
    currentSlide = 0;
  }
  flexplz.style.transform = `translateX(-${IMAGE_WIDTH * currentSlide}px)`;
  currentSlide++;
}
 /*----------------------------- 캐러셀 메뉴 구현 끝 -----------------------------------*/

function pwCheck(){	
    let passwd=document.getElementById("passwd").value;  //작성자 가져오기
    passwd=passwd.trim();
    if(passwd.length<4 || isNaN(passwd)){
        alert("비밀번호를 4글자 이상 입력하세요");
        document.getElementById("passwd").focus();//작성자 칸에 커서 생성
        return false;//전송하지 않음
    }//if end    
    
    let message="진행된 내용은 복구되지 않습니다\n계속 진행할까요?"
    if(confirm(message)){//확인(ture), 취소(false) 버튼 2개 생성
		return true;
	}else{
		return false;
	}//if end   
	
}//pwCheck() end


function loginCheck(){//로그인 유효성 검사(아이디, 비번)
	//1)아이디 5~10글자 이내인지 검사
	let mid=document.getElementById("mid").value;//아이디 가져오기
	mid=mid.trim();
	if(!(mid.length>=5 && mid.length<=10)){
		alert("아이디를 5~10글자 사이로 입력해주세요")
		document.getElementById("mid").focus();
		return false;
	}//if end
	
	//2)비밀번호 5~10글자 이내인지 검사
	let passwd=document.getElementById("passwd").value;//비밀번호 가져오기
	passwd=passwd.trim();
	if(!(passwd.length>=5 && passwd.length<=10)){
		alert("비밀번호를 5~10글자 사이로 입력해주세요")
		document.getElementById("passwd").focus();
		return false;
	}//if end	
	
	return true;
	
}//loginCheck


function idCheck(){//회원가입 아이디 중복 확인. 유효성 검사

	//모달창(주소가 없다. 탭이 생성이 안된다)
	//->부모창과 자식창이 한몸으로 구성되어 있음
	//->참조 https://www.w3schools.com/bootstrap/bootstrap_modal.asp
	
	//새창만들기(주소가 있다. 탭이 생성되거나 새로운 주소로 넘어간다)
	//->부모창과 자식창이 별개로 구성되어 있음
	//->모바일에 기반을 둔 frontend단에서는 사용하지 말것!!
	//->참조 https://www.w3schools.com/jsref/met_win_open.asp
	window.open("idCheckForm.jsp", "idwin", "width=500, height=350");
	
}//idCheck() end


function emailCheck(){//회원가입 이메일 중복 확인. 유효성 검사

	window.open("emailCheckForm.jsp", "emwin", "width=600, height=350");
	
}//idCheck() end


function memberCheck(){//회원가입 유효성 검사
	//1)아이디 5~10글자 인지?
	let mid=document.getElementById("mid").value;
    mid=mid.trim();
    if(!(mid.length>=5 && mid.length<=10)){
        alert("ID를 5~10글자 사이로 입력하세요");
        document.getElementById("mid").focus();
        return false;//전송하지 않음
    }//if end
    
    //2)비밀번호 5~10글자 인지?
    let passwd=document.getElementById("passwd").value;
	passwd=passwd.trim();
	if(!(passwd.length>=5 && passwd.length<=10)){
		alert("비밀번호를 5~10글자 사이로 입력해주세요");
		document.getElementById("passwd").focus();
		return false;
	}//if end	
	
    //3)비밀번호와 비밀번호확인이 서로 일치하는지?
    let repasswd=document.getElementById("repasswd").value;
	repasswd=repasswd.trim();
	if(!(repasswd==passwd)){
		alert("비밀번호를 다시 확인해주세요");
		document.getElementById("repasswd").focus();
		return false;
	}//if end	

    //4)이름 두글자 이상 인지?
    let mname=document.getElementById("mname").value;
    mname=mname.trim();
    if(mname.length<2){
        alert("이름을 2글자 이상 입력하세요");
        document.getElementById("mname").focus();
        return false;//전송하지 않음
    }//if end

    //5)이메일 5글자 인지?
    let email=document.getElementById("email").value;
	email=email.trim();
	if(email.length<5){
		alert("이메일을 다시 확인해 주세요")
		document.getElementById("email").focus();
		return false;
	}//if end	
	
}//memberCheck() end


function findIDCheck(){
	
	 //이름 두글자 이상 인지?
    let mname=document.getElementById("mname").value;
    mname=mname.trim();
    if(mname.length<2){
        alert("이름을 2글자 이상 입력하세요");
        document.getElementById("mname").focus();
        return false;//전송하지 않음
    }//if end
    
    //이메일 5글자 인지?
    let email=document.getElementById("email").value;
	email=email.trim();
	if(email.length<5){
		alert("이메일을 다시 확인해 주세요")
		document.getElementById("email").focus();
		return false;
	}//if end	    
    
}//findIDCheck() end



////////////////////////////////////////////////////////////////
//예매관련
function selectDate(){ //아이디 중복확인
	//날짜 선택 창
	window.open("reserve.html", "idwin", "width=500, height=350");
	
}














