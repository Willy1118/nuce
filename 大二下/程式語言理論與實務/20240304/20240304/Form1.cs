using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace _20240304
{
    public partial class Form1 : Form
    {
        string[,] name = new string[50, 2];
        int[,] score = new int[50, 2];
        int counter = 0, math = 0, chinese = 0;
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            textBox8.Text = "學號\t姓名\t國文\t數學\r\n";
            textBox5.Text = "" + counter;
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox3_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox4_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox5_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox6_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox7_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox8_TextChanged(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                int num1, num2;
                if( ! (int.TryParse(textBox3.Text, out num1) ) )
                {
                    throw new Exception("輸入字串格式不正確");
                }
                else if (!(int.TryParse(textBox4.Text, out num2)))
                {
                    throw new Exception("輸入字串格式不正確");
                }
                score[counter, 0] = num1;
                score[counter, 1] = num2;
                name[counter, 0] = textBox1.Text;
                name[counter, 1] = textBox2.Text;

                textBox8.Text += name[counter, 0] + "\t" + name[counter, 1] + "\t" + score[counter, 0] + "\t" + score[counter, 1] + "\r\n";
                
                double c = 0.0, m = 0.0;
                counter += 1;
                for(int i=0 ; i<counter; i++)
                {
                    c += score[i, 0];
                    m += score[i, 1];
                }

                textBox5.Text = "" + counter;
                textBox6.Text = "" + (double)c / counter;
                textBox7.Text = "" + (double)m / counter;

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "錯誤訊息", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            bool search = false;
            for(int i=0; i<counter; i++)
            {
                if(textBox1.Text == name[i, 0])
                {
                    search = true;
                    textBox8.Text = "學號\t姓名\t國文\t數學\r\n" +
                    name[i, 0] + "\t" + name[i, 1] + "\t" + score[i, 0] + "\t" + score[i, 0];
                    break;
                }
            }
            if(search == false) MessageBox.Show("資料不存在", "錯誤訊息", MessageBoxButtons.OK, MessageBoxIcon.Error);
            search = false;
        }

        private void button3_Click(object sender, EventArgs e)
        {
            textBox8.Text = "學號\t姓名\t國文\t數學\r\n";
            for(int i=0; i<counter; i++)
            {
                textBox8.Text += name[i, 0] + "\t" + name[i, 1] + "\t" + score[i, 0] + "\t" + score[i, 0] + "\r\n";
            }
        }
    }
}
