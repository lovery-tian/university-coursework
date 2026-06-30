package com.TongWang.WiFiContrl;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.Socket;
import java.net.UnknownHostException;

import android.os.Handler;
import android.os.Looper;
import android.util.Log;

public class TCPClient implements Runnable {
	private String TAG = "TCPClient";
	private int port = 8086;
	private String ipAddress = "127.0.0.1";
	private Socket socket=null;
    private Handler mHandler;
	private DataOutputStream dos = null;
	private DataInputStream dataInput;
	private boolean connected = false;

	public boolean isConnected() {
		return connected;
	}
	public TCPClient(Handler handler) throws UnknownHostException{
		this.mHandler = handler;
	}
	public TCPClient(Socket s,Handler handler){
		this.port = s.getPort();
		this.ipAddress = s.getInetAddress().getHostAddress();
		this.socket = s;
		this.mHandler = handler;
		try {
			dataInput = new DataInputStream(socket.getInputStream());
			dos = new DataOutputStream(socket.getOutputStream());
			connected = true;
        	mHandler.obtainMessage(MainActivity.MESSAGE_CONNECT,ipAddress+":"+port+" is connected").sendToTarget();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void run() {
		byte[] inDatas = new byte[1024];
		String recStr = null;
			while(connected){
//				Log.e(TAG, this.id+"--->>Ready to read!");
				if(dataInput==null){
					Log.e(TAG, "--->>data is null");
				}
				try {
					int count = dataInput.read(inDatas);
					if(count == -1){
						this.close();
						return;
					}
					recStr = new String(inDatas,0,count, "gb2312");
					if(recStr != null){
						mHandler.obtainMessage(MainActivity.MESSAGE_MSG_OBJ, recStr).sendToTarget();//将接收到的信息发送到主视图
					}
				} catch (IOException e) {
//					e.printStackTrace();
					this.close();
				}
			}
			this.close();
	}
	
	public void connect(final String ipAdress,final int port) {
		if(ipAdress.matches("\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}")){
			new Thread(new Runnable() {
				@Override
				public void run() {
					Looper.prepare();
					try {
						Log.e(TAG, "--->>start connect  server " + ipAdress + ":" + port);
						socket = new Socket(ipAdress, port);
						if(MainActivity.connected){
							TCPClient.this.close();
							return;
						}
						Log.e(TAG, "--->>end connect  server!");

						OutputStream outputStream = socket.getOutputStream();
						dataInput = new DataInputStream(socket.getInputStream());
						dos = new DataOutputStream(outputStream);
						connected = true;
				        mHandler.obtainMessage(MainActivity.MESSAGE_CONNECT,"connected").sendToTarget();
						new Thread(TCPClient.this).start();
//						showInfo("连接成功!");
					} catch (Exception e) {
						e.printStackTrace();
			        	mHandler.obtainMessage(MainActivity.MESSAGE_CONNECT,"connectfail").sendToTarget();
						connected = false;
					}
				}
			}).start();
		}
	}
	
	public void close(){
		Log.d(TAG, this.port+"--->>TCPClient close!");
		try {
			connected=false;
			if(dataInput!=null){
				dataInput.close();
				dataInput=null;
			}
			if(dos!=null){
				dos.close();
				dos=null;
			}
			if(socket!=null){
				socket.close();
				socket=null;
			}
        	mHandler.obtainMessage(MainActivity.MESSAGE_CONNECT,"connectfail").sendToTarget();
		} catch (IOException e1) {
			//e.printStackTrace();
		}
		finally{
			try {
				connected = false;
				if(dataInput!=null){
					dataInput.close();
					dataInput=null;
				}
				if(dos!=null){
					dos.close();
					dos=null;
				}
				if(socket != null){
					socket.close();
					socket=null;
				}
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}
	}
	
	public boolean write(byte[] data){
		try {
			dos.write(data);
			dos.flush();
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	public Handler getmHandler() {
		return mHandler;
	}
	public void setmHandler(Handler mHandler) {
		this.mHandler = mHandler;
	}
	public int getId() {
		return port;
	}
	public void setId(int id) {
		this.port = id;
	}

}
