using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace SQLDataBaseEditor
{
    public partial class Form1 : Form
    {
        MySqlConnection mySqlConnection;
        DataSet dataSet = new DataSet();
        Database database;

        public Form1()
        {
            InitializeComponent();
        }

        private void msiConnectToDatabase_Click(object sender, EventArgs e)
        {
            database = new Database();
            database.InitializeDB();
            database.Connection.StateChange += MySqlConnection_StateChange;
            database.Connection.Open();

        }

        private void MySqlConnection_StateChange(object sender, StateChangeEventArgs e)
        {
            tsslStatus.Text = database.Connection.State.ToString();
        }

        private void readDataToolStripMenuItem_Click(object sender, EventArgs e)
        {
            database.ReadDataToList();
        }

        private void insertDataToolStripMenuItem_Click(object sender, EventArgs e)
        {
            database.InsertData("data1", "data2");
        }
    }
}
