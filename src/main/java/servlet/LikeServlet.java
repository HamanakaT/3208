package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LikeServlet")
public class LikeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String articleId = request.getParameter("articleId");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/your_database", "username", "password");

            String sql = "UPDATE articles SET likes = likes + 1 WHERE id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, articleId);

            ps.executeUpdate();

            ps.close();
            con.close();

            //response.sendRedirect("/"); // 元のページにリダイレクト出来る方法かもしれなため残してる
            //下のが元ページにリダイレクト出来る方法。詳しくはLoginPageServlet参照
            RequestDispatcher dispatcher = request.getRequestDispatcher("./WEB-INF/jsp/login.jsp");
    		dispatcher.forward(request, response);
    		//適当
    		
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
