package com.mscs.emr.security;


public class ShaPasswordEncoder extends org.springframework.security.authentication.encoding.ShaPasswordEncoder {

	public ShaPasswordEncoder() {
		super();
	}

	@Override
	public String encodePassword(String rawPass, Object salt) {
		return "{SHA-1}" + super.encodePassword(rawPass, salt);
	}

}
