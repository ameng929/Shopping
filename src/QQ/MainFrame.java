package QQ;

import java.awt.BorderLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.io.IOException;
import java.util.HashMap;

import javax.swing.DefaultListModel;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JList;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;

public class MainFrame extends JFrame implements ActionListener {
	/**
	 * 聊天界面
	 */
	private static final long serialVersionUID = 1L;

	private JTextArea jta_1;

	private JTextArea jta_2;

	private JButton button;

	private JScrollPane jsp_1;

	private JScrollPane jsp_2;

	private JList jl;

	private JPanel jp;

	private Client client;

	private UserQQ userQQ;

	private DefaultListModel dlm;

	private HashMap<String, Personal> ps;

	public MainFrame(Client client, UserQQ userQQ) {
		super(userQQ.getName());
		ps = new HashMap<String, Personal>();
		jta_1 = new JTextArea(20, 25);
		jta_1.setLineWrap(true);
		jta_1.setEditable(false);
		jta_2 = new JTextArea(3, 19);
		button = new JButton("发送");
		jsp_1 = new JScrollPane(jta_1);
		jsp_2 = new JScrollPane(jta_2);
		dlm = new DefaultListModel();
		jl = new JList(dlm);
		jp = new JPanel();
		this.client = client;
		this.userQQ = userQQ;
		new ReadMessageThread().start();
		init();
		showMe();
		addEventHandler();
	}

	/**
	 * 界面的布局
	 */
	private void init() {
		jta_1.setEditable(false);

		jp.setLayout(new BorderLayout());
		jp.add(jsp_2, BorderLayout.WEST);
		jp.add(button, BorderLayout.EAST);

		this.add(jsp_1, BorderLayout.CENTER);
		this.add(jp, BorderLayout.SOUTH);
		this.add(jl, BorderLayout.EAST);
	}

	/**
	 * 界面的显示
	 */
	private void showMe() {
		this.setSize(280, 400);
		this.setResizable(false);
		this.setLocation(200, 300);
		this.setVisible(true);
		this.setDefaultCloseOperation(JFrame.DO_NOTHING_ON_CLOSE);
	}

	/**
	 * 发送按纽和窗口关闭的触发事件
	 */
	public void actionPerformed(ActionEvent e) {
		// System.out.println(jta_2.getText());
		if (jta_2.getText().equals("")) {
			JOptionPane.showMessageDialog(this, "发送信息不能为空！");
		} else {
			client.sendMessage(Constants.MSG + userQQ.getName() + ":"
					+ jta_2.getText() + Constants.MSGEND);
			jta_2.setText("");
		}
	}

	private void addEventHandler() {
		button.addActionListener(this);
		jta_2.addKeyListener(new KeyAdapter() {
			public void keyPressed(KeyEvent e) {
				if (e.getKeyCode() == KeyEvent.VK_ENTER && e.isControlDown()) {
					actionPerformed(null);
				}
			}
		});

		this.addWindowListener(new WindowAdapter() {
			public void windowClosing(WindowEvent e) {
				client.sendMessage(Constants.EXIT + userQQ.getName()
						+ Constants.MSGEND);
				try {
					Thread.sleep(800);
					client.close();
				} catch (IOException e1) {
					e1.printStackTrace();
				} catch (InterruptedException e2) {
					e2.printStackTrace();
				}
				System.exit(0);
			}
		});

		// 为JList添加事件
		// 产生一个私聊窗口，并把这个窗口的信息保存到ps中
		jl.addMouseListener(new MouseAdapter() {
			public void mouseClicked(MouseEvent e) {
				if (e.getClickCount() == 2) {
					int index = jl.locationToIndex(e.getPoint());
					String str = (String) dlm.get(index);
					if (str.equals(userQQ.getName())) // 如果点的是自己，不理他
						return;
					if (ps.get(str) != null) { // 如果与str的私聊窗口已经存在，则显示
						ps.get(str).setVisible(true);
						return;
					}
					Personal p = Personal.getPersonalDialog(str, userQQ
							.getName(), client);
					ps.put(str, p);
					client.sendMessage(Constants.PERSONALREQUEST
							+ userQQ.getName() + ":" + str + Constants.MSGEND);
					p.setVisible(true);
				}
			}
		});
	}

	/**
	 * 接收到信息后，依据协议对信息进行处理
	 * 
	 * @param str
	 */
	public void dealMessage(String str) {
		if (str.indexOf(Constants.MSG) > -1) { // 公聊信息
			String[] s = str.split(":");
			jta_1.append(s[1] + "  [" + s[3] + "]:\n  " + s[2] + "\n");
		} else if (str.indexOf(Constants.LOGIN) > -1) { // 用户登录
			String s = str.split(":")[1];
			dlm.addElement(s);
			jta_1.append(s + " 上线了！\n");
		} else if (str.indexOf(Constants.EXIT) > -1) { // 用户下线
			String obj = str.split(":")[1];
			dlm.removeElement(obj);
			jta_1.append(obj + " 下线了！\n");
		} else if (str.indexOf(Constants.PERSONALREQUEST) > -1) { // 私聊请求，生成与其聊天的窗口，并保存窗口信息
			String name = str.split(":")[1];
			Personal p = Personal.getPersonalDialog(name, userQQ.getName(),
					client);
			ps.put(name, p);
			p.setVisible(true);
		} else if (str.indexOf(Constants.MSGONLY) > -1) { // 信息为私聊信息，发往私聊窗口
			String ownname = str.split(":")[1];// 说话人的姓名
			String oname = str.split(":")[2];// 接收人的姓名
			if (ownname.equals(userQQ.getName())) {// 自己说的
				Personal p = ps.get(oname);
				p.setVisible(true);
				p.addMessage(str);
			} else {// 别人说的
				Personal p = ps.get(ownname);
				p.setVisible(true);
				p.addMessage(str);
			}

		}
		jta_1.setCaretPosition(jta_1.getText().length());
	}

	/**
	 * 主界面读信息线程
	 */
	class ReadMessageThread extends Thread {
		public void run() {
			while (!client.isClosed()) {
				try {
					StringBuilder sb = new StringBuilder();
					String str = "";
					while (sb.toString().indexOf(Constants.MSGEND) < 0) {
						str = client.readMessage();
						if (str == null)
							return;
						sb.append(str + "\n");
					}
					str = sb.toString();
					dealMessage(str);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}

}
