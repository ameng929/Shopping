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
 * 登录框
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
		jl_1 = new JLabel("昵称:");
		jl_2 = new JLabel("IP:");
		jl_3 = new JLabel("Port:");

		button_1 = new JButton("登录");
		button_2 = new JButton("退出");
		button_3=new JButton("注册");
		jp_1 = new JPanel();
		jp_2 = new JPanel();
		this.setTitle("QQ2009");

		init();
		addEventHandel();
		showMe();
	}

	/**
	 * QQ登陆界面的布局
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
	 * 登陆界面的显示
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
	 * 登陆按纽的事件
	 */
	public void actionPerformed(ActionEvent e) {
		if (e.getActionCommand().equals("注册"))
		{
			new Enroll();
		}
		else if (e.getActionCommand().equals("登录")) {
			if (jtf_2.getText().equals("") || jtf_3.getText().equals("")) {
				JOptionPane.showMessageDialog(this, "IP地址或端口号不能为空！");
				return;
			} else if (jtf_1.getText().equals("")
					|| jtf_1.getText().length() > 6) {
				JOptionPane.showMessageDialog(this, "昵称不能为空且不能长度不能走过6字节！");
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
				JOptionPane.showMessageDialog(this, "端口号只能是数字，请重新输入");
				return;
			} catch (IOException e1) {
				JOptionPane.showMessageDialog(this, "连接参数错误！");
				return;
			}
			new MainFrame(client, userQQ);
			this.dispose();
		} else {
			int op = JOptionPane.showConfirmDialog(this, "确定退出？", "退出程序框",
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
