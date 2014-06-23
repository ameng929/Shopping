package com.zx.kuangjia.image;


/*
 * @author zhangda
 * 验证码
 */
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Random;
import javax.imageio.ImageIO;

public class ImageEnsure
{

 public ImageEnsure()
 {
 }

 public String getEnsure(int width, int height, OutputStream os)
 {
     if(width <= 0)
         width = 60;
     if(height <= 0)
         height = 18;
     BufferedImage image = new BufferedImage(width, height, 1);
     Graphics g = image.getGraphics();
     g.setColor(new Color(0xF8F6E7)); //背景颜色
     g.fillRect(0, 0, width, height);
     g.setColor(new Color(0xF8F6E7));//边框颜色
     g.drawRect(0, 0, width - 1, height - 1);
     String strEnsure = "";
     for(int i = 0; i < 4; i++)
         strEnsure = strEnsure + mapTable[(int)((double)mapTable.length * Math.random())];

     g.setColor(color[(int)((double)mapTable.length * Math.random())]);//字体颜色
     g.setFont(new Font("Atlantic Inline", 0, 18));
     String str = strEnsure.substring(0, 1);
     g.drawString(str, 8, 17);
     g.setColor(color[(int)((double)mapTable.length * Math.random())]);
     str = strEnsure.substring(1, 2);
     g.drawString(str, 20, 15);
     g.setColor(color[(int)((double)mapTable.length * Math.random())]);
     str = strEnsure.substring(2, 3);
     g.drawString(str, 35, 18);
     g.setColor(color[(int)((double)mapTable.length * Math.random())]);
     str = strEnsure.substring(3, 4);
     g.drawString(str, 45, 15);
     Random rand = new Random();
     for(int i = 0; i < 10; i++)
     {
         int x = rand.nextInt(width);
         int y = rand.nextInt(height);
         g.drawOval(x, y, 1, 1);
     }

     g.dispose();
     try
     {
         ImageIO.write(image, "JPEG", os);

     }
     catch(IOException e)
     {
         return "";
     }
     return strEnsure;
 }
 private Color color[]={new Color(0xfad654),new Color(0xfff0f),new Color(0xa0a0a0),new Color(0xccccc),
		                new Color(0x993366),new Color(0x0066ff),new Color(0xc0099ff),new Color(0x99ff33),new Color(0x996633),new Color(0x336633)};
 private char mapTable[] = {
     '1', '2', '3',  '4', '5', '6', '7', '8', '9'
 };
}
