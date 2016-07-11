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
            //response.getWriter().write(username+"       ");
            //String password = (request.getParameter("password"));
            String encripted = (request.getParameter("ncodif"));
            response.getWriter().write(encripted);
            try {
                QueryLogin obj = new QueryLogin();
                String query = "SELECT * FROM usuarios where usrLogin='" + username + "'";
                ResultSet rs = obj.Consultar(query);
                if (rs.next() == true) {
                    String pass = rs.getString("usrPassword");
                    if (pass.equals(encripted)) {
                        HttpSession sesion = request.getSession(true);
                        int id = rs.getInt("usuario_id");
                        sesion.setAttribute("idSesion", id);
                        long fechaCreacion = sesion.getCreationTime();
                        long ultimoAcceso = sesion.getLastAccessedTime();
                        //out.println(sesion.getAttribute("idSesion"));
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

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
