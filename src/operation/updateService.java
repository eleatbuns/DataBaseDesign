package operation;

import database.Database;

public class updateService {
	public int update(String sql) {
		
		int a= new Database().executeUpdate(sql);
		return a;
	}
}
