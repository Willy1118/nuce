using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace _20240422
{
    public partial class Form1 : Form
    {
        Picture g = new Picture("Graph");
        List<Picture> allPicture = new List<Picture>();
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            textBox1.Text = "{Picture Graph:}";
            allPicture.Add(g);
        }

        private void button1_Click(object sender, EventArgs e)
        {
            int n = 0;
            Form2 f2 = new Form2();
            f2.ShowDialog();
            string newName;
            double tbase, height;
            if (f2.DialogResult == DialogResult.OK)
            {
                f2.getData(out string c, out newName);
                Picture x = new Picture(newName);
                for (int i = 0; i < allPicture.Count; i++)
                {
                    if (allPicture[i].getName() == c)
                    {
                        n = 1;
                        allPicture[i].addComponent(x);
                        allPicture.Add(x);
                        textBox1.Text = g.show();
                    }
                }
                if (n != 1)
                {
                    MessageBox.Show("此容器不存在", "錯誤訊息", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                n = 0;
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            int n = 0;
            Form3 f3 = new Form3();
            f3.ShowDialog();
            string newName;
            double tbase, height;
            if(f3.DialogResult == DialogResult.OK)
            {
                f3.getData(out string c, out newName, out tbase, out height);
                Rectangle x = new Rectangle(newName, tbase, height);
                for(int i = 0; i < allPicture.Count; i++)
                {
                    if (allPicture[i].getName() == c)
                    {
                        n = 1;
                        allPicture[i].addComponent(x);
                        textBox1.Text = g.show();
                    }
                }
                if(n != 1)
                {
                    MessageBox.Show("此容器不存在", "錯誤訊息",  MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                n = 0;
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            int n = 0;
            Form4 f4 = new Form4();
            f4.ShowDialog();
            string newName;
            double tbase, height;
            if (f4.DialogResult == DialogResult.OK)
            {
                f4.getData(out string c, out newName, out tbase, out height);
                Triangle x = new Triangle(newName, tbase, height);
                for (int i = 0; i < allPicture.Count; i++)
                {
                    if (allPicture[i].getName() == c)
                    {
                        n = 1;
                        allPicture[i].addComponent(x);
                        textBox1.Text = g.show();
                    }
                }
                if (n != 1)
                {
                    MessageBox.Show("此容器不存在", "錯誤訊息", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                n = 0;
            }
        }

        private void button4_Click(object sender, EventArgs e)
        {
            int n = 0;
            Form5 f5 = new Form5();
            f5.ShowDialog();
            string newName;
            double tbase, radius;
            if (f5.DialogResult == DialogResult.OK)
            {
                f5.getData(out string c, out newName, out radius);
                Circle x = new Circle(newName, radius);
                for (int i = 0; i < allPicture.Count; i++)
                {
                    if (allPicture[i].getName() == c)
                    {
                        n = 1;
                        allPicture[i].addComponent(x);
                        textBox1.Text = g.show();
                    }
                }
                if (n != 1)
                {
                    MessageBox.Show("此容器不存在", "錯誤訊息", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                n = 0;
            }
        }

        private void button5_Click(object sender, EventArgs e)
        {
            textBox2.Text = "" + g.area();
        }
    }

    abstract class Component
    {
        protected string name;
        public abstract double area();
        public abstract string show();
        public string getName()
        {
            return name;
        }
    }

    abstract class Shape: Component { }

    class Rectangle : Shape
    {
        private double length;
        private double width;
        public Rectangle(string n, double l, double w)
        {
            name = n;
            length = l;
            width = w;
        }
        public override double area()
        {
            return length * width;
        }
        public override string show()
        {
            return "Rectangle" + name + "(" + length + "," + width + ")";
        }
    }

    class Triangle : Shape
    {
        private double tbase;
        private double height;
        public Triangle(string n, double t, double h)
        {
            name=n;
            tbase = t;
            height = h;
        }
        public override double area()
        {
            return 0.5 * tbase * height;
        }
        public override string show()
        {
            return "Triangle" + name + "(" + tbase + "," + height + ")";
        }
    }

    class Circle : Shape
    {
        private double radius;
        public Circle(string n, double r)
        {
            name = n;
            radius = r;
        }
        public override double area()
        {
            return Math.PI * radius * radius;
        }
        public override string show()
        {
            return "Circle" + name + "(" + radius  + ")";
        }
    }

    class Picture: Component
    {
        private List<Component> coms = new List<Component>();

        public Picture(string n) 
        {
            name=n;
        }

        public void addComponent(Component c)
        {
            coms.Add(c);
        }

        public override double area()
        {
            double total = 0.0;
            for(int i = 0; i < coms.Count; i++)
            {
                total += coms[i].area();
            }
            return total;
        }

        public override string show()
        {
            string str = "{Picture" + name + ":";
            for(int i = 0;i < coms.Count; i++)
            {
                str += coms[i].show();
            }
            str = str + "}";
            return str;
        }
    }
}
