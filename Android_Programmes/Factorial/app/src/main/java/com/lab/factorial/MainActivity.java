package com.lab.factorial;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

import androidx.appcompat.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {

        EditText Number;
        Button Fact;

        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        Number = (EditText) findViewById(R.id.Number);
        Fact = (Button) findViewById(R.id.Fact);

        Fact.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i = new Intent(MainActivity.this, Result.class);
                i.putExtra("Number", Number.getText().toString());
                startActivity(i);
            }
        });
    }
}