namespace SqlWinformDay01
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
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            this.idBox = new System.Windows.Forms.TextBox();
            this.pwdBox = new System.Windows.Forms.TextBox();
            this.nameBox = new System.Windows.Forms.TextBox();
            this.button1 = new System.Windows.Forms.Button();
            this.backgroundWorker1 = new System.ComponentModel.BackgroundWorker();
            this.radioButton1 = new System.Windows.Forms.RadioButton();
            this.radioButton2 = new System.Windows.Forms.RadioButton();
            this.radioButton3 = new System.Windows.Forms.RadioButton();
            this.radioButton4 = new System.Windows.Forms.RadioButton();
            this.radioButtonAm = new System.Windows.Forms.RadioButton();
            this.radioButtonTe = new System.Windows.Forms.RadioButton();
            this.radioButtonStu = new System.Windows.Forms.RadioButton();
            this.radioButtonEmp = new System.Windows.Forms.RadioButton();
            this.panelrole = new System.Windows.Forms.Panel();
            this.panelstatus = new System.Windows.Forms.Panel();
            this.panelsex = new System.Windows.Forms.Panel();
            this.label8 = new System.Windows.Forms.Label();
            this.label9 = new System.Windows.Forms.Label();
            this.label10 = new System.Windows.Forms.Label();
            this.button2 = new System.Windows.Forms.Button();
            this.panelrole.SuspendLayout();
            this.panelstatus.SuspendLayout();
            this.panelsex.SuspendLayout();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(468, 74);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(98, 18);
            this.label1.TabIndex = 0;
            this.label1.Text = "注册新用户";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(288, 161);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(44, 18);
            this.label2.TabIndex = 1;
            this.label2.Text = "账号";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(288, 226);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(44, 18);
            this.label3.TabIndex = 2;
            this.label3.Text = "密码";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(291, 291);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(44, 18);
            this.label4.TabIndex = 3;
            this.label4.Text = "姓名";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(288, 360);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(44, 18);
            this.label5.TabIndex = 4;
            this.label5.Text = "性别";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(288, 423);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(44, 18);
            this.label6.TabIndex = 5;
            this.label6.Text = "状态";
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(288, 486);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(44, 18);
            this.label7.TabIndex = 6;
            this.label7.Text = "角色";
            // 
            // idBox
            // 
            this.idBox.Location = new System.Drawing.Point(408, 158);
            this.idBox.MaxLength = 15;
            this.idBox.Name = "idBox";
            this.idBox.Size = new System.Drawing.Size(179, 28);
            this.idBox.TabIndex = 7;
            this.idBox.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.idBox_KeyPress);
            // 
            // pwdBox
            // 
            this.pwdBox.Location = new System.Drawing.Point(408, 223);
            this.pwdBox.MaxLength = 15;
            this.pwdBox.Name = "pwdBox";
            this.pwdBox.Size = new System.Drawing.Size(179, 28);
            this.pwdBox.TabIndex = 8;
            this.pwdBox.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.pwdBox_KeyPress);
            // 
            // nameBox
            // 
            this.nameBox.Location = new System.Drawing.Point(408, 288);
            this.nameBox.MaxLength = 15;
            this.nameBox.Name = "nameBox";
            this.nameBox.Size = new System.Drawing.Size(179, 28);
            this.nameBox.TabIndex = 9;
            this.nameBox.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.nameBox_KeyPress);
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(408, 530);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(158, 44);
            this.button1.TabIndex = 10;
            this.button1.Text = "提交";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // radioButton1
            // 
            this.radioButton1.AutoSize = true;
            this.radioButton1.Checked = true;
            this.radioButton1.Location = new System.Drawing.Point(29, 17);
            this.radioButton1.Name = "radioButton1";
            this.radioButton1.Size = new System.Drawing.Size(51, 22);
            this.radioButton1.TabIndex = 11;
            this.radioButton1.TabStop = true;
            this.radioButton1.Text = "男";
            this.radioButton1.UseVisualStyleBackColor = true;
            // 
            // radioButton2
            // 
            this.radioButton2.AutoSize = true;
            this.radioButton2.Location = new System.Drawing.Point(161, 17);
            this.radioButton2.Name = "radioButton2";
            this.radioButton2.Size = new System.Drawing.Size(51, 22);
            this.radioButton2.TabIndex = 12;
            this.radioButton2.TabStop = true;
            this.radioButton2.Text = "女";
            this.radioButton2.UseVisualStyleBackColor = true;
            // 
            // radioButton3
            // 
            this.radioButton3.AutoSize = true;
            this.radioButton3.Checked = true;
            this.radioButton3.Location = new System.Drawing.Point(22, 7);
            this.radioButton3.Name = "radioButton3";
            this.radioButton3.Size = new System.Drawing.Size(69, 22);
            this.radioButton3.TabIndex = 13;
            this.radioButton3.TabStop = true;
            this.radioButton3.Text = "正常";
            this.radioButton3.UseVisualStyleBackColor = true;
            // 
            // radioButton4
            // 
            this.radioButton4.AutoSize = true;
            this.radioButton4.Location = new System.Drawing.Point(134, 7);
            this.radioButton4.Name = "radioButton4";
            this.radioButton4.Size = new System.Drawing.Size(69, 22);
            this.radioButton4.TabIndex = 14;
            this.radioButton4.TabStop = true;
            this.radioButton4.Text = "冻结";
            this.radioButton4.UseVisualStyleBackColor = true;
            // 
            // radioButtonAm
            // 
            this.radioButtonAm.AutoSize = true;
            this.radioButtonAm.Location = new System.Drawing.Point(16, 19);
            this.radioButtonAm.Name = "radioButtonAm";
            this.radioButtonAm.Size = new System.Drawing.Size(87, 22);
            this.radioButtonAm.TabIndex = 0;
            this.radioButtonAm.TabStop = true;
            this.radioButtonAm.Text = "管理员";
            this.radioButtonAm.UseVisualStyleBackColor = true;
            // 
            // radioButtonTe
            // 
            this.radioButtonTe.AutoSize = true;
            this.radioButtonTe.Location = new System.Drawing.Point(109, 19);
            this.radioButtonTe.Name = "radioButtonTe";
            this.radioButtonTe.Size = new System.Drawing.Size(69, 22);
            this.radioButtonTe.TabIndex = 1;
            this.radioButtonTe.TabStop = true;
            this.radioButtonTe.Text = "教师";
            this.radioButtonTe.UseVisualStyleBackColor = true;
            // 
            // radioButtonStu
            // 
            this.radioButtonStu.AutoSize = true;
            this.radioButtonStu.Checked = true;
            this.radioButtonStu.Location = new System.Drawing.Point(184, 19);
            this.radioButtonStu.Name = "radioButtonStu";
            this.radioButtonStu.Size = new System.Drawing.Size(69, 22);
            this.radioButtonStu.TabIndex = 2;
            this.radioButtonStu.TabStop = true;
            this.radioButtonStu.Text = "学生";
            this.radioButtonStu.UseVisualStyleBackColor = true;
            // 
            // radioButtonEmp
            // 
            this.radioButtonEmp.AutoSize = true;
            this.radioButtonEmp.Location = new System.Drawing.Point(259, 19);
            this.radioButtonEmp.Name = "radioButtonEmp";
            this.radioButtonEmp.Size = new System.Drawing.Size(105, 22);
            this.radioButtonEmp.TabIndex = 3;
            this.radioButtonEmp.TabStop = true;
            this.radioButtonEmp.Text = "工作人员";
            this.radioButtonEmp.UseVisualStyleBackColor = true;
            // 
            // panelrole
            // 
            this.panelrole.Controls.Add(this.radioButtonEmp);
            this.panelrole.Controls.Add(this.radioButtonAm);
            this.panelrole.Controls.Add(this.radioButtonStu);
            this.panelrole.Controls.Add(this.radioButtonTe);
            this.panelrole.Location = new System.Drawing.Point(362, 466);
            this.panelrole.Name = "panelrole";
            this.panelrole.Size = new System.Drawing.Size(388, 49);
            this.panelrole.TabIndex = 18;
            // 
            // panelstatus
            // 
            this.panelstatus.Controls.Add(this.radioButton4);
            this.panelstatus.Controls.Add(this.radioButton3);
            this.panelstatus.Location = new System.Drawing.Point(362, 414);
            this.panelstatus.Name = "panelstatus";
            this.panelstatus.Size = new System.Drawing.Size(327, 32);
            this.panelstatus.TabIndex = 19;
            // 
            // panelsex
            // 
            this.panelsex.Controls.Add(this.radioButton2);
            this.panelsex.Controls.Add(this.radioButton1);
            this.panelsex.Location = new System.Drawing.Point(354, 348);
            this.panelsex.Name = "panelsex";
            this.panelsex.Size = new System.Drawing.Size(331, 51);
            this.panelsex.TabIndex = 20;
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(683, 161);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(233, 18);
            this.label8.TabIndex = 21;
            this.label8.Text = "用户名重复，请再想一个八~";
            this.label8.Visible = false;
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Location = new System.Drawing.Point(686, 225);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(152, 18);
            this.label9.TabIndex = 22;
            this.label9.Text = "重复，再想一个八";
            this.label9.Visible = false;
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Location = new System.Drawing.Point(686, 291);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(152, 18);
            this.label10.TabIndex = 23;
            this.label10.Text = "重复，再想一个吧";
            this.label10.Visible = false;
            // 
            // button2
            // 
            this.button2.Location = new System.Drawing.Point(621, 530);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(163, 44);
            this.button2.TabIndex = 24;
            this.button2.Text = "关闭";
            this.button2.UseVisualStyleBackColor = true;
            this.button2.Click += new System.EventHandler(this.button2_Click);
            // 
            // Form_register
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 18F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1416, 785);
            this.Controls.Add(this.button2);
            this.Controls.Add(this.label10);
            this.Controls.Add(this.label9);
            this.Controls.Add(this.label8);
            this.Controls.Add(this.panelsex);
            this.Controls.Add(this.panelstatus);
            this.Controls.Add(this.panelrole);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.nameBox);
            this.Controls.Add(this.pwdBox);
            this.Controls.Add(this.idBox);
            this.Controls.Add(this.label7);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Name = "Form_register";
            this.Text = "Form_register";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.Form_register_FormClosing);
            this.Load += new System.EventHandler(this.Form_register_Load);
            this.panelrole.ResumeLayout(false);
            this.panelrole.PerformLayout();
            this.panelstatus.ResumeLayout(false);
            this.panelstatus.PerformLayout();
            this.panelsex.ResumeLayout(false);
            this.panelsex.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.TextBox idBox;
        private System.Windows.Forms.TextBox pwdBox;
        private System.Windows.Forms.TextBox nameBox;
        private System.Windows.Forms.Button button1;
        private System.ComponentModel.BackgroundWorker backgroundWorker1;
        private System.Windows.Forms.RadioButton radioButton1;
        private System.Windows.Forms.RadioButton radioButton2;
        private System.Windows.Forms.RadioButton radioButton3;
        private System.Windows.Forms.RadioButton radioButton4;
        private System.Windows.Forms.RadioButton radioButtonAm;
        private System.Windows.Forms.RadioButton radioButtonTe;
        private System.Windows.Forms.RadioButton radioButtonEmp;
        private System.Windows.Forms.RadioButton radioButtonStu;
        private System.Windows.Forms.Panel panelrole;
        private System.Windows.Forms.Panel panelstatus;
        private System.Windows.Forms.Panel panelsex;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.Button button2;
    }
}