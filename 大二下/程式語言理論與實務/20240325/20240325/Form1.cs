using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.IO;

namespace _20240325
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            openFileDialog1.Filter = "二元檔案(*.dat)|*.dat";
            if(openFileDialog1.ShowDialog() == DialogResult.OK)
            {
                FileStream fs = new FileStream(openFileDialog1.FileName, FileMode.Open);
                BinaryReader br = new BinaryReader(fs);

                textBox1.Text = "第一回合:\r\n";

                int cn = br.ReadInt32();
                int bn = br.ReadInt32();
                int[,] ballot = new int[bn, cn];
                int[] count = new int[cn + 1];
                bool[] remove = new bool[cn + 1];
                int min = cn + 1;
                int round = 1;
                bool election = false;
                int remain = cn;

                for(int i=0; i<bn; i++)
                {
                    for(int j=0; j<cn; j++)
                    {
                        ballot[i, j] = br.ReadInt32();
                        textBox1.Text += ballot[i, j] + " ";
                    }
                    textBox1.Text += "\r\n";
                }
                for(int i=0; i<=cn; i++)
                {
                    remove[i] = false;
                }

                while(true)
                {
                    min = bn;
                    election = false;
                    //重置選票
                    for(int i = 0; i<=cn; i++)
                    {
                        count[i] = 0;
                    }

                    //計算第一順位的票
                    for(int i=0; i<bn; i++)
                    {
                        count[ballot[i, 0]] += 1;
                    }
                    /*for (int i = 0; i <= cn; i++)
                    {
                        label1.Text += " " + count[i];
                    }
                    label1.Text += "\r\n";*/

                    //如果第0個票等於選民人數，無法決定當選者
                    if (count[0] == bn)
                    {
                        textBox1.Text += "無法決定當選者\r\n";
                        break;
                    }

                    //如果第i候選人超過一半，當選
                    for (int i = 0; i <= cn; i++)
                    {
                        if(count[i] > bn/2)
                        {
                            textBox1.Text += "號碼" + i + "候選人過半數當選\r\n";
                            election = true;
                        }
                    }
                    if(election) break;


                    //計算最少的票數
                    for (int i = 1; i <= cn; i++)
                    {
                        if(count[i] < min && remove[i] == false) min = count[i];
                    }

                    //淘汰最低票
                    for(int i=1; i <= cn; i++)
                    {
                        if (count[i] == min && remove[i] == false)
                        {
                            remove[i] = true;
                            textBox1.Text += "號碼" + i + "候選人 ";
                            remain -= 1;
                        }
                    }
                    textBox1.Text += "本回合最低票被淘汰\r\n";

                    //整理投票
                    for(int i = 0;i<bn; i++)
                    {
                        int now = 0;
                        for(int j = 0; j < cn; j++)
                        {
                            if (remove[ballot[i, j]] != true) 
                            {
                                ballot[i, now] = ballot[i, j];
                                now += 1;
                            }
                        }
                    }
                    for (int i = 0; i < bn; i++)
                    {
                        for (int j=remain; j<cn; j++)
                        {
                            ballot[i, j] = 0;
                        }
                    }

                    for (int i = 0; i < bn; i++)
                    {
                        for (int j = 0; j < cn; j++)
                        {
                            textBox1.Text += ballot[i, j] + " ";
                        }
                        textBox1.Text += "\r\n";
                    }

                    round += 1;
                    textBox1.Text += "第" + round + "回合\r\n";
                }
            }
        }
    }
}
