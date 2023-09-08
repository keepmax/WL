using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;
using WindowsFormConnectsql;

namespace SqlWinformDay01
{
    public partial class Form_Login : Form
    {
        public Form_Login()
        {
            InitializeComponent();
        }
        private BindingList<User_index> users = null;
        private User_index user = null;
        SqlConnection conn = null;
        private void Form_Login_Load(object sender, EventArgs e)
        {
            TipLabel.Visible = false;
            SqlCommand comand = new SqlCommand();
            List<SqlParameter> parameters = new List<SqlParameter>();
            //使用存储过程来进行sql操作  1.有参数无返回值
            /*
            try
            {
                conn = SQLHelper.OpenConnection();
                
                
                parameters.Add(new SqlParameter("@UserName", "admin"));
                parameters.Add(new SqlParameter("@UserPwd", "admin"));

                comand = SQLHelper.CreateCommand(conn, "Proc_Login", parameters.ToArray(), true);
                int count = (int)comand.ExecuteScalar();
                Console.WriteLine(count);
            }
            catch(Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            finally
            {
                conn.Close();
            }
            
            string word = @"server=.;uid=sa;pwd=sa;database=MyDB";
            SqlConnection con2 = new SqlConnection(word);
            con2.Open();
            //2.有参数有返回值
            try
            {
                comand = new SqlCommand();
                int sno_value = 0;
                parameters = new List<SqlParameter>();
                parameters.Add(new SqlParameter("@number", SqlDbType.Int));
                parameters.Add(new SqlParameter("@sno", 12));
                parameters.Add(new SqlParameter("@sname", "大力"));
                parameters.Add(new SqlParameter("@sage", 20));
                parameters.Add(new SqlParameter("@sgender", 1));
                parameters.Add(new SqlParameter("@sbirthday", "2000-02-13"));
                parameters.Add(new SqlParameter("@mysphone", "19998999399"));
                //需要加入以下语句
                parameters[0].Direction = ParameterDirection.Output;
                sno_value = (int)SQLHelper.GetExecuteNonQuery(con2, "Add_stu_Re", parameters.ToArray(), true);
                Console.WriteLine($"输出参数返回的结果是:{parameters[0].Value}");
            }
            catch(Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            finally { con2.Close(); }

            */
            
            
        }

        private void button_Login_Click(object sender, EventArgs e)
        {
            string connectstr = @"server = .;uid = sa;pwd = sa;database = StudentDB";
            SqlConnection con = new SqlConnection(connectstr);

            

            try {
                string userid = Box_Id.Text;
                string password = Box_Pwd.Text;

                con.Open();
                SqlCommand cmd = con.CreateCommand();
                cmd.Connection = con;

                cmd.CommandText = "Select count(*) from User_test where userid = @userid and password = @password";
                cmd.Parameters.AddWithValue("@userid", userid);
                cmd.Parameters.AddWithValue("@password", password);

                int count = (int)cmd.ExecuteScalar();
                if (count > 0)
                {
                    cmd.CommandText = "Select status from User_test where userid = @query";
                    cmd.Parameters.AddWithValue("@query", userid);
                    int tmp = (int)cmd.ExecuteScalar();
                    if (tmp == 0) {
                        TipLabel.Text = "登录成功！";

                        //查询名字
                        cmd.CommandText = "Select username from User_test where userid = @ques";
                        cmd.Parameters.AddWithValue("@ques", userid);
                        string name_tmp = (string)cmd.ExecuteScalar();
                        //查询职位
                        cmd.CommandText = "Select role from User_test where userid = @thk";
                        cmd.Parameters.AddWithValue("@thk", userid);
                        int role_tmp = (int)cmd.ExecuteScalar();

                        string role_con = null;
                        if (role_tmp == 0) role_con = "管理员";
                        else if (role_tmp == 1) role_con = "教师";
                        else if (role_tmp == 2) role_con = "学生";
                        else role_con = "工作人员";

                        user = new User_index()
                        {
                            Userid = userid,
                            Username = name_tmp,
                            Role = role_con
                        };
                        users = new BindingList<User_index>() { user };

                        User_index current = users[0];
                        
                        TipLabel.Visible = true;
                        
                        TipLabel.Text = "正在登入。。。。。。";
                        //Thread.Sleep(2000);

                        Form_IndexPage form_IndexPage = new Form_IndexPage(current);
                        form_IndexPage.Tag = this;

                        form_IndexPage.passToForm_Index += (User_index value) =>
                        {
                            this.Visible = true;
                        };
                        form_IndexPage.Show();
                        this.Visible = false;
                    }
                    else
                    {
                        TipLabel.Text = "账号已冻结，请联系管理员";
                        Thread.Sleep(1000);
                        TipLabel.Visible = true;
                    }
                    
                    
                }
                else
                {
                    if (userid == "") TipLabel.Text = " 请输入用户名";
                    else if (password == "") TipLabel.Text = "请输入密码";
                    else TipLabel.Text = "该用户不存在或账号密码输入错误";
                    TipLabel.Visible = true;
                }
            }
            catch(Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            finally { con.Close(); }
        }

        private void label3_Click(object sender, EventArgs e)
        {
            
            Form_register form_register = new Form_register();
            form_register.passToForm1 += () =>
            {
                this.Visible = true;
            };

            form_register.Show();
            this.Visible = false;
        }
    }

    public class User_index : INotifyPropertyChanged
    {
        private string _userid;
        private string _username;
        private string _role;

        public string Userid
        {
            get
            {
                return _userid;
            }
            set
            {
                _userid = value;
                OnPropertyChanged();
            }
        }
        public string Username
        {
            get
            {
                return _username;
            }
            set
            {
                _username = value;
                OnPropertyChanged();
            }
        }
        public string Role
        {
            get { return _role; }
            set
            {
                _role = value;
                OnPropertyChanged();
            }
        }
        
        public event PropertyChangedEventHandler PropertyChanged;

        private void OnPropertyChanged([CallerMemberName] string propertyName = "")
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}
