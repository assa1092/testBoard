package kr.co.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.service.MemberService;
import kr.co.vo.MemberVO;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	MemberService mService;
	
	// 암호화 작업
	@Inject
	BCryptPasswordEncoder pwdEncoder;
	
	// 회원 가입 GET
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void getRegister() throws Exception {
		logger.info("get register");
	}
	// 회원 가입 POST
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String postRegister(MemberVO vo) throws Exception {
		logger.info("post register");
		
		// 아이디 중복 체크
		int result = mService.idCheck(vo);
		
		try {
			if (result == 1) {		
				// 아이디 중복되면 다시 회원가입 화면으로
				return "/member/register";
			} else if (result == 0) {
				// 아이디 중복이 아니면
				
				// 비밀번호 암호롸
				// 회원가입 요청이 들어오면 비밀번호를 암호화하여 vo에 다시 넣어줍니다
				// 회원가입 서비스를 실행합니다.
				String inputPass = vo.getUserPass();
				String encodePass = pwdEncoder.encode(inputPass);
				vo.setUserPass(encodePass);
				mService.register(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();
		}
		
		System.out.println(vo);
		return "redirect:/";
	}
	
	// 로그인
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(MemberVO vo, HttpSession session, RedirectAttributes rttr) throws Exception {
		logger.info("post login");
		
		// 세션값을 가져온다
		// 회원가입을 암호화를 하여 했기때문에 
		// 로그인을 할 때에는 입력된 비밀번호와 조회한 비밀번호가 같아야한다. 
		session.getAttribute("member");
		MemberVO login = mService.login(vo);
		boolean pwdMatch = pwdEncoder.matches(vo.getUserPass(), login.getUserPass());
		
		if (login != null && pwdMatch == true) {
			session.setAttribute("member", login);
		} else {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
		}
		
		return "redirect:/";
	}
	
	// 로그 아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception{
		logger.info("logout");

		// 세션 제거
		session.invalidate();
		return "redirect:/";
	}
	
	// 회원 정보 수정 GET
	@RequestMapping(value ="/memberUpdateView", method = RequestMethod.GET)
	public String registerUpdateView() throws Exception{
		logger.info("registerUpdateView");
		
		return "member/memberUpdateView";
	}
	
	// 회원 정보 수정 POST
	@RequestMapping(value = "/memberUpdate", method = RequestMethod.POST)
	public String registerUpdate(MemberVO vo, HttpSession session) throws Exception{
		logger.info("registerUpdate");
		mService.memberUpdate(vo);
		
		session.invalidate();
		
		return "redirect:/";
	}
	
	// 회원 정보 탈퇴 GET
	@RequestMapping(value = "/memberDeleteView", method = RequestMethod.GET)
	public String memberDeleteView() throws Exception{
		logger.info("memberDeleteView");
		
		return "member/memberDeleteView";
	}
	
	// 회원 정보 탈퇴 POST
	@RequestMapping(value = "/memberDelete", method = RequestMethod.POST)
	public String memberDelete(MemberVO vo, HttpSession session, RedirectAttributes rttr) throws Exception{
		logger.info("memberDelete");
		
		/*
		 * // 세션에 있는 member 를 가져와서 member 변수에 넣어준다. MemberVO member = (MemberVO)
		 * session.getAttribute("member"); // 세션에 있는 비밀번호를 가져온다 String sessionPass =
		 * member.getUserPass(); // 회원 탈퇴시 입력되는 비밀번호 String voPass = vo.getUserPass();
		 * 
		 * // 세션에 비밀번호와 입력된 비밀번호 비교 if (!(sessionPass.equals(voPass))) {
		 * rttr.addFlashAttribute("msg", false); return
		 * "redirect:/member/memberDeleteView"; }
		 */
		
		
		// 세션 정보와 탈퇴시 입력되는 값이 같으면 탈퇴진행
		mService.memberDelete(vo);
		// 세션 삭제
		session.invalidate();
		
		return "redirect:/";
	}
	
	// 패스워드 체크
	@ResponseBody 		// ajax 통신하겠다...
	@RequestMapping(value = "/passCheck", method = RequestMethod.POST)
	public boolean passCheck(MemberVO vo) throws Exception {	
//		int result = mService.passCheck(vo);
//		return result;
		MemberVO login = mService.login(vo);
		boolean pwdCheck = pwdEncoder.matches(vo.getUserPass(), login.getUserPass());
		
		return pwdCheck;
	}
	
	// 아이디 중복 체크
	@ResponseBody		// ajax 통신한다고 통보
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public int idCheck(MemberVO vo) throws Exception{
		int result = mService.idCheck(vo);
		
		return result;
	}
	
}
