/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.helper;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.imageio.ImageIO;
import javax.swing.JOptionPane;

import com.constant.ServerConstants;

/**
 * 
 * @author Admin
 */
public class ConnectionManager extends DBUtils {
	public static HashMap spamKeywords = new HashMap();
	static {
		spamKeywords = getQueryMap("SELECT spamWord,1 as val FROM spamkeyword ");
	}
	public static void main(String[] args) {
		getDBConnection();
	}
	public static boolean checkUserName(HashMap parameters){
		String userNameId=StringHelper.n2s(parameters.get("username"));
		String q="SELECT * FROM useraccounts where username like '"+userNameId+"'";
		return dataExists(q);
	}
	public static boolean checkEmailId(HashMap parameters){
		String email=StringHelper.n2s(parameters.get("email"));
		String q="SELECT * FROM useraccounts where email like '"+email+"'";
		return dataExists(q);
	}
	public static UserModel checkLogin(HashMap parameters){
		String userNameId=StringHelper.n2s(parameters.get("username"));
		String pass=StringHelper.n2s(parameters.get("userpass"));
		if(pass.length()>0){
			try {
				pass=SimpleCryptoAndroidJava.encryptString(pass);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		String query="SELECT * FROM useraccounts where (username like ? OR email like ?) and pass = ?";
		UserModel um=null;
		List list=DBUtils.getBeanList(UserModel.class, query,userNameId,userNameId,pass);
		if(list.size()>0){
			 um=(UserModel) list.get(0);
		}
		return um;
	}
	public static String insertUser(HashMap parameters){
		System.out.println(parameters);
		String success="";
		//userid, fname, lname, emailid, phoneno, startlocation, imei, userpass, username, roleid
		String fname=StringHelper.n2s(parameters.get("fname"));
		String lname=StringHelper.n2s(parameters.get("lname"));
		String email=StringHelper.n2s(parameters.get("email"));
		String username=StringHelper.n2s(parameters.get("username"));
		String userpass=StringHelper.n2s(parameters.get("userpass"));
	
		
		try {
			userpass = SimpleCryptoAndroidJava.encryptString(userpass);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String sql="insert into useraccounts (fname, lname, email, pass, username) values(?,?,?,?,?)";
		
		int list=DBUtils.executeUpdate(sql, fname, lname, email, userpass, username);
		if(list>0){
			success="User registered Successfully";
			
		}else{
			success="Error adding user to database";
		}
		return success;
	}
	
	public static Connection getDBConnection() {
		Connection conn = null;
		try {
			Class.forName(ServerConstants.db_driver);
			conn = DriverManager.getConnection(ServerConstants.db_url,
					ServerConstants.db_user, ServerConstants.db_pwd);
			System.out.println("Got Connection");
		} catch (SQLException ex) {
			ex.printStackTrace();
			JOptionPane.showMessageDialog(
					null,
					"Please start the mysql Service from XAMPP Console.\n"
							+ ex.getMessage());
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return conn;
	}

	public static boolean hasSpamKeyword(String subject, String body) {
		boolean hasSpamKeywords = false;
		Set words = spamKeywords.keySet();
		for (Iterator iterator = words.iterator(); iterator.hasNext();) {
			String word = (String) iterator.next();
			word=word.toLowerCase();
			body=body.toLowerCase();
			int occurancesSubject1 = subject.length()
					- subject.replace(word, "").length();

			int occurancesBody1 = body.length()
					- body.replace(word, "").length();
			int occurancesSubject = 0;
			int occurancesBody = 0;
			if (occurancesSubject1 > 0) {
				occurancesSubject = occurancesSubject1 / word.length();
			}
			if (occurancesBody1 > 0) {
				occurancesBody = occurancesBody1 / word.length();
			}
			if (occurancesSubject >= 1 || occurancesBody >= 1) {
				hasSpamKeywords = true;
				System.out.println("Got SPAM Keyword " + word);
				System.out.println("================================================BODY ====================");
				System.out.println(subject);
//				System.out.println(body);
				System.out.println("================================================BODY ====================");
			}

		}

		return hasSpamKeywords;
	}

	public static String getCombo(String sql) {
		List list = getMapList(sql);
		StringBuffer sb = new StringBuffer();
		for (Iterator iterator = list.iterator(); iterator.hasNext();) {
			HashMap record = (HashMap) iterator.next();
			String key = StringHelper.n2s(record.get("key"));
			String value = StringHelper.n2s(record.get("value"));
			sb.append("<option value='" + key + "'>" + value + "</option>");
		}
		return sb.toString();
	}

	public static void closeConnection(Connection conn) {
		try {
			conn.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

	}

	public static BufferedImage getImage(String sql) {
		BufferedImage bi = null;
		Connection con = null;
		try {
			con = getDBConnection();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			if (rs.next()) {
				Blob b = rs.getBlob(1);
				InputStream is = b.getBinaryStream();
				try {
					bi = ImageIO.read(is);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (con != null)
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		return bi;

	}

}
