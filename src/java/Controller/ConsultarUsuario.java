package Controller;

import Model.Classes.Usuario;
import Model.UserQueries;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ConsultarUsuario extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        UserQueries query = new UserQueries();
        Usuario[] usuarios = query.getUsuarios();
        //for (int i = 0; i < usuarios.length; i++) {
        //    System.out.println(usuarios[i].getName());
        //}
        request.setAttribute("listaUsr", usuarios);
        RequestDispatcher view = request.getRequestDispatcher("ListaUsuarios.jsp");
        view.forward(request, response);
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
