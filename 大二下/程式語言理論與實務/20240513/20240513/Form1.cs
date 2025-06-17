using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace _20240513
{
    public partial class Form1 : Form
    {
        class node
        {
            int data;
            node left;
            node right;

            public node(int n)
            {
                data = n;
                left = null;
                right = null;
            }

            public int getData()
            {
                return data;
            }
            public node getLeft()
            {
                return left;
            }
            public node getRight()
            {
                return right;
            }
            public void setData(int n)
            {
                data = n;
            }
            public void setLeft(node d)
            {
                left = d;
            }
            public void setRight(node d)
            {
                right = d;
            }
        }
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        node root = new node(1000);

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                int n = Convert.ToInt32(textBox1.Text);
                node ptr1 = root;
                node ptr2 = root.getLeft();
                node x = new node(n); //加入資料n
                if (ptr2 == null)
                { root.setLeft(x); return; }
                while (ptr2 != null)
                {
                    if (ptr2.getData() == n)
                        throw new Exception("資料" + n + "已存在，新增失敗");
                    ptr1 = ptr2;
                    if (n < ptr2.getData())
                        ptr2 = ptr2.getLeft();
                    else
                        ptr2 = ptr2.getRight();
                }
                if (n < ptr1.getData())
                    ptr1.setLeft(x);
                else
                    ptr1.setRight(x);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "錯誤訊息", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            finally
            {
                textBox2.Text = "";
                inorder(root.getLeft());
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            textBox2.Text = "";
            int n = Convert.ToInt32(textBox1.Text);
            delete(n);
        }
        void delete(int n)
        {
            try
            {
                node ptr1 = root;
                node ptr2 = root.getLeft();
                while (ptr2 != null)
                {
                    if (ptr2.getData() == n) //搜尋資料n
                        break;
                    ptr1 = ptr2;
                    if (n < ptr2.getData())
                        ptr2 = ptr2.getLeft();
                    else
                        ptr2 = ptr2.getRight();
                }
                if (ptr2 == null)
                    throw new Exception("資料" + n + "不存在");
                else
                {
                    if (ptr2.getLeft() == null && ptr2.getRight() == null)
                    {
                        if (ptr1.getData() < ptr2.getData())
                            ptr1.setRight(null);
                        else
                            ptr1.setLeft(null);
                    }
                    else if (ptr2.getLeft() != null && ptr2.getRight() == null)
                    {
                        if (ptr1.getData() < ptr2.getData())
                            ptr1.setRight(ptr2.getLeft());
                        else
                            ptr1.setLeft(ptr2.getLeft());
                    }
                    else if (ptr2.getLeft() == null && ptr2.getRight() != null)
                    {
                        if (ptr1.getData() < ptr2.getData())
                            ptr1.setRight(ptr2.getRight());
                        else
                            ptr1.setLeft(ptr2.getRight());
                    }
                    else
                    {
                        node ptr3 = ptr2.getLeft();
                        node ptr4 = ptr3;
                        while (ptr3.getRight() != null)
                        {
                            ptr4 = ptr3;
                            ptr3 = ptr3.getRight();
                        }
                        int value = ptr3.getData();
                        delete(ptr3.getData());
                        ptr2.setData(value);
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "錯誤訊息", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            finally
            {
                textBox2.Text = "";
                inorder(root.getLeft());
            }
        }
        void inorder(node ptr)
        {
            if (ptr != null)
            {
                inorder(ptr.getLeft());
                textBox2.Text = textBox2.Text + " " + ptr.getData();
                inorder(ptr.getRight());
            }
        }
        void preorder(node ptr)
        {
            if (ptr != null)
            {
                textBox2.Text = textBox2.Text + " " + ptr.getData();
                preorder(ptr.getLeft());
                preorder(ptr.getRight());
            }
        }
        void postorder(node ptr)
        {
            if (ptr != null)
            {
                postorder(ptr.getLeft());
                postorder(ptr.getRight());
                textBox2.Text = textBox2.Text + " " + ptr.getData();
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            textBox2.Text = "";
            preorder(root.getLeft());
        }

        private void button5_Click(object sender, EventArgs e)
        {
            textBox2.Text = "";
            postorder(root.getLeft());
        }
    }
}
