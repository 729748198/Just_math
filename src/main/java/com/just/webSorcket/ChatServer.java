package com.just.webSorcket;

import com.alibaba.fastjson.JSONObject;

import javax.servlet.http.HttpSession;
import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CopyOnWriteArraySet;

@ServerEndpoint(value="/chatServer",configurator=HttpSessionConfigurator.class)
public class ChatServer {
	//ͳ����������
	private static int onlineCount=0;

	/**
	 * ���ÿ��Server����Ϊ�̰߳�ȫ
	 */

	private static CopyOnWriteArraySet<ChatServer> webSocket=new CopyOnWriteArraySet<ChatServer>();
	private Session session;
	private String user;//�û�Id
	private HttpSession httpSession;
	private static List<Object> list=new ArrayList<Object>();//���ÿ���û�id
	private static Map<String,Session> routetab=new HashMap<String,Session>();//���session
	@OnOpen
	public void onOpen(Session session,EndpointConfig config)//����ʱ���ô˺���
	{
		this.session=session;
		webSocket.add(this);         //��Ӵ�Server      
		addOnlineCount();	//����������1��
		this.httpSession=(HttpSession) config.getUserProperties().get(HttpSession.class.getName());//��ȡ��Server��httpSession
		this.user=(String) httpSession.getAttribute("user");//��ȡ�û�Id
		System.out.println("user:"+user);
		list.add(user);//��ӵ�list
		routetab.put(user, session);//��session���û�Id��ŵ�map��
		String message=getMessage("[" + user + "]����������,��ǰ��������Ϊ"+getOnlineCount()+"λ", "notice",  list);//��ȡ�㲥������ʽ
		broadcast(message);//�㲥��ʾ���
	}
	@OnClose
	public void onClose(){//�ر�ʱ����
		webSocket.remove(this);//�Ƴ���Server
		subOnlineCount();     //������һ
		list.remove(user);//�Ƴ����û�id
		routetab.remove(user);//�Ƴ�MAP�еĴ��û�
		String message=getMessage("[" + user +"]�뿪��������,��ǰ��������Ϊ"+getOnlineCount()+"λ", "notice", list);
		broadcast(message);//�㲥
	}
	@OnMessage
	public void onMessage(String _message)//���ܵ�����ʱ����
	{
		JSONObject chat= JSONObject.parseObject(_message);//������JSONΪ����
		JSONObject message= JSONObject.parseObject(chat.get("message").toString());//��ȡmessage�е�����
		if(message.get("to")==null||message.get("to").toString().equals("")){//������͵���Ϊ�գ�����й㲥
			broadcast(_message);
		}else
		{
			String [] userlist=message.get("to").toString().split(",");//��ȡҪ���͵�����
			singleSend(_message,(Session)routetab.get(message.get("from")));//���͸��Լ�
			for(String user:userlist)//���û����з���
			{
				if(!user.equals(message.get("from")))
				{
					singleSend(_message,(Session)routetab.get(user));//������Ϣ��ָ���û�
				}
			}
		}
	}
	@OnError
	public void onError(Throwable error){
		error.printStackTrace();
	}
	public void broadcast(String message)//�㲥��Ϣ
	{
		for(ChatServer chat:webSocket){
			try{
				  chat.session.getBasicRemote().sendText(message);
			}catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	  public void singleSend(String message, Session session){
	        try {
	            session.getBasicRemote().sendText(message);
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	    }
	public String getMessage(String message,String type,List list)
	{
		JSONObject member=new JSONObject();
		member.put("message", message);
		member.put("type", type);
		member.put("list", list);
		return member.toString();
	}
	  public  int getOnlineCount() {
	        return onlineCount;
	    }

	    public  void addOnlineCount() {
	        ChatServer.onlineCount++;
	    }

	    public  void subOnlineCount() {
	        ChatServer.onlineCount--;
	    }
}
