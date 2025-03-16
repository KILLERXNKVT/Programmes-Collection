package com.lab.calculator;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;

import org.mozilla.javascript.Context;
import org.mozilla.javascript.Scriptable;

public class MainActivity extends AppCompatActivity {

    public Button Btn0, Btn1, Btn2, Btn3, Btn4, Btn5, Btn6, Btn7, Btn8, Btn9,
            BtnPercentage, BtnAddition, BtnSubtraction, BtnMultiplication, BtnDivision, BtnEqual,
            BtnClear, BtnDot, BtnBrackets, BtnBackspace;
    public TextView TvInput, TvOutput;
    public String Process, Store;
    public Boolean checkBracket = false;

    public int count = 0;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        //        Numbers
        Btn0 = findViewById(R.id.Btn0);
        Btn1 = findViewById(R.id.Btn1);
        Btn2 = findViewById(R.id.Btn2);
        Btn3 = findViewById(R.id.Btn3);
        Btn4 = findViewById(R.id.Btn4);
        Btn5 = findViewById(R.id.Btn5);
        Btn6 = findViewById(R.id.Btn6);
        Btn7 = findViewById(R.id.Btn7);
        Btn8 = findViewById(R.id.Btn8);
        Btn9 = findViewById(R.id.Btn9);
        //        Operators
        BtnPercentage = findViewById(R.id.BtnPercentage);
        BtnAddition = findViewById(R.id.BtnAddition);
        BtnSubtraction = findViewById(R.id.BtnSubtraction);
        BtnMultiplication = findViewById(R.id.BtnMultiplication);
        BtnDivision = findViewById(R.id.BtnDivision);
        BtnEqual = findViewById(R.id.BtnEqual);
        //        Functions
        BtnClear = findViewById(R.id.BtnClear);
        BtnDot = findViewById(R.id.BtnDot);
        BtnBrackets = findViewById(R.id.BtnBrackets);
        BtnBackspace = findViewById(R.id.BtnBackspace);
        //        Input & Output
        TvInput = findViewById(R.id.TvInput);
        TvOutput = findViewById(R.id.TvOutput);

        Btn0.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Process = TvInput.getText().toString();
                TvInput.setText(Process + "0");
                count = 0;
            }
        });

        Btn1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Process = TvInput.getText().toString();
                TvInput.setText(Process + "1");
                count = 0;
            }
        });

        Btn2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Process = TvInput.getText().toString();
                TvInput.setText(Process + "2");
                count = 0;
            }
        });

        Btn3.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Process = TvInput.getText().toString();
                TvInput.setText(Process + "3");
                count = 0;
            }
        });

        Btn4.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Process = TvInput.getText().toString();
                TvInput.setText(Process + "4");
                count = 0;
            }
        });

        Btn5.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Process = TvInput.getText().toString();
                TvInput.setText(Process + "5");
                count = 0;
            }
        });

        Btn6.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Process = TvInput.getText().toString();
                TvInput.setText(Process + "6");
                count = 0;
            }
        });

        Btn7.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Process = TvInput.getText().toString();
                TvInput.setText(Process + "7");
                count = 0;
            }
        });

        Btn8.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Process = TvInput.getText().toString();
                TvInput.setText(Process + "8");
                count = 0;
            }
        });

        Btn9.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Process = TvInput.getText().toString();
                TvInput.setText(Process + "9");
                count = 0;
            }
        });

        BtnClear.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                TvInput.setText("");
                TvOutput.setText("");
                count = 0;
            }
        });

        BtnBackspace.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                count = 0;
                if (TvInput.getText().length() > 0) {
                    CharSequence name = TvInput.getText().toString();
                    TvInput.setText(name.subSequence(0, name.length() - 1));
                } else {
                    TvInput.setText("");
                    TvOutput.setText("");
                }
            }
        });

        BtnAddition.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Process = TvInput.getText().toString();
                TvInput.setText(Process + "+");
            }
        });

        BtnSubtraction.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Process = TvInput.getText().toString();
                TvInput.setText(Process + "-");
            }
        });

        BtnMultiplication.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Process = TvInput.getText().toString();
                TvInput.setText(Process + "*");
            }
        });

        BtnDivision.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Process = TvInput.getText().toString();
                TvInput.setText(Process + "/");
            }
        });

        BtnDot.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Process = TvInput.getText().toString();
                TvInput.setText(Process + ".");
            }
        });

        BtnPercentage.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Process = TvInput.getText().toString();
                TvInput.setText(Process + "%");
            }
        });

        BtnBrackets.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (checkBracket) {
                    Process = TvInput.getText().toString();
                    TvInput.setText(Process + ")");
                    checkBracket = false;
                } else {
                    Process = TvInput.getText().toString();
                    TvInput.setText(Process + "(");
                    checkBracket = true;
                }
            }
        });

        BtnEqual.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                count = 0;
                Process = TvInput.getText().toString();
                if (Process.matches("")) {
                    TvOutput.setText("");
                } else {
                    // Process = Process.replace("X", "*");
                    // Process = Process.replace("%","/100");
                    Context rihno = Context.enter();
                    rihno.setOptimizationLevel(-1);

                    String finalResult = "";
                    try {
                        Scriptable scriptable = rihno.initSafeStandardObjects();
                        finalResult = rihno.evaluateString(scriptable, Process, "javascript", 1, null).toString();
                    } catch (Exception e) {
                        finalResult = "Error";
                    }
                    TvOutput.setText(finalResult);
                }
            }
        });


    }
}