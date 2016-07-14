package Controller;

import Model.Classes.Producto;
import Model.*;
import java.io.IOException;
import java.util.Calendar;
import java.util.GregorianCalendar;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class RegistrarProducto extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession sesion = request.getSession(true);
        int usrAlta = new Integer(sesion.getAttribute("idSesion").toString());
        Calendar fecha = new GregorianCalendar();
        String date = fecha.get(Calendar.YEAR) + "-" + fecha.get(Calendar.MONTH) + "-" + fecha.get(Calendar.DAY_OF_MONTH);
        Producto product = new Producto();
        product.setNombre(request.getParameter("nombrep"));
        product.setDescripcion(request.getParameter("descrip"));
        product.setProveedor(request.getParameter("provedorp"));
        product.setCosto(new Float(request.getParameter("costop")));
        product.setPrecio(new Float(request.getParameter("preciop")));
        product.setExistencia(new Integer(request.getParameter("existenciap")));
        product.setTipo(request.getParameter("tipop"));
        product.setUnidad(request.getParameter("unidadp"));
        product.setUsrAlta(usrAlta);
        product.setUsrMod(usrAlta);
        product.setFechMod(date);
        ProductQueries insert = new ProductQueries();
        insert.insertProduct(product);
        response.sendRedirect("Menu.jsp");
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
