
package Controller;

import Model.Clasess.Producto;
import Model.ProductQueries;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ActualizarProducto extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Producto product = new Producto();
            product.setProducto_id(new Integer(request.getParameter("id")));
            product.setNombre(request.getParameter("nombre"));
            product.setDescripcion(request.getParameter("descrip"));
            product.setCosto(new Float(request.getParameter("costo")));
            product.setPrecio(new Float(request.getParameter("precio")));
            product.setProveedor(request.getParameter("prove"));
            product.setExistencia(new Integer(request.getParameter("exist")));
            product.setTipo(request.getParameter("tipo"));
            product.setUnidad(request.getParameter("unidad"));
            product.setUsrMod(1);
            product.setFechMod("2016-07-10");         
            ProductQueries query = new ProductQueries();
            query.updateProduct(product);
            
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