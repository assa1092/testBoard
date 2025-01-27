package kr.co.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.vo.ReplyVO;

@Repository
public class ReplyDAOImpl  implements ReplyDAO{
	
	@Autowired
	private SqlSession session;
	
	private final String NS = "replyMapper";

	@Override
	public int insert(ReplyVO vo) {
		// 답글 번호 가져오기
		Integer rno = session.selectOne(NS+".getRno");
		
		// 답글 번호 세팅
		vo.setRno(rno);
		
		// 답글 입력
		return session.insert(NS + ".insert", vo);
		
	}

	@Override
	public List<ReplyVO> list(int bno) {
		return session.selectList(NS + ".list", bno);
	}

	@Override
	public int update(ReplyVO vo) {
		return session.update(NS + ".update", vo);
	}

	@Override
	public int delete(int rno) {
		return session.delete(NS + ".delete", rno);
	}

}
