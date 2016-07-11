package Controller;

import Model.Clasess.Producto;
import Model.*;
import java.io.IOException;
import java.util.Calendar;
import java.util.GregorianCalendar;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class RegistarProducto extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            Calendar fecha = new GregorianCalendar();
            String date = fecha.get(Calendar.YEAR)+"-"+fecha.get(Calendar.MONTH)+"-"+fecha.get(Calendar.DAY_OF_MONTH);
            Producto product = new Producto();
            product.setNombre(request.getParameter("nombrep"));
            product.setDescripcion(request.getParameter("descrip"));
            product.setProveedor(request.getParameter("provedorp"));
            product.setCosto(new Float(request.getParameter("costop")));
            product.setPrecio(new Float(request.getParameter("preciop")));
            product.setExistencia(new Integer(request.getParameter("existenciap")));
            product.setTipo(request.getParameter("tipop"));
            product.setUnidad(request.getParameter("unidadp"));
            product.setFechMod(date);
            ProductQueries insert = new ProductQueries();
            insert.insertProduct(product);
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
