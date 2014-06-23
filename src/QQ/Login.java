package QQ;

import java.awt.BorderLayout;
import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.IOException;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTextField;

/**
 * ��¼��
 */
public class Login extends JFrame implements ActionListener {

	private static final long serialVersionUID = 1L;

	private JTextField jtf_1;

	private JTextField jtf_2;

	private JTextField jtf_3;

	private JLabel jl_1;

	private JLabel jl_2;

	private JLabel jl_3;

	private JButton button_1;

	private JButton button_2;
	private JButton button_3;

	private JPanel jp_1;

	private JPanel jp_2;

	private String ip;

	private String port;

	private Client client;

	private UserQQ userQQ;

	public Login() {
		jtf_1 = new JTextField(16);
		jtf_2 = new JTextField(16);
		jtf_3 = new JTextField(16);
		jtf_3.setText("8888");
		jl_1 = new JLabel("�ǳ�:");
		jl_2 = new JLabel("IP:");
		jl_3 = new JLabel("Port:");

		button_1 = new JButton("��¼");
		button_2 = new JButton("�˳�");
		button_3=new JButton("ע��");
		jp_1 = new JPanel();
		jp_2 = new JPanel();
		this.setTitle("QQ2009");

		init();
		addEventHandel();
		showMe();
	}

	/**
	 * QQ��½����Ĳ���
	 */
	private void init() {
		this.setLayout(new BorderLayout());

		jp_1.setLayout(new FlowLayout(FlowLayout.LEFT));
		jp_2.setLayout(new BorderLayout());
		//jp_1.add(button_3);
		jp_1.add(jl_1);
		jp_1.add(jtf_1);
		jp_1.add(jl_2);
		jp_1.add(jtf_2);
		jp_1.add(jl_3);
		jp_1.add(jtf_3);
		jp_2.add(button_3, BorderLayout.CENTER);
		jp_2.add(button_1, BorderLayout.WEST);
		jp_2.add(button_2, BorderLayout.EAST);

		this.add(jp_1, BorderLayout.CENTER);
		this.add(jp_2, BorderLayout.SOUTH);
	}

	/**
	 * ��½�������ʾ
	 */
	private void showMe() {
		this.setSize(197, 197);
		this.setLocation(300, 350);
		this.setResizable(false);
		this.setVisible(true);
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	}

	private void addEventHandel() {
		button_1.addActionListener(this);
		button_2.addActionListener(this);
		button_3.addActionListener(this);
	}

	/**
	 * ��½��Ŧ���¼�
	 */
	public void actionPerformed(ActionEvent e) {
		if (e.getActionCommand().equals("ע��"))
		{
			new Enroll();
		}
		else if (e.getActionCommand().equals("��¼")) {
			if (jtf_2.getText().equals("") || jtf_3.getText().equals("")) {
				JOptionPane.showMessageDialog(this, "IP��ַ��˿ںŲ���Ϊ�գ�");
				return;
			} else if (jtf_1.getText().equals("")
					|| jtf_1.getText().length() > 6) {
				JOptionPane.showMessageDialog(this, "�ǳƲ���Ϊ���Ҳ��ܳ��Ȳ����߹�6�ֽڣ�");
				return;
			}
			userQQ = new UserQQ(jtf_1.getText());
			ip = jtf_2.getText();
			port = jtf_3.getText();
			try {
				client = new Client(ip, Integer.parseInt(port));
				JOptionPane.showMessageDialog(this, "ip" + ip + "port" + port);
				client.sendMessage(Constants.LOGIN + jtf_1.getText().trim()
						+ Constants.MSGEND);
			} catch (NumberFormatException e1) {
				JOptionPane.showMessageDialog(this, "�˿ں�ֻ�������֣�����������");
				return;
			} catch (IOException e1) {
				JOptionPane.showMessageDialog(this, "���Ӳ�������");
				return;
			}
			new MainFrame(client, userQQ);
			this.dispose();
		} else {
			int op = JOptionPane.showConfirmDialog(this, "ȷ���˳���", "�˳������",
					JOptionPane.YES_NO_OPTION);
			if (op == JOptionPane.YES_OPTION) {
				System.exit(0);
			}
		}

	}

	public static void main(String[] args) {
		new Login();
	}

}
