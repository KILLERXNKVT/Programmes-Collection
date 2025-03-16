package com.lab.multiplicationtable;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

import androidx.appcompat.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity {

    EditText number, range;
    Button mult;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        number = (EditText) findViewById(R.id.number);
        range = (EditText) findViewById(R.id.range);
        mult = (Button) findViewById(R.id.mul);

        mult.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                Intent i = new Intent(getApplicationContext(), Result.class);
                String n = number.getText().toString();
                String r = range.getText().toString();
                i.putExtra("number", n);
                i.putExtra("range", r);
                startActivity(i);

            }
        });
    }
}