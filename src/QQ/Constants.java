package QQ;

/**
 * 定义常量，通信协议
 * 
 */
public class Constants {
	/**
	 * 客户端退出
	 */
	public static final String EXIT = "_@EXIT@_:";

	/**
	 * 聊天信息. head+name+msg+date+end
	 */
	public static final String MSG = "＿@message＠＿:";

	/**
	 * 用户登录.head+name+end
	 */
	public static final String LOGIN = "＿@login@_:";

	/**
	 * 结束标志
	 */
	public static final String MSGEND = ":!@#$%^&*";

	/**
	 * 用户选择私聊标志(向服务器发的请求).head+ownname+oname+end
	 */
	public static final String PERSONALREQUEST = "_@personal#!:";

	/**
	 * 用户私聊信息标志，head+ownname+oname+msg+date+end
	 */
	public static final String MSGONLY = "_@msgonly&@:";

}
