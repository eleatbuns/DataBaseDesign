package operation;

import java.sql.ResultSet;
import database.Database;

public class selectService{
	public ResultSet select(String sql) {
		ResultSet rSet=new Database().executeQuery(sql);
		return rSet;
	}
}
