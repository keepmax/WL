namespace SqlWinformDay01
{
    partial class Form_Login
    {
        /// <summary>
        /// 必需的设计器变量。
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// 清理所有正在使用的资源。
        /// </summary>
        /// <param name="disposing">如果应释放托管资源，为 true；否则为 false。</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows 窗体设计器生成的代码

        /// <summary>
        /// 设计器支持所需的方法 - 不要修改
        /// 使用代码编辑器修改此方法的内容。
        /// </summary>
        private void InitializeComponent()
        {
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.Box_Id = new System.Windows.Forms.TextBox();
            this.Box_Pwd = new System.Windows.Forms.TextBox();
            this.button_Login = new System.Windows.Forms.Button();
            this.TipLabel = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(297, 291);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(44, 18);
            this.label1.TabIndex = 0;
            this.label1.Text = "账号";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(300, 360);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(44, 18);
            this.label2.TabIndex = 1;
            this.label2.Text = "密码";
            // 
            // Box_Id
            // 
            this.Box_Id.Location = new System.Drawing.Point(415, 291);
            this.Box_Id.Name = "Box_Id";
            this.Box_Id.Size = new System.Drawing.Size(169, 28);
            this.Box_Id.TabIndex = 2;
            // 
            // Box_Pwd
            // 
            this.Box_Pwd.Location = new System.Drawing.Point(415, 360);
            this.Box_Pwd.Name = "Box_Pwd";
            this.Box_Pwd.Size = new System.Drawing.Size(169, 28);
            this.Box_Pwd.TabIndex = 3;
            // 
            // button_Login
            // 
            this.button_Login.Location = new System.Drawing.Point(439, 444);
            this.button_Login.Name = "button_Login";
            this.button_Login.Size = new System.Drawing.Size(125, 54);
            this.button_Login.TabIndex = 4;
            this.button_Login.Text = "登录";
            this.button_Login.UseVisualStyleBackColor = true;
            this.button_Login.Click += new System.EventHandler(this.button_Login_Click);
            // 
            // TipLabel
            // 
            this.TipLabel.AutoSize = true;
            this.TipLabel.Location = new System.Drawing.Point(412, 411);
            this.TipLabel.Name = "TipLabel";
            this.TipLabel.Size = new System.Drawing.Size(44, 18);
            this.TipLabel.TabIndex = 5;
            this.TipLabel.Text = "内容";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(703, 411);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(80, 18);
            this.label3.TabIndex = 6;
            this.label3.Text = "注册账号";
            this.label3.Click += new System.EventHandler(this.label3_Click);
            // 
            // Form_Login
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 18F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1355, 832);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.TipLabel);
            this.Controls.Add(this.button_Login);
            this.Controls.Add(this.Box_Pwd);
            this.Controls.Add(this.Box_Id);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Name = "Form_Login";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form_Login_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox Box_Id;
        private System.Windows.Forms.TextBox Box_Pwd;
        private System.Windows.Forms.Button button_Login;
        private System.Windows.Forms.Label TipLabel;
        private System.Windows.Forms.Label label3;
    }
}

