package team.shop.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import team.shop.DTO.mypage1VO;
import team.shop.DTO.productVO;
import team.util.DBManager;

//DAO : DB와 어떻게 일 할 것인가? 에 대한 코드
public class mypage1DAO {

	private mypage1DAO() {
	}
	
	private static mypage1DAO instance = new mypage1DAO();
	
	public static mypage1DAO getInstance() {
		return instance;
	}
	
	//1. SELECT : 내 구매내역을 모두 불러와 oNum(주문번호) 기준으로 내림차순 정렬
		public List<mypage1VO> selectMyProducts(String id){
			String sql = "select * from mypage1_view where id=? order by oNum desc";
			
			List<mypage1VO> list = new ArrayList<mypage1VO>();
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {
				conn = DBManager.getConnection();
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, id);
				
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					mypage1VO mVo = new mypage1VO();
					//bVo의 setter에 값세팅 (rs가 타입변환 시켜줌)
					mVo.setId(rs.getString("id"));
					mVo.setpNum(rs.getInt("pNum"));
					mVo.setpName(rs.getString("pName"));
					mVo.setpShortInfo(rs.getString("pShortInfo"));
					mVo.setpImg(rs.getString("pImg"));
					mVo.setoNum(rs.getInt("oNum"));
					mVo.setoDate(rs.getTimestamp("oDate"));
					mVo.setoPrice(rs.getInt("oPrice"));
					mVo.setCnt(rs.getInt("cnt"));			
					list.add(mVo);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				DBManager.close(conn, pstmt, rs);
			}
			return list;
		}

		public productVO selectOneProductBypNum(String pNum) {
			String sql = "select * from product where pNum=?";
			
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			// try/catch문 밖에서 선언 해 주어야 return 가능
			productVO pVo = null; 
			
			try {
				conn = DBManager.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, pNum);
				
				rs = pstmt.executeQuery(); //데이터 rs에 저장
				
				while(rs.next()) { // rs에 들어있는 정보를 bVo에 세팅
					pVo = new productVO();
					//VO의 setter의 매개변수 타입과 일치되게 저장할 것
					pVo.setpNum(rs.getInt("pNum"));
					pVo.setpName(rs.getString("pName"));
					pVo.setpPrice(rs.getInt("pPrice"));
					pVo.setpImg(rs.getString("pImg"));
					pVo.setpShortInfo(rs.getString("pShortInfo"));
					pVo.setpDetailInfo(rs.getString("pDetailInfo"));
					pVo.setpCategory(rs.getString("pCategory"));
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				DBManager.close(conn, pstmt, rs);
			}
			return pVo;
		}
}
