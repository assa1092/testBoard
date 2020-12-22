package kr.co.dao;

import kr.co.vo.MemberVO;

public interface MemberDAO {

	void register(MemberVO vo) throws Exception;

	MemberVO login(MemberVO vo) throws Exception;

	void memberUpdate(MemberVO vo) throws Exception;


}