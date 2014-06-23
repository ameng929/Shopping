package QQ;

import javax.swing.*;
import java.awt.*;


public class Enroll extends JFrame //接口
{
 
 JLabel labelname,labelpass1,labelpass2,labelsxe,labeladdress,labelmail,labelphone;//标签
 JTextField textname,textaddress,textmail,textphone;//文本框
 JRadioButton r1,r2;//单选按纽
 ButtonGroup bg;//组
 JPasswordField textpass;//密码域
 JButton buttonregit,buttonreset;//注册按纽 重写按纽
 JPanel p;//面板
 String sex;//定义性别字符串
 
 

 //布局方式
 GridBagLayout gbl;
 GridBagConstraints gc;
 
 public Enroll()
 {
	 init();
 }
 //初始化
 public void init()
 {
  //new 对象
  labelname=new JLabel("昵称:");
  labelpass1=new JLabel("用户密码:");
  labelpass2=new JLabel("确认密码:");
  labelsxe=new JLabel("性别:");
  labeladdress=new JLabel("所在地:");
  labelmail=new JLabel("信箱账号:");
  labelphone=new JLabel("生日:");
  
  textname=new JTextField(15); textname.setForeground(Color.red);
  textname.setToolTipText("请在这输入你的昵称");
  textaddress=new JTextField(15);textaddress.setForeground(Color.red);
  textaddress.setToolTipText("请在这输入你的地址");
  textmail=new JTextField(15); textmail.setForeground(Color.red);
  textmail.setToolTipText("请在这里输入你的E-mail地址");
  textphone=new JTextField(15); textphone.setForeground(Color.red);
  textphone.setToolTipText("请在这输入你的生日");
  
  r1=new JRadioButton("男"); r1.setBackground(new Color(47,177,210));//设置颜色
  r2=new JRadioButton("女"); r2.setBackground(new Color(47,177,210));//设置颜色
  bg=new ButtonGroup();
  bg.add(r1);bg.add(r2);//加入组,实现单选
  
  textpass=new JPasswordField(15); 
  textpass.setToolTipText("在这里输入密码");
  textpass.setForeground(Color.red);
  
  buttonregit=new JButton("注册"); buttonregit.setBackground(new Color(47,177,210));//设置颜色
     buttonregit.setToolTipText("点击按纽完成注册");
  buttonreset=new JButton("填写"); buttonreset.setBackground(new Color(47,177,210));//设置颜色
     buttonreset.setToolTipText("点击按纽刷新重写");
  
  gbl=new GridBagLayout();     ///////////////////////////////////////
  gc=new GridBagConstraints(); //////采用GridBagLayout布局方式////////
  
  p=new JPanel();
  p.setLayout(gbl);
  p.setBackground(new Color(47,177,210));
  
  this.getContentPane().add(p);//加入面板
  
  gc.anchor=GridBagConstraints.NORTHWEST;
  gc.gridx=2;
  gc.gridy=2;
  gbl.setConstraints(labelname,gc);
  p.add(labelname);
  
  gc.anchor=GridBagConstraints.NORTHWEST;
  gc.gridx=4;
  gc.gridy=2;
  gbl.setConstraints(textname,gc);
  p.add(textname);
  
  gc.anchor=GridBagConstraints.NORTHWEST;
  gc.gridx=2;
  gc.gridy=4;
  gbl.setConstraints(labelpass1,gc);
  p.add(labelpass1);
  
  gc.anchor=GridBagConstraints.NORTHWEST;
  gc.gridx=4;
  gc.gridy=4;
  gbl.setConstraints(textpass,gc);
  p.add(textpass);
  
  gc.anchor=GridBagConstraints.NORTHWEST;
  gc.gridx=2;
  gc.gridy=6;
  gbl.setConstraints(labelsxe,gc);
  p.add(labelsxe);
  
  gc.anchor=GridBagConstraints.NORTHWEST;
  gc.gridx=4;
  gc.gridy=6;
  gbl.setConstraints(r1,gc);
  p.add(r1);
  
  gc.anchor=GridBagConstraints.NORTHWEST;
  gc.gridx=5;
  gc.gridy=6;
  gbl.setConstraints(r2,gc);
  p.add(r2);
  
  gc.anchor=GridBagConstraints.NORTHWEST;
  gc.gridx=2;
  gc.gridy=8;
  gbl.setConstraints(labeladdress,gc);
  p.add(labeladdress);
  
  gc.anchor=GridBagConstraints.NORTHWEST;
  gc.gridx=4;
  gc.gridy=8;
  gbl.setConstraints(textaddress,gc);
  p.add(textaddress);
  
  gc.anchor=GridBagConstraints.NORTHWEST;
  gc.gridx=2;
  gc.gridy=10;
  gbl.setConstraints(labelmail,gc);
  p.add(labelmail);
  
  gc.anchor=GridBagConstraints.NORTHWEST;
  gc.gridx=4;
  gc.gridy=10;
  gbl.setConstraints(textmail,gc);
  p.add(textmail);
  
  gc.anchor=GridBagConstraints.NORTHWEST;
  gc.gridx=2;
  gc.gridy=12;
  gbl.setConstraints(labelphone,gc);
  p.add(labelphone);
  
  gc.anchor=GridBagConstraints.NORTHWEST;
  gc.gridx=4;
  gc.gridy=12;
  gbl.setConstraints(textphone,gc);
  p.add(textphone);
  
  gc.anchor=GridBagConstraints.NORTHWEST;
  gc.gridx=2;
  gc.gridy=16;
  gbl.setConstraints(buttonregit,gc);
  p.add(buttonregit);
  
  gc.anchor=GridBagConstraints.NORTHWEST;
  gc.gridx=4;
  gc.gridy=16;
  gbl.setConstraints(buttonreset,gc);
  p.add(buttonreset);
  this.setSize(400, 300);
  this.setVisible(true);
 }
}
 