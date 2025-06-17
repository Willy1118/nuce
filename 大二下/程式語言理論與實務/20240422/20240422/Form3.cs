using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Net.Mime.MediaTypeNames;

namespace _20240422
{
    public partial class Form3 : Form
    {
        public Form3()
        {
            InitializeComponent();
        }

        private void Form3_Load(object sender, EventArgs e)
        {

        }
        public void getData(out string c, out string name, out double tbase, out double height)
        {
            name = textBox1.Text;
            c = textBox2.Text;
            tbase = Convert.ToDouble(textBox3.Text);
            height = Convert.ToDouble(textBox4.Text);
        }
    }
}
