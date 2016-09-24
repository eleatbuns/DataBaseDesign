package operation;

import database.Database;

/**
 * Created by GaoLi on 16-8-2.
 */
public class registerImp implements register {

    @Override
    public int insert(String username, String nickname, String password,String power) {
        String sql = "insert into login_message values ('" + username + "','" + nickname + "','"
                + password +  "','"+power+"')";

       int a= new Database().executeUpdate(sql);
       return a;
    }
}
