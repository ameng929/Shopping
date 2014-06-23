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
 * ˽�Ĵ���
 * 
 */
public class Personal extends JFrame implements ActionListener {
	/**
	 * 
	 */
	private static final long serialVersionUID = -3668804215562311638L;

	/**
	 * �Է�����
	 */
	private String username;

	/**
	 * �Լ�������
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
	 * ��ʼ���������
	 * 
	 */
	public void init() {
		this.setTitle("�� " + username + " ������");
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

		button = new JButton("����");
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
	 * ���Ͱ�ť�¼�
	 */
	public void actionPerformed(ActionEvent e) {
		if (jta_2.getText().equals("")) {
			JOptionPane.showMessageDialog(this, "������Ϣ����Ϊ�գ�");
		} else {
			client.sendMessage(Constants.MSGONLY + ownname + ":" + username
					+ ":" + jta_2.getText() + Constants.MSGEND);
			jta_2.setText("");
		}
	}

	/**
	 * �����Ϣ
	 * 
	 * @param str
	 */
	public void addMessage(String str) {
		String[] s = str.split(":");
		jta_1.append(s[1] + "  [" + s[4] + "]:\n  " + s[3] + "\n");
	}

	/**
	 * ��ȡһ��˽�Ĵ���
	 * 
	 * @param username
	 *            �Է�����
	 * @param ownname
	 *            �Լ�����
	 * @param client
	 *            ���ڷ�����Ϣ�Ŀͻ���
	 * @return
	 */
	public static Personal getPersonalDialog(String username, String ownname,
			Client client) {
		return new Personal(username, ownname, client);
	}
}
