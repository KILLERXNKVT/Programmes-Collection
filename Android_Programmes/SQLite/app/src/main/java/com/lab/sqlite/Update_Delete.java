package com.lab.sqlite;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class Update_Delete extends AppCompatActivity {

    EditText name, email, phone;
    Button update, del;
    DBHandler dbhandler;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_update);

        name = findViewById(R.id.u_name);
        email = findViewById(R.id.u_email);
        phone = findViewById(R.id.u_phone);
        Bundle b = getIntent().getExtras();
        dbhandler = new DBHandler(Update_Delete.this);

        String eid = b.getString("email");
        String p = b.getString("password");

        update = findViewById(R.id.upd_button);
        del = findViewById(R.id.delete);

        ArrayList<HashMap<String, String>> lst = dbhandler.getloginuser(eid, p);
        HashMap<String, String> val = lst.get(0);
        List<String> res = new ArrayList<String>(val.values());


        phone.setText(res.get(0));
        name.setText(res.get(1));
        email.setText(res.get(2));

        String prevname = res.get(1);

        del.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                String nme = name.getText().toString();
                Toast.makeText(Update_Delete.this, "The user is deleted", Toast.LENGTH_SHORT).show();
                dbhandler.DeleteUser(nme);
                Intent i = new Intent(getApplicationContext(), MainActivity.class);
                startActivity(i);
            }
        });


        update.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String n = name.getText().toString();
                String e = email.getText().toString();
                String p = phone.getText().toString();

                dbhandler.Updateuser(n, e, p, prevname);
                Toast.makeText(Update_Delete.this, "The user has been updated", Toast.LENGTH_SHORT).show();

                name.setText("");
                email.setText("");
                phone.setText("");
                Intent i = new Intent(getApplicationContext(), MainActivity.class);
                startActivity(i);

            }
        });
    }
}