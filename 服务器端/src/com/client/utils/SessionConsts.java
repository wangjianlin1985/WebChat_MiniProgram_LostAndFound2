package com.client.utils;

public class SessionConsts {

	public static final String BASE_URL = "http://localhost:8080/JavaWebProject/";
	/**
     * session存储用户key值
     */
	public static final String SESSION_USERTOKEN = "SMART_SESSION_USERTOKEN";
    
    /**
     * token命名
     */
    public static final String AUTH_TOKEN_NAME = "x-auth-token";
    
    /**
     * 返回token的key值
     */
    public static final String AUTH_TOKEN_KEY = "authToken";

    /**
     * 会话超时时间
     */
    public final static int SESSION_TIMEOUT = 3600;
    
    /**
     * 小程序appId
     */
    public final static String APP_ID = "wx5697bcc7f0765ad3";
    
    /**
     * 小程序appSecret
     */
    public final static String APP_SECRET = "76e37691b9d7247e2ea5663a164c1d4c";
}
