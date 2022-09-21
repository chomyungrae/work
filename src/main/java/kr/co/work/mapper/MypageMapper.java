package kr.co.work.mapper;

import java.util.ArrayList;

import kr.co.work.vo.InfoVO;
import kr.co.work.vo.MemberVO;
import kr.co.work.vo.WorkVO;

public interface MypageMapper {

	//mypage
    public MemberVO myinfo(String userid);
    
    public String get_dbpwd(String userid,String pwd);
    public void pwd_change_ok(String userid,String pwd1);
    
    public void my_update_ok(MemberVO mvo);
    
    public int check_member(String userid,String pwd);
    public void member_state1(String userid);
    
    public ArrayList<WorkVO> my_apply(String userid);
   
    public InfoVO information(String userid);
    public void info_input_ok(InfoVO ivo);
    public void info_update_ok(InfoVO ivo);
}
