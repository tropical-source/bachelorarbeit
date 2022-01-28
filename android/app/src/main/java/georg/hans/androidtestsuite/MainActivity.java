package georg.hans.androidtestsuite;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {
    TextView text;
    Button test1_Activity_button;
    Button test2_Activity_button;

    @Override
    protected void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        test1_Activity_button = (Button)findViewById(R.id.first_test_button);
        test2_Activity_button = (Button)findViewById(R.id.second_test_button);

        text = (TextView)findViewById(R.id.question1_id);
        text.setText("");

        test1_Activity_button.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v)
            {
                Intent intent = new Intent(MainActivity.this, Test1Activity.class);
                startActivity(intent);
            }
        });

        test2_Activity_button.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v)
            {
                Intent intent = new Intent(MainActivity.this, Test2Activity.class);
                startActivity(intent);
            }
        });
    }
}