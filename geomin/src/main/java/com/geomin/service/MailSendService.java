package com.geomin.service;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

@Component
public class MailSendService {
    @Autowired
    private JavaMailSenderImpl mailSender;
    private int authNumber; 

    public void makeRandomNumber() {
        Random random = new Random();
        int checkNum = random.nextInt(888888) + 111111;
        System.out.println("인증번호 : " + checkNum);
        authNumber = checkNum;
    }

    public String joinEmail(String email) {
        makeRandomNumber();
        String setFrom = "wed478@naver.com";
        String[] toMailAddresses = email.split(","); // 여러 이메일 주소 쉼표로 분리
        String title = "[geomin] 이메일 변경을 위한 인증번호 입니다.";
        String content = 
                "홈페이지를 방문해주셔서 감사합니다." +  
                "<br><br>" + 
                "인증 번호는 " + authNumber + "입니다." + 
                "<br>" + 
                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";

        for (String toMail : toMailAddresses) {
            System.out.println("이메일 주소 : " + toMail);
            mailSend(setFrom, toMail, title, content);
        }
        
        return Integer.toString(authNumber);
    }

    public void mailSend(String setFrom, String toMail, String title, String content) { 
        MimeMessage message = mailSender.createMimeMessage();
        try {
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content, true);
            
         
            mailSender.send(message);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}
