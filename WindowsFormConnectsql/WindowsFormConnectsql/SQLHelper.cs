using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WindowsFormConnectsql
{
    public class SQLHelper
    {
        //连接字符串
        private static string connString = @"server=.;uid=sa;pwd=sa;database=StudentDB";

        //1.打开一个连接，返回连接对象
        public static SqlConnection OpenConnection()
        {
            SqlConnection conection = new SqlConnection(connString);
            conection.Open();
            return conection;
        }

        //2.获取一个Command对象 : 目前有两个重载的方法
        public static SqlCommand CreateCommand(SqlConnection conn, string commandText, SqlParameter[] sqlParameters, bool isProc = false)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            if (sqlParameters.Length != 0)
            {
                cmd.Parameters.AddRange(sqlParameters);
            }
            if (isProc == true)
            {
                cmd.CommandType = CommandType.StoredProcedure;
            }
            return cmd;
        }

        public static SqlCommand CreateCommand(SqlConnection conn, string commandText, bool isProc = false)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            if (isProc == true)
            {
                cmd.CommandType = CommandType.StoredProcedure;
            }
            return cmd;
        }

        //3.获取DataReader的封装：有两个重载的函数
        public static SqlDataReader GetDataReader(SqlConnection conn, string commandText, bool isProc = false)
        {
            SqlCommand cmd = CreateCommand(conn, commandText, isProc);
            //当关闭sdr的时候，就自动关闭连接对象
            SqlDataReader sdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            return sdr;
        }

        public static SqlDataReader GetDataReader(SqlConnection conn, string commandText, SqlParameter[] sqlParameters, bool isProc = false)
        {
            SqlCommand cmd = CreateCommand(conn, commandText, sqlParameters, isProc);
            //当关闭sdr的时候，就自动关闭连接对象
            SqlDataReader sdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            return sdr;
        }

        //4.ExecuteNonQuery的封装 : 两个重载函数
        public static int GetExecuteNonQuery(SqlConnection conn, string commandText, SqlParameter[] sqlParameters, bool isProc = false)
        {
            SqlCommand cmd = CreateCommand(conn, commandText, sqlParameters, isProc);
            return cmd.ExecuteNonQuery();
        }

        public static int GetExecuteNonQuery(SqlConnection conn, string commandText, bool isProc = false)
        {
            SqlCommand cmd = CreateCommand(conn, commandText, isProc);
            return cmd.ExecuteNonQuery();
        }

        //5.ExecuteScalar封装 : 两个重载函数
        public static object GetExecuteScalar(SqlConnection conn, string commandText, SqlParameter[] sqlParameters, bool isProc = false)
        {
            SqlCommand cmd = CreateCommand(conn, commandText, sqlParameters, isProc);
            return cmd.ExecuteScalar();
        }

        public static object GetExecuteScalar(SqlConnection conn, string commandText, bool isProc = false)
        {
            SqlCommand cmd = CreateCommand(conn, commandText, isProc);
            return cmd.ExecuteScalar();
        }

        //6.关闭连接的方法
        public static void CloseConnection(SqlConnection conn)
        {
            if (conn != null && conn.State != ConnectionState.Closed)
            {
                conn.Close();
                conn.Dispose();
            }
        }
    }
}