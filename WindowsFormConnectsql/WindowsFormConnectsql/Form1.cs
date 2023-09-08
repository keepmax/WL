using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace WindowsFormConnectsql
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            string connectstr = @"server = .;uid = sa;pwd = sa;database = StudentDB";
            SqlConnection con = new SqlConnection(connectstr);

            try
            {
                con.Open();
                string username = textBox1.Text;
                string password = textBox2.Text;

                SqlCommand cmd = con.CreateCommand();
                cmd.Connection = con;
                //sqlCommand.CommandText = $"select count(*) from student where sname = '{uname}' and spwd = '{upwd}'";

                //上面的sql语句是存在sql注入的问题，用户可以通过一些方式输入特定的字符串来实现账号密码错误也能能力
                //要避免sql注入的问题，我们可以使用查询化参数的方式来解决，如下：
                cmd.CommandText = "select count(*) from UserInfos where UserId = @UserId and UserPwd = @UserPwd";
                cmd.Parameters.AddWithValue("@UserId", username);
                cmd.Parameters.AddWithValue("@UserPwd", password);

                int count = (int)cmd.ExecuteScalar();
                if (count > 0)
                {
                    MessageBox.Show("登录成功");
                }
                else
                {
                    MessageBox.Show("登录失败");
                }
                //查询化参数也可以像下面这样写：
                //sqlCommand.CommandText = "select count(*) from student where sname = @name and spwd = @pwd";
                //SqlParameter sqlParameter1 = new SqlParameter("@name", SqlDbType.NVarChar, 20);
                //sqlParameter1.Value = uname;
                //SqlParameter sqlParameter2 = new SqlParameter("@pwd", SqlDbType.NVarChar, 10);
                //sqlParameter2.Value = upwd;
                //sqlCommand.Parameters.Add(sqlParameter1);
                //sqlCommand.Parameters.Add(sqlParameter2);

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            finally { 
                con.Close(); 
            }
        }
    }
}
