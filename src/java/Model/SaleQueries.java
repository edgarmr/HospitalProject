package Model;

import Model.Classes.Venta;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SaleQueries {

    private Connection conn;
    private PreparedStatement pstmt = null;
    private ResultSet rs;
    private String sqlInsert;
    private String sqlInsert2;
    private String sqlSelect;
    private String sqlUpdate;
    private String sqlDelete;

    public SaleQueries() {
        Conexion bd = new Conexion();
        conn = bd.Conexion();
        sqlInsert = "INSERT INTO "
                + "cotizacion(pacId,vtaSubtotal,vatTotal,vtaLugarExp,vtaFormaPago,vtaIva,usrAlta,vtaUsrMod,vtaFechMod)"
                + "VALUES(?,?,?,?,?,?,?,?,?)";
        sqlInsert2 = "INSERT INTO "
                + "detcotiza(producto_id,vtaId,dvtcantidad,dvtPrecio,dvtImporte)"
                + "VALUES(?,?,?,?,?)";
    }

    public void insertSale(Venta v) {
        try {
            pstmt = conn.prepareStatement(sqlInsert);
            pstmt.setInt(1, v.getPaciente_id());
            //pstmt.setString(2, v.getFecha());
            pstmt.setFloat(2, v.getSubtotal());
            pstmt.setFloat(3, v.getTotal());
            pstmt.setString(4, v.getLugar());
            pstmt.setString(5, v.getForma_pago());
            pstmt.setFloat(6, v.getIva());
            pstmt.setInt(7, v.getUsrA());
            //pstmt.setString(9, v.getFechaA());
            pstmt.setInt(8, v.getUsrM());
            pstmt.setString(9, v.getFechaM());
            pstmt.executeUpdate();
            //conn.close();
            //System.out.println("¡Inserción exitosa!");
        } catch (SQLException ex) {
            System.err.println(ex.toString());
        }
    }

    public void insertDetail(Venta v) {
        try {
            pstmt = conn.prepareStatement(sqlInsert2);
            pstmt.setInt(1, v.getProd_id());
            pstmt.setInt(2, v.getVenta_id());
            pstmt.setFloat(3, v.getCantidad());
            pstmt.setFloat(4, v.getPrecio());
            pstmt.setFloat(5, v.getImporte());
            pstmt.executeUpdate();
            conn.close();
            System.out.println("¡Inserción exitosa!");
        } catch (SQLException ex) {
            System.err.println(ex.toString());
        }
    }
    
    public Venta[] getVentas(){
        Venta []listVenta = null;
        sqlSelect = "SELECT COUNT(c.venta_id) FROM cotizacion c JOIN detcotiza dc ON c.venta_id=dc.vtaId";
        
        try{
            pstmt = conn.prepareStatement(sqlSelect);
            rs = pstmt.executeQuery();
            if(rs.next()){
                listVenta = new Venta[rs.getInt(1)];
                System.out.println("Numero de filas "+rs.getInt(1));
               
            }
            sqlSelect = "SELECT venta_id,vtaFecha,vtaSubtotal,vatTotal,vtaLugarExp,vtaFormaPago,dvtcantidad,p.nombre,p.precio "
                      + "FROM cotizacion c JOIN detcotiza dc ON c.venta_id=dc.vtaId JOIN productos p ON dc.producto_id=p.producto_id";
            pstmt = conn.prepareStatement(sqlSelect);
            rs = pstmt.executeQuery();
            int i=0;
            while(rs.next()){
                listVenta[i] = new Venta();
                
                listVenta[i].setVenta_id(rs.getInt(1));
                listVenta[i].setFecha(rs.getString(2));
                listVenta[i].setSubtotal(rs.getFloat(3));
                listVenta[i].setTotal(rs.getFloat(4));
                listVenta[i].setLugar(rs.getString(5));
                listVenta[i].setForma_pago(rs.getString(6));
                listVenta[i].setCantidad(rs.getInt(7));
                listVenta[i].setNombre(rs.getString(8));
                listVenta[i].setPrecio(rs.getFloat(9));
                        
                i++;
            }
        }catch(SQLException ex){
            System.err.println(ex.toString());
        }
        
        
        return listVenta;
    }
    
    public Venta[] getFilterVentas(String firstDate, String lastDate){
        Venta []listVenta = null;
        sqlSelect = "SELECT COUNT(*) FROM cotizacion c JOIN detcotiza dc ON c.venta_id=dc.vtaId WHERE DATE(vtaFecha) BETWEEN '"+firstDate+"' AND '"+lastDate+"'";
        
        try{
            pstmt = conn.prepareStatement(sqlSelect);
            rs = pstmt.executeQuery();
            if(rs.next()){
                listVenta = new Venta[rs.getInt(1)];
                System.out.println("Numero de filas "+rs.getInt(1));
               
            }
            sqlSelect = "SELECT venta_id,vtaFecha,vtaSubtotal,vatTotal,vtaLugarExp,vtaFormaPago,dvtcantidad,p.nombre,p.precio "
                      + "FROM cotizacion c JOIN detcotiza dc ON c.venta_id=dc.vtaId JOIN productos p ON dc.producto_id=p.producto_id WHERE DATE(vtaFecha) BETWEEN '"+firstDate+"' AND '"+lastDate+"'";
            pstmt = conn.prepareStatement(sqlSelect);
            rs = pstmt.executeQuery();
            int i=0;
            while(rs.next()){
                listVenta[i] = new Venta();
                
                listVenta[i].setVenta_id(rs.getInt(1));
                listVenta[i].setFecha(rs.getString(2));
                listVenta[i].setSubtotal(rs.getFloat(3));
                listVenta[i].setTotal(rs.getFloat(4));
                listVenta[i].setLugar(rs.getString(5));
                listVenta[i].setForma_pago(rs.getString(6));
                listVenta[i].setCantidad(rs.getInt(7));
                listVenta[i].setNombre(rs.getString(8));
                listVenta[i].setPrecio(rs.getFloat(9));
                        
                i++;
            }
        }catch(SQLException ex){
            System.err.println(ex.toString());
        }
        return listVenta;
    }
}
