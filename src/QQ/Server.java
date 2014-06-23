package QQ;

import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.swing.JFrame;
import javax.swing.JMenuItem;
import javax.swing.JOptionPane;
import javax.swing.JPopupMenu;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.SwingUtilities;
import javax.swing.table.AbstractTableModel;

/**
 * 服务端
 */

// TODO 这里我给服务器加了父类
public class Server extends Thread {
	private ServerSocket ss;

	private ArrayList<Socket> sockets;

	private UserQQ userQQ;

	private List<UserQQ> hs;
	
	MainServerUI ui;

	// TODO 这里给Server构造函数添加一个参数，端口号
	public Server(int port) {
		try {
			ss = new ServerSocket(port);
			sockets = new ArrayList<Socket>();
			hs = new ArrayList<UserQQ>();
			ui = new MainServerUI();
			ui.showUI();
			System.out.println("The Server is running：" + port);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 接收Socket，加入Socket集合中，启动通信线程
	 */
	// TODO 这里我把start()方法改为了run()方法
	public void run() {
		while (true) {
			try {
				Socket s = ss.accept();
				sockets.add(s);
				//System.out.println("ChatRoomServerThread");
				new ChatRoomServerThread(s).start();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * 客户端请求处理线程
	 * 
	 */
	class ChatRoomServerThread extends Thread {
		private Socket s;

		public ChatRoomServerThread(Socket s) {
			this.s = s;
		}

		/**
		 * 作用BufferedReader读取登陆界面和聊天界面发出来的信息 对接收到的信息依据协议的规定处理信息
		 */
		public void run() {
			//System.out.println("ChatRoomServerThread");
			BufferedReader br = null;
			try {
				br = new BufferedReader(new InputStreamReader(s
						.getInputStream()));
				while (true) {
					StringBuilder sb = new StringBuilder();
					while (sb.toString().indexOf(Constants.MSGEND) < 0) {
						sb.append(br.readLine() + "\n");
					}
					String str = sb.toString();
					if (str.indexOf(Constants.EXIT) > -1) {
						sockets.remove(s);
						UserQQ u = new UserQQ(str.split(":")[1]);
						hs.remove(u);
						System.out.println(u.getName() + " 下线了!");
						sendMessage(Constants.EXIT + str.split(":")[1]
								+ Constants.MSGEND);
						s.close();
						return;
					} else if (str.indexOf(Constants.MSG) > -1) {
						sendMessage(str);
					} else if (str.indexOf(Constants.LOGIN) > -1) {
						if (hs.size() != 0) { // 向刚上线的人发送目前在线的人的列表
							for (UserQQ h : hs) {
								sendMessage(Constants.LOGIN + h.getName()
										+ Constants.MSGEND, s);
							}
						}
						sendMessage(Constants.LOGIN + str.split(":")[1]
								+ Constants.MSGEND);// 向当前在线的所有人发送有人上线的信息
						userQQ = new UserQQ(str.split(":")[1]);
						// TODO 这里设置一下新增用户的Socket
						userQQ.setSocket(s);
						hs.add(userQQ);
					} else if (str.indexOf(Constants.PERSONALREQUEST) > -1) {// 私聊请求
						System.out.println(str);
						String name2 = str.split(":")[2];
						sendMessage(str, getSocketByName(name2));
					} else if (str.indexOf(Constants.MSGONLY) > -1) {// 点对点信息
						String name2 = str.split(":")[2];
						sendMessage(str, s);
						sendMessage(str, getSocketByName(name2));
					}
				
					SwingUtilities.updateComponentTreeUI(ui.table_onlineUser);
					
				}

			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		/**
		 * 向某个人发送信息
		 * 
		 * @param str
		 * @param so
		 *            这个人的Socket
		 * @throws IOException
		 */
		public void sendMessage(String str, Socket so) throws IOException {
			Date date = new Date();
			PrintWriter pw = new PrintWriter(so.getOutputStream());
			if (str.indexOf(Constants.MSGONLY) > -1) { // 重新组装
				String[] sts = str.split(":");
				str = Constants.MSGONLY + sts[1] + ":" + sts[2] + ":" + sts[3]
						+ ":" + date + Constants.MSGEND;
			}
			pw.println(str);
			pw.flush();
		}

		/**
		 * 向所有人发送信息
		 * 
		 * @param str
		 * @throws IOException
		 */
		public void sendMessage(String str) throws IOException {
			Date date = new Date();
			// System.out.println(str + "\t[" + date + "]");
			PrintWriter pw = null;
			for (Socket s_temp : sockets) {
				// pw.println(str + ":" + date + Constants.MSGEND);
				pw = new PrintWriter(s_temp.getOutputStream());
				if (str.indexOf(Constants.MSG) > -1) { // 重新组装
					String[] sts = str.split(":");
					str = Constants.MSG + sts[1] + ":" + sts[2] + ":" + date
							+ Constants.MSGEND;
				}
				pw.println(str);
				pw.flush();
			}
		}
	}

	public Socket getSocketByName(String name) {
		Socket s = null;
		for (UserQQ u : hs) {
			if (u.getName().equals(name)) {
				s = u.getSocket();
			}
		}
		return s;
	}
	
	public class MainServerUI {
		private JFrame jf;
		public JTable table_onlineUser;
		
		public void showUI() {
			jf = new JFrame("QQ服务器管理程序");
			jf.setSize(500, 300);
			jf.setLayout(new FlowLayout());
			
			//界面上用于显示在线用户列表的表格
			table_onlineUser = new JTable();
			
			UserInfoTableMode utm = new UserInfoTableMode(hs);
			table_onlineUser.setModel(utm);
			
			JScrollPane scrollPane = new JScrollPane(table_onlineUser);
			table_onlineUser.setPreferredScrollableViewportSize(new Dimension(400, 100));
			scrollPane.setAutoscrolls(true);
			
			jf.add(scrollPane);
			
			//弹出菜单
			JPopupMenu pop = getTablePop();
			table_onlineUser.setComponentPopupMenu(pop);
			
			jf.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
			jf.setVisible(true);
		}
		
		private JPopupMenu getTablePop() {
			JPopupMenu pop = new JPopupMenu();
			
			JMenuItem pi_del = new JMenuItem("踢掉");
			pi_del.setActionCommand("del");
			
			ActionListener al = new ActionListener() {
				
				@Override
				public void actionPerformed(ActionEvent e) {
					popMenuAction(e.getActionCommand());
				}
			};
			
			pi_del.addActionListener(al);
			
			pop.add(pi_del);
			
			return pop;
		}

		//处理弹出菜单上的事件
		protected void popMenuAction(String command) {
			final int selectIndex = table_onlineUser.getSelectedRow();
			if (selectIndex == -1) {
				JOptionPane.showMessageDialog(jf, "请选择一个用户");
				return ;
			}
			if (command.equals("del")) {
				try {
					hs.remove(selectIndex);
					sockets.remove(selectIndex).close();
				} catch (IOException e) {
					e.printStackTrace();
				}
				
			} else {
				JOptionPane.showMessageDialog(jf, "未知菜单：" + command);
			}
			
			//刷新表格
			SwingUtilities.updateComponentTreeUI(table_onlineUser);
		}
		
		/**
		 * 创建表格模型
		 * @author 郑祥
		 *
		 */
		public class UserInfoTableMode extends AbstractTableModel {

			private static final long serialVersionUID = 6006081227685021641L;

			private List<UserQQ> userQQs;
			
			public UserInfoTableMode(List<UserQQ> userQQs) {
				this.userQQs = userQQs;
			}
			
			@Override
			public int getRowCount() {
				
				return userQQs.size();
			}

			@Override
			public String getColumnName(int column) {
				String[] columnName = {"姓名", "服务器IP"};
				return columnName[column];
			}

			@Override
			public int getColumnCount() {
				
				return 2;
			}

			@Override
			public Object getValueAt(int rowIndex, int columnIndex) {
				String result = null;
				switch (columnIndex) {
				case 0:
					result = userQQs.get(rowIndex).getName();
					break;

				case 1:
					result = userQQs.get(rowIndex).getSocket().getInetAddress().toString();
					break;
					
				default:
					break;
				}
				
				return result;
			}

			@Override
			public boolean isCellEditable(int rowIndex, int columnIndex) {
				return false;
			}

		}
	}

	public static void main(String[] args) {
		new Server(8888).start();
	}
}
