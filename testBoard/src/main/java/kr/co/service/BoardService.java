package kr.co.service;

import java.util.List;

import kr.co.vo.BoardDTO;
import kr.co.vo.BoardVO;
import kr.co.vo.PageTO;

public interface BoardService {

	// 게시글 작성
	public void write(BoardVO boardVO ) throws Exception;
	
	// 게시글 목록 조회
	public List<BoardVO> list() throws Exception;

	public BoardVO read(int bno) throws Exception;

	public void update(BoardVO boardVO) throws Exception;

	public void delete(int bno) throws Exception;

	public PageTO list(PageTO to) throws Exception;

	public List<BoardVO> searchList(String searchType, String keyword);

	public void insertBoard(BoardDTO dto);
	
}