
package Model;

import Model.Classes.Paciente;
import Model.Classes.Producto;
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
                  +"pAlcohol,pCirujias,pFract,pTransfu,anoDiag,enferCro,tratamAct,pUsrAlta,pUsrMod,pFechMod)"
                + "VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
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
            pstmt.setString(27,p.getAnio());
            pstmt.setString(28,p.getNombreEnfCro());
            pstmt.setString(29,p.getTratamiento());
            pstmt.setInt(30,p.getUsrAlta());
            pstmt.setInt(31, p.getUsrMod());
            pstmt.setString(32,p.getFechMod());
            pstmt.executeUpdate();
            System.out.println("¡Insercion exitosa!");
            conn.close();
        }catch(SQLException ex){
            System.err.println(ex.toString());
        }
    }
    
    public Paciente[] getPacientes(){
        Paciente []listPac = null;
        sqlSelect = "SELECT COUNT(paciente_id) FROM pacientes WHERE pStatus='Activo'";
        try{
            pstmt = conn.prepareStatement(sqlSelect);
            rs = pstmt.executeQuery();
            if(rs.next()){
                listPac = new Paciente[rs.getInt(1)];
                System.out.println("Numero de filas "+rs.getInt(1));
            }
            sqlSelect = "SELECT paciente_id, nombre, apPaterno, apMaterno, pFechAlta FROM pacientes WHERE pStatus='Activo'";
            pstmt = conn.prepareStatement(sqlSelect);
            rs = pstmt.executeQuery();
            int i=0;
            while(rs.next()){
                listPac[i] = new Paciente();
                listPac[i].setPaciente_id(rs.getInt(1));
                listPac[i].setNombre(rs.getString(2));
                listPac[i].setApPaterno(rs.getString(3));
                listPac[i].setApMaterno(rs.getString(4));
                listPac[i].setFechAlta(rs.getString(5));
                i++;
            }
            conn.close();
        }catch(SQLException ex){
            System.err.println(ex.toString());
        }
        return listPac;
    }
    
    public Paciente getExpediente(int id){
        Paciente paciente = new Paciente();
        sqlSelect = "SELECT * FROM pacientes WHERE pStatus='Activo' AND paciente_id="+id;
        try{
            pstmt = conn.prepareStatement(sqlSelect);
            rs = pstmt.executeQuery();
            
            if(rs.next()){
                paciente.setPaciente_id(rs.getInt(1));
                paciente.setNombre(rs.getString(2));
                paciente.setApPaterno(rs.getString(3));
                paciente.setApMaterno(rs.getString(4));
                paciente.setFechNac(rs.getString(5));
                paciente.setTelefono(rs.getString(6));
                paciente.setDireccion(rs.getString(7));
                paciente.setMunicipio(rs.getString(8));
                paciente.setEstado(rs.getString(9));
                paciente.setCorreo(rs.getString(10));
                paciente.setDiabetes(rs.getString(11));
                paciente.setCancer(rs.getString(12));
                paciente.setRenales(rs.getString(13));
                paciente.setAutoinmunes(rs.getString(14));
                paciente.setMuscEsq(rs.getString(15));
                paciente.setHas(rs.getString(16));
                paciente.setCardiopatias(rs.getString(17));
                paciente.setTiroides(rs.getString(18));
                paciente.setEmbolias(rs.getString(19));
                paciente.setOtros(rs.getString(20));
                paciente.setTabaqu(rs.getString(21));
                paciente.setTaxicom(rs.getString(22));
                paciente.setAlergias(rs.getString(23));
                paciente.setAlcohol(rs.getString(24));
                paciente.setCirujias(rs.getString(25));
                paciente.setFract(rs.getString(26));
                paciente.setTransfu(rs.getString(27));
                paciente.setAnio(rs.getString(28));
                paciente.setNombreEnfCro(rs.getString(29));
                paciente.setTratamiento(rs.getString(30));
                System.out.println("¡Consulta Exitosa!");
            }
        }catch(SQLException ex){
            System.err.println(ex.toString());
        }
        return paciente;
    }
    
    public void deletePaciente(int id){
        sqlDelete = "UPDATE pacientes SET pStatus='Inactivo' WHERE paciente_id="+id;
        try{
            pstmt = conn.prepareStatement(sqlDelete);
            pstmt.executeUpdate();
            System.out.println("Eliminación Exitosa");
        }catch(SQLException ex){
            System.err.println(ex.toString());
        }
    }
    
    public void updatePaciente(Paciente p){
                sqlUpdate = "UPDATE pacientes\n" +
"                     SET nombre = '"+p.getNombre()+"',\n" +
"                     apPaterno = '"+p.getApPaterno()+"',\n" +
"                     apMaterno = '"+p.getApMaterno()+"',\n" +
"                     FechNac = '"+p.getFechNac()+"',\n" +
"                     telefono = '"+p.getTelefono()+"',\n" +
"                     direccion = '"+p.getDireccion()+"',\n" +
"                     municipio = '"+p.getMunicipio()+"',\n" +
"                     estado = '"+p.getEstado()+"',\n" +
"                     correo = '"+p.getCorreo()+"',\n" +
"                     pDiabetes = '"+p.getDiabetes()+"', \n" +
"                     pCancer = '"+p.getCancer()+"', \n" +
"                     pRenales = '"+p.getRenales()+"', \n" +
"                     pAutoinmu = '"+p.getAutoinmunes()+"', \n" +
"                     pMuscEsq = '"+p.getMuscEsq()+"', \n" +
"                     pHas = '"+p.getHas()+"', \n" +
"                     pCardioPatias = '"+p.getCardiopatias()+"', \n" +
"                     pTiroides = '"+p.getTiroides()+"', \n" +
"                     pEmbolias = '"+p.getEmbolias()+"', \n" +
"                     pOtros = '"+p.getOtros()+"', \n" +
"                     pTabaq = '"+p.getTabaqu()+"', \n" +
"                     pTaxicom = '"+p.getTaxicom()+"', \n" +
"                     pAlergias = '"+p.getAlergias()+"', \n" +
"                     pAlcohol = '"+p.getAlcohol()+"', \n" +
"                     pCirujias = '"+p.getCirujias()+"', \n" +
"                     pFract = '"+p.getFract()+"', \n" +
"                     pTransfu = '"+p.getTransfu()+"', \n" +
"                     anoDiag = '"+p.getAnio()+"', \n" +
"                     enferCro = '"+p.getNombreEnfCro()+"', \n" +
"                     tratamAct = '"+p.getTratamiento()+"', \n" +
"                     pUsrMod = "+p.getUsrMod()+", \n" +
"                     pFechMod = '"+p.getFechMod()+"' \n" +
"                     WHERE paciente_id = "+p.getPaciente_id();
        try{
            pstmt = conn.prepareStatement(sqlUpdate);
            pstmt.executeUpdate();
            System.out.println("Actualización exitosa");
        }catch(SQLException ex){
            ex.printStackTrace();
        }
    }
}
