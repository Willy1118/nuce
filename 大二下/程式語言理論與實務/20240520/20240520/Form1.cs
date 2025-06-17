using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace _20240520
{
    public partial class Form1 : Form
    {
        List<node> tree = new List<node>();

        class node
        {
            char data;
            int freq;
            string code;
            bool leaf;
            bool hasfather;
            node left;
            node right;

            public node(char ch)
            {
                data = ch;
                freq = 1;
                code = "";
                leaf = true;
                hasfather = false;
                left = null;
                right = null;
            }

            public char getData()
            {
                return data;
            }

            public int getFreq()
            {
                return freq;
            }

            public string getCode()
            {
                return code;
            }

            public bool getLeaf()
            {
                return leaf;
            }

            public bool getHasFather()
            {
                return hasfather;
            }

            public node getLeft()
            {
                return left;
            }

            public node getRight()
            {
                return right;
            }

            public void setData(char ch)
            {
                data = ch;
            }

            public void setFreq(int n)
            {
                freq = n;
            }

            public void setCode(string s)
            {
                code = s;
            }

            public void setLeaf(bool b)
            {
                leaf = b;
            }

            public void setHasFather(bool b)
            {
                hasfather = b;
            }

            public void setLeft(node n)
            {
                left = n;
            }
            public void setRight(node n)
            {
                right = n;
            }
        }

        void Encode(node ptr)
        {
            if(ptr != null)
            {
                if (ptr.getLeft() != null)
                    ptr.getLeft().setCode(ptr.getCode() + "0");
                if (ptr.getRight() != null)
                    ptr.getRight().setCode(ptr.getCode() + "1");
                Encode(ptr.getLeft());
                Encode(ptr.getRight());
            }
        }

        void findMin(out node min1, out node min2)
        {
            min1 = null;
            min2 = null;
            int i, n = 0;
            for(i=0 ; i<tree.Count; i++)
            {
                if (tree[i].getHasFather() == false)
                {
                    if(n == 0)
                    {
                        min1 = tree[i];
                        n += 1;
                    }
                    else if(n == 1)
                    {
                        min2 = tree[i];
                        n += 1;
                        if(min1.getFreq() > min2.getFreq())
                        {
                            min2 = min1;
                            min1 = tree[i];
                        }
                    }
                    else
                    {
                        if (tree[i].getFreq() < min2.getFreq())
                        {
                            min2 = tree[i];
                            if(min1.getFreq() > min2.getFreq())
                            {
                                min2 = min1;
                                min1 = tree[i];
                            }
                        }
                    }
                }
            }
        }
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            string txt = textBox1.Text;
            int len = txt.Length;

            for (int i = 0; i < len; i++)
            {
                char ch = txt[i];
                bool has = false;

                for(int k=0; k<tree.Count; k++)
                {
                    if (tree[k].getData() == ch)
                    {
                        tree[k].setFreq(tree[k].getFreq() + 1);
                        has = true;
                        break;
                    }
                }

                if (!has)
                {
                    node newNode = new node(ch);
                    tree.Add(newNode);
                }
            }

            textBox2.Text = "";

            node tmp1, tmp2 ;
            while(true)
            {
                findMin(out tmp1, out tmp2);
                if(tmp2 == null)
                {
                    break;
                }
                node newNode = new node('\0');

                newNode.setLeft(tmp1);
                newNode.setRight(tmp2);
                tmp1.setHasFather(true);
                tmp2.setHasFather(true);
                newNode.setFreq(tmp1.getFreq() + tmp2.getFreq());
                newNode.setLeaf(false);

                tree.Add(newNode);
                
            }

            
                Encode(tmp1);
            

            for(int k=0; k<tree.Count; k++)
            {
                if (tree[k].getData() != '\0')
                textBox2.Text += tree[k].getData() + "\t" + tree[k].getFreq() + "\t" + tree[k].getCode() + "\r\n";
            }

            int sum = 0;
            int origin = 8 * txt.Length;

            for(int i = 0; i<len; i++)
            {
                for(int j=0; j<tree.Count; j++)
                {
                    if (txt[i] == tree[j].getData())
                    {
                        textBox3.Text += tree[j].getCode();
                        sum += tree[j].getCode().Length;
                    }
                }
            }

            double compress = (double)(origin - sum) / (double)origin;
            textBox4.Text += origin + "bits被壓縮成" + sum + "bits 壓縮率為" + compress * 100 + "%";
        }

    }
}
