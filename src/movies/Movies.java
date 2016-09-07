package movies;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;

public class Movies {
    public static void main(String[] args) {
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;
        String again = "";
        
        Scanner scan = new Scanner(System.in);
        
        
        try{
            con = DriverManager.getConnection(DBsettings.url,
                    DBsettings.user, DBsettings.pass);
            st = con.createStatement();
            
            //while(rs.next()){
            //    System.out.println(rs.getString("Category"));
            //}
            System.out.println("Welcome to the Movie List Application. \n");
            
        do {
            System.out.println("There are 10 movies in this list.");
            System.out.println("What categories are you interested? (War, Action, Animation, Comedy/Animation, Science Fiction, Sports) ");
            String input = scan.nextLine();
            rs = st.executeQuery("\nSelect * FROM movie WHERE Category ='" + input + "'");
            
            while (rs.next()) {
                System.out.println(rs.getString("Title"));
            }
            System.out.print("\nContinue or not (y or n)");
            again = scan.nextLine();
        } while (again.equalsIgnoreCase("y"));
        
        System.out.println("Thanks!!");
        scan.close();    
            
        } catch (Exception e) {
            System.out.println("DB Exception: " + e);
        } finally {
            //this is where I do my cleanup
            try {
                if (rs != null)
                    rs.close();
                if (st != null)
                    st.close();
                if (con != null)
                    con.close();
            } catch (Exception e) {
                System.out.println("Exception in finally: " + e);
              }
        }
    }
}
	
	
	
	
	
	
	

