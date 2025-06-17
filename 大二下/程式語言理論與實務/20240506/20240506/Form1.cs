using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace _20240506
{
    public partial class Form1 : Form
    {
        int now = 0;
        class node
        {
            int data;
            node next;
            public node(int n)
            {
                data = n;
                next = null;
            }
            public int getData()
            {
                return data;
            }
            public node getNext()
            {
                return next;
            }
            public void setData(int n)
            {
                data = n;
            }
            public void setNext(node d)
            {
                next = d;
            }
        }

        node head = new node(100);

        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            textBox1.Text = "head->null";
        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                int num = Convert.ToInt32(textBox2.Text);
                node x = new node(num);
                node ptr1 = head;
                node ptr2 = head.getNext();
                while (ptr2 != null)
                {
                    if (ptr2.getData() == num)
                    {
                        throw new Exception("資料" + num + "重複");
                    }
                    else if (ptr2.getData() > num) 
                    {
                        ptr1.setNext(x);
                        x.setNext(ptr2);
                        now += 1;
                        
                        return;
                    }
                    ptr1 = ptr2;
                    ptr2 = ptr2.getNext();
                }
                ptr1.setNext(x);

            }
            catch(Exception ex)
            {
                MessageBox.Show(ex.Message, "錯誤訊息", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            finally
            {
                textBox1.Text = "head->";
                node begin = head;
                begin = begin.getNext();
                while(begin != null)
                {
                    textBox1.Text += Convert.ToString(begin.getData());
                    textBox1.Text += "-> ";
                    begin = begin.getNext();
                }
                textBox1.Text += "null";
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            try
            {
                int num = Convert.ToInt32(textBox2.Text);
                node x = new node(num);
                node ptr1 = head;
                node ptr2 = head.getNext();
                while (ptr2 != null)
                {
                    if (ptr2.getData() == num)
                    {
                        ptr1.setNext(ptr2.getNext());
                        return;
                    }
                    if (ptr2.getData() > num)
                        throw new Exception("串列中沒有" + num + "，無法刪除");
                    ptr1 = ptr2;
                    ptr2 = ptr2.getNext();
                }
                throw new Exception("串列中沒有" + num + "，無法刪除");
                
            }
            catch(Exception ex)
            {
                MessageBox.Show(ex.Message, "錯誤訊息", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            finally
            {
                textBox1.Text = "head->";
                node begin = head;
                begin = begin.getNext();
                while (begin != null)
                {
                    textBox1.Text += Convert.ToString(begin.getData());
                    textBox1.Text += "-> ";
                    begin = begin.getNext();
                }
                textBox1.Text += "null";
            }
        }
    }
}
