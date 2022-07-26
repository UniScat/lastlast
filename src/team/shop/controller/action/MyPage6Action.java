package team.shop.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import team.shop.DAO.mtmDAO;
import team.shop.DTO.mtmVO;


public class MyPage6Action implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url="/member/mypage_6_myQna.jsp";
		
			String id = request.getParameter("id");
			
			mtmDAO mtmDao = mtmDAO.getInstance();
			List<mtmVO> mtmVO = mtmDao.selectMtm(id);
			
			request.setAttribute("mtmVO", mtmVO);
			
		RequestDispatcher dispaatcher = request.getRequestDispatcher(url);
		dispaatcher.forward(request, response);
	}

}
