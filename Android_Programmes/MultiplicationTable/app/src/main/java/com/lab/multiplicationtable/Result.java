package com.lab.multiplicationtable;

import android.os.Bundle;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;

public class Result extends AppCompatActivity {

    TextView res;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_result);

        res = (TextView) findViewById(R.id.result);
        Bundle b = getIntent().getExtras();

        int n = Integer.parseInt(b.getString("number"));
        int r = Integer.parseInt(b.getString("range"));

        for (int i = 1; i <= r; i++) {
            String rt = n + " * " + i + " = " + (n * i) + "\n";
            res.append(rt);
        }
    }
}