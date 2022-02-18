//    Author     : Shubham lalawat
package dao;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailDAO {


    public static boolean sendMail(String receiver,String subject,String content)
    {
        boolean b = false;
        
        String senderid = "expertmessaging007@gmail.com";
        String senderpass = "java@123";
        
        //1st step) Get the session object	
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");//change accordingly
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class",  
                    "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.auth", "true");  
        props.put("mail.smtp.port", "465");

        Session session = Session.getDefaultInstance(props,
         new javax.mail.Authenticator() {
          @Override
          protected PasswordAuthentication getPasswordAuthentication() {
           return new PasswordAuthentication(senderid,senderpass);
           }
        });
        
        //2nd step)compose message
        try {
         MimeMessage message = new MimeMessage(session);
         message.setFrom(new InternetAddress(senderid));
         message.addRecipient(Message.RecipientType.TO,
                 new InternetAddress(receiver));
         message.setSubject(subject);
         message.setContent(content, "text/html; charset=utf-8");

         //3rd step)send message
         Transport.send(message);
         b = true;
         
         } catch (MessagingException e) {
                throw new RuntimeException(e);
         }

        return b;
    }


}
