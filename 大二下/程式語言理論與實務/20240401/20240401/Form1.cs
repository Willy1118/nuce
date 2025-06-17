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
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace _20240401
{
    public partial class Form1 : Form
    {
        string[,] relation = new string[200, 40];
        int recNo, rank = 0;
        int[] people = new int[100];
        string[] king;

        public Form1()
        {
            InitializeComponent();
        }

        void find_descendant(string p)
        {
            int row = 0, col = 0;
            for(int i = 0; i< recNo; i++)
            {
                for(int j = 0; j < people[i]; j++)
                {
                    if (relation[i, j] == p && j != 0)
                    {
                        row = i;
                        col = j;
                    }
                }
            }
            //textBox1.Text += "" + row + " " + col + "\r\n";
            if(p != null && p != king[0] && relation[row, col+1] != "(MD)" && relation[row, col + 1] != "(FD)" && relation[row, col + 1] != "(MND)")
            {
                textBox1.Text += "" + rank + ":" + p + "\r\n";
                rank += 1;
            }
            
            for (int i = 0; i < recNo; i++)
            {
                if (relation[i, 0] == p)
                {
                    for(int k=0; k < people[i]; k+=2)
                    {
                        find_descendant(relation[i, k+2]);
                    }
                }
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            openFileDialog1.Filter = "文字檔案(*.txt)|*.txt";

            if(openFileDialog1.ShowDialog() == DialogResult.OK)
            {
                StreamReader sr = new StreamReader(openFileDialog1.FileName);

                king = sr.ReadLine().Split();
                string[] s = null;
                recNo = 0; 
                rank = 1;
                int king_row=0, king_col=0;
                textBox1.Text = null;

                while(sr.Peek() >= 0)
                {
                    s = sr.ReadLine().Split();
                    people[recNo] = 0;
                    for(int i=0; i<s.Length; i++)
                    {
                        relation[recNo, i] = s[i];
                        /*textBox1.Text += relation[recNo, i];
                        textBox1.Text += " ";*/
                        people[recNo] += 1;
                    }
                    recNo++;
                }

                for (int i = 0; i < recNo; i++)
                {
                    for (int j = 2; j < people[i]-2; j+=2)
                    {
                        for(int k = 2; k< people[i]-2; k+=2)
                        if ((relation[i, k+1] == "(F)"  || relation[i, k + 1] == "(FD)") && (relation[i, k+3] == "(M)" || relation[i, k+3] == "(MD)"))
                        {
                            string s1 = relation[i, k];
                            relation[i, k] = relation[i, k + 2];
                            relation[i, k+2] = s1;

                            string s2 = relation[i, k+1];
                            relation[i, k+1] = relation[i, k + 3];
                            relation[i, k + 3] = s2;
                        }
                    }
                }

                for(int i = 0; i < recNo; i++)
                {
                    for(int j = 2;j < people[i]-2;j+=2)
                    {

                        if (relation[i, j] == king[0])
                        {
                            king_row = i;
                            king_col = j;
                        }
                    }
                }
                /*for(int i=0; i<recNo; i++)
                {
                    for(int j=0; j < people[i]; j++)
                    {
                        textBox1.Text += relation[i, j];
                        textBox1.Text += " ";
                    }
                    textBox1.Text += people[i] + " ";
                    textBox1.Text += "\r\n";
                }*/
                find_descendant(king[0]);
                for(int i = 4; i < people[king_row]; i+=2)
                {
                    find_descendant(relation[king_row, king_col + i]);
                }
            }
        }
    }
}
 