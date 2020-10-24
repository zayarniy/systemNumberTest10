using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyDatabase;

namespace systemNumberTest10
{
    public partial class results : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void get_results_Click1(object sender, EventArgs e)
        {
            if (tbPassword.Text == "329")
            {
                try
                {
                    Database database = new Database();
                    database.InitializeDB();
                    database.ReadDataToList();
                    gridView.DataSource = database.list;
                    gridView.DataBind();
                }
                catch (Exception ex)
                {
                    lblStatus.Text = ex.Message;
                }
            }
            else lblStatus.Text = "Wrong password";
        }
    }
}