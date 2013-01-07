/**
 * 这是客户端连接服务器的后台
 */

package com.client.model;
import com.client.common.Message;
import com.client.common.User;
import com.client.tools.ClientConServerThread;
import com.client.tools.ManageClientConServerThread;

import java.util.*;
import java.net.*;
import java.io.*;

public class QqClientConServer {

	public  Socket s;
	//发送第一次请求
	public boolean sendInfoToServer(Object o)
	{
		boolean b=false;
		try {
			//System.out.println("kk");
			s=new Socket("127.0.0.1",9999);
			ObjectOutputStream oos=new ObjectOutputStream(s.getOutputStream());
			oos.writeObject(o);
			
			ObjectInputStream ois=new ObjectInputStream(s.getInputStream());
			Message ms=(Message)ois.readObject();
			
			//这里就是验证用户登录的地方
			if(ms.getMesType().equals("1"))
			{
				//就创建一个该qq号和服务器端保持通讯连接的线程
				ClientConServerThread ccst=new ClientConServerThread(s);
				//启动该通讯线程
				ccst.start();
				ManageClientConServerThread.addClientConServerThread(((User) o).getUserId(), ccst);
				b=true;
			}else{
				//关闭socket
				s.close();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			
		}
		return b;
	}
	
	
	
	//发送信息
	public void SendInfoToServer(Object o)
	{
		try {
			Socket s=new Socket("127.0.0.1",9999);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			
		}
	}
}
