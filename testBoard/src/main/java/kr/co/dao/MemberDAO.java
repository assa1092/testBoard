package kr.co.dao;

import kr.co.vo.MemberVO;

public interface MemberDAO {

	void register(MemberVO vo) throws Exception;

	MemberVO login(MemberVO vo) throws Exception;

	void memberUpdate(MemberVO vo) throws Exception;

	void memberDelete(MemberVO vo) throws Exception;

	int passCheck(MemberVO vo) throws Exception;

	int idCheck(MemberVO vo) throws Exception;


}
