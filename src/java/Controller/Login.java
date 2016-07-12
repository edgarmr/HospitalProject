package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Model.QueryLogin;
import java.sql.ResultSet;

public class Login extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String username = request.getParameter("nuser");
            String encripted = (request.getParameter("ncodif"));
            try {
                QueryLogin obj = new QueryLogin();
                String query = "SELECT * FROM usuarios where usrLogin='" + username + "'";
                ResultSet rs = obj.Consultar(query);
                if (rs.next() == true) {
                    String pass = rs.getString("usrPassword");
                    if (pass.equals(encripted)) {
                        HttpSession sesion = request.getSession(true);
                        int id = rs.getInt("usuario_id");
                        String rol = rs.getString("usrRol");
                        sesion.setAttribute("idSesion", id);
                        sesion.setAttribute("rolSesion", rol);
                        //long fechaCreacion = sesion.getCreationTime();
                        //long ultimoAcceso = sesion.getLastAccessedTime();
                        response.getWriter().write("Correcto");
                    } else {
                        response.getWriter().write("Contraseña incorrecta");
                    }
                } else {
                    response.getWriter().write("Ese usuario no existe");
                }
            } catch (Exception e) {
                out.println(e.toString());
            }
        }
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
    }// </editor-fold>

}
