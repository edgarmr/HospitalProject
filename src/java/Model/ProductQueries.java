package Model;
import Model.Clasess.Producto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


public class ProductQueries {
    private Connection conn;
    private PreparedStatement pstmt = null;
    private String sqlInsert;
    
    public ProductQueries(){
        Conexion bd = new Conexion();
        conn = bd.Conexion();
        sqlInsert="INSERT INTO "
                + "productos(nombre,descripcion,costo,precio,proveedor,existencia,tipo,unidad,proUsrAlta,proUsrMod,proFechMod)"
                + "VALUES(?,?,?,?,?,?,?,?,?,?,?)";
                
    }
    
    public void insertProduct(Producto p){
        try{
            pstmt = conn.prepareStatement(sqlInsert);
        }catch(SQLException ex){
            System.err.println(ex.toString());
        }
    }
}
