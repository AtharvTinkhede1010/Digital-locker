import java.awt.*;
import java.awt.event.*;
import java.applet.*;
import javax.swing.*;
import java.io.*;
import java.security.*;
import javax.crypto.*;
import javax.crypto.spec.*;
import java.io.*;
import java.net.*;

class WSFrame extends JFrame implements ActionListener
{
JButton b1,b2,b3,b4;
public WSFrame()
    {
    URL imgURL = getClass().getResource("/key.JPG");
    Image img = Toolkit.getDefaultToolkit().getImage(imgURL);
    Container con=this.getContentPane();
    con.setLayout(new GridLayout(4,1,10,10));
    b1=new JButton("Create Key",new ImageIcon(img));
    con.add(b1);
    b1.setBackground(Color.white);
    b1.addActionListener(this);

    imgURL = getClass().getResource("/encrypt.JPG");
    img = Toolkit.getDefaultToolkit().getImage(imgURL);
    b2=new JButton("Encrypt",new ImageIcon(img));
    con.add(b2);
    b2.setBackground(Color.white);	
    b2.addActionListener(this);

    imgURL = getClass().getResource("/decrypt.JPG");
    img = Toolkit.getDefaultToolkit().getImage(imgURL);
    b3=new JButton("Decrypt",new ImageIcon(img));
    con.add(b3);
    b3.setBackground(Color.white);
    b3.addActionListener(this);

    imgURL = getClass().getResource("/exit.JPG");
    img = Toolkit.getDefaultToolkit().getImage(imgURL);
    b4=new JButton("Exit",new ImageIcon(img));
    con.add(b4);
    b4.setBackground(Color.white);
    b4.addActionListener(this);
    
    }
public void actionPerformed(ActionEvent e)
    {
    String cmd=e.getActionCommand();
    if(cmd.equals("Create Key"))
        {
	File keydir=new File("c:\\keys");
	if(!keydir.exists())
		keydir.mkdir();
        String key=JOptionPane.showInputDialog(this,"Enter Key Name");
	String ckey="c:\\keys\\"+key+".key";
	genkey(ckey);
        JOptionPane.showMessageDialog(this,"Key stored in file "+ckey);
        }
    if(cmd.equals("Exit"))
        System.exit(0);
    if(cmd.equals("Encrypt"))
        {
        JFileChooser fd=new JFileChooser();
	if(fd.showOpenDialog(this)==JFileChooser.APPROVE_OPTION)
		{
		String key=JOptionPane.showInputDialog(this,"Enter Key Name");
		String ckey="c:\\keys\\"+key+".key";
		File fkey=new File(ckey);
		if(!fkey.exists())
			{
			JOptionPane.showMessageDialog(this,"Key Not Found");
			return;
			}
		String efile=fd.getSelectedFile().toString();
		long starttime=System.currentTimeMillis();
		encrypt(efile,efile+".aes",ckey);
		long endtime=System.currentTimeMillis();
		
		long time=endtime-starttime;

		JOptionPane.showMessageDialog(this,"Encrypted file is stored in "+efile+".aes"+"\nTime :"+time+" ms");
		}
        }
     if(cmd.equals("Decrypt"))
        {
        JFileChooser fd=new JFileChooser();
	if(fd.showOpenDialog(this)==JFileChooser.APPROVE_OPTION)
		{
		String key=JOptionPane.showInputDialog(this,"Enter Key Name");
		String ckey="c:\\keys\\"+key+".key";
		File fkey=new File(ckey);
		if(!fkey.exists())
			{
			JOptionPane.showMessageDialog(this,"Key Not Found");
			return;
			}
		String efile=fd.getSelectedFile().toString();
		String dfile=efile.substring(0,efile.length()-4);
		long starttime=System.currentTimeMillis();
		decrypt(efile,dfile,ckey);
		long endtime=System.currentTimeMillis();
		long time=endtime-starttime;
		JOptionPane.showMessageDialog(this,"Decrypted file is stored in  "+dfile+"\nTime:"+time+" ms");
		}
        }
    }

public static void genkey(String fkey)
    {
    try{

    //get Key Generator object for AES
    KeyGenerator keygen=KeyGenerator.getInstance("AES");

    // create an Random number generator
    SecureRandom rnd=new SecureRandom();

    //ininitilize key by random number
    keygen.init(rnd);

    //create a key
    SecretKey key=keygen.generateKey();

    //store key into file
    ObjectOutputStream out=new ObjectOutputStream(new FileOutputStream(fkey));
    out.writeObject(key);
    out.close();
        }
    catch(Exception er)
        {
        System.out.println(er);
        }
    }
public static void encrypt(String datafile,String enfile,String keyfile)
    {
    try{

       //Open  Key File
       ObjectInputStream keyin=new ObjectInputStream(new FileInputStream(keyfile));

       //read key object from key file
       Key key=(Key)keyin.readObject();

       keyin.close();


       //open file to be encrypted
       InputStream in=new FileInputStream(datafile);

       //open output file in which encrypted file is to be stored
       OutputStream out=new FileOutputStream(enfile);


       //create a Cipher object which will encrypt file
       Cipher cipher=Cipher.getInstance("AES");

       //set it in encrypt mode
       cipher.init(Cipher.ENCRYPT_MODE,key);

       //find out input block size
       int blocksize=cipher.getBlockSize();

       //find out output block size
       int outputsize=cipher.getOutputSize(blocksize);

       //define input block  buffer
       byte inbytes[]=new byte[blocksize];

       //define output block buffer
       byte outbytes[]=new byte[outputsize];

       int length=0;
       boolean more=true;
       while(more)
        {
        length=in.read(inbytes);
        if(length==blocksize)
            {
            int outlength=cipher.update(inbytes,0,blocksize,outbytes);
            out.write(outbytes,0,outlength);
            }
        else
            more=false;
        }
        if(length>0)
            outbytes=cipher.doFinal(inbytes,0,length);
        else
            outbytes=cipher.doFinal();
       out.write(outbytes);
       out.close();
       in.close();
       }
    catch(Exception er)
        {
        System.out.println(er);
        }
    }
public static void decrypt(String datafile,String enfile,String keyfile)
    {
    try{
       ObjectInputStream keyin=new ObjectInputStream(new FileInputStream(keyfile));
       Key key=(Key)keyin.readObject();
       keyin.close();

       InputStream in=new FileInputStream(datafile);
       OutputStream out=new FileOutputStream(enfile);

       Cipher cipher=Cipher.getInstance("AES");
       cipher.init(Cipher.DECRYPT_MODE,key);

       int blocksize=cipher.getBlockSize();
       int outputsize=cipher.getOutputSize(blocksize);

       byte inbytes[]=new byte[blocksize];
       byte outbytes[]=new byte[outputsize];
       System.out.println(blocksize+" , "+outputsize);
       int length=0;
       boolean more=true;
       while(more)
        {
        length=in.read(inbytes);
        if(length==blocksize)
            {
            int outlength=cipher.update(inbytes,0,blocksize,outbytes);
            out.write(outbytes,0,outlength);
            }
        else
            more=false;
        }
        if(length>0)
            outbytes=cipher.doFinal(inbytes,0,length);
        else
            outbytes=cipher.doFinal();
       out.write(outbytes);
       out.close();
       in.close();
       }
    catch(Exception er)
        {
        System.out.println(er);
        }
    }
}


class ws
{
public static void main(String args[])
{
WSFrame f=new WSFrame();
f.setSize(170,300);
f.setVisible(true);
}	
}
