package com.lab.factorial;

import android.os.Bundle;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;

public class Result extends AppCompatActivity {

    TextView Result;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_result);

        Bundle b = getIntent().getExtras();
        int n = Integer.parseInt(b.getString("Number"));
        long f = 1;

        for (int i = n; i > 0; i--) {
            f = f * i;
        }

        Result = findViewById(R.id.Result);
        Result.setText("Factorial of " + n + " is " + f);
    }
}