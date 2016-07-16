
package Model;

import Model.Classes.Paciente;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class PacienteQueries {
    private Connection conn;
    private PreparedStatement pstmt = null;
    private ResultSet rs;
    private String sqlInsert;
    private String sqlSelect;
    private String sqlUpdate;
    private String sqlDelete;
    
    public PacienteQueries(){
        Conexion bd = new Conexion();
        conn = bd.Conexion();
        sqlInsert ="INSERT INTO pacientes(nombre,apPaterno,apMaterno,FechNac,"
                  +"telefono,direccion,municipio,estado,correo,pDiabetes,"
                  +"pCancer,pRenales,pAutoinmu,pMuscEsq,pHas,pCardiopatias,"
                  +"pTiroides,pEmbolias,pOtros,pTabaq,pTaxicom,pAlergias,"
                  +"pAlcohol,pCirujias,pFract,pTransfu,pUsrAlta,pUsrMod,pFechMod)"
                + "VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
    }
    
    public void insertPaciente(Paciente p){       
        try{
            pstmt = conn.prepareStatement(sqlInsert);
            pstmt.setString(1, p.getNombre());
            pstmt.setString(2, p.getApPaterno());
            pstmt.setString(3, p.getApMaterno());
            pstmt.setString(4, p.getFechNac());
            pstmt.setString(5, p.getTelefono());
            pstmt.setString(6, p.getDireccion());
            pstmt.setString(7, p.getMunicipio());
            pstmt.setString(8, p.getEstado());
            pstmt.setString(9, p.getCorreo());
            pstmt.setString(10, p.getDiabetes());
            pstmt.setString(11, p.getCancer());
            pstmt.setString(12, p.getRenales());
            pstmt.setString(13, p.getAutoinmunes());
            pstmt.setString(14, p.getMuscEsq());
            pstmt.setString(15, p.getHas());
            pstmt.setString(16, p.getCardiopatias());
            pstmt.setString(17, p.getTiroides());
            pstmt.setString(18, p.getEmbolias());
            pstmt.setString(19, p.getOtros());
            pstmt.setString(20, p.getTabaqu());
            pstmt.setString(21, p.getTaxicom());
            pstmt.setString(22, p.getAlergias());
            pstmt.setString(23, p.getAlcohol());
            pstmt.setString(24, p.getCirujias());
            pstmt.setString(25, p.getFract());
            pstmt.setString(26, p.getTransfu());
            pstmt.setInt(27, 1);
            pstmt.setInt(28, 1);
            pstmt.setString(29,"");
            pstmt.executeUpdate();
            conn.close();
        }catch(SQLException ex){
            System.err.println(ex.toString());
        }
    }
}
