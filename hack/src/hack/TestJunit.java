package hack;

import org.junit.Test;
import static org.junit.Assert.assertEquals;

import java.sql.SQLException;
public class TestJunit {
	
  MessageUtil m=new MessageUtil("vzsaurabh","saurabh");
  
   @Test
   public void testcheck() throws SQLException {
	   String ms=m.check();
	   assertEquals("true", ms);
      
   }
}