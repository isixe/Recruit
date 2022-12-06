package bean;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class DB {
    private Connection conn;

    public Connection getConn() {
        return conn;
    }

    public DB(){
        try {
            Properties p = new Properties();
            String configFile = "config.properties";
            InputStream is = this.getClass().getClassLoader().getResourceAsStream(configFile);
            p.load(is);
            String driver = p.getProperty("driver");
            String url = p.getProperty("url");
            String username = p.getProperty("user");
            String password = p.getProperty("password");
            Class.forName(driver);
            conn = DriverManager.getConnection(url, username, password);
        }catch (ClassNotFoundException | IOException | SQLException e){
            e.printStackTrace();
        }
    }

}

