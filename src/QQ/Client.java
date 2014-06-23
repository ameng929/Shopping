package QQ;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;

/**
 * 
 * 通信客户端 
 */
public class Client {
	private Socket s;

	private PrintWriter pw;

	private BufferedReader br;

	public Client(String ip, int port) throws IOException {

		s = new Socket(ip, port);
		System.out.println("ip" + ip + "port" + port);
		pw = new PrintWriter(s.getOutputStream());
		br = new BufferedReader(new InputStreamReader(s.getInputStream()));

	}

	public String readMessage() throws IOException {
		return br.readLine();
	}

	public void sendMessage(String str) {
		pw.println(str);
		pw.flush();
	}

	public boolean isClosed() {
		return s.isClosed();
	}

	public void close() throws IOException {
		pw.close();
		br.close();
		s.close();
	}

}
