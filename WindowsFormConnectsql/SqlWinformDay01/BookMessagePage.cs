using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Net;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using SqlWinformDay01;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace SqlWinformDay01
{
    public partial class BookMessagePage : Form
    {
        int aa = 0;
        SqlConnection con = null;
        private DataTable bookInfoTable = null;
        private SqlDataAdapter adapter = null;
        private string bkId = string.Empty;
        private event Action<int> upd_sel;
        public static DataTable typeTable = null;
        //int sel_index = -1;
        public BookMessagePage()
        {
            InitializeComponent();
        }
        public BookMessagePage(string bkId)
        {
           
            InitializeComponent();
            UpdateLoad(bkId);

        }
        public event Action passToForm_BkMessage;
        private void BookMessagePage_Load(object sender, EventArgs e)
        {
            //设置价格可显示小数两位
            numeric_bkPrice.DecimalPlaces = 2;

            //加载窗口时，填充书籍类别box
            try
            {
                con = SQLHelper.OpenConnection();
                adapter = SQLHelper.GetDataAdapter(con, "select * from booktype");
                typeTable = new DataTable();
                adapter.Fill(typeTable);

                comboBox_bkType.DataSource = typeTable;
                comboBox_bkType.ValueMember = "Typeid";
                comboBox_bkType.DisplayMember = "bookType";

         

            }
            catch(Exception ex) 
            {
                Console.WriteLine(ex.Message);
            }
            finally
            {
                con.Close();
            }

            //如果有修改书籍的信息传递,进行页面渲染
            if (aa != 0)
            {
                comboBox_bkType.Text = typeTable.Rows[aa - 1][0].ToString();
            }
            
        }

        //重新显示上个页面
        private void BookMessagePage_FormClosing(object sender, FormClosingEventArgs e)
        {
            
            passToForm_BkMessage?.Invoke();
        }
        
        //关闭当前页面
        private void button_bkClose_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        //插入书籍信息
        private void button_Commit_Click(object sender, EventArgs e)
        {
            
            
            try
            {
                con = SQLHelper.OpenConnection();

                //获取页面信息
                string bookId = textBox_bkId.Text;
                //Console.WriteLine($"{bookId}"); 
                string bookName = textBox_bkName.Text;
                //Console.WriteLine($"{bookName}");
                int selbookType = (int)comboBox_bkType.SelectedValue;
                //Console.WriteLine($"{selbookType}");
                //Console.WriteLine(selbookType);
                decimal bookPrice = numeric_bkPrice.Value;
                //Console.WriteLine($"{bookPrice}");
                int bookAmount = (int)numeric_bkAmount.Value;
                //Console.WriteLine($"{bookAmount}");
                DateTime bookinDate = datePicker_bk.Value;
                //Console.WriteLine($"{bookinDate}");
                string bookImg = null;

                //判断输入为空情况
                if (bookId.Equals(""))
                {
                    MessageBox.Show("图书编号未填写");
                }
                else if (bookName.Equals(""))
                {
                    MessageBox.Show("图书名未填写");
                }
                else if(bookPrice == 0)
                {
                    MessageBox.Show("价格不可为零");
                }
                else if( bookAmount == 0)
                {
                    MessageBox.Show("图书数量为零，无法上架");
                }
                //判断图片,成功后插入或者更新数据
                else
                {
                    if(!(picBox_bkImg.ImageLocation is null))
                    {
                        //插入数据准备操作
                        bookImg = picBox_bkImg.ImageLocation.ToString();
                        con = SQLHelper.OpenConnection();
                        List<SqlParameter> parameters = new List<SqlParameter>();
                        parameters.Add(new SqlParameter("@msg",SqlDbType.VarChar,20));
                        parameters.Add(new SqlParameter("@bookid", bookId));
                        parameters.Add(new SqlParameter("@bookname", bookName));
                        parameters.Add(new SqlParameter("@booktype", selbookType));
                        parameters.Add(new SqlParameter("@unit_price", bookPrice));
                        parameters.Add(new SqlParameter("@amount", bookAmount));
                        parameters.Add(new SqlParameter("@indate", bookinDate));
                        parameters.Add(new SqlParameter("@img", bookImg));
                        parameters[0].Direction = ParameterDirection.Output;
                        
                        //查看返回信息
                        SQLHelper.GetExecuteNonQuery(con, "bkInfo_Insert",parameters.ToArray(),true);
                        string msg_value = parameters[0].Value.ToString();
                        if (msg_value.Equals("update"))
                        {
                            //查看修改后是否输入为空
                            MessageBox.Show("书籍编号存在，修改成功");
                            this.Close();
                        }
                        else
                        {
                            MessageBox.Show("添加成功！");
                            this.Close();
                        }
                        
                        
                    }
                    //判断图片为空情况
                    else
                    {
                        MessageBox.Show("图片尚未添加");
                    }
                }
                

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            finally { con.Close(); }
        }

        //书籍封面图片地址的提取
        private void picBox_bkImg_Click(object sender, EventArgs e)
        {
            OpenFileDialog openfile = new OpenFileDialog();
            openfile.Filter = "图片文件|*.jpg;*.png;*.gif;*.bmp";
            if (openfile.ShowDialog() == DialogResult.OK)
            { 
                picBox_bkImg.ImageLocation = openfile.FileName;
            }
            openfile.Dispose();
        }

        //限制图书编号为数字字母范围
        private void textBox_bkId_KeyPress(object sender, KeyPressEventArgs e)
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
        //限制图书数量为整形
        private void numeric_bkAmount_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar < 48 || e.KeyChar > 57)
            {
                e.Handled = true;
            }
        }
        
        //加载数据库中书籍信息到修改界面
        private void UpdateLoad(string bkId)
        {
            //Console.WriteLine(bkId);
            try
            {
                string bkName = "";
                int bkType = 1;
                decimal bkPrice = 0;
                int bkAmount = 0;
                DateTime bkIndate = datePicker_bk.Value;
                string bkImg = "";
                textBox_bkId.Text = bkId;
                textBox_bkId.Enabled = false;
                con  = SQLHelper.OpenConnection();
                List<SqlParameter> ptrs = new List<SqlParameter>();
                ptrs.Add(new SqlParameter("@bookid", bkId));
                
                ptrs.Add(new SqlParameter("@img", bkImg));
                SqlDataReader sdr =  SQLHelper.GetDataReader(con, "select * from bookinfo where bookid = @bookid",ptrs.ToArray());
                while (sdr.Read())
                {
                    bkName = sdr["bookname"].ToString();
                   
                    bkPrice = (decimal)sdr["unit_price"];
                    //Console.WriteLine(sdr["booktype"].ToString());
                    aa = int.Parse(sdr["booktype"].ToString());
 
                    bkAmount = (int)sdr["amount"];
                    bkIndate = (DateTime)sdr["indate"];
                    bkImg = sdr["img"].ToString();
                }
                textBox_bkName.Text = bkName;
                /*
                con.Close();
                con = SQLHelper.OpenConnection();   
                SqlCommand cmd = con.CreateCommand();
                cmd.CommandText = "select bookType from booktype where Typeid = @Typeid";
                cmd.Parameters.AddWithValue("@Typeid", bkType);
                string tp = (string)cmd.ExecuteScalar();
                Console.WriteLine(this.comboBox_bkType.Items);
                */
                numeric_bkPrice.Value = bkPrice;
                numeric_bkAmount.Value = bkAmount;
                
                datePicker_bk.Value = bkIndate;
                picBox_bkImg.ImageLocation = bkImg;
                
            }
            catch(Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            finally
            {
                con.Close();
            }
        }

        
    }
}
