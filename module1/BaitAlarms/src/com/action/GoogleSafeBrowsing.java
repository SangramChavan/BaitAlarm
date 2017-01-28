package com.action;

import java.net.URLEncoder;

import com.helper.StringHelper;

public class GoogleSafeBrowsing {
	public static String BROWSER_API_KEY = "AIzaSyBSxb_qLE5KB5Dn5V7Dg_L9mOG8zlKtSPU"; // Key
																						// for
																						// browser
																						// apps
																						// (with
																						// referers)

	public static String GOOGLE_SAFE_BROWSING_API = "https://sb-ssl.google.com/safebrowsing/api/lookup?client=JavaClass&key="
			+ BROWSER_API_KEY + "&appver=1.5.2&pver=3.1&url=";

	public static void main(String[] args) {
		String url = "http://192.185.96.244/~secnet/account-ppl/5c879498f1feb34d01e261a3ce99ec8e/?cmd=_home&dispatch=788b9f93911af87109c2af9ba90a086c788b9f93911af87109c2af9ba90a086c";
		StringBuffer s = StringHelper.readURLContent(GOOGLE_SAFE_BROWSING_API
				+ URLEncoder.encode(url));
		System.out.println(s);
		// GET_RESP_BODY = “phishing” | “malware” | “phishing,malware”
	}

	public static int isPhishing(String url) {
		// String
		// url="http://192.185.96.244/~secnet/account-ppl/5c879498f1feb34d01e261a3ce99ec8e/?cmd=_home&dispatch=788b9f93911af87109c2af9ba90a086c788b9f93911af87109c2af9ba90a086c";

		try {
			StringBuffer s = StringHelper
					.readURLContent(GOOGLE_SAFE_BROWSING_API
							+ URLEncoder.encode(url));
			System.out.println(s);
			String ret = s.toString().trim().toLowerCase();
			if (s.toString().equalsIgnoreCase("phishing")) {
				return 1;
			} else if (s.toString().equalsIgnoreCase("malware")) {
				return 2;
			} else if (s.toString().equalsIgnoreCase("phishing,malware")) {
				return 3;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return -1;
		// GET_RESP_BODY = “phishing” | “malware” | “phishing,malware”
	}
}
