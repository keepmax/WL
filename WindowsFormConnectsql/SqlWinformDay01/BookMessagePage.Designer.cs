namespace SqlWinformDay01
{
    partial class BookMessagePage
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
            this.label_bkId = new System.Windows.Forms.Label();
            this.label_bkName = new System.Windows.Forms.Label();
            this.label_bkType = new System.Windows.Forms.Label();
            this.label_bkPrice = new System.Windows.Forms.Label();
            this.label_bkAmount = new System.Windows.Forms.Label();
            this.label_bkIndate = new System.Windows.Forms.Label();
            this.label_bkImg = new System.Windows.Forms.Label();
            this.textBox_bkId = new System.Windows.Forms.TextBox();
            this.textBox_bkName = new System.Windows.Forms.TextBox();
            this.comboBox_bkType = new System.Windows.Forms.ComboBox();
            this.picBox_bkImg = new System.Windows.Forms.PictureBox();
            this.datePicker_bk = new System.Windows.Forms.DateTimePicker();
            this.numeric_bkPrice = new System.Windows.Forms.NumericUpDown();
            this.backgroundWorker1 = new System.ComponentModel.BackgroundWorker();
            this.numeric_bkAmount = new System.Windows.Forms.NumericUpDown();
            this.button_Commit = new System.Windows.Forms.Button();
            this.button_bkClose = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.picBox_bkImg)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.numeric_bkPrice)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.numeric_bkAmount)).BeginInit();
            this.SuspendLayout();
            // 
            // label_bkId
            // 
            this.label_bkId.AutoSize = true;
            this.label_bkId.Location = new System.Drawing.Point(151, 90);
            this.label_bkId.Name = "label_bkId";
            this.label_bkId.Size = new System.Drawing.Size(89, 18);
            this.label_bkId.TabIndex = 0;
            this.label_bkId.Text = "图书编码:";
            // 
            // label_bkName
            // 
            this.label_bkName.AutoSize = true;
            this.label_bkName.Location = new System.Drawing.Point(151, 166);
            this.label_bkName.Name = "label_bkName";
            this.label_bkName.Size = new System.Drawing.Size(89, 18);
            this.label_bkName.TabIndex = 1;
            this.label_bkName.Text = "图书名称:";
            // 
            // label_bkType
            // 
            this.label_bkType.AutoSize = true;
            this.label_bkType.Location = new System.Drawing.Point(151, 246);
            this.label_bkType.Name = "label_bkType";
            this.label_bkType.Size = new System.Drawing.Size(89, 18);
            this.label_bkType.TabIndex = 2;
            this.label_bkType.Text = "图书类别:";
            // 
            // label_bkPrice
            // 
            this.label_bkPrice.AutoSize = true;
            this.label_bkPrice.Location = new System.Drawing.Point(151, 325);
            this.label_bkPrice.Name = "label_bkPrice";
            this.label_bkPrice.Size = new System.Drawing.Size(89, 18);
            this.label_bkPrice.TabIndex = 3;
            this.label_bkPrice.Text = "图书价格:";
            // 
            // label_bkAmount
            // 
            this.label_bkAmount.AutoSize = true;
            this.label_bkAmount.Location = new System.Drawing.Point(151, 395);
            this.label_bkAmount.Name = "label_bkAmount";
            this.label_bkAmount.Size = new System.Drawing.Size(89, 18);
            this.label_bkAmount.TabIndex = 4;
            this.label_bkAmount.Text = "图书数量:";
            // 
            // label_bkIndate
            // 
            this.label_bkIndate.AutoSize = true;
            this.label_bkIndate.Location = new System.Drawing.Point(151, 465);
            this.label_bkIndate.Name = "label_bkIndate";
            this.label_bkIndate.Size = new System.Drawing.Size(89, 18);
            this.label_bkIndate.TabIndex = 5;
            this.label_bkIndate.Text = "入库日期:";
            // 
            // label_bkImg
            // 
            this.label_bkImg.AutoSize = true;
            this.label_bkImg.Location = new System.Drawing.Point(791, 90);
            this.label_bkImg.Name = "label_bkImg";
            this.label_bkImg.Size = new System.Drawing.Size(89, 18);
            this.label_bkImg.TabIndex = 6;
            this.label_bkImg.Text = "图书图像:";
            // 
            // textBox_bkId
            // 
            this.textBox_bkId.Location = new System.Drawing.Point(314, 90);
            this.textBox_bkId.MaxLength = 30;
            this.textBox_bkId.Name = "textBox_bkId";
            this.textBox_bkId.Size = new System.Drawing.Size(180, 28);
            this.textBox_bkId.TabIndex = 7;
            this.textBox_bkId.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.textBox_bkId_KeyPress);
            // 
            // textBox_bkName
            // 
            this.textBox_bkName.Location = new System.Drawing.Point(314, 166);
            this.textBox_bkName.Name = "textBox_bkName";
            this.textBox_bkName.Size = new System.Drawing.Size(180, 28);
            this.textBox_bkName.TabIndex = 8;
            // 
            // comboBox_bkType
            // 
            this.comboBox_bkType.FormattingEnabled = true;
            this.comboBox_bkType.Location = new System.Drawing.Point(314, 246);
            this.comboBox_bkType.Name = "comboBox_bkType";
            this.comboBox_bkType.Size = new System.Drawing.Size(180, 26);
            this.comboBox_bkType.TabIndex = 9;
            // 
            // picBox_bkImg
            // 
            this.picBox_bkImg.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.picBox_bkImg.Location = new System.Drawing.Point(939, 90);
            this.picBox_bkImg.Name = "picBox_bkImg";
            this.picBox_bkImg.Size = new System.Drawing.Size(540, 441);
            this.picBox_bkImg.TabIndex = 10;
            this.picBox_bkImg.TabStop = false;
            this.picBox_bkImg.Click += new System.EventHandler(this.picBox_bkImg_Click);
            // 
            // datePicker_bk
            // 
            this.datePicker_bk.Location = new System.Drawing.Point(314, 465);
            this.datePicker_bk.Name = "datePicker_bk";
            this.datePicker_bk.Size = new System.Drawing.Size(231, 28);
            this.datePicker_bk.TabIndex = 11;
            // 
            // numeric_bkPrice
            // 
            this.numeric_bkPrice.Location = new System.Drawing.Point(314, 325);
            this.numeric_bkPrice.Name = "numeric_bkPrice";
            this.numeric_bkPrice.Size = new System.Drawing.Size(180, 28);
            this.numeric_bkPrice.TabIndex = 12;
            // 
            // numeric_bkAmount
            // 
            this.numeric_bkAmount.Location = new System.Drawing.Point(314, 395);
            this.numeric_bkAmount.Name = "numeric_bkAmount";
            this.numeric_bkAmount.Size = new System.Drawing.Size(180, 28);
            this.numeric_bkAmount.TabIndex = 13;
            this.numeric_bkAmount.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.numeric_bkAmount_KeyPress);
            // 
            // button_Commit
            // 
            this.button_Commit.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(224)))), ((int)(((byte)(192)))));
            this.button_Commit.Location = new System.Drawing.Point(773, 625);
            this.button_Commit.Name = "button_Commit";
            this.button_Commit.Size = new System.Drawing.Size(126, 49);
            this.button_Commit.TabIndex = 14;
            this.button_Commit.Text = "提交";
            this.button_Commit.UseVisualStyleBackColor = false;
            this.button_Commit.Click += new System.EventHandler(this.button_Commit_Click);
            // 
            // button_bkClose
            // 
            this.button_bkClose.Location = new System.Drawing.Point(939, 625);
            this.button_bkClose.Name = "button_bkClose";
            this.button_bkClose.Size = new System.Drawing.Size(123, 50);
            this.button_bkClose.TabIndex = 15;
            this.button_bkClose.Text = "返回";
            this.button_bkClose.UseVisualStyleBackColor = true;
            this.button_bkClose.Click += new System.EventHandler(this.button_bkClose_Click);
            // 
            // BookMessagePage
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 18F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1657, 870);
            this.Controls.Add(this.button_bkClose);
            this.Controls.Add(this.button_Commit);
            this.Controls.Add(this.numeric_bkAmount);
            this.Controls.Add(this.numeric_bkPrice);
            this.Controls.Add(this.datePicker_bk);
            this.Controls.Add(this.picBox_bkImg);
            this.Controls.Add(this.comboBox_bkType);
            this.Controls.Add(this.textBox_bkName);
            this.Controls.Add(this.textBox_bkId);
            this.Controls.Add(this.label_bkImg);
            this.Controls.Add(this.label_bkIndate);
            this.Controls.Add(this.label_bkAmount);
            this.Controls.Add(this.label_bkPrice);
            this.Controls.Add(this.label_bkType);
            this.Controls.Add(this.label_bkName);
            this.Controls.Add(this.label_bkId);
            this.Name = "BookMessagePage";
            this.Text = "BookMessagePage";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.BookMessagePage_FormClosing);
            this.Load += new System.EventHandler(this.BookMessagePage_Load);
            ((System.ComponentModel.ISupportInitialize)(this.picBox_bkImg)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.numeric_bkPrice)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.numeric_bkAmount)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label_bkId;
        private System.Windows.Forms.Label label_bkName;
        private System.Windows.Forms.Label label_bkType;
        private System.Windows.Forms.Label label_bkPrice;
        private System.Windows.Forms.Label label_bkAmount;
        private System.Windows.Forms.Label label_bkIndate;
        private System.Windows.Forms.Label label_bkImg;
        private System.Windows.Forms.TextBox textBox_bkId;
        private System.Windows.Forms.TextBox textBox_bkName;
        private System.Windows.Forms.ComboBox comboBox_bkType;
        private System.Windows.Forms.PictureBox picBox_bkImg;
        private System.Windows.Forms.DateTimePicker datePicker_bk;
        private System.Windows.Forms.NumericUpDown numeric_bkPrice;
        private System.ComponentModel.BackgroundWorker backgroundWorker1;
        private System.Windows.Forms.NumericUpDown numeric_bkAmount;
        private System.Windows.Forms.Button button_Commit;
        private System.Windows.Forms.Button button_bkClose;
    }
}