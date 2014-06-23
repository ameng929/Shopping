package QQ;

import java.awt.BorderLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;

/**
 * 私聊窗口
 * 
 */
public class Personal extends JFrame implements ActionListener {
	/**
	 * 
	 */
	private static final long serialVersionUID = -3668804215562311638L;

	/**
	 * 对方姓名
	 */
	private String username;

	/**
	 * 自己的名字
	 */
	private String ownname;

	private JPanel jp;

	private JScrollPane jsp_1;

	private JScrollPane jsp_2;

	private JTextArea jta_1;

	private JTextArea jta_2;

	private JButton button;

	private Client client;

	public Personal(String username, String ownname, Client client) {
		super();
		this.username = username;
		this.ownname = ownname;
		this.client = client;
		// TODO Auto-generated constructor stub
		init();
	}

	/**
	 * 初始化窗口组件
	 * 
	 */
	public void init() {
		this.setTitle("与 " + username + " 聊天中");
		jp = new JPanel();
		jta_1 = new JTextArea(20, 25);
		jta_1.setLineWrap(true);
		jta_1.setEditable(false);
		jta_2 = new JTextArea(3, 19);

		jta_2.addKeyListener(new KeyAdapter() {
			public void keyPressed(KeyEvent e) {
				if (e.getKeyCode() == KeyEvent.VK_ENTER && e.isControlDown()) {
					actionPerformed(null);
				}
			}
		});

		button = new JButton("发送");
		button.addActionListener(this);
		jsp_1 = new JScrollPane(jta_1);
		jsp_2 = new JScrollPane(jta_2);

		jta_1.setEditable(false);

		jp.setLayout(new BorderLayout());
		jp.add(jsp_2, BorderLayout.WEST);
		jp.add(button, BorderLayout.EAST);

		this.add(jsp_1, BorderLayout.CENTER);
		this.add(jp, BorderLayout.SOUTH);
		this.setDefaultCloseOperation(HIDE_ON_CLOSE);
		this.pack();
		this.validate();

	}

	/**
	 * 发送按钮事件
	 */
	public void actionPerformed(ActionEvent e) {
		if (jta_2.getText().equals("")) {
			JOptionPane.showMessageDialog(this, "发送信息不能为空！");
		} else {
			client.sendMessage(Constants.MSGONLY + ownname + ":" + username
					+ ":" + jta_2.getText() + Constants.MSGEND);
			jta_2.setText("");
		}
	}

	/**
	 * 添加信息
	 * 
	 * @param str
	 */
	public void addMessage(String str) {
		String[] s = str.split(":");
		jta_1.append(s[1] + "  [" + s[4] + "]:\n  " + s[3] + "\n");
	}

	/**
	 * 获取一个私聊窗口
	 * 
	 * @param username
	 *            对方姓名
	 * @param ownname
	 *            自己姓名
	 * @param client
	 *            用于发送消息的客户端
	 * @return
	 */
	public static Personal getPersonalDialog(String username, String ownname,
			Client client) {
		return new Personal(username, ownname, client);
	}
}
