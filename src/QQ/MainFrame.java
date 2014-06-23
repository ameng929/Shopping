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
	 * �������
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
		button = new JButton("����");
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
	 * ����Ĳ���
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
	 * �������ʾ
	 */
	private void showMe() {
		this.setSize(280, 400);
		this.setResizable(false);
		this.setLocation(200, 300);
		this.setVisible(true);
		this.setDefaultCloseOperation(JFrame.DO_NOTHING_ON_CLOSE);
	}

	/**
	 * ���Ͱ�Ŧ�ʹ��ڹرյĴ����¼�
	 */
	public void actionPerformed(ActionEvent e) {
		// System.out.println(jta_2.getText());
		if (jta_2.getText().equals("")) {
			JOptionPane.showMessageDialog(this, "������Ϣ����Ϊ�գ�");
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

		// ΪJList����¼�
		// ����һ��˽�Ĵ��ڣ�����������ڵ���Ϣ���浽ps��
		jl.addMouseListener(new MouseAdapter() {
			public void mouseClicked(MouseEvent e) {
				if (e.getClickCount() == 2) {
					int index = jl.locationToIndex(e.getPoint());
					String str = (String) dlm.get(index);
					if (str.equals(userQQ.getName())) // ���������Լ���������
						return;
					if (ps.get(str) != null) { // �����str��˽�Ĵ����Ѿ����ڣ�����ʾ
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
	 * ���յ���Ϣ������Э�����Ϣ���д���
	 * 
	 * @param str
	 */
	public void dealMessage(String str) {
		if (str.indexOf(Constants.MSG) > -1) { // ������Ϣ
			String[] s = str.split(":");
			jta_1.append(s[1] + "  [" + s[3] + "]:\n  " + s[2] + "\n");
		} else if (str.indexOf(Constants.LOGIN) > -1) { // �û���¼
			String s = str.split(":")[1];
			dlm.addElement(s);
			jta_1.append(s + " �����ˣ�\n");
		} else if (str.indexOf(Constants.EXIT) > -1) { // �û�����
			String obj = str.split(":")[1];
			dlm.removeElement(obj);
			jta_1.append(obj + " �����ˣ�\n");
		} else if (str.indexOf(Constants.PERSONALREQUEST) > -1) { // ˽������������������Ĵ��ڣ������洰����Ϣ
			String name = str.split(":")[1];
			Personal p = Personal.getPersonalDialog(name, userQQ.getName(),
					client);
			ps.put(name, p);
			p.setVisible(true);
		} else if (str.indexOf(Constants.MSGONLY) > -1) { // ��ϢΪ˽����Ϣ������˽�Ĵ���
			String ownname = str.split(":")[1];// ˵���˵�����
			String oname = str.split(":")[2];// �����˵�����
			if (ownname.equals(userQQ.getName())) {// �Լ�˵��
				Personal p = ps.get(oname);
				p.setVisible(true);
				p.addMessage(str);
			} else {// ����˵��
				Personal p = ps.get(ownname);
				p.setVisible(true);
				p.addMessage(str);
			}

		}
		jta_1.setCaretPosition(jta_1.getText().length());
	}

	/**
	 * ���������Ϣ�߳�
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
