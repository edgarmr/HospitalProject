/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;
import Model.Classes.Paciente;
import Model.PacienteQueries;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.GregorianCalendar;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class RegistrarPaciente extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession sesion = request.getSession(true);
        int usrAlta = new Integer(sesion.getAttribute("idSesion").toString());
        Calendar fecha = new GregorianCalendar();
        String date = fecha.get(Calendar.YEAR) + "-" + fecha.get(Calendar.MONTH) + "-" + fecha.get(Calendar.DAY_OF_MONTH);
        Paciente p = new Paciente();
        
        p.setNombre(request.getParameter("nombre"));
        p.setApPaterno(request.getParameter("apellidop"));
        p.setApMaterno(request.getParameter("apellidom"));
        p.setFechNac(request.getParameter("fechaNac"));
        p.setTelefono(request.getParameter("telefono"));
        p.setDireccion(request.getParameter("direccion"));
        p.setCorreo(request.getParameter("correo"));
        p.setEstado(request.getParameter("estado"));
        p.setMunicipio(request.getParameter("municipio"));
        p.setDiabetes(request.getParameter("diabetes"));
        p.setHas(request.getParameter("has"));
        p.setCancer(request.getParameter("cancer"));
        p.setCardiopatias(request.getParameter("cardiopatia"));
        p.setRenales(request.getParameter("enf_renales"));
        p.setTiroides(request.getParameter("tiroides"));
        p.setAutoinmunes(request.getParameter("enf_autoinmunes"));
        p.setEmbolias(request.getParameter("embolias"));
        p.setMuscEsq(request.getParameter("musculoesqueleticas"));
        p.setOtros(request.getParameter("otras"));
        p.setCirujias(request.getParameter("cirugias"));
        p.setFract(request.getParameter("fracturas"));
        p.setTransfu(request.getParameter("transfusiones"));
        p.setTabaqu(request.getParameter("tabaquismo"));
        p.setAlergias(request.getParameter("alergias"));
        p.setTaxicom(request.getParameter("toxicomanias"));
        p.setAlcohol(request.getParameter("alcoholismo"));
        p.setAnio(request.getParameter("aniodx"));
        p.setNombreEnfCro(request.getParameter("enf_cro"));
        p.setTratamiento(request.getParameter("tratamiento"));
        p.setUsrAlta(usrAlta);
        p.setUsrMod(usrAlta);
        p.setFechMod(date);
        System.out.println(new StringBuilder(date).reverse().toString());
        
        PacienteQueries query = new PacienteQueries();
        query.insertPaciente(p);
        
        
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
