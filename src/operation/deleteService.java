package operation;

import database.Database;

public class deleteService {
	public int delete(String sql) {
		
		int a= new Database().executeUpdate(sql);
	     return a;
	}
}
