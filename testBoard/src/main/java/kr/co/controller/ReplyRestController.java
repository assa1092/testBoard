package kr.co.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.co.service.ReplyService;
import kr.co.vo.ReplyVO;

@RestController
public class ReplyRestController {
	
	@Inject
	private ReplyService rService;
	
	@RequestMapping(value = "/replies", method = RequestMethod.POST)
	public String insert(@RequestBody ReplyVO vo) {
		int i = rService.insert(vo);
		if (i == 1) {
			return "Reply Success";
		} else {
			return "Reply Fail";
		}
	}
	
	@RequestMapping(value = "/replies/all/{bno}", method = RequestMethod.GET)
	public List<ReplyVO> list(@PathVariable("bno") int bno){
		List<ReplyVO> list= rService.list(bno);
		return list;
	}

}