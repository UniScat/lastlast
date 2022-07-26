package team.shop.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import team.shop.DTO.clientVO;
import team.util.DBManager;

//DAO : DB와 어떻게 일 할 것인가? 에 대한 코드
public class clientDAO {

	private clientDAO() {
	}
	
	private static clientDAO instance = new clientDAO();
	
	public static clientDAO getInstance() {
		return instance;
	}
	
	//1. SELECT : 모든 게시글을 불러와 최근 순서로 리스트에 정렬되도록 하는 DAO
		public clientVO getUser(String id2){
			String sql = "select * from client where id=?";
			
			clientVO cVo = null;
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {
				conn = DBManager.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id2);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					cVo = new clientVO();
					//bVo의 setter에 값세팅 (rs가 타입변환 시켜줌)
					cVo.setId(rs.getString("id"));
					cVo.setPw(rs.getString("pw"));
					cVo.setName(rs.getString("name"));
					cVo.setEmail(rs.getString("email"));
					cVo.setAddress(rs.getString("address"));
					cVo.setPhone(rs.getString("phone"));
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				DBManager.close(conn, pstmt, rs);
			}
			return cVo;
		}

		public void insertClient(clientVO cVo) {
			
			String sql = "insert into client values(?,?,?,?,?,?)";
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			
			try {
				conn = DBManager.getConnection();
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, cVo.getId());
				pstmt.setString(2, cVo.getPw());
				pstmt.setString(3, cVo.getName());
				pstmt.setString(4, cVo.getEmail());
				pstmt.setString(5, cVo.getAddress());
				pstmt.setString(6, cVo.getPhone());
				
				pstmt.executeUpdate();//쿼리문 실행
				
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				DBManager.close(conn, pstmt);
			}
			
		}
		public void updateClient(String id, clientVO cVo2) {

			String sql = "update client set pw=?, email=?, address=?, phone=? where id=?";

			Connection conn = null;
			PreparedStatement pstmt = null;

			try {
				conn = DBManager.getConnection();
				pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, cVo2.getPw());
				pstmt.setString(2, cVo2.getEmail());
				pstmt.setString(3, cVo2.getAddress());
				pstmt.setString(4, cVo2.getPhone());
				pstmt.setString(5, id);

				pstmt.executeUpdate();// 쿼리문 실행

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				DBManager.close(conn, pstmt);
			}

		}

		public List<clientVO> selectAllclients() {
			String sql = "select * from client";

			List<clientVO> list = new ArrayList<clientVO>();

			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try {
				conn = DBManager.getConnection();
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery(sql);

				while (rs.next()) {
					clientVO cVo = new clientVO();
					// bVo의 setter에 값세팅 (rs가 타입변환 시켜줌)
					cVo.setId(rs.getString("id"));
					cVo.setName(rs.getString("name"));

					list.add(cVo);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				DBManager.close(conn, pstmt, rs);
			}
			return list;
		}

		public clientVO selectOneclient(String id) {

			String sql = "select * from client where id=?";
			
			clientVO cVO= null;
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try {
				conn = DBManager.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);

				rs = pstmt.executeQuery();

				while (rs.next()) {
					 cVO = new clientVO();

					cVO.setId(rs.getString("id"));
					cVO.setPw(rs.getString("pw"));
					cVO.setName(rs.getString("name"));
					cVO.setEmail(rs.getString("email"));
					cVO.setAddress(rs.getString("address"));
					cVO.setPhone(rs.getString("phone"));
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				DBManager.close(conn, pstmt, rs);
			}
			return cVO;
		

		}
		
}
