using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace _20240429
{
    public partial class Form1 : Form
    {
        class MyStack
        {
            const int MAX = 1000;
            char[] stack = new char[MAX];
            public int top = -1;

            public char topstack()
            {
                if (top < 0) return '0';
                else return stack[top];
            }
            public void push (char item)
            {
                try
                {
                    if(top == MAX - 1) 
                    {
                        throw new Exception("無空間");
                    }
                    else
                    {
                        top += 1;
                        stack[top] = item;
                    }
                }
                catch(Exception ex) { }
            }
            public char pop()
            {
                try
                {
                    char item;
                    if (top < 0) throw new Exception("沒有資料");
                    else
                    {
                        item = stack[top];
                        top -= 1;
                        return item;
                    }
                }
                catch (Exception ex)
                {
                    top = -1; // 重置 top
                    return '0';
                }
            }

        }
        public Form1()
        {
            InitializeComponent();
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            string text = textBox1.Text;
            int len = textBox1.Text.Length;

            MyStack s1 = new MyStack();
            for(int i = 0; i < len; i++)
            {
                
                if (text[i] >= 'A' && text[i] <= 'Z' || text[i] >= 'a' && text[i] <= 'z')
                {
                    textBox2.Text += text[i];
                }
                else if(text[i] == '(')
                {
                    s1.push(text[i]);
                }
                else if (text[i] == ')')
                {
                    char n0 = s1.pop();
                    while (n0 != '(' && n0 != '0') 
                    { 
                        textBox2.Text += n0;
                        n0 = s1.pop();
                    }
                }
                else if (text[i] == '*' || text[i] == '/' || text[i] == '%')
                {
                    char n1 = s1.pop();
                    while ((n1 == '*' || n1 == '/' || n1 == '%') && n1 != '0')
                    {
                        textBox2.Text += n1;
                        n1 = s1.pop();
                    }
                    s1.push(n1);
                    s1.push(text[i]);
                }
                else if (text[i] == '+' || text[i] == '-')
                {
                    char n2 = s1.pop();
                    while ((n2 == '*' || n2 == '/' || n2 == '%' || n2 == '+' || n2 == '-') && n2 != '0')
                    {
                        textBox2.Text += n2;
                        n2 = s1.pop();
                    }
                    s1.push(n2);
                    s1.push(text[i]);
                }
            }
            char now = s1.pop();
            while (now != '0')
            {
                textBox2.Text += now;
                now = s1.pop();
            }
        }

        /*static string intopost(string str)
        {
            string post = "";



            return post;
        }*/
    }
}
