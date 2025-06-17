using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace _20240311
{
    public partial class Form1 : Form
    { 
        bool start = false;
        bool[] card = new bool[52];
        int[] dealer = new int[5];
        int[] player = new int[5];
        Random ran = new Random();
        int N1, N2, d, p, dn, pn, dn2, pn2;
        bool db=false;
        bool[] ap = new bool[5];

        private void label6_Click(object sender, EventArgs e)
        {

        }

        private void label5_Click(object sender, EventArgs e)
        {

        }

        bool[] ad = new bool[5];

        string GenerateColor(int a)
        {
            string color;
            if (a <= 12) color = "\u2660\r\n";
            else if (a <= 25) color = "\u2665\r\n";
            else if (a <= 38) color = "\u2666\r\n";
            else color = "\u2663\r\n";

            if (a % 13 == 0) color += "A";
            else if (a % 13 == 12) color += "K";
            else if (a % 13 == 11) color += "Q";
            else if (a % 13 == 10) color += "J";
            else color += (a % 13 + 1);

            return color;
        }

        
        private void button11_Click(object sender, EventArgs e)
        {
            try
            {
                if (start == false)
                {
                    d = 2; p = 2; dn = 0; pn = 0; dn2 = 0; pn2 = 0; db = false ;

                    button3.Visible = false;
                    button4.Visible = false;
                    button5.Visible = false;
                    button8.Visible = false;
                    button9.Visible = false;
                    button10.Visible = false;
                    button11.Enabled = false;
                    button12.Enabled = true;
                    button13.Enabled = true;

                    N1 = Convert.ToInt32(textBox1.Text);
                    N2 = Convert.ToInt32(textBox2.Text);
                    if (N2 > N1) throw new Exception("籌碼不足");
                    if (N2 <= 0) throw new Exception("下注籌碼不可為0");
                    textBox2.ReadOnly = true;

                    for (int i = 0; i < 52; i++) card[i] = false;
                    for(int i = 0;i < 5; i++)
                    {
                        dealer[i] = -1;
                        player[i] = -1;
                        ap[i] = false;
                        ad[i] = false;
                    }

                    dealer[0] = ran.Next(52);
                    card[dealer[0]] = true;
                    button1.Text = "";

                    do
                    {
                        dealer[1] = ran.Next(52);
                    } while (card[dealer[1]] == true);
                    card[dealer[1]] = true;
                    button2.Text = GenerateColor(dealer[1]);

                    do
                    {
                        player[0] = ran.Next(52);
                    }while (card[player[0]] == true);
                    card[player[0]] = true;
                    button6.Text = GenerateColor(player[0]);

                    do
                    {
                        player[1] = ran.Next(52);
                    } while (card[player[1]] == true);
                    card[player[1]] = true;
                    button7.Text = GenerateColor(player[1]);

                    if (dealer[0] % 13 == 0 && dealer[1] % 13 >= 9 || dealer[0] % 13 >= 9 && dealer[1] % 13 == 0)
                    {
                        if (player[0] % 13 == 0 && player[1] % 13 >= 9 || player[0] % 13 >= 9 && player[1] % 13 == 0)
                        {
                            button1.Text = GenerateColor(dealer[0]);
                            MessageBox.Show("雙方都是Black Jack, 平手!!", "和局", MessageBoxButtons.OK, MessageBoxIcon.None);
                            textBox2.ReadOnly = false;
                            button11.Enabled = true;
                            start = false;
                            //return;
                        }
                        else
                        {
                            button1.Text = GenerateColor(dealer[0]);
                            textBox1.Text = "" + (N1 - N2);
                            MessageBox.Show("莊家Black Jack, 你輸了" + N2 + "籌碼", "好可惜", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                            textBox2.ReadOnly = false;
                            button11.Enabled = true;
                            start = false;
                           // return;
                        }
                    }
                    else if(player[0] % 13 == 0 && player[1] % 13 >= 9 || player[0] % 13 >= 9 && player[1] % 13 == 0)
                    {
                        button1.Text = GenerateColor(dealer[0]);
                        textBox1.Text = "" + (N1 + N2);
                        MessageBox.Show("玩家Black Jack, 你贏了" + N2 + "籌碼", "恭喜你", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        textBox2.ReadOnly = false;
                        button11.Enabled = true;
                        start = false;
                        //return;
                    }

                    if (dealer[0] % 13 == 0)
                    {
                        dn += 11;
                        ad[0] = true;
                    }
                    else if (dealer[0] % 13 < 9 && dealer[0] % 13 != 0) dn += dealer[0] % 13 + 1;
                    else dn += 10;

                    if (dealer[1] % 13 == 0)
                    {
                        dn += 11;
                        ad[1] = true;
                        if(dn > 21)
                        {
                            ad[1] = false;
                            dn -= 10;
                        }
                    }
                    else if (dealer[1] % 13 < 9 && dealer[1] % 13 != 0) dn += dealer[1] % 13 + 1;
                    else dn += 10;

                    if (player[0] % 13 == 0)
                    {
                        pn += 11;
                        ap[0] = true;
                    }
                    else if (player[0] % 13 < 9 && player[0] % 13 != 0) pn += player[0] % 13 + 1;
                    else pn += 10;

                    if (player[1] % 13 == 0)
                    {
                        pn += 11;
                        ap[1] = true;
                        if(pn> 21)
                        {
                            ap[1] = false;
                            pn -= 10;
                        }
                    }
                    else if (player[1] % 13 < 9 && player[1] % 13 != 0) pn += player[1] % 13 + 1;
                    else pn += 10;

                    label6.Text = "" + pn;
                }
            }
            catch (Exception ex) 
            {
                MessageBox.Show(ex.Message, "錯誤訊息", MessageBoxButtons.OK, MessageBoxIcon.Error);
                button11.Enabled = true;
                button12.Enabled = false;
                button13.Enabled = false;
            }
        }
        private void button12_Click(object sender, EventArgs e)
        {
            if(p < 5)
            {
                do
                {
                    player[p] = ran.Next(52);
                } while (card[player[p]] == true);
                card[player[p]] = true;

                if (p == 2)
                {
                    button8.Text = GenerateColor(player[p]);
                    button8.Visible = true;
                }
                else if (p == 3)
                {
                    button9.Text = GenerateColor(player[p]);
                    button9.Visible = true;
                }
                else if (p == 4)
                {
                    button10.Text = GenerateColor(player[p]);
                    button10.Visible = true;
                }

                if(player[p] % 13 == 0)
                {
                    pn += 11;
                    ap[p] = true;
                }
                else if (player[p] % 13 < 9 && player[p] % 13 != 0) pn += player[p] % 13 + 1;
                else pn += 10;
            }
            if (pn > 21)
            {
                int decide = 0;
                for (int i = 0; i <= p; i++)
                {
                    if (ap[i] == true)
                    {
                        decide += 1;
                    }
                }
                if (decide != 0)
                { 
                    for (int i = 0; i <= p; i++)
                    {
                        if (player[i] % 13 == 0 && ap[i] == true)
                        {
                            pn -= 10;
                            ap[i] = false;
                            break;
                        }
                    }
                }
            }
            label6.Text = "" + pn;
            if (pn > 21)
            {
                textBox1.Text = "" + (N1 - N2);
                MessageBox.Show("你爆了, 你輸了" + N2 + "籌碼", "好可惜", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                textBox2.ReadOnly = false;
                button11.Enabled = true;
                start = false;
                button12.Enabled = false;
                button13.Enabled = false;
                //return;
            }
            p++;
        }

        private void button13_Click(object sender, EventArgs e)
        {
            while ((dn < 17 || (dn >= 17 && dn < pn)) && dn <= 21 && d < 5)
            {
                do
                {
                    dealer[d] = ran.Next(52);
                } while (card[dealer[d]] == true);
                card[dealer[d]] = true;

                if (d == 2)
                {
                    button3.Text = GenerateColor(dealer[d]);
                    button3.Visible = true;
                }
                else if (d == 3)
                {
                    button4.Text = GenerateColor(dealer[d]);
                    button4.Visible = true;
                }
                else if (d == 4)
                {
                    button5.Text = GenerateColor(dealer[d]);
                    button5.Visible = true;
                }

                if (dealer[d] % 13 == 0)
                {
                    dn += 11;
                    ad[d] = true;
                }
                else if (dealer[d] % 13 < 9 && dealer[d] % 13 != 0) dn += dealer[d] % 13 + 1;
                else dn += 10;

                if (dn > 21)
                {
                    int decide = 0;
                    for (int i = 0; i <= d; i++)
                    {
                        if (ad[i] == true)
                        {
                            decide += 1;
                        }
                    }
                    if (decide != 0)
                    {
                        for (int i = 0; i <= d; i++)
                        {
                            if (dealer[i] % 13 == 0 && ad[i] == true)
                            {
                                dn -= 10;
                                ad[i] = false;
                                break;
                            }
                        }
                    }
                }
                if (dn > 21)
                {
                    button1.Text = GenerateColor(dealer[0]);
                    textBox1.Text = "" + (N1 + N2);
                    MessageBox.Show("莊家爆了, 你贏了" + N2 + "籌碼", "恭喜你", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    textBox2.ReadOnly = false;
                    button11.Enabled = true;
                    db = true;
                    start = false;
                    //return;
                }
                d++;
                label5.Text = "" + dn;
            }
            label5.Text = "" + dn;
            if (dn <= 21 && dn > pn && db == false)
            {
                button1.Text = GenerateColor(dealer[0]);
                textBox1.Text = "" + (N1 - N2);
                MessageBox.Show("莊家點數較高, 你輸了" + N2 + "籌碼", "好可惜", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                textBox2.ReadOnly = false;
                button11.Enabled = true;
                start = false;
                //return;
            }
            else if (dn <= 21 && dn == pn && db == false)
            {
                button1.Text = GenerateColor(dealer[0]);
                MessageBox.Show("雙方點數相等，平手", "恭喜你", MessageBoxButtons.OK, MessageBoxIcon.None);
                textBox2.ReadOnly = false;
                button11.Enabled = true;
                start = false;
               // return;
            }
            else if (dn <= 21 && dn < pn && db == false)
            {
                button1.Text = GenerateColor(dealer[0]);
                textBox1.Text = "" + (N1 + N2);
                MessageBox.Show("你的點數較高, 你贏了" + N2 + "籌碼", "恭喜你", MessageBoxButtons.OK, MessageBoxIcon.Information);
                textBox2.ReadOnly = false;
                button11.Enabled = true;
                start = false;
                //return;
            }
            button12.Enabled = false;
            button13.Enabled = false;  
        }

        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            textBox1.Text = "" + 1000;
        }
    }
}
