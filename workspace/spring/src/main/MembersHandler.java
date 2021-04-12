package main;

import java.util.Scanner;

import dao.MembersDao;
import dto.MembersDto;

// 비즈니스 로직(bussiness login)

public class MembersHandler {

	// field
	private MembersDao dao = MembersDao.getInstance();
	private Scanner sc = new Scanner(System.in);
	
	// method
	private void menu() {
		System.out.println("=====회원관리=====");
		System.out.println("0. 프로그램 종료");
		System.out.println("1. 가입");
		System.out.println("==================");
	}
	public void execute() {
		while (true) {
			menu();
			System.out.print("선택(0~) >>> ");
			switch (sc.nextInt()) {
			case 0 : System.out.println("프로그램을 종료합니다."); return;
			case 1 : join(); break;
			}
		}
	}
	// 가입
	public void join() {
		System.out.print("신규 아이디 >>> ");
		String mId = sc.next();
		System.out.print("사용자명 >>> ");
		String mName = sc.next();
		System.out.print("이메일 >>> ");
		String mEmail = sc.next();
		
		MembersDto dto = new MembersDto();
		dto.setmId(mId);
		dto.setmName(mName);
		dto.setmEmail(mEmail);
		// MembersDto dto2 = new MembersDto(0L, mId, mName, mEmail, null);
		
		int result = dao.insertMembers(dto);
		if (result > 0) {
			System.out.println(mId + "님이 가입되었습니다.");
		} else {  // result == 0
			System.out.println(mId + "님의 가입이 실패했습니다.");
		}
	}
	
}











