namespace SqlWinformDay01
{
    partial class BookManageForm
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.BookAddbtn = new System.Windows.Forms.Button();
            this.textBox_bkId = new System.Windows.Forms.TextBox();
            this.BookUpdatebtn = new System.Windows.Forms.Button();
            this.backgroundWorker1 = new System.ComponentModel.BackgroundWorker();
            this.bindingSource1 = new System.Windows.Forms.BindingSource(this.components);
            this.checkBox_deleted = new System.Windows.Forms.CheckBox();
            this.button_del = new System.Windows.Forms.Button();
            this.button_reset = new System.Windows.Forms.Button();
            this.panel1 = new System.Windows.Forms.Panel();
            this.menuStrip1 = new System.Windows.Forms.MenuStrip();
            this.书籍类别ToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.程序书籍ToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.哲学书籍ToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.文学书籍ToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.c书籍ToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.java书籍ToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.panel2 = new System.Windows.Forms.Panel();
            this.dataGridView_book = new System.Windows.Forms.DataGridView();
            this.Column_check = new System.Windows.Forms.DataGridViewCheckBoxColumn();
            this.bookid = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.bookname = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Type = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.amount = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.unit_price = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Column_update = new System.Windows.Forms.DataGridViewButtonColumn();
            this.Column_delete = new System.Windows.Forms.DataGridViewButtonColumn();
            this.Column_reset = new System.Windows.Forms.DataGridViewButtonColumn();
            this.Column_remove = new System.Windows.Forms.DataGridViewButtonColumn();
            this.checkBox_select = new System.Windows.Forms.CheckBox();
            ((System.ComponentModel.ISupportInitialize)(this.bindingSource1)).BeginInit();
            this.panel1.SuspendLayout();
            this.menuStrip1.SuspendLayout();
            this.panel2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView_book)).BeginInit();
            this.SuspendLayout();
            // 
            // BookAddbtn
            // 
            this.BookAddbtn.Location = new System.Drawing.Point(331, 114);
            this.BookAddbtn.Name = "BookAddbtn";
            this.BookAddbtn.Size = new System.Drawing.Size(112, 41);
            this.BookAddbtn.TabIndex = 0;
            this.BookAddbtn.Text = "添加图书";
            this.BookAddbtn.UseVisualStyleBackColor = true;
            this.BookAddbtn.Click += new System.EventHandler(this.BookAddbtn_Click);
            // 
            // textBox_bkId
            // 
            this.textBox_bkId.Location = new System.Drawing.Point(39, 52);
            this.textBox_bkId.Name = "textBox_bkId";
            this.textBox_bkId.Size = new System.Drawing.Size(184, 28);
            this.textBox_bkId.TabIndex = 1;
            this.textBox_bkId.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.textBox_bkId_KeyPress);
            // 
            // BookUpdatebtn
            // 
            this.BookUpdatebtn.Location = new System.Drawing.Point(287, 36);
            this.BookUpdatebtn.Name = "BookUpdatebtn";
            this.BookUpdatebtn.Size = new System.Drawing.Size(191, 56);
            this.BookUpdatebtn.TabIndex = 2;
            this.BookUpdatebtn.Text = "查询图书（id/name）";
            this.BookUpdatebtn.UseVisualStyleBackColor = true;
            this.BookUpdatebtn.Click += new System.EventHandler(this.BookUpdatebtn_Click);
            // 
            // checkBox_deleted
            // 
            this.checkBox_deleted.AutoSize = true;
            this.checkBox_deleted.Location = new System.Drawing.Point(1294, 140);
            this.checkBox_deleted.Name = "checkBox_deleted";
            this.checkBox_deleted.Size = new System.Drawing.Size(88, 22);
            this.checkBox_deleted.TabIndex = 5;
            this.checkBox_deleted.Text = "已删除";
            this.checkBox_deleted.UseVisualStyleBackColor = true;
            this.checkBox_deleted.CheckedChanged += new System.EventHandler(this.checkBox_deleted_CheckedChanged);
            // 
            // button_del
            // 
            this.button_del.Location = new System.Drawing.Point(1061, 114);
            this.button_del.Name = "button_del";
            this.button_del.Size = new System.Drawing.Size(136, 41);
            this.button_del.TabIndex = 6;
            this.button_del.Text = "删除";
            this.button_del.UseVisualStyleBackColor = true;
            this.button_del.Click += new System.EventHandler(this.button_del_Click);
            // 
            // button_reset
            // 
            this.button_reset.Location = new System.Drawing.Point(835, 114);
            this.button_reset.Name = "button_reset";
            this.button_reset.Size = new System.Drawing.Size(124, 40);
            this.button_reset.TabIndex = 8;
            this.button_reset.Text = "恢复";
            this.button_reset.UseVisualStyleBackColor = true;
            this.button_reset.Click += new System.EventHandler(this.button_reset_Click);
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.menuStrip1);
            this.panel1.Location = new System.Drawing.Point(39, 196);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(234, 587);
            this.panel1.TabIndex = 9;
            // 
            // menuStrip1
            // 
            this.menuStrip1.GripMargin = new System.Windows.Forms.Padding(2, 2, 0, 2);
            this.menuStrip1.ImageScalingSize = new System.Drawing.Size(24, 24);
            this.menuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.书籍类别ToolStripMenuItem});
            this.menuStrip1.Location = new System.Drawing.Point(0, 0);
            this.menuStrip1.Name = "menuStrip1";
            this.menuStrip1.Size = new System.Drawing.Size(234, 32);
            this.menuStrip1.TabIndex = 0;
            this.menuStrip1.Text = "menuStrip1";
            // 
            // 书籍类别ToolStripMenuItem
            // 
            this.书籍类别ToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.程序书籍ToolStripMenuItem,
            this.哲学书籍ToolStripMenuItem,
            this.文学书籍ToolStripMenuItem,
            this.c书籍ToolStripMenuItem,
            this.java书籍ToolStripMenuItem});
            this.书籍类别ToolStripMenuItem.Name = "书籍类别ToolStripMenuItem";
            this.书籍类别ToolStripMenuItem.Size = new System.Drawing.Size(98, 28);
            this.书籍类别ToolStripMenuItem.Text = "书籍类别";
            // 
            // 程序书籍ToolStripMenuItem
            // 
            this.程序书籍ToolStripMenuItem.Name = "程序书籍ToolStripMenuItem";
            this.程序书籍ToolStripMenuItem.Size = new System.Drawing.Size(184, 34);
            this.程序书籍ToolStripMenuItem.Text = "程序书籍";
            this.程序书籍ToolStripMenuItem.Click += new System.EventHandler(this.程序书籍ToolStripMenuItem_Click);
            // 
            // 哲学书籍ToolStripMenuItem
            // 
            this.哲学书籍ToolStripMenuItem.Name = "哲学书籍ToolStripMenuItem";
            this.哲学书籍ToolStripMenuItem.Size = new System.Drawing.Size(184, 34);
            this.哲学书籍ToolStripMenuItem.Text = "哲学书籍";
            this.哲学书籍ToolStripMenuItem.Click += new System.EventHandler(this.哲学书籍ToolStripMenuItem_Click);
            // 
            // 文学书籍ToolStripMenuItem
            // 
            this.文学书籍ToolStripMenuItem.Name = "文学书籍ToolStripMenuItem";
            this.文学书籍ToolStripMenuItem.Size = new System.Drawing.Size(184, 34);
            this.文学书籍ToolStripMenuItem.Text = "文学书籍";
            this.文学书籍ToolStripMenuItem.Click += new System.EventHandler(this.文学书籍ToolStripMenuItem_Click);
            // 
            // c书籍ToolStripMenuItem
            // 
            this.c书籍ToolStripMenuItem.Name = "c书籍ToolStripMenuItem";
            this.c书籍ToolStripMenuItem.Size = new System.Drawing.Size(184, 34);
            this.c书籍ToolStripMenuItem.Text = "C++书籍";
            this.c书籍ToolStripMenuItem.Click += new System.EventHandler(this.c书籍ToolStripMenuItem_Click);
            // 
            // java书籍ToolStripMenuItem
            // 
            this.java书籍ToolStripMenuItem.Name = "java书籍ToolStripMenuItem";
            this.java书籍ToolStripMenuItem.Size = new System.Drawing.Size(184, 34);
            this.java书籍ToolStripMenuItem.Text = "Java书籍";
            this.java书籍ToolStripMenuItem.Click += new System.EventHandler(this.java书籍ToolStripMenuItem_Click);
            // 
            // panel2
            // 
            this.panel2.Controls.Add(this.dataGridView_book);
            this.panel2.Location = new System.Drawing.Point(321, 196);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(1107, 587);
            this.panel2.TabIndex = 10;
            // 
            // dataGridView_book
            // 
            this.dataGridView_book.AllowUserToAddRows = false;
            this.dataGridView_book.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dataGridView_book.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView_book.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.Column_check,
            this.bookid,
            this.bookname,
            this.Type,
            this.amount,
            this.unit_price,
            this.Column_update,
            this.Column_delete,
            this.Column_reset,
            this.Column_remove});
            this.dataGridView_book.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dataGridView_book.Location = new System.Drawing.Point(0, 0);
            this.dataGridView_book.Name = "dataGridView_book";
            this.dataGridView_book.RowHeadersWidth = 62;
            this.dataGridView_book.RowTemplate.Height = 30;
            this.dataGridView_book.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dataGridView_book.Size = new System.Drawing.Size(1107, 587);
            this.dataGridView_book.TabIndex = 1;
            this.dataGridView_book.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView_book_CellClick);
            // 
            // Column_check
            // 
            this.Column_check.HeaderText = "选择";
            this.Column_check.MinimumWidth = 8;
            this.Column_check.Name = "Column_check";
            // 
            // bookid
            // 
            this.bookid.DataPropertyName = "bookid";
            this.bookid.HeaderText = "编号";
            this.bookid.MinimumWidth = 8;
            this.bookid.Name = "bookid";
            // 
            // bookname
            // 
            this.bookname.DataPropertyName = "bookname";
            this.bookname.HeaderText = "书名";
            this.bookname.MinimumWidth = 8;
            this.bookname.Name = "bookname";
            // 
            // Type
            // 
            this.Type.DataPropertyName = "bookType";
            this.Type.HeaderText = "类别";
            this.Type.MinimumWidth = 8;
            this.Type.Name = "Type";
            this.Type.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.Type.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.NotSortable;
            // 
            // amount
            // 
            this.amount.DataPropertyName = "amount";
            this.amount.HeaderText = "数量";
            this.amount.MinimumWidth = 8;
            this.amount.Name = "amount";
            this.amount.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.amount.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.NotSortable;
            // 
            // unit_price
            // 
            this.unit_price.DataPropertyName = "unit_price";
            this.unit_price.HeaderText = "价格";
            this.unit_price.MinimumWidth = 8;
            this.unit_price.Name = "unit_price";
            // 
            // Column_update
            // 
            this.Column_update.HeaderText = "修改";
            this.Column_update.MinimumWidth = 8;
            this.Column_update.Name = "Column_update";
            // 
            // Column_delete
            // 
            this.Column_delete.HeaderText = "删除";
            this.Column_delete.MinimumWidth = 8;
            this.Column_delete.Name = "Column_delete";
            // 
            // Column_reset
            // 
            this.Column_reset.HeaderText = "恢复";
            this.Column_reset.MinimumWidth = 8;
            this.Column_reset.Name = "Column_reset";
            this.Column_reset.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.Column_reset.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic;
            // 
            // Column_remove
            // 
            this.Column_remove.HeaderText = "移除";
            this.Column_remove.MinimumWidth = 8;
            this.Column_remove.Name = "Column_remove";
            this.Column_remove.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.Column_remove.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic;
            // 
            // checkBox_select
            // 
            this.checkBox_select.AutoSize = true;
            this.checkBox_select.Location = new System.Drawing.Point(321, 162);
            this.checkBox_select.Name = "checkBox_select";
            this.checkBox_select.Size = new System.Drawing.Size(70, 22);
            this.checkBox_select.TabIndex = 11;
            this.checkBox_select.Text = "全选";
            this.checkBox_select.UseVisualStyleBackColor = true;
            this.checkBox_select.CheckedChanged += new System.EventHandler(this.checkBox_select_CheckedChanged);
            // 
            // BookManageForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 18F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1507, 813);
            this.Controls.Add(this.checkBox_select);
            this.Controls.Add(this.panel2);
            this.Controls.Add(this.panel1);
            this.Controls.Add(this.button_reset);
            this.Controls.Add(this.button_del);
            this.Controls.Add(this.checkBox_deleted);
            this.Controls.Add(this.BookUpdatebtn);
            this.Controls.Add(this.textBox_bkId);
            this.Controls.Add(this.BookAddbtn);
            this.MainMenuStrip = this.menuStrip1;
            this.Name = "BookManageForm";
            this.Text = "BookManageForm";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.BookManageForm_FormClosing);
            this.Load += new System.EventHandler(this.BookManageForm_Load);
            this.VisibleChanged += new System.EventHandler(this.BookManageForm_VisibleChanged);
            ((System.ComponentModel.ISupportInitialize)(this.bindingSource1)).EndInit();
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            this.menuStrip1.ResumeLayout(false);
            this.menuStrip1.PerformLayout();
            this.panel2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView_book)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button BookAddbtn;
        private System.Windows.Forms.TextBox textBox_bkId;
        private System.Windows.Forms.Button BookUpdatebtn;
        private System.ComponentModel.BackgroundWorker backgroundWorker1;
        private System.Windows.Forms.BindingSource bindingSource1;
        private System.Windows.Forms.CheckBox checkBox_deleted;
        private System.Windows.Forms.Button button_del;
        private System.Windows.Forms.Button button_reset;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.MenuStrip menuStrip1;
        private System.Windows.Forms.ToolStripMenuItem 书籍类别ToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem 程序书籍ToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem 哲学书籍ToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem 文学书籍ToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem c书籍ToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem java书籍ToolStripMenuItem;
        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.DataGridView dataGridView_book;
        private System.Windows.Forms.DataGridViewCheckBoxColumn Column_check;
        private System.Windows.Forms.DataGridViewTextBoxColumn bookid;
        private System.Windows.Forms.DataGridViewTextBoxColumn bookname;
        private System.Windows.Forms.DataGridViewTextBoxColumn Type;
        private System.Windows.Forms.DataGridViewTextBoxColumn amount;
        private System.Windows.Forms.DataGridViewTextBoxColumn unit_price;
        private System.Windows.Forms.DataGridViewButtonColumn Column_update;
        private System.Windows.Forms.DataGridViewButtonColumn Column_delete;
        private System.Windows.Forms.DataGridViewButtonColumn Column_reset;
        private System.Windows.Forms.DataGridViewButtonColumn Column_remove;
        private System.Windows.Forms.CheckBox checkBox_select;
    }
}