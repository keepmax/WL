namespace SqlWinformDay01
{
    partial class Form_IndexPage
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
            this.label1 = new System.Windows.Forms.Label();
            this.bookManagebtn = new System.Windows.Forms.Button();
            this.label2 = new System.Windows.Forms.Label();
            this.timer_Index = new System.Windows.Forms.Timer(this.components);
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(92, 61);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(134, 18);
            this.label1.TabIndex = 0;
            this.label1.Text = ",欢迎使用系统,";
            // 
            // bookManagebtn
            // 
            this.bookManagebtn.Location = new System.Drawing.Point(95, 140);
            this.bookManagebtn.Name = "bookManagebtn";
            this.bookManagebtn.Size = new System.Drawing.Size(197, 80);
            this.bookManagebtn.TabIndex = 1;
            this.bookManagebtn.Text = "图书信息管理";
            this.bookManagebtn.UseVisualStyleBackColor = true;
            this.bookManagebtn.Click += new System.EventHandler(this.bookManagebtn_Click);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(92, 659);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(44, 18);
            this.label2.TabIndex = 2;
            this.label2.Text = "Time";
            // 
            // timer_Index
            // 
            this.timer_Index.Interval = 1000;
            this.timer_Index.Tick += new System.EventHandler(this.timer_Index_Tick);
            // 
            // Form_IndexPage
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 18F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1549, 868);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.bookManagebtn);
            this.Controls.Add(this.label1);
            this.Name = "Form_IndexPage";
            this.Text = "Form_IndexPage";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.Form_IndexPage_FormClosing);
            this.Load += new System.EventHandler(this.Form_IndexPage_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button bookManagebtn;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Timer timer_Index;
    }
}