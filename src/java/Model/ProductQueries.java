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
            pstmt.setString(1,p.getNombre());
            pstmt.setString(2,p.getDescripcion());
            pstmt.setFloat(3,p.getCosto());
            pstmt.setFloat(4,p.getPrecio());
            pstmt.setString(5,p.getProveedor());
            pstmt.setInt(6,p.getExistencia());
            pstmt.setString(7,p.getTipo());
            pstmt.setString(8,p.getUnidad());
            //Aquí va la session del usuario.
            pstmt.setInt(9,1);
            pstmt.setInt(10,1);
            //
            pstmt.setString(11,p.getFechMod());
            pstmt.executeUpdate();
            conn.close();
            System.out.println("¡Insercion exitosa!");
        }catch(SQLException ex){
            System.err.println(ex.toString());
        }
    }
}
