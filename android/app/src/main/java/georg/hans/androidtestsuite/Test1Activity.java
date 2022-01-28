package georg.hans.androidtestsuite;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;

import java.util.Arrays;

public class Test1Activity extends AppCompatActivity {
    TextView test1Results;
    Button startTest1_button;
    private int N = 10000;
    @Override
    protected void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.test1activity);

        test1Results = (TextView)findViewById(R.id.test1results_id);
        startTest1_button = (Button)findViewById(R.id.startTest1Button_id);

        test1Results.setText("");

        // Add_button add clicklistener
        startTest1_button.setOnClickListener(new View.OnClickListener() {

            public void onClick(View v)
            {
                int j = 0;
                int[] primes = new int[N];
                test1Results.setText("");
                long startTime = System.currentTimeMillis();
                for (int i = 0; i < N; i++) {
                    boolean foundPrime = false;
                    while (!foundPrime) {
                        j++;
                        if(isPrime(j)) {
                            primes[i] = j;
                            foundPrime = true;
                        }
                    }
                }
                long stopTime = System.currentTimeMillis();

                test1Results.setText("calculated " + N + " primes in " + (stopTime - startTime) + " milliseconds\n\n" +  Arrays.toString(primes));
            }
        });

    }

    private boolean isPrime(int n)
    {

        // Check if number is less than
        // equal to 1
        if (n <= 1)
            return false;

            // Check if number is 2
        else if (n == 2)
            return true;

        for (int i = 2; i < n; i++)
        {
            if (n % i == 0)
                return false;
        }
        return true;
    }
}