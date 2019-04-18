package cn.itcast.exam.utils;

import java.util.Properties;
import java.util.UUID;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import cn.itcast.exam.domain.User;

public class SendMail{
private User user;
	
	public SendMail(User user) {
		super();
		this.user = user;
	}
	public void send(User user) throws MessagingException{
		Properties prop = new Properties();
		prop.setProperty("mail.smtp.host", "smtp.qq.com");
		prop.setProperty("mail.smtp.port", "465");
		prop.setProperty("mail.smtp.auth", "true");// 是否开启权限控制
		prop.setProperty("mail.transport", "smtp");// 发送的协议是简单的邮件传输协议
		prop.setProperty("mail.debug", "true");// true 打印信息到控制台
		prop.setProperty("mail.smtp.ssl.enable", "true");

		// 创建验证器
		Authenticator auth = new Authenticator() {
			public PasswordAuthentication getPasswordAuthentication() {
				// 设置发送人的帐号和密码(授权密码)
				// 注意发送者的qq必须去QQ邮箱开通权限
				return new PasswordAuthentication("1585168893@qq.com","zevjmjkqdthkhhch");
			}
		};
		Session session = Session.getInstance(prop,auth);
		Message message = createMail(session,user);
		//发送邮件
		Transport.send(message,message.getAllRecipients());
	}
	//创建邮件
	private Message createMail(Session session, User user) throws MessagingException {
		Message message = new MimeMessage(session);
		message.setFrom(new InternetAddress("1585168893@qq.com"));
		message.setRecipient(Message.RecipientType.TO, new InternetAddress(user.getEmail()));
		message.setSubject("激活账号的激活链接");
//		//定义激活码
//		String uuid = UUID.randomUUID().toString().replace("-", "");
		//设置激活链接
		String url = "http://192.168.10.59:8080//examOnline/user_active.action?uuidcode="+user.getUuidcode();
		String content = "<h1>来自【小车驾照文科在线模拟理论考试网站】的激活账号链接:您已经成功注册账号，点击下面链接<a href='"+url+"'>"+url+"</a>进行激活账号</h1>";
		System.out.println(content);
		message.setContent(content,"text/html;charset=UTF-8");
		message.saveChanges();
		return message;
	}
}
