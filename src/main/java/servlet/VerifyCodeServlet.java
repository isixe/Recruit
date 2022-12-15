package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.VerifyCode;

import java.awt.image.BufferedImage;
import java.io.IOException;

@WebServlet(name = "VerifyCodeServlet", value = "/VerifyCodeServlet")
public class VerifyCodeServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //创建验证码类
        VerifyCode vc = new VerifyCode();
        // 获取随机图片
        BufferedImage image = vc.getImage();
        //保存图片上的文本到session域中
        request.getSession().setAttribute("vCode", vc.getText());
        //把图片响应给客户端
        VerifyCode.output(image, response.getOutputStream());
    }
}