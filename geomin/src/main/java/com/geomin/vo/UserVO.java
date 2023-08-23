package com.geomin.vo;

import lombok.Data;

@Data
public class UserVO {
	private String user_id;
	private String user_name;
	private String user_pw;
	private String user_type;
	private String phonenumber;
	private String email;
	private String address;
	private String datebirth;
	private String gender;
}
