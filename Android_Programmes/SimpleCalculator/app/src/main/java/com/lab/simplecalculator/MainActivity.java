package com.lab.simplecalculator;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

import androidx.appcompat.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity {

    Button button1, button2, button3, button4, button5, button6, button7, button8, button9, button0, buttonc, buttondec, buttonequal, buttonadd, buttonmul, buttonsub, buttondiv;
    EditText dis;
    float mValueOne, mValueTwo;
    boolean add, mul, sub, div;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        button0 = (Button) findViewById(R.id.btn0);
        button1 = (Button) findViewById(R.id.btn1);
        button2 = (Button) findViewById(R.id.btn2);
        button3 = (Button) findViewById(R.id.btn3);
        button4 = (Button) findViewById(R.id.btn4);
        button5 = (Button) findViewById(R.id.btn5);
        button6 = (Button) findViewById(R.id.btn6);
        button7 = (Button) findViewById(R.id.btn7);
        button8 = (Button) findViewById(R.id.btn8);
        button9 = (Button) findViewById(R.id.btn9);

        buttonadd = (Button) findViewById(R.id.add);
        buttonmul = (Button) findViewById(R.id.mul);
        buttonsub = (Button) findViewById(R.id.sub);
        buttondiv = (Button) findViewById(R.id.div);

        buttonc = (Button) findViewById(R.id.clear);
        buttondec = (Button) findViewById(R.id.dot);
        buttonequal = (Button) findViewById(R.id.result);

        dis = (EditText) findViewById(R.id.display);

        button1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                dis.setText(dis.getText() + "1");
            }
        });

        button2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                dis.setText(dis.getText() + "2");
            }
        });

        button3.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                dis.setText(dis.getText() + "3");
            }
        });

        button4.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                dis.setText(dis.getText() + "4");
            }
        });

        button5.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                dis.setText(dis.getText() + "5");
            }
        });

        button6.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                dis.setText(dis.getText() + "6");
            }
        });

        button7.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                dis.setText(dis.getText() + "7");
            }
        });

        button8.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                dis.setText(dis.getText() + "8");
            }
        });

        button9.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                dis.setText(dis.getText() + "9");
            }
        });

        button0.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                dis.setText(dis.getText() + "0");
            }
        });

        buttonc.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                dis.setText("");
            }
        });

        buttondec.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                dis.setText(dis.getText() + ".");
            }
        });

        buttonadd.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                if (dis == null) {
                    dis.setText("");
                } else {
                    mValueOne = Float.parseFloat(dis.getText() + "");
                    add = true;
                    dis.setText(null);
                }
            }
        });

        buttonsub.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                if (dis == null) {
                    dis.setText("");
                } else {
                    mValueOne = Float.parseFloat(dis.getText() + "");
                    sub = true;
                    dis.setText(null);
                }
            }
        });

        buttonmul.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                if (dis == null) {
                    dis.setText("");
                } else {
                    mValueOne = Float.parseFloat(dis.getText() + "");
                    mul = true;
                    dis.setText(null);
                }
            }
        });

        buttondiv.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                if (dis == null) {
                    dis.setText("");
                } else {
                    mValueOne = Float.parseFloat(dis.getText() + "");
                    div = true;
                    dis.setText(null);
                }
            }
        });

        buttonequal.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                mValueTwo = Float.parseFloat(dis.getText() + "");

                if (add == true) {
                    dis.setText(mValueOne + mValueTwo + "");
                    add = false;
                }

                if (sub == true) {
                    dis.setText(mValueOne - mValueTwo + "");
                    sub = false;
                }

                if (mul == true) {
                    dis.setText(mValueOne * mValueTwo + "");
                    mul = false;
                }

                if (div == true) {
                    dis.setText(mValueOne / mValueTwo + "");
                    div = false;
                }
            }
        });

    }
}