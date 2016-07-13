package Model;
import Model.Classes.Producto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class ProductQueries {
    private Connection conn;
    private PreparedStatement pstmt = null;
    private ResultSet rs;
    private String sqlInsert;
    private String sqlSelect;
    private String sqlUpdate;
    private String sqlDelete;
    
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
            pstmt.setInt(9,p.getUsrAlta());
            pstmt.setInt(10,p.getUsrMod());
            pstmt.setString(11,p.getFechMod());
            pstmt.executeUpdate();
            conn.close();
            System.out.println("¡Insercion exitosa!");
        }catch(SQLException ex){
            System.err.println(ex.toString());
        }
    }
    
    public Producto[] getProductos(){
        Producto []listPro = null;
        sqlSelect = "SELECT COUNT(producto_id) FROM productos WHERE proStatus='Activo'";
        try{
            pstmt = conn.prepareStatement(sqlSelect);
            rs = pstmt.executeQuery();
            if(rs.next()){
                listPro = new Producto[rs.getInt(1)];
                System.out.println("Numero de filas "+rs.getInt(1));
            }
            sqlSelect = "SELECT * FROM productos WHERE proStatus='Activo'";
            pstmt = conn.prepareStatement(sqlSelect);
            rs = pstmt.executeQuery();
            int i=0;
            while(rs.next()){
                listPro[i] = new Producto();
                listPro[i].setProducto_id(rs.getInt(1));
                listPro[i].setNombre(rs.getString(2));
                listPro[i].setDescripcion(rs.getString(3));
                listPro[i].setCosto(rs.getFloat(4));
                listPro[i].setPrecio(rs.getFloat(5));
                listPro[i].setProveedor(rs.getString(6));
                listPro[i].setExistencia(rs.getInt(7));
                listPro[i].setTipo(rs.getString(8));
                listPro[i].setUnidad(rs.getString(9));
                i++;
            }
        }catch(SQLException ex){
            System.err.println(ex.toString());
        }
        return listPro;
    }
    
    public void updateProduct(Producto p){
        sqlUpdate = "UPDATE productos\n" +
"                     SET nombre = '"+p.getNombre()+"',\n" +
"                     descripcion = '"+p.getDescripcion()+"',\n" +
"                     costo = "+p.getCosto()+",\n" +
"                     precio = "+p.getPrecio()+",\n" +
"                     proveedor = '"+p.getProveedor()+"',\n" +
"                     existencia = "+p.getExistencia()+",\n" +
"                     tipo = '"+p.getTipo()+"',\n" +
"                     unidad = '"+p.getUnidad()+"',\n" +
"                     proUsrMod = "+p.getUsrMod()+",\n" +
"                     proFechMod = '"+p.getFechMod()+"'\n" +
"                     WHERE producto_id = "+p.getProducto_id();
        try{
            pstmt = conn.prepareStatement(sqlUpdate);
            pstmt.executeUpdate();
            System.out.println("Actualización exitosa");
        }catch(SQLException ex){
            ex.printStackTrace();
        }
    }
    
    public void deleteProduct(int id){
        sqlDelete = "UPDATE productos SET proStatus='Inactivo' WHERE producto_id="+id;
        try{
            pstmt = conn.prepareStatement(sqlDelete);
            pstmt.executeUpdate();
            System.out.println("Eliminación Exitosa");
        }catch(SQLException ex){
            System.err.println(ex.toString());
        }
    }
}
