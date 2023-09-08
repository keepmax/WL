namespace WindowsFormConnectsql
{
    partial class Form_register
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
            this.label1 = new System.Windows.Forms.Label();
            this.labelaccount = new System.Windows.Forms.Label();
            this.labelpwd = new System.Windows.Forms.Label();
            this.labelsex = new System.Windows.Forms.Label();
            this.labelrole = new System.Windows.Forms.Label();
            this.labelname = new System.Windows.Forms.Label();
            this.labelstatus = new System.Windows.Forms.Label();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.textBox2 = new System.Windows.Forms.TextBox();
            this.textBox3 = new System.Windows.Forms.TextBox();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("华文行楷", 16F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.label1.ForeColor = System.Drawing.SystemColors.MenuHighlight;
            this.label1.Location = new System.Drawing.Point(684, 71);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(175, 33);
            this.label1.TabIndex = 0;
            this.label1.Text = "注册新用户";
            // 
            // labelaccount
            // 
            this.labelaccount.AutoSize = true;
            this.labelaccount.Location = new System.Drawing.Point(366, 139);
            this.labelaccount.Name = "labelaccount";
            this.labelaccount.Size = new System.Drawing.Size(44, 18);
            this.labelaccount.TabIndex = 1;
            this.labelaccount.Text = "账号";
            // 
            // labelpwd
            // 
            this.labelpwd.AutoSize = true;
            this.labelpwd.Location = new System.Drawing.Point(366, 199);
            this.labelpwd.Name = "labelpwd";
            this.labelpwd.Size = new System.Drawing.Size(44, 18);
            this.labelpwd.TabIndex = 1;
            this.labelpwd.Text = "密码";
            // 
            // labelsex
            // 
            this.labelsex.AutoSize = true;
            this.labelsex.Location = new System.Drawing.Point(366, 324);
            this.labelsex.Name = "labelsex";
            this.labelsex.Size = new System.Drawing.Size(44, 18);
            this.labelsex.TabIndex = 1;
            this.labelsex.Text = "性别";
            // 
            // labelrole
            // 
            this.labelrole.AutoSize = true;
            this.labelrole.Location = new System.Drawing.Point(366, 445);
            this.labelrole.Name = "labelrole";
            this.labelrole.Size = new System.Drawing.Size(44, 18);
            this.labelrole.TabIndex = 1;
            this.labelrole.Text = "角色";
            // 
            // labelname
            // 
            this.labelname.AutoSize = true;
            this.labelname.Location = new System.Drawing.Point(366, 257);
            this.labelname.Name = "labelname";
            this.labelname.Size = new System.Drawing.Size(44, 18);
            this.labelname.TabIndex = 1;
            this.labelname.Text = "姓名";
            // 
            // labelstatus
            // 
            this.labelstatus.AutoSize = true;
            this.labelstatus.Location = new System.Drawing.Point(366, 389);
            this.labelstatus.Name = "labelstatus";
            this.labelstatus.Size = new System.Drawing.Size(44, 18);
            this.labelstatus.TabIndex = 1;
            this.labelstatus.Text = "状态";
            // 
            // textBox1
            // 
            this.textBox1.Location = new System.Drawing.Point(485, 139);
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(199, 28);
            this.textBox1.TabIndex = 2;
            // 
            // textBox2
            // 
            this.textBox2.Location = new System.Drawing.Point(485, 199);
            this.textBox2.Name = "textBox2";
            this.textBox2.Size = new System.Drawing.Size(199, 28);
            this.textBox2.TabIndex = 3;
            // 
            // textBox3
            // 
            this.textBox3.Location = new System.Drawing.Point(485, 257);
            this.textBox3.Name = "textBox3";
            this.textBox3.Size = new System.Drawing.Size(199, 28);
            this.textBox3.TabIndex = 4;
            // 
            // Form_register
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 18F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1614, 860);
            this.Controls.Add(this.textBox3);
            this.Controls.Add(this.textBox2);
            this.Controls.Add(this.textBox1);
            this.Controls.Add(this.labelstatus);
            this.Controls.Add(this.labelname);
            this.Controls.Add(this.labelrole);
            this.Controls.Add(this.labelsex);
            this.Controls.Add(this.labelpwd);
            this.Controls.Add(this.labelaccount);
            this.Controls.Add(this.label1);
            this.Name = "Form_register";
            this.Text = "Form_register";
            this.Load += new System.EventHandler(this.Form_register_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label labelaccount;
        private System.Windows.Forms.Label labelpwd;
        private System.Windows.Forms.Label labelsex;
        private System.Windows.Forms.Label labelrole;
        private System.Windows.Forms.Label labelname;
        private System.Windows.Forms.Label labelstatus;
        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.TextBox textBox2;
        private System.Windows.Forms.TextBox textBox3;
    }
}