package com.action;

import java.util.Date;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

import com.helper.ConnectionManager;
import com.helper.DBUtils;
import com.helper.EmailModel;
import com.helper.PhishMailGuard;
import com.helper.ReadRecentMail;
import com.helper.SimpleCryptoAndroidJava;
import com.helper.SpamModel;
import com.helper.UserModel;

public class UpdateEmailsJob {
	public static void main(String[] args) {
		TimerTask tt = new TimerTask() {

			@Override
			public void run() {
				// TODO Auto-generated method stub
				final List<UserModel> emails = DBUtils.getBeanList(
						UserModel.class, "SELECT * FROM useraccounts");
				for (int i = 0; i < emails.size(); i++) {
					final UserModel user = (UserModel) emails.get(i);
					new Thread() {
						public void run() {

							final String username = user.getEmail();
							
							String userId = user.getUserid();
							System.out.println("CHecking " + user.getEmail()
									+ " " + userId);
							String userpass = user.getPass();
							try {
								userpass = SimpleCryptoAndroidJava
										.decryptString(userpass);
								// System.out.println("userpass  "+userpass );

							} catch (Exception e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
							// System.out.println(username+" "+userpass);

							ReadRecentMail.storeAllEmails(username, userpass,
									userId);
							ReadRecentMail.updatePhishingRules(userId);

						}
					}.start();
				}
			}
		};
		Timer t = new Timer();
		t.scheduleAtFixedRate(tt, new Date(), 1*1000*60);
	}
}
