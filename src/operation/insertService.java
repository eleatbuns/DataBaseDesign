package operation;

import database.Database;

public class insertService {
	public int insert(String sql) {
		 int a= new Database().executeUpdate(sql);
	     return a;
	}
}
