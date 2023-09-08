using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace SqlWinformDay01
{
    public partial class Form_register : Form
    {
        public event Action passToForm1;
        public Form_register()
        {
            InitializeComponent();
        }

        private void Form_register_Load(object sender, EventArgs e)
        {

        }

        private void Form_register_FormClosing(object sender, FormClosingEventArgs e)
        {
            passToForm1?.Invoke();
        }
        //注册提交按钮
        private void button1_Click(object sender, EventArgs e)
        {
            string userid = idBox.Text;
            string password = pwdBox.Text;
            string username = nameBox.Text;
            int sex = getSelectedSex(panelsex);
            int status = getSelectedStatus(panelstatus);
            int role = getSelectedRole(panelrole);

            string connectstr = @"server = .;uid = sa;pwd = sa;database = StudentDB";
            SqlConnection con = null;
            try
            {
                con = new SqlConnection(connectstr);
                con.Open();
                SqlCommand cmd = con.CreateCommand();

                //查看重复账户
                cmd.CommandText = "select count(*) from User_test where userid = @content";
                cmd.Parameters.AddWithValue("@content", userid);
                int acc_count = (int)cmd.ExecuteScalar();
                if(acc_count > 0)
                {
                    label8.Text = "用户名账号重复，换一个八~";
                    label8.Visible = true;
                }
                else
                {
                    //判断是否空
                    if (userid.Equals(""))
                    {
                        label8.Text = "请输入账号哦~";
                        label8.Visible = true;
                    }
                    else if (password.Equals(""))
                    {
                        label8.Visible = false;
                        label9.Text = "请输入密码哦~";
                        label9.Visible = true;
                    }
                    else if (username.Equals(""))
                    {
                        label10.Text = "请输入姓名哦(实名认证防沉迷)";
                        label10.Visible = true;
                        label9.Visible = false;
                    }
                    //插入数据
                    else
                    {
                        label8.Visible= false;
                        label9.Visible= false;
                        label10.Visible = false;
                        label8.Text = "用户名账号可用！";
                        label8.Visible = true;
                        cmd.CommandText = "insert into User_test(userid,password,username,sex,status,role) " +
                        "values(@userid,@password,@username,@sex,@status,@role)";
                        cmd.Parameters.AddWithValue("@userid", userid);
                        cmd.Parameters.AddWithValue("@password", password);
                        cmd.Parameters.AddWithValue("@username", username);
                        cmd.Parameters.AddWithValue("@sex", sex);
                        cmd.Parameters.AddWithValue("@status", status);
                        cmd.Parameters.AddWithValue("@role", role);
                        int gst_count = cmd.ExecuteNonQuery();
                        if (gst_count > 0)
                        {
                            MessageBox.Show("注册成功！");
                        }
                        else
                        {
                            MessageBox.Show("注册失败！");
                        }
                    }
                    
                }


                

                

            }catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            finally { con.Close(); }

        }
        private int getSelectedSex(Panel sexPanel)
        {
            ICollection controls = sexPanel.Controls; 
            string message = string.Empty;
            foreach (Control control in controls)
            {
                RadioButton radioButton = control as RadioButton;
                if(radioButton.Checked)
                {
                    message = radioButton.Text;
                }
            }
            //Console.WriteLine(message);
            if (message.Equals("男")) return 1;
            else return 0;
            
        }

        private int getSelectedStatus(Panel statusPanel)
        {
            ICollection controls = statusPanel.Controls;
            string message = string.Empty;
            foreach (Control control in controls)
            {
                RadioButton radioButton = control as RadioButton;
                if (radioButton.Checked)
                {
                    message = radioButton.Text;
                }
            }
            //Console.WriteLine(message);
            if (message.Equals("正常")) return 0;
            else return 1;
        }

        private int getSelectedRole(Panel rolePanel)
        {
            ICollection controls = rolePanel.Controls;
            string message = string.Empty;
            foreach (Control control in controls)
            {
                RadioButton radioButton = control as RadioButton;
                if (radioButton.Checked)
                {
                    message = radioButton.Text;
                }
            }
            //Console.WriteLine(message);
            if (message.Equals("管理员")) return 0;
            else if (message.Equals("教师")) return 1;
            else if (message.Equals("学生")) return 2;
            else return 3;

        }

        //限制输入id范围为字母和数字
        private void idBox_KeyPress(object sender, KeyPressEventArgs e)
        {
            // 检查输入的字符是否是字母或数字，如果不是则取消输入
            if (!char.IsLetterOrDigit(e.KeyChar) && !char.IsControl(e.KeyChar))
            {
                e.Handled = true;
            }
            // 检查输入的字符是否是中文，如果是则取消输入
            else if (e.KeyChar >= 0x4e00 && e.KeyChar <= 0x9fbb)
            {
                e.Handled = true;
            }
        }
        //限制输入密码范围为字母和数字
        private void pwdBox_KeyPress(object sender, KeyPressEventArgs e)
        {
            // 检查输入的字符是否是字母或数字，如果不是则取消输入
            if (!char.IsLetterOrDigit(e.KeyChar) && !char.IsControl(e.KeyChar))
            {
                e.Handled = true;
            }
            // 检查输入的字符是否是中文，如果是则取消输入
            else if (e.KeyChar >= 0x4e00 && e.KeyChar <= 0x9fbb)
            {
                e.Handled = true;
            }
        }

        private void nameBox_KeyPress(object sender, KeyPressEventArgs e)
        {
            
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
