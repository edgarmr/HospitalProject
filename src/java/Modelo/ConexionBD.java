package Modelo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ConexionBD {

    Connection connection = null;

    public Connection Conexion() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/clinica_v1", "root", "");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return connection;
    }

    public void Insertar(String Cad) {
        try {
            Conexion();
            PreparedStatement st = connection.prepareStatement(Cad);
            int tbl = st.executeUpdate(Cad);
        } catch (SQLException e) {
            System.err.println(e.toString());
        }
    }

    public ResultSet Listar(String Cad) {
        try {
            Conexion();
            PreparedStatement st = connection.prepareStatement(Cad);
            ResultSet tbl = st.executeQuery();
            return tbl;
        } catch (SQLException e) {
            System.err.println(e.toString());
            return null;
        }
    }
}
