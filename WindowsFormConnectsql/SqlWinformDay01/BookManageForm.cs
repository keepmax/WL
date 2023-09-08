using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace SqlWinformDay01
{
    public partial class BookManageForm : Form
    {
        BindingList<Book> books = new BindingList<Book>();
        BindingList<Book> delbooks = new BindingList<Book>();
        public BookManageForm()
        {
            InitializeComponent();
            button_del.Visible = true;
            button_reset.Visible = false;
        }
        public event Action passToForm_Index;
        SqlConnection conn = null;
        private SqlDataAdapter adapter = null;
        //datagridview动态绑定数据
        private void BookManageForm_Load(object sender, EventArgs e)
        {
            try
            {
                
                //Console.WriteLine(dataGridView_book.ReadOnly);
                dataGridView_book.Columns[6].Visible = true;
                dataGridView_book.Columns[7].Visible = true;
                dataGridView_book.Columns[8].Visible = false;
                dataGridView_book.Columns[9].Visible = false;
                conn = SQLHelper.OpenConnection();
                adapter = SQLHelper.GetDataAdapter(conn, "select " +
                    "bookid,bookname,booktype.bookType,unit_price,amount,indate,img" +
                    " from bookinfo inner join booktype on bookinfo.booktype = booktype.Typeid");
                DataTable bkInfotable = new DataTable();
                adapter.Fill(bkInfotable);
                dataGridView_book.AutoGenerateColumns = false;
                
                foreach (DataRow row in bkInfotable.Rows)
                {
                    var book = new Book()
                    {
                        bookid = row["bookid"].ToString(),
                        bookname = row["bookname"].ToString(),
                        bookType = row["bookType"].ToString(),
                        unit_price = (decimal)row["unit_price"],
                        amount = (int)row["amount"],
                        indate = (DateTime)row["indate"],
                        img = row["img"].ToString()
                    };
                    books.Add(book);
                }
                
                dataGridView_book.DataSource = books;
                //dataGridView_book.Columns[2].

                //Console.WriteLine($"{books}");

                
            }
            catch(Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            finally
            {
                conn.Close();
            }
        }
        //跳转页面
        private void BookManageForm_FormClosing(object sender, FormClosingEventArgs e)
        {
            passToForm_Index?.Invoke();
        }

        //图书添加按钮
        private void BookAddbtn_Click(object sender, EventArgs e)
        {
            this.Visible = false;
            BookMessagePage msgPage = new BookMessagePage();
            msgPage.Tag = this;
            msgPage.passToForm_BkMessage += () =>
            {
                this.Visible = true;    
            };
            msgPage.Show();
        }
        //查询书籍，包括id或者是名字(试验）
        private void BookUpdatebtn_Click(object sender, EventArgs e)
        {
            try
            {
                string value_id = (string)textBox_bkId.Text;
                conn = SQLHelper.OpenConnection();
                adapter = SQLHelper.GetDataAdapter(conn, $"select bookid,bookname,booktype.bookType,unit_price,amount,indate,img from bookinfo inner join booktype on bookinfo.booktype = booktype.Typeid where bookid like '%{value_id}%' or bookname like '%{value_id}%'");
                DataTable bkInfotable = new DataTable();
                adapter.Fill(bkInfotable);
                dataGridView_book.AutoGenerateColumns = false;
                while (this.dataGridView_book.Rows.Count != 0)
                {
                    this.dataGridView_book.Rows.RemoveAt(0);
                }
                
                foreach (DataRow row in bkInfotable.Rows)
                {
                    var book = new Book()
                    {
                        bookid = row["bookid"].ToString(),
                        bookname = row["bookname"].ToString(),
                        bookType = row["bookType"].ToString(),
                        unit_price = (decimal)row["unit_price"],
                        amount = (int)row["amount"],
                        indate = (DateTime)row["indate"],
                        img = row["img"].ToString()
                    };
                    books.Add(book);
                }

                dataGridView_book.DataSource = books;

            }
            catch(Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            finally
            {
                conn.Close();
            }
            
        }

        //限制查询内容为字母中文或者数字
        private void textBox_bkId_KeyPress(object sender, KeyPressEventArgs e)
        {
            // 检查输入的字符是否是字母或数字，如果不是则取消输入
            if (!char.IsLetterOrDigit(e.KeyChar) && !char.IsControl(e.KeyChar))
            {
                e.Handled = true;
            }
            // 检查输入的字符是否是中文，
            else if (e.KeyChar >= 0x4e00 && e.KeyChar <= 0x9fbb)
            {
                e.Handled = false;
            }
        }
        //刷新后重新加载gridview,载入修改数据
        private void BookManageForm_VisibleChanged(object sender, EventArgs e)
        {
            if(this.Visible == true)
            {
                while(this.dataGridView_book.Rows.Count != 0)
                {
                    this.dataGridView_book.Rows.RemoveAt(0);
                }
                BookManageForm_Load(sender, e);
            }
            
        }
        //check已删除改变gridview显示数据
        private void checkBox_deleted_CheckedChanged(object sender, EventArgs e)
        {
            while (this.dataGridView_book.Rows.Count != 0)
            {
                this.dataGridView_book.Rows.RemoveAt(0);
            }
            if(checkBox_deleted.Checked == true)
            {
                try
                {
                    dataGridView_book.Columns[6].Visible = false;
                    dataGridView_book.Columns[7].Visible = false;
                    dataGridView_book.Columns[8].Visible = true;
                    dataGridView_book.Columns[9].Visible = true;
                    button_del.Visible = false;
                    button_reset.Visible = true;

                    conn = SQLHelper.OpenConnection();
                    adapter = SQLHelper.GetDataAdapter(conn, "select " +
                        "bookid,bookname,booktype.bookType,unit_price,amount,indate,img" +
                    " from backupbookinfo inner join booktype on backupbookinfo.booktype = booktype.Typeid");
                    DataTable delInfotable = new DataTable();
                    adapter.Fill(delInfotable);

                    dataGridView_book.AutoGenerateColumns = false;

                    foreach (DataRow row in delInfotable.Rows)
                    {
                        var book = new Book()
                        {
                            bookid = row["bookid"].ToString(),
                            bookname = row["bookname"].ToString(),
                            bookType = row["bookType"].ToString(),
                            unit_price = (decimal)row["unit_price"],
                            amount = (int)row["amount"],
                            indate = (DateTime)row["indate"],
                            img = row["img"].ToString()
                        };
                        delbooks.Add(book);
                    }

                    dataGridView_book.DataSource = delbooks;
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.Message);
                }
                finally
                {
                    conn.Close();
                }
            }
            else
            {
                button_del.Visible = true;
                button_reset.Visible = false;
                BookManageForm_Load(sender, e);
            }
        }

        //gridview cell按钮触发
        private void dataGridView_book_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            //if click is on new row or header row
            if (e.RowIndex == dataGridView_book.NewRowIndex || e.RowIndex < 0)
                return;
            

            //gridview移除按钮
            if(e.ColumnIndex == dataGridView_book.Columns["Column_remove"].Index)
            {
                string bk_Id = (string)dataGridView_book.Rows[e.RowIndex].Cells[1].Value;
                try
                {
                    MessageBoxButtons btn = MessageBoxButtons.YesNoCancel;
                    if (MessageBox.Show("确定要移除么？", "删除数据", btn) == DialogResult.Yes)
                    {
                        conn = SQLHelper.OpenConnection();
                        SqlCommand cmd = conn.CreateCommand();
                        cmd.CommandText = "delete from backupbookinfo where bookid = @bookid";
                        cmd.Parameters.AddWithValue("@bookid", bk_Id);
                        cmd.ExecuteNonQuery();
                        MessageBox.Show("移除成功");
                        checkBox_deleted_CheckedChanged(sender, e);
                        
                    }


                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.Message);
                }
                finally { conn.Close(); }
            }
            //gridview恢复按钮
            if(e.ColumnIndex == dataGridView_book.Columns["Column_reset"].Index)
            {
                string bk_Id = (string)dataGridView_book.Rows[e.RowIndex].Cells[1].Value;

                //Console.WriteLine(bk_Id);
                try
                {
                    conn = SQLHelper.OpenConnection();
                    List<SqlParameter> prs = new List<SqlParameter>();
                    prs.Add(new SqlParameter("@bookid",bk_Id));
                    SQLHelper.GetExecuteNonQuery(conn, "backdata_bookinfo_proc", prs.ToArray(), true);
                    MessageBox.Show("恢复成功");
                    checkBox_deleted_CheckedChanged(sender, e);
                }
                catch(Exception ex){ 
                    Console.WriteLine(ex.Message);
                }
                finally { conn.Close(); }
            }
            //gridview修改按钮
            if(e.ColumnIndex == dataGridView_book.Columns["Column_update"].Index)
            {
                string bk_Id = (string)dataGridView_book.Rows[e.RowIndex].Cells[1].Value;
                this.Visible = false;
                BookMessagePage msgPage = new BookMessagePage(bk_Id);
                msgPage.Tag = this;
                msgPage.passToForm_BkMessage += () =>
                {
                    this.Visible = true;
                };
                msgPage.Show();
            }
            
            //gridview删除按钮
            if (e.ColumnIndex == dataGridView_book.Columns["Column_delete"].Index)
            {
                //Put some logic here, for example to remove row from your binding list.
                //yourBindingList.RemoveAt(e.RowIndex);
                string bk_Id = (string)dataGridView_book.Rows[e.RowIndex].Cells[1].Value;
                try
                {
                    MessageBoxButtons btn = MessageBoxButtons.YesNoCancel;
                    if (MessageBox.Show("确定要删除么？", "删除数据", btn) == DialogResult.Yes)
                    {
                        conn = SQLHelper.OpenConnection();
                        SqlCommand cmd = conn.CreateCommand();
                        cmd.CommandText = "delete from bookinfo where bookid = @bookid";
                        cmd.Parameters.AddWithValue("@bookid", bk_Id);
                        cmd.ExecuteNonQuery();
                        MessageBox.Show("删除成功");
                        BookManageForm_VisibleChanged(sender, e);
                    }
                    

                }
                catch(Exception ex)
                {
                    Console.WriteLine(ex.Message);
                }
                finally { conn.Close(); }
                //Console.WriteLine(bk_Id);
                // Or
                // var data = (Product)dataGridView1.Rows[e.RowIndex].DataBoundItem;
                // do something 
            }
        }

        //类别选择控件
        private void 程序书籍ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            try
            {
                conn = SQLHelper.OpenConnection();
                adapter = SQLHelper.GetDataAdapter(conn, "select bookid,bookname,booktype.bookType,unit_price,amount,indate,img from bookinfo inner join booktype on bookinfo.booktype = booktype.Typeid where booktype.bookType = '程序书籍'");
                DataTable bkInfotable = new DataTable();
                adapter.Fill(bkInfotable);
                dataGridView_book.AutoGenerateColumns = false;
                while (this.dataGridView_book.Rows.Count != 0)
                {
                    this.dataGridView_book.Rows.RemoveAt(0);
                }
                foreach (DataRow row in bkInfotable.Rows)
                {
                    var book = new Book()
                    {
                        bookid = row["bookid"].ToString(),
                        bookname = row["bookname"].ToString(),
                        bookType = row["bookType"].ToString(),
                        unit_price = (decimal)row["unit_price"],
                        amount = (int)row["amount"],
                        indate = (DateTime)row["indate"],
                        img = row["img"].ToString()
                    };
                    books.Add(book);
                }

                dataGridView_book.DataSource = books;

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            finally
            {
                conn.Close();
            }
        }

        private void 哲学书籍ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            try
            {
                conn = SQLHelper.OpenConnection();
                adapter = SQLHelper.GetDataAdapter(conn, "select bookid,bookname,booktype.bookType,unit_price,amount,indate,img from bookinfo inner join booktype on bookinfo.booktype = booktype.Typeid where booktype.bookType = '哲学书籍'");
                DataTable bkInfotable = new DataTable();
                adapter.Fill(bkInfotable);
                dataGridView_book.AutoGenerateColumns = false;
                while (this.dataGridView_book.Rows.Count != 0)
                {
                    this.dataGridView_book.Rows.RemoveAt(0);
                }
                foreach (DataRow row in bkInfotable.Rows)
                {
                    var book = new Book()
                    {
                        bookid = row["bookid"].ToString(),
                        bookname = row["bookname"].ToString(),
                        bookType = row["bookType"].ToString(),
                        unit_price = (decimal)row["unit_price"],
                        amount = (int)row["amount"],
                        indate = (DateTime)row["indate"],
                        img = row["img"].ToString()
                    };
                    books.Add(book);
                }

                dataGridView_book.DataSource = books;

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            finally
            {
                conn.Close();
            }
        }

        private void 文学书籍ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            try
            {
                conn = SQLHelper.OpenConnection();
                adapter = SQLHelper.GetDataAdapter(conn, "select bookid,bookname,booktype.bookType,unit_price,amount,indate,img from bookinfo inner join booktype on bookinfo.booktype = booktype.Typeid where booktype.bookType = '文学书籍'");
                DataTable bkInfotable = new DataTable();
                adapter.Fill(bkInfotable);
                dataGridView_book.AutoGenerateColumns = false;
                while (this.dataGridView_book.Rows.Count != 0)
                {
                    this.dataGridView_book.Rows.RemoveAt(0);
                }
                foreach (DataRow row in bkInfotable.Rows)
                {
                    var book = new Book()
                    {
                        bookid = row["bookid"].ToString(),
                        bookname = row["bookname"].ToString(),
                        bookType = row["bookType"].ToString(),
                        unit_price = (decimal)row["unit_price"],
                        amount = (int)row["amount"],
                        indate = (DateTime)row["indate"],
                        img = row["img"].ToString()
                    };
                    books.Add(book);
                }

                dataGridView_book.DataSource = books;

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            finally
            {
                conn.Close();
            }
        }

        private void c书籍ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            try
            {
                conn = SQLHelper.OpenConnection();
                adapter = SQLHelper.GetDataAdapter(conn, "select bookid,bookname,booktype.bookType,unit_price,amount,indate,img from bookinfo inner join booktype on bookinfo.booktype = booktype.Typeid where booktype.bookType = 'C++书籍'");
                DataTable bkInfotable = new DataTable();
                adapter.Fill(bkInfotable);
                dataGridView_book.AutoGenerateColumns = false;
                while (this.dataGridView_book.Rows.Count != 0)
                {
                    this.dataGridView_book.Rows.RemoveAt(0);
                }
                foreach (DataRow row in bkInfotable.Rows)
                {
                    var book = new Book()
                    {
                        bookid = row["bookid"].ToString(),
                        bookname = row["bookname"].ToString(),
                        bookType = row["bookType"].ToString(),
                        unit_price = (decimal)row["unit_price"],
                        amount = (int)row["amount"],
                        indate = (DateTime)row["indate"],
                        img = row["img"].ToString()
                    };
                    books.Add(book);
                }

                dataGridView_book.DataSource = books;

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            finally
            {
                conn.Close();
            }
        }

        private void java书籍ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            try
            {
                conn = SQLHelper.OpenConnection();
                adapter = SQLHelper.GetDataAdapter(conn, "select bookid,bookname,booktype.bookType,unit_price,amount,indate,img from bookinfo inner join booktype on bookinfo.booktype = booktype.Typeid where booktype.bookType = 'Java书籍'");
                DataTable bkInfotable = new DataTable();
                adapter.Fill(bkInfotable);
                dataGridView_book.AutoGenerateColumns = false;
                while (this.dataGridView_book.Rows.Count != 0)
                {
                    this.dataGridView_book.Rows.RemoveAt(0);
                }
                foreach (DataRow row in bkInfotable.Rows)
                {
                    var book = new Book()
                    {
                        bookid = row["bookid"].ToString(),
                        bookname = row["bookname"].ToString(),
                        bookType = row["bookType"].ToString(),
                        unit_price = (decimal)row["unit_price"],
                        amount = (int)row["amount"],
                        indate = (DateTime)row["indate"],
                        img = row["img"].ToString()
                    };
                    books.Add(book);
                }

                dataGridView_book.DataSource = books;

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            finally
            {
                conn.Close();
            }
        }

        //批量删除
        private void button_del_Click(object sender, EventArgs e)
        {
            
            //删除操作
            try
            {
                List<string> lst = new List<string>();
                for (int i = 0; i < dataGridView_book.Rows.Count; i++)
                {
                    if ((bool)dataGridView_book.Rows[i].Cells[0].EditedFormattedValue == true)
                    {
                        string bk_Id = (string)dataGridView_book.Rows[i].Cells[1].Value;
                        lst.Add(bk_Id);
                    }
                }
                if(lst.Count == 0) {
                    MessageBox.Show("未选择任何数据");
                }
                else {
                    foreach (string item in lst)
                    {
                        conn = SQLHelper.OpenConnection();
                        SqlCommand cmd = conn.CreateCommand();
                        cmd.CommandText = "delete from bookinfo where bookid = @bookid";
                        cmd.Parameters.AddWithValue("@bookid", item);
                        cmd.ExecuteNonQuery();
                    }
                    BookManageForm_VisibleChanged(sender, e);
                    MessageBox.Show("删除成功");
                    checkBox_select.Checked = false;
                }    
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            finally { conn.Close(); }
        }
        //批量恢复
        private void button_reset_Click(object sender, EventArgs e)
        {
            //恢复操作
            try
            {
                List<string> lst = new List<string>();
                for (int i = 0; i < dataGridView_book.Rows.Count; i++)
                {
                    if ((bool)dataGridView_book.Rows[i].Cells[0].EditedFormattedValue == true)
                    {
                        string bk_Id = (string)dataGridView_book.Rows[i].Cells[1].Value;
                        lst.Add(bk_Id);
                    }
                }
                if (lst.Count == 0)
                {
                    MessageBox.Show("未选择任何数据");
                }
                else
                {
                    foreach (string item in lst)
                    {
                        conn = SQLHelper.OpenConnection();
                        List<SqlParameter> prs = new List<SqlParameter>();
                        prs.Add(new SqlParameter("@bookid", item));
                        SQLHelper.GetExecuteNonQuery(conn, "backdata_bookinfo_proc", prs.ToArray(), true);
                    }
                    checkBox_deleted_CheckedChanged(sender, e);
                    MessageBox.Show("恢复成功");
                    checkBox_select.Checked = false;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            finally
            {
                conn.Close();
            }

        }

        //全选按钮
        private void checkBox_select_CheckedChanged(object sender, EventArgs e)
        {
            if (checkBox_select.Checked)
            {
                for (int i = 0; i < dataGridView_book.Rows.Count; i++)
                {
                    dataGridView_book.Rows[i].Cells[0].Value = true;
                }
            }
            else
            {
                for (int i = 0; i < dataGridView_book.Rows.Count; i++)
                {
                    dataGridView_book.Rows[i].Cells[0].Value = false;
                }
            }
        }
    }
}
