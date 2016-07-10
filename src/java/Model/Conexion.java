package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {
    private Connection conex = null;

    public Connection Conexion() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conex = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/clinica_v1","root","");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return conex;
    }
}
