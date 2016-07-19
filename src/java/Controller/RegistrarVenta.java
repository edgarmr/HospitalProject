package Controller;

import Model.*;
import Model.Classes.Venta;
import java.text.SimpleDateFormat;
import java.util.*;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.print.Doc;
import javax.print.DocFlavor;
import javax.print.DocPrintJob;
import javax.print.PrintException;
import javax.print.PrintService;
import javax.print.PrintServiceLookup;
import javax.print.SimpleDoc;
import javax.print.attribute.HashPrintRequestAttributeSet;
import javax.print.attribute.PrintRequestAttributeSet;
import javax.print.attribute.standard.Copies;
import javax.print.attribute.standard.MediaSizeName;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class RegistrarVenta extends HttpServlet {

    Conexion bd = new Conexion();
    Connection conn = bd.Conexion();
    Venta sale = new Venta();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        HttpSession sesion = request.getSession();
        int usrAlta = new Integer(sesion.getAttribute("idSesion").toString());
        Calendar fecha = new GregorianCalendar();
        String date = fecha.get(Calendar.YEAR) + "-" + fecha.get(Calendar.MONTH) + "-" + fecha.get(Calendar.DAY_OF_MONTH);
        sale.setProd_id(new Integer(request.getParameter("prod")));
        String query = "SELECT * FROM productos WHERE producto_id=" + sale.getProd_id();
        PreparedStatement pstmt = conn.prepareStatement(query);
        ResultSet rs = pstmt.executeQuery();
        if (rs.next()) {
            float price = rs.getFloat(5);
            sale.setPrecio(price);
        }
        sale.setPaciente_id(new Integer(request.getParameter("paciente")));
        sale.setCantidad(new Float(request.getParameter("cant")));
        sale.setIva(new Float(request.getParameter("iva")));
        sale.setSubtotal(sale.getCantidad() * sale.getPrecio());
        sale.setTotal(sale.getCantidad() * sale.getPrecio() * sale.getIva());
        sale.setImporte(sale.getTotal());
        sale.setLugar(request.getParameter("lugar"));
        sale.setForma_pago(request.getParameter("pago"));
        sale.setUsrA(usrAlta);
        sale.setUsrM(usrAlta);
        sale.setFechaM(date);
        SaleQueries insert = new SaleQueries();
        insert.insertSale(sale);

        String query2 = "SELECT venta_id FROM cotizacion ORDER BY venta_id DESC LIMIT 1";
        PreparedStatement pstmt2 = conn.prepareStatement(query2);
        ResultSet rs2 = pstmt2.executeQuery();
        if (rs2.next()) {
            int venta_id = rs2.getInt(1);
            sale.setVenta_id(venta_id);
        }
        insert.insertDetail(sale);
        hacer_ticket();
        imprimir_ticket();
        conn.close();
        response.sendRedirect("AltaCotizaciones.jsp");
    }

    protected void hacer_ticket() throws SQLException, IOException {
        try {
            String carpeta = "C:\\Users\\Edgar\\Documents\\NetBeansProjects";
            FileWriter fw = new FileWriter(carpeta + "/ticket.txt", false);
            //System.out.println(fw);
            PrintWriter pw = new PrintWriter(fw);
            //System.out.println(pw);
            //CREACIÓN DEL TICKET
            Date date = new Date();
            String paciente_name = null;
            String vendedor_name = null;
            String prod_name = null;
            SimpleDateFormat fecha = new SimpleDateFormat("dd/MM/yyyy");
            SimpleDateFormat hora = new SimpleDateFormat("hh:mm:ss aa");
            pw.println("--------HOSPITAL  MEXICO--------");
            pw.println("EXPEDIDO EN: " + sale.getLugar());
            pw.println(DibujarLinea(32));
            pw.println("PACIENTE:");
            String query = "SELECT nombre,apPaterno,apMaterno FROM pacientes WHERE paciente_id=" + sale.getPaciente_id();
            PreparedStatement pstmt = conn.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                paciente_name = rs.getString(1) + " " + rs.getString(2) + " " + rs.getString(3);
            }
            pw.println(paciente_name);
            pw.println("Caja #1 - Ticket #" + String.valueOf(sale.getVenta_id()));
            String query2 = "SELECT nombre,apPaterno FROM usuarios WHERE usuario_id=" + sale.getUsrA();
            PreparedStatement pstmt2 = conn.prepareStatement(query2);
            ResultSet rs2 = pstmt2.executeQuery();
            if (rs2.next()) {
                vendedor_name = rs2.getString(1) + " " + rs2.getString(2);
            }
            pw.println("LE ATENDIO: " + vendedor_name);
            pw.println("" + fecha.format(date) + " " + hora.format(date));
            pw.println(DibujarLinea(32));
            String query3 = "SELECT nombre FROM productos WHERE producto_id=" + sale.getProd_id();
            PreparedStatement pstmt3 = conn.prepareStatement(query3);
            ResultSet rs3 = pstmt3.executeQuery();
            if (rs3.next()) {
                prod_name = rs3.getString(1);
            }
            pw.println("Cantidad|Producto\t|Precio");
            pw.println(String.valueOf(sale.getCantidad()) + "\t|" + prod_name + "\t|" + String.valueOf(sale.getPrecio()));
            pw.println(DibujarLinea(32));
            pw.println("Forma de pago:\t" + sale.getForma_pago());
            pw.println("SUBTOTAL:\t$" + String.valueOf(sale.getSubtotal()));
            pw.println("IVA:\t\t16%");
            pw.println("TOTAL:\t\t$" + String.valueOf(sale.getTotal()));
            pw.println(DibujarLinea(32));
            pw.println("LA SALUD ES NUESTRA PASION...");
            pw.println("Gracias por su visita");
            pw.close();
            fw.close();
        } catch (IOException e) {
            System.out.println(e.toString());
        }
    }

    public static String DibujarLinea(int valor) {
        String raya = "";
        for (int x = 0; x < valor; x++) {
            raya += "=";
        }
        return raya;
    }

    protected void imprimir_ticket() {
        String file = "C:\\Users\\Edgar\\Documents\\NetBeansProjects\\ticket.txt";
        DocFlavor docFlavor = new DocFlavor.INPUT_STREAM("application/octet-stream");
        PrintRequestAttributeSet aset = new HashPrintRequestAttributeSet();
        aset.add(MediaSizeName.ISO_A7);
        aset.add(new Copies(1));
        PrintService service = PrintServiceLookup.lookupDefaultPrintService();
        Doc docPrint;
        try {
            docPrint = new SimpleDoc(new FileInputStream(file), docFlavor, null);
        } catch (FileNotFoundException e1) {
            e1.printStackTrace();
            return;
        }
        DocPrintJob printJob = service.createPrintJob();
        try {
            printJob.print(docPrint, aset);
        } catch (PrintException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);

        } catch (SQLException ex) {
            Logger.getLogger(RegistrarVenta.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);

        } catch (SQLException ex) {
            Logger.getLogger(RegistrarVenta.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
