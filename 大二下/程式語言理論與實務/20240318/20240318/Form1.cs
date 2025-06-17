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

namespace _20240318
{
    public partial class Form1 : Form
    {
        

        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            openFileDialog1.Filter = "Excel檔案(*.csv)|*.csv";
            string[] input = new string[4];
            string[] name = new string[100];
            int[] num = new int[100];
            double[,] coordinate = new double[100, 2];
            double x = Convert.ToDouble(textBox2.Text);
            double y = Convert.ToDouble(textBox3.Text);
            int count = 0, sum = 0;
            double distance = 0;

            if (openFileDialog1.ShowDialog() == DialogResult.OK) 
            {
                string str;
                StreamReader sr = new StreamReader(openFileDialog1.FileName, Encoding.Default);

                str = "姓名\t需求量\tX座標\t\tY座標\r\n";

                while(sr.Peek() >= 0) 
                {
                    input = sr.ReadLine().Split(',');

                    name[count] = input[0];
                    num[count] = Convert.ToInt32(input[1]);
                    coordinate[count, 0] = Convert.ToDouble(input[2]);
                    coordinate[count, 1] = Convert.ToDouble(input[3]);

                    str += name[count] + "\t" + num[count]  + "\t" + coordinate[count, 0] + "\t" + coordinate[count, 1] + "\r\n";
                    sum += num[count];
                    distance += Math.Sqrt(Math.Pow((x - coordinate[count, 0]), 2) + Math.Pow((y - coordinate[count, 1]), 2));

                    count += 1;
                }
                textBox1.Text = str;
                textBox4.Text = "" + count;
                textBox5.Text = "" + sum;
                textBox6.Text = "" + distance / count;
            }
        }
    }
}
