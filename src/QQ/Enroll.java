package QQ;

import javax.swing.*;
import java.awt.*;


public class Enroll extends JFrame //�ӿ�
{
 
 JLabel labelname,labelpass1,labelpass2,labelsxe,labeladdress,labelmail,labelphone;//��ǩ
 JTextField textname,textaddress,textmail,textphone;//�ı���
 JRadioButton r1,r2;//��ѡ��Ŧ
 ButtonGroup bg;//��
 JPasswordField textpass;//������
 JButton buttonregit,buttonreset;//ע�ᰴŦ ��д��Ŧ
 JPanel p;//���
 String sex;//�����Ա��ַ���
 
 

 //���ַ�ʽ
 GridBagLayout gbl;
 GridBagConstraints gc;
 
 public Enroll()
 {
	 init();
 }
 //��ʼ��
 public void init()
 {
  //new ����
  labelname=new JLabel("�ǳ�:");
  labelpass1=new JLabel("�û�����:");
  labelpass2=new JLabel("ȷ������:");
  labelsxe=new JLabel("�Ա�:");
  labeladdress=new JLabel("���ڵ�:");
  labelmail=new JLabel("�����˺�:");
  labelphone=new JLabel("����:");
  
  textname=new JTextField(15); textname.setForeground(Color.red);
  textname.setToolTipText("��������������ǳ�");
  textaddress=new JTextField(15);textaddress.setForeground(Color.red);
  textaddress.setToolTipText("������������ĵ�ַ");
  textmail=new JTextField(15); textmail.setForeground(Color.red);
  textmail.setToolTipText("���������������E-mail��ַ");
  textphone=new JTextField(15); textphone.setForeground(Color.red);
  textphone.setToolTipText("�����������������");
  
  r1=new JRadioButton("��"); r1.setBackground(new Color(47,177,210));//������ɫ
  r2=new JRadioButton("Ů"); r2.setBackground(new Color(47,177,210));//������ɫ
  bg=new ButtonGroup();
  bg.add(r1);bg.add(r2);//������,ʵ�ֵ�ѡ
  
  textpass=new JPasswordField(15); 
  textpass.setToolTipText("��������������");
  textpass.setForeground(Color.red);
  
  buttonregit=new JButton("ע��"); buttonregit.setBackground(new Color(47,177,210));//������ɫ
     buttonregit.setToolTipText("�����Ŧ���ע��");
  buttonreset=new JButton("��д"); buttonreset.setBackground(new Color(47,177,210));//������ɫ
     buttonreset.setToolTipText("�����Ŧˢ����д");
  
  gbl=new GridBagLayout();     ///////////////////////////////////////
  gc=new GridBagConstraints(); //////����GridBagLayout���ַ�ʽ////////
  
  p=new JPanel();
  p.setLayout(gbl);
  p.setBackground(new Color(47,177,210));
  
  this.getContentPane().add(p);//�������
  
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
 