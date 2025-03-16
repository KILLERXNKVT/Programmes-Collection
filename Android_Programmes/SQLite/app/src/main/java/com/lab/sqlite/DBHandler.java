package com.lab.sqlite;

import android.annotation.SuppressLint;
import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

import java.util.ArrayList;
import java.util.HashMap;

public class DBHandler extends SQLiteOpenHelper {

    private static final String DB_NAME = "infodb";
    private static final int DB_VERSION = 1;
    private static final String TABLE_NAME = "users";
    private static final String ID_COL = "id";
    private static final String NAME_COL = "name";
    private static final String EMAIL_COL = "email";
    private static final String PHONE_COL = "phone";
    private static final String PASSWORD_COL = "password";

    public DBHandler(Context context) {
        super(context, DB_NAME, null, DB_VERSION);
    }

    @Override
    public void onCreate(SQLiteDatabase db) {
        String query = "CREATE TABLE " + TABLE_NAME + " ("
                + ID_COL + " INTEGER PRIMARY KEY AUTOINCREMENT, "
                + NAME_COL + " TEXT,"
                + EMAIL_COL + " TEXT,"
                + PHONE_COL + " TEXT,"
                + PASSWORD_COL + " TEXT)";

        db.execSQL(query);
    }

    @Override
    public void onUpgrade(SQLiteDatabase db, int i, int i1) {
        db.execSQL("DROP TABLE IF EXISTS " + TABLE_NAME);
        onCreate(db);
    }


    public void addNewUser(String name, String email, String phone, String password) {

        SQLiteDatabase db = this.getWritableDatabase();
        ContentValues values = new ContentValues();


        values.put(NAME_COL, name);
        values.put(EMAIL_COL, email);
        values.put(PHONE_COL, phone);
        values.put(PASSWORD_COL, password);


        db.insert(TABLE_NAME, null, values);

        db.close();
    }


    public void Updateuser(String name, String email, String phone, String prevname) {
        SQLiteDatabase db_u = this.getWritableDatabase();
        ContentValues values_u = new ContentValues();

        values_u.put(NAME_COL, name);
        values_u.put(EMAIL_COL, email);
        values_u.put(PHONE_COL, phone);

        db_u.update(TABLE_NAME, values_u, "name=?", new String[]{prevname});
    }


    public void DeleteUser(String name) {
        SQLiteDatabase db_d = this.getWritableDatabase();
        db_d.delete(TABLE_NAME, "name=?", new String[]{name});
        db_d.close();
    }


    public Boolean CheckUser(String name) {
        SQLiteDatabase dbcu = this.getWritableDatabase();
        Cursor cursor = dbcu.rawQuery("SELECT name from users where name = ?", new String[]{name});
        if (cursor.getCount() > 0)
            return true;
        else
            return false;
    }

    public void ChangePassword(String email, String p) {
        SQLiteDatabase db_u = this.getWritableDatabase();
        ContentValues values_u = new ContentValues();

        values_u.put(PASSWORD_COL, p);

        db_u.update(TABLE_NAME, values_u, "email=?", new String[]{email});
    }


    public Boolean LoginCheck(String email, String p) {
        SQLiteDatabase dblc = this.getWritableDatabase();
        Cursor cursor1 = dblc.rawQuery("SELECT * FROM users where email = ? and password = ?", new String[]{email, p});
        if (cursor1.getCount() > 0)
            return true;
        else
            return false;
    }

    @SuppressLint("Range")
    public ArrayList<HashMap<String, String>> getloginuser(String email, String p) {

        SQLiteDatabase db = this.getReadableDatabase();
        ArrayList<HashMap<String, String>> UserList = new ArrayList<HashMap<String, String>>();

        Cursor cursor = db.rawQuery("SELECT * FROM users where email=? and password =?", new String[]{email, p});


        if (cursor.moveToNext()) {

            HashMap<String, String> user = new HashMap<String, String>();
            user.put("name", cursor.getString(cursor.getColumnIndex(NAME_COL)));
            user.put("email", cursor.getString(cursor.getColumnIndex(EMAIL_COL)));
            user.put("phone", cursor.getString(cursor.getColumnIndex(PHONE_COL)));
            UserList.add(user);

        }

        return UserList;
    }

}
