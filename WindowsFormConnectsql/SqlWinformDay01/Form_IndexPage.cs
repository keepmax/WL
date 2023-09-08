using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace SqlWinformDay01
{
    public partial class Form_IndexPage : Form
    {
        public event Action<User_index> passToForm_Index;
        public Form_IndexPage()
        {
            InitializeComponent();
        }
        private User_index _user;
        public Form_IndexPage(User_index user)
        {
            _user = user;
            InitializeComponent();
        }
        private void Form_IndexPage_Load(object sender, EventArgs e)
        {
            string ori = label1.Text;
            label1.Text = _user.Username + ori + _user.Role;
            label2.Text = DateTime.Now.ToString();
            timer_Index.Start();
        }

        private void Form_IndexPage_FormClosing(object sender, FormClosingEventArgs e)
        {
            passToForm_Index?.Invoke(_user);
        }

        private void bookManagebtn_Click(object sender, EventArgs e)
        {
            this.Visible = false;
            BookManageForm bookMa = new BookManageForm();
            bookMa.Tag = this;
            bookMa.passToForm_Index += () =>
            {
                this.Visible = true;
            };
            bookMa.Show();
        }

        private void timer_Index_Tick(object sender, EventArgs e)
        {
            label2.Text = DateTime.Now.ToString();
        }
    }
}
