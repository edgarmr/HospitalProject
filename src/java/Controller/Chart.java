package Controller;

import Model.Classes.Venta;
import Model.SaleQueries;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.data.general.DefaultPieDataset;

public class Chart extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SaleQueries query = new SaleQueries();
        Venta[] listaVentas = query.getVentas();
        DefaultPieDataset dataset = new DefaultPieDataset();
        for (Venta listaVenta : listaVentas) {
            dataset.setValue(listaVenta.getNombre() + "," + (String.valueOf((int) listaVenta.getCantidad())), (int) (listaVenta.getCantidad()));
        }
        JFreeChart grafica = ChartFactory.createPieChart(
                "Productos Vendidos", // El nombre de la gráfica 
                dataset); // El arreglo de datos 
        //true, // Indica si lleva leyenda 
        //true, // Indica si lleva tooltips 
        //false); // Indica si son URls 
        String dir = "C:\\Users\\Edgar\\Documents\\NetBeansProjects\\HospitalProject\\web\\img\\grafica.png";
        ChartUtilities.saveChartAsPNG(new File(dir), grafica, 650, 500);
        response.sendRedirect("Grafica.jsp");
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
