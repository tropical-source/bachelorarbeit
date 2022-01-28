package georg.hans.androidtestsuite;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.io.InputStream;

public class Test2Activity extends AppCompatActivity {

    TextView test2Results;
    Button startTest2_button;
    @Override
    protected void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.test2activity);

        test2Results = (TextView)findViewById(R.id.test2results_id);
        startTest2_button = (Button)findViewById(R.id.startTest2Button_id);

        test2Results.setText("");

        startTest2_button.setOnClickListener(new View.OnClickListener() {

            public void onClick(View v)
            {
                SharedPreferences sharedPref = getPreferences(Context.MODE_PRIVATE);
                SharedPreferences.Editor editor = sharedPref.edit();
                editor.clear();
                editor.apply();

                long startTime = System.currentTimeMillis();
                try {
                    JSONObject obj = new JSONObject(loadJSONFromAsset());
                    JSONArray jArray = obj.getJSONArray("data");

                    for (int i = 0; i < jArray.length(); i++) {
                        JSONObject jo_inside = jArray.getJSONObject(i);
                        String key = jo_inside.getString("key");
                        String value = jo_inside.getString("value");
                        editor.putString(key, value);
                    }
                    editor.apply();
                    long time = System.currentTimeMillis() - startTime;
                    test2Results.setText("Saved " + jArray.length() + " Key-Value Pairs in " + time + " milliseconds.");

                } catch (JSONException e) {
                    e.printStackTrace();
                }
            }
        });
    }

    private String loadJSONFromAsset() {
        String json = null;
        try {
            InputStream is = getAssets().open("generated.json");
            int size = is.available();
            byte[] buffer = new byte[size];
            is.read(buffer);
            is.close();
            json = new String(buffer, "UTF-8");
        } catch (IOException ex) {
            ex.printStackTrace();
            return null;
        }
        return json;
    }
}