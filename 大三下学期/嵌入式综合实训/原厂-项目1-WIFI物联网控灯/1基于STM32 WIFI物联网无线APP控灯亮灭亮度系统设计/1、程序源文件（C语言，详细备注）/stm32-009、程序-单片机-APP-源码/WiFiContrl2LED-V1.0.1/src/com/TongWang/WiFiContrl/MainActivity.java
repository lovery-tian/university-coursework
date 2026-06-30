package com.TongWang.WiFiContrl;

import java.net.UnknownHostException;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.util.Log;
import android.view.KeyEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.Toast;

import com.TongWang.WiFiContrl2LEDs.R;

@SuppressLint({ "HandlerLeak", "NewApi", "ShowToast" })
public class MainActivity extends Activity {

    private static final String TAG = "MainActivity";
//    static final String Folder = "/SunEnergyWiFi/history.dat";
	private Handler mHandler;//定义一个句柄对象，用于线程间传递信息
	public static final int MESSAGE_READ = 0;
	public static final int MESSAGE_CONNECT = 1;
	public static final int MESSAGE_MSG_OBJ = 2;
	public TCPClient client = null;
	public static boolean connected = false;
	private Button btn_open_1,btn_open_2,btn_close_1,btn_close_2;
	private Button btn_led1_D1,btn_led1_D2,btn_led1_D3,btn_led2_D1,btn_led2_D2,btn_led2_D3;
	private Button btn_close_all,btn_open_all,btn_connect;

	private String ipAdress = "10.10.10.11";
//	private String ipAdress = "192.168.0.107";

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.main);

		btn_open_1 = (Button) findViewById(R.id.btn_op_1);
		btn_open_2 = (Button) findViewById(R.id.btn_op_2);
		btn_close_1 = (Button) findViewById(R.id.btn_cl_1);
		btn_close_2 = (Button) findViewById(R.id.btn_cl_2);
		btn_led1_D1 = (Button) findViewById(R.id.btn_led1_1);
		btn_led1_D2 = (Button) findViewById(R.id.btn_led1_2);
		btn_led1_D3 = (Button) findViewById(R.id.btn_led1_3);
		btn_led2_D1 = (Button) findViewById(R.id.btn_led2_1);
		btn_led2_D2 = (Button) findViewById(R.id.btn_led2_2);
		btn_led2_D3 = (Button) findViewById(R.id.btn_led2_3);
		btn_close_all = (Button) findViewById(R.id.btn_close_all);
		btn_open_all = (Button) findViewById(R.id.btn_open_all);
		btn_connect = (Button) findViewById(R.id.btn_connect);

		btn_open_1.setOnClickListener(clickListener);
		btn_open_2.setOnClickListener(clickListener);
		btn_close_1.setOnClickListener(clickListener);
		btn_close_2.setOnClickListener(clickListener);
		btn_led1_D1.setOnClickListener(clickListener);
		btn_led1_D2.setOnClickListener(clickListener);
		btn_led1_D3.setOnClickListener(clickListener);
		btn_led2_D1.setOnClickListener(clickListener);
		btn_led2_D2.setOnClickListener(clickListener);
		btn_led2_D3.setOnClickListener(clickListener);
		btn_close_all.setOnClickListener(clickListener);
		btn_open_all.setOnClickListener(clickListener);
		btn_connect.setOnClickListener(clickListener);
		
		
        mHandler = new Handler() {//在启动程序时会新建一个服务器对象，同时把此对象传给服务器
    		@Override								//服务器会在应用程序状态发生改变时（连接、发送信息等）调用此对象的方法，通知主视图更新UI
            public void handleMessage(Message msg) {
                switch (msg.what) {
                case MESSAGE_READ://状态发生改变
                	String myMsg = (String)msg.obj;
            		Log.d(TAG, myMsg);
            		Toast.makeText(getApplicationContext(), myMsg, 0).show();
                    break;
                case MESSAGE_MSG_OBJ://状态发生改变
                	String message = (String)msg.obj;
                    process(message);
//            		Toast.makeText(getApplicationContext(), message, 0).show();
                    break;
                case MESSAGE_CONNECT://状态发生改变
                	String msgStr = (String)msg.obj;
//            		Toast.makeText(getApplicationContext(), msgStr, 0).show();
            		if(msgStr.equals("connected")){
            			connected = true;
            			btn_connect.setText("断开连接");
            		}
            		else{
            			connected = false;
            			btn_connect.setText("连接设备");
            		}
                    break;
                }
            }
        };
		try {
			client = new TCPClient(this.mHandler);
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}
        
	}
	
	private void process(String msg){
	}
	
	private OnClickListener clickListener = new OnClickListener() {
		@Override
		public void onClick(View v) {
			if(v.getId() == R.id.btn_connect){
				if(connected){
					client.close();
				}
				else{
					client.connect(ipAdress, 8080);
				}
				return;
			}
			if(!connected){
        		Toast.makeText(getApplicationContext(), "请先连接设备", 0).show();
        		return;
			}
			switch(v.getId()){
			case R.id.btn_op_1:
				client.write("OPEN1".getBytes());
				break;
			case R.id.btn_op_2:
				client.write("OPEN2".getBytes());
				break;
			case R.id.btn_cl_1:
				client.write("CLOSE1".getBytes());
				break;
			case R.id.btn_cl_2:
				client.write("CLOSE2".getBytes());
				break;
			case R.id.btn_led1_1:
				client.write("LED1-1".getBytes());
				break;
			case R.id.btn_led1_2:
				client.write("LED1-2".getBytes());
				break;
			case R.id.btn_led1_3:
				client.write("LED1-3".getBytes());
				break;
			case R.id.btn_led2_1:
				client.write("LED2-1".getBytes());
				break;
			case R.id.btn_led2_2:
				client.write("LED2-2".getBytes());
				break;
			case R.id.btn_led2_3:
				client.write("LED2-3".getBytes());
				break;
			case R.id.btn_open_all:
				client.write("OPENALL".getBytes());
				break;
			case R.id.btn_close_all:
				client.write("CLOSEALL".getBytes());
				break;
			}
		}
	};
    
	@Override
	protected void onResume() {
		super.onResume();
//		client.write("$S1&supplylist#");
	}
	private long waitTime = 2000;
	private long touchTime;	

	public boolean onKeyDown(int keyCode, KeyEvent event) {
		if (event.getAction() == KeyEvent.ACTION_DOWN && KeyEvent.KEYCODE_BACK == keyCode) {
			long currentTime = System.currentTimeMillis();
			if ((currentTime - touchTime) >= waitTime) {
				Toast.makeText(getApplicationContext(), "再按一次退出", Toast.LENGTH_SHORT).show();
				touchTime = currentTime;
			} else {
				finish();
			}
			return true;
		}

		return super.onKeyDown(keyCode, event);
	}
}
