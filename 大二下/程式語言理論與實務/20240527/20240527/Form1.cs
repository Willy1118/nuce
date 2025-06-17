using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace _20240527
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        TextBox[] arr = new TextBox[15];
        int num = 0;

        private void Form1_Load(object sender, EventArgs e)
        {
            arr[0] = textBox2;
            arr[1] = textBox3;
            arr[2] = textBox4;
            arr[3] = textBox5;
            arr[4] = textBox6;
            arr[5] = textBox7;
            arr[6] = textBox8;
            arr[7] = textBox9;
            arr[8] = textBox10;
            arr[9] = textBox11;
            arr[10] = textBox12;
            arr[11] = textBox13;
            arr[12] = textBox14;
            arr[13] = textBox15;
            arr[14] = textBox16;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                textBox17.Text = "";
                if (num == 15)
                    throw new Exception("堆積樹已滿");
                num += 1;
                arr[num - 1].Text = textBox1.Text;
                if(num > 1)
                {
                    int i = num - 1;
                    while ((Convert.ToInt32(arr[i].Text) > Convert.ToInt32(arr[(i - 1) / 2].Text)) && i >= 0)
                    {
                        int tmp = Convert.ToInt32(arr[i].Text);
                        arr[i].Text = arr[(i - 1) / 2].Text;
                        arr[(i - 1) / 2].Text = Convert.ToString(tmp);

                        i = (i - 1) / 2;
                    }
                }
            }
            catch(Exception ex)
            {
                MessageBox.Show(ex.Message, "錯誤訊息", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            try
            {
                if (num == 0)
                    throw new Exception("Heap沒有東西");
                textBox17.Text = arr[0].Text;

                arr[0].Text = arr[num - 1].Text;
                arr[num - 1].Text = "";
                num -= 1;

                int i = 0;
                /*while (true)
                {
                    if (Convert.ToInt32(arr[2 * i + 1].Text) > Convert.ToInt32(arr[2 * i + 2].Text))
                    {
                        if (Convert.ToInt32(arr[2 * i + 1].Text) > Convert.ToInt32(arr[i].Text))
                        {
                            int tmp = Convert.ToInt32(arr[i].Text);
                            arr[i].Text = arr[2 * i + 1].Text;
                            arr[2 * i + 1].Text = Convert.ToString(tmp);

                            i = 2 * i + 1;
                            if (i >= num) break;
                        }
                        else break;
                    }
                    else
                    {
                        if (Convert.ToInt32(arr[2 * i + 2].Text) > Convert.ToInt32(arr[i].Text))
                        {
                            int tmp = Convert.ToInt32(arr[i].Text);
                            arr[i].Text = arr[2 * i + 2].Text;
                            arr[2 * i + 2].Text = Convert.ToString(tmp);

                            i = 2 * i + 2;
                            if (i > num) break;
                        }
                        else break ;
                    }
                }*/

                while((2*i+2)<(num-1) && (Convert.ToInt32(arr[i].Text) < Convert.ToInt32(arr[2 * i + 1].Text) || Convert.ToInt32(arr[i].Text) < Convert.ToInt32(arr[2 * i + 2].Text)))
                {
                    if(Convert.ToInt32(arr[2 * i + 1].Text) > Convert.ToInt32(arr[2 * i + 2].Text))
                    {
                        int tmp = Convert.ToInt32(arr[i].Text);
                        arr[i].Text = arr[2 * i + 1].Text;
                        arr[2 * i + 1].Text = Convert.ToString(tmp);

                        i = 2 * i + 1;
                    }
                    else if(Convert.ToInt32(arr[2 * i + 1].Text) < Convert.ToInt32(arr[2 * i + 2].Text))
                    {
                        int tmp = Convert.ToInt32(arr[i].Text);
                        arr[i].Text = arr[2 * i + 2].Text;
                        arr[2 * i + 2].Text = Convert.ToString(tmp);

                        i = 2 * i + 2;
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "錯誤訊息", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
    }
}
