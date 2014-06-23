package QQ;

import java.net.Socket;

public class UserQQ implements java.io.Serializable {
	/**
	 * 用户信息
	 */
	private static final long serialVersionUID = 1L;

	private String name;

	// TODO 这里加了个Socket属性，用来保存用户的Socket
	private Socket socket;

	public Socket getSocket() {
		return socket;
	}

	public void setSocket(Socket s) {
		this.socket = s;
	}

	public UserQQ(String name) {
		this.name = name;

	}

	public String getName() {
		return name;
	}

	@Override
	public int hashCode() {
		final int PRIME = 31;
		int result = 1;
		result = PRIME * result + ((name == null) ? 0 : name.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		final UserQQ other = (UserQQ) obj;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		return true;
	}

}
