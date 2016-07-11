package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class QueryLogin {
    private Connection c;

    public QueryLogin() {
        Conexion obj = new Conexion();
        c = obj.Conexion();
    }

    public ResultSet Consultar(String Cad) {
        try {
            PreparedStatement st = c.prepareStatement(Cad);
            ResultSet tbl = st.executeQuery();
            return tbl;
        } catch (SQLException e) {
            System.err.println(e.toString());
            return null;
        }
    }
}
