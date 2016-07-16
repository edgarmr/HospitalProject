package Model;

import Model.Classes.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserQueries {
    private Connection conn;
    private PreparedStatement pstmt = null;
    private ResultSet rs;
    private String sqlInsert;
    private String sqlSelect;
    private String sqlUpdate;
    private String sqlDelete;

    public UserQueries() {
        Conexion bd = new Conexion();
        conn = bd.Conexion();
        sqlInsert = "INSERT INTO "
                + "usuarios(nombre,apPaterno,apMaterno,usrLogin,usrPassword ,usrRol,usrUsrAlta,usrUsrMod,usrFechMod)"
                + "VALUES(?,?,?,?,?,?,?,?,?)";
    }

    public void insertUser(Usuario u) {
        try {
            pstmt = conn.prepareStatement(sqlInsert);
            pstmt.setString(1, u.getName());
            pstmt.setString(2, u.getApeP());
            pstmt.setString(3, u.getApeM());
            pstmt.setString(4, u.getLogin());
            pstmt.setString(5, u.getPass());
            //pstmt.setString(6, u.getStatus());
            pstmt.setString(6, u.getRol());
            pstmt.setInt(7, u.getUsrA());
            //pstmt.setString(9, u.getFechaA());
            pstmt.setInt(8, u.getUsrM());
            pstmt.setString(9, u.getFechaM());
            pstmt.executeUpdate();
            conn.close();
            System.out.println("¡Inserción exitosa!");
        } catch (SQLException ex) {
            System.err.println(ex.toString());
        }
    }

    public Usuario[] getUsuarios() {
        Usuario[] listUsr = null;
        sqlSelect = "SELECT COUNT(usuario_id) FROM usuarios WHERE usrStatus='Activo'";
        try {
            pstmt = conn.prepareStatement(sqlSelect);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                listUsr = new Usuario[rs.getInt(1)];
                System.out.println("Número de filas " + rs.getInt(1));
            }
            sqlSelect = "SELECT usuario_id,nombre,apPaterno,apMaterno,usrLogin,usrPassword,usrRol FROM usuarios WHERE usrStatus='Activo'";
            pstmt = conn.prepareStatement(sqlSelect);
            rs = pstmt.executeQuery();
            int i = 0;
            while (rs.next()) {
                listUsr[i] = new Usuario();
                listUsr[i].setId(rs.getInt(1));
                listUsr[i].setName(rs.getString(2));
                listUsr[i].setApeP(rs.getString(3));
                listUsr[i].setApeM(rs.getString(4));
                listUsr[i].setLogin(rs.getString(5));
                listUsr[i].setPass(rs.getString(6));
                listUsr[i].setRol(rs.getString(7));
                i++;
            }
        } catch (SQLException ex) {
            System.err.println(ex.toString());
        }
        return listUsr;
    }

    public void updateUser(Usuario u) {
        sqlUpdate = "UPDATE usuarios\n"
                + "                     SET nombre = '" + u.getName()+ "',\n"
                + "                     apPaterno = '" + u.getApeP()+ "',\n"
                + "                     apMaterno = '" + u.getApeM()+ "',\n"
                + "                     usrLogin = '" + u.getLogin()+ "',\n"
                //+ "                     usrPassword = '" + u.getPass() + "',\n"
                + "                     usrRol = '" + u.getRol() + "',\n"
                //+ "                     usrStatus = '" + u.getStatus() + "',\n"
                + "                     usrUsrMod = " + u.getUsrM() + ",\n"
                + "                     usrFechMod = '" + u.getFechaM() + "'\n"
                + "                     WHERE usuario_id = " + u.getId();
        try {
            pstmt = conn.prepareStatement(sqlUpdate);
            pstmt.executeUpdate();
            System.out.println("Actualización exitosa");
        } catch (SQLException ex) {
            System.err.println(ex.toString());
        }
    }

    public void deleteUser(int id) {
        sqlDelete = "UPDATE usuarios SET usrStatus='Inactivo' WHERE usuario_id=" + id;
        try {
            pstmt = conn.prepareStatement(sqlDelete);
            pstmt.executeUpdate();
            System.out.println("Eliminación Exitosa");
        } catch (SQLException ex) {
            System.err.println(ex.toString());
        }
    }
}