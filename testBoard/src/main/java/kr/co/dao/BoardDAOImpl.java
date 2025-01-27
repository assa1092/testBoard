package kr.co.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.vo.BoardDTO;
import kr.co.vo.BoardVO;
import kr.co.vo.PageTO;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Inject
	private SqlSession sqlSession;
	
	// 게시글 작성
	@Override
	public void write(BoardVO boardVO) throws Exception {
		sqlSession.insert("boardMapper.insert", boardVO);
		
	}

	@Override
	public List<BoardVO> list() {
		return sqlSession.selectList("boardMapper.list");
	}

	@Override
	public BoardVO read(int bno) {
		return sqlSession.selectOne("boardMapper.read", bno);
	}

	@Override
	public void update(BoardVO boardVO) {
		sqlSession.update("boardMapper.update", boardVO);
		
	}

	@Override
	public void delete(int bno) {
		sqlSession.delete("boardMapper.delete", bno);
		
	}

	@Override
	public PageTO list(PageTO to) {
		RowBounds rowBounds = new RowBounds(to.getStartNum()-1, to.getPerPage());
		
		List<BoardVO> list = sqlSession.selectList("boardMapper.list", null, rowBounds);
		
		to.setList(list);
		
		Integer amount = sqlSession.selectOne("boardMapper.getAmount");
		
		if (amount != null) {
			to.setAmount(amount);
		} else {
			to.setAmount(0);
		}
		return to;
		
	}

	@Override
	public List<BoardVO> searchList(String searchType, String keyword) {
		
		// SearchTO 클래스를 따로 만들어쓰거나( searchType, keyword 를 가진) 
		// Map 을 이용해서 데이터를 보낸다.
		// 검색된 리스트 페이징 처리를 위해서는 rowBounds까지 가지고 가야한다.
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		
		return sqlSession.selectList("boardMapper.searchList", map);
	}

	@Override
	public void insertBoard(BoardDTO dto) {
		sqlSession.insert("boardMapper.insertBoard", dto);
		
	}

}