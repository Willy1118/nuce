using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace _20240617
{
    public partial class Form1 : Form
    {
        List <string>[] table = new List<string>[13];
        TextBox[] arr = new TextBox[13];
        public Form1()
        {
            InitializeComponent();
        }

        private void label22_Click(object sender, EventArgs e)
        {

        }

        private void Form1_Load(object sender, EventArgs e)
        {
            table[0] = new List<string>();
            table[1] = new List<string>();
            table[2] = new List<string>();
            table[3] = new List<string>();
            table[4] = new List<string>();
            table[5] = new List<string>();
            table[6] = new List<string>();
            table[7] = new List<string>();
            table[8] = new List<string>();
            table[9] = new List<string>();
            table[10] = new List<string>();
            table[11] = new List<string>();
            table[12] = new List<string>();

            arr[0] = textBox4;
            arr[1] = textBox5;
            arr[2] = textBox6;
            arr[3] = textBox7;
            arr[4] = textBox8;
            arr[5] = textBox9;
            arr[6] = textBox10;
            arr[7] = textBox11;
            arr[8] = textBox12;
            arr[9] = textBox13;
            arr[10] = textBox14;
            arr[11] = textBox15;
            arr[12] = textBox16;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                string str = textBox1.Text;
                string fold;
                int total;
                bool found;
                searchHash(str, out fold, out total, out found);
                textBox2.Text = fold;
                textBox3.Text = total + " % 13 = " + total%13;
                if (found)
                {
                    throw new Exception("授權碼" + str + "重複");
                }
                else
                {
                    table[total%13].Add(str);
                }
                printHash();
            }
            catch(Exception ex)
            {
                MessageBox.Show(ex.Message, "新增失敗", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            try
            {
                string str = textBox1.Text;
                string fold;
                int total;
                bool found;
                searchHash(str, out fold, out total, out found);
                if (found)
                {
                    table[total % 13].Remove(str);
                }
                else
                {
                    throw new Exception("授權碼" + str + "不存在");
                }
                printHash();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "刪除失敗", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            try
            {
                string str = textBox1.Text;
                string fold;
                int total;
                bool found;
                searchHash(str, out fold, out total, out found);
                if (found)
                {
                    throw new Exception("授權碼" + str + "正確");
                }
                else
                {
                    throw new Exception("授權碼" + str + "不存在");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "查詢失敗", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        void searchHash(string s, out string fold, out int total, out bool found)
        {
            fold = "";
            total = 0;
            int strlen = s.Length;

            for(int i = 0; i < strlen; i+=3)
            {
                string sub1 = s.Substring(i, Math.Min(3, strlen- i));
                char[] ch = sub1.ToCharArray();
                if((i+1)%2 == 0)
                {
                    Array.Reverse(ch);
                }
                string sub2 = new string(ch);
                fold += sub2;

                total += Convert.ToInt32(sub2);
            }
            found = table[total%13].Contains(s);
        }
        public void printHash()
        {
            int i, j;
            for (i = 0; i < 13; i++)
                arr[i].Text = "";
            for(i = 0; i < 13; i++)
                for(j = 0; j < table[i].Count; j++)
                    arr[i].Text = arr[i].Text + " -> " + table[i][j];
        }
    }
}
