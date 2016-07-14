package Controller;

import Model.Classes.Usuario;
import Model.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.GregorianCalendar;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class RegistrarUsuario extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {
            HttpSession sesion = request.getSession();
            int usrAlta = new Integer(sesion.getAttribute("idSesion").toString());
            Calendar fecha = new GregorianCalendar();
            String date = fecha.get(Calendar.YEAR) + "-" + fecha.get(Calendar.MONTH) + "-" + fecha.get(Calendar.DAY_OF_MONTH);
            Usuario user = new Usuario();
            user.setName(request.getParameter("nname"));
            user.setApeP(request.getParameter("napeP"));
            user.setApeM(request.getParameter("napeM"));
            user.setLogin(request.getParameter("nuser"));
            user.setPass(request.getParameter("ncodif"));
            user.setRol(request.getParameter("nrol"));
            user.setUsrA(usrAlta);
            user.setUsrM(usrAlta);
            user.setFechaM(date);
            UserQueries insertar = new UserQueries();
            insertar.insertUser(user);
        }
        //response.sendRedirect("Menu.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
