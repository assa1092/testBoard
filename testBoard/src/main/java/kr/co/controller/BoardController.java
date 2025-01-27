package kr.co.controller;



import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.service.BoardService;
import kr.co.vo.BoardVO;
import kr.co.vo.PageTO;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	BoardService service;
	
	// 게시팔 글 작성 화면
	@RequestMapping(value = "/writeView", method = RequestMethod.GET)
	public void writeView() throws Exception{
		logger.info("writeView");
	}
	
	// 게시판 글 작성
	@RequestMapping(value = "/write", method = RequestMethod.POST) 
	public	 String write(BoardVO boardVO) throws Exception { 
		logger.info("write"); 
		
		service.write(boardVO); 
		
		return "redirect:/board/list";
	}
	
	// 게시판 글 작성 + 첨부파일
//	@RequestMapping(value = "/write", method = RequestMethod.POST)
//	public String write(BoardVO boardVO, MultipartHttpServletRequest mpRequest) throws Exception {
//		logger.info("write");
//				
//		service.write(boardVO, mpRequest);
//		
//		return "redirect:/board/list";
//	}
	
	// 게시판 목록 조회
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model, String curPage) throws Exception{
//		logger.info("list");
//				
//		model.addAttribute("list", service.list());
//		
//		return "board/list";
		logger.info("list");
		
		int page = -1;
		System.out.println("curPage : " +  curPage);
		if(curPage == null) {
			page = 1;
		} else {
			page = Integer.parseInt(curPage);
		}
		
		System.out.println("page : " +  page);
		System.out.println("curPage : " +  curPage);
		// 페이징 처리 객체
		PageTO to = new PageTO(page);
		
		to = service.list(to);
		
		model.addAttribute("to", to);
		
		model.addAttribute("list", to.getList());
		
		return "board/list";
	}
	
	// 게시판 글 자세히보기
	@RequestMapping(value = "/readView/{bno}", method = RequestMethod.GET)
	public String  read(@PathVariable("bno") int bno, Model model) throws Exception{
		
		logger.info("read");
		
		model.addAttribute("read", service.read(bno));
		
		return "board/readView";
	}
	
	// 게시글 수정뷰
	@RequestMapping(value = "/updateView/{bno}", method = RequestMethod.GET)
	public String updateView(@PathVariable("bno")int bno, Model model) throws Exception {
		logger.info("updateView");
		
		model.addAttribute("update", service.read(bno));
		return "board/updateView";
	}
	
	// 게시글 수정
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(BoardVO boardVO) throws Exception{
		logger.info("update");
		
		service.update(boardVO);
		//return "redirect:/board/readView/" + boardVO.getBno();
		return "redirect:/board/list";
	}
	
	// 게시글 삭제
	@RequestMapping(value = "/delete/{bno}", method = RequestMethod.GET)
	public String delete(@PathVariable("bno") int bno) throws Exception{
		logger.info("delete");
		service.delete(bno);
		return "redirect:/board/list";
	}
	
	// 게시글 검색 리스트
	@RequestMapping(value = "/searchList")
	public String searchList(Model model, String searchType, String keyword) {
		
		List<BoardVO> list = service.searchList(searchType, keyword);
		model.addAttribute("list", list);
		model.addAttribute("searchType", searchType);
		model.addAttribute("keyword", keyword);
		System.out.println(list);
		
		return "/board/searchList";
	}
	

}
