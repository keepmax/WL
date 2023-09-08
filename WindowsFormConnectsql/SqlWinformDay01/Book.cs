using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;

namespace SqlWinformDay01
{
    public class Book : INotifyPropertyChanged
    {
        public event PropertyChangedEventHandler PropertyChanged;

        private string _bookid;
        private string _bookname;
        private string _bookType;
        private decimal _unit_price;
        private int _amount;
        private DateTime _indate;
        private string _img;

        public string bookid
        {
            get
            {
                return _bookid;
            }
            set
            {
                _bookid = value;
                NotifyPropertyChanged("bookid");
            }
        }

        public string bookname
        {
            get
            {
                return _bookname;
            }
            set
            {
                _bookname = value;
                NotifyPropertyChanged("bookname");
            }
        }

        public string bookType
        {
            get
            {
                return _bookType;
            }
            set
            {
                _bookType = value;
                NotifyPropertyChanged("bookType");
            }
        }

        public decimal unit_price
        {
            get
            {
                return _unit_price;
            }
            set
            {
                _unit_price = value;
                NotifyPropertyChanged("unit_price");
            }
        }

        public int amount
        {
            get
            {
                return _amount;
            }
            set
            {
                _amount = value;
                NotifyPropertyChanged("amount");
            }
        }

        public DateTime indate
        {
            get
            {
                return _indate;
            }
            set
            {
                _indate = value;
                NotifyPropertyChanged("indate");
            }
        }

        public string img
        {
            get
            {
                return _img;
            }
            set
            {
                _img = value;
                NotifyPropertyChanged("img");
            }
        }
        private void NotifyPropertyChanged([CallerMemberName] String propertyName = "")
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
}
}
