package com.lab.listviewimplictintent;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ListView;

import androidx.appcompat.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity {

    ListView CompanyList;
    String Companies[] = {"Facebook", "Amazon", "Apple", "Netflix", "Google"};

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        CompanyList = findViewById(R.id.CompanyList);
        ArrayAdapter<String> arr;
        arr = new ArrayAdapter<String>(this, androidx.appcompat.R.layout.support_simple_spinner_dropdown_item, Companies);
        CompanyList.setAdapter(arr);

        CompanyList.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> adapterView, View view, int i, long CompanyList) {
                if (i == 0) {
                    Intent zero = new Intent(Intent.ACTION_VIEW);
                    zero.setData(Uri.parse("https://www.facebook.com/"));
                    startActivity(zero);
                } else if (i == 1) {
                    Intent one = new Intent(Intent.ACTION_VIEW);
                    one.setData(Uri.parse("https://www.amazon.in/"));
                    startActivity(one);
                } else if (i == 2) {
                    Intent two = new Intent(Intent.ACTION_VIEW);
                    two.setData(Uri.parse("https://www.apple.com/"));
                    startActivity(two);
                } else if (i == 3) {
                    Intent three = new Intent(Intent.ACTION_VIEW);
                    three.setData(Uri.parse("https://www.netflix.com/"));
                    startActivity(three);
                } else {
                    Intent four = new Intent(Intent.ACTION_VIEW);
                    four.setData(Uri.parse("https://www.google.co.in/"));
                    startActivity(four);
                }
            }
        });
    }
}