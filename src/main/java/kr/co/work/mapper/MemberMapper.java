package kr.co.work.mapper;

import java.util.ArrayList;

import kr.co.work.vo.MemberVO;
import kr.co.work.vo.WorkVO;

public interface MemberMapper {
	
	//홈 일자리 리스트
	public ArrayList<WorkVO> work_list(String day);

	public void member_input_ok(MemberVO mvo);
	public int check_userid(String userid);

	public MemberVO login_ok(MemberVO mvo);
	//아디 비번찾기 (아작스)
	public String get_userid(String name,String ymd);
	public String get_pwd(String userid,String name,String phone);
	    
	
	//mypage
    public MemberVO myinfo(String userid);
    
    public String get_dbpwd(String userid,String pwd);
    public void pwd_change_ok(String userid,String pwd1);
    
    public void my_update_ok(MemberVO mvo);
    
    public int check_member(String userid,String pwd);
    public void member_state1(String userid);
}
