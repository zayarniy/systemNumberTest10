using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyDatabase;

namespace systemNumberTest10
{
    public partial class main : System.Web.UI.Page
    {
        //string path = HttpRuntime.AppDomainAppPath;
        //string filename = HttpRuntime.AppDomainAppPath + "\\results.csv";


        protected void Page_Load(object sender, EventArgs e)
        {
            //try
            //{
            //    if (File.Exists(filename))
            //    {
            //        string[] strs = File.ReadAllLines(filename);
            //        int count = strs.Length/2; //Если дублируем инфу в двух кодировках
            //        string str = strs.LastOrDefault();
            //        var res = str.Split(';');
            //        lblStatus.Text = "Count:" + count+" Last:"+res[0];
                        
            //    }
            //}
            //catch
            //{
                
            //}
        }

        //Get HTML
        //    protected override void Render(HtmlTextWriter writer)
        //    {
        //    TextWriter tw = new StringWriter();
        //    HtmlTextWriter htw = new HtmlTextWriter(tw);

        //// render the markup into our surrogate TextWriter
        //base.Render(htw);

        //    // get the captured markup as a string
        //    string pageSource = tw.ToString();

        //    // render the markup into the output stream verbatim
        //    writer.Write(pageSource);
        //        System.Diagnostics.Debug.WriteLine(pageSource);
        //// remove the viewstate field from the captured markup
        ////string viewStateRemoved = Regex.Replace(pageSource,
        ////    "<input type=\"hidden\" name=\"__VIEWSTATE\" id=\"__VIEWSTATE\" value=\".*?\" />",
        ////    "", RegexOptions.IgnoreCase);

        //    }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //ScriptManager.RegisterStartupScript(this, GetType(), "AnyValue", "checkIt()", false);
            //ScriptManager.RegisterStartupScript(this, GetType(), "showalert2", "alert('"+data2.Value+"');", true);

            //Encoding utf8 = Encoding.GetEncoding("UTF-8");
            //Encoding win1251 = Encoding.GetEncoding("Windows-1251");            
            //HttpCookie cookieRes = Request.Cookies["results_zaa"];
            //HttpCookie cookieFIO = Request.Cookies["FIO_zaa"];
           
            if (dataFIO.Value == "")
            {
                //lblStatus.Text = "Имя не задано! Результаты не отправлены";
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert0", "alert('Имя не введено. Данные не сохранены');", true);
                return;
            }
            if (dataResult.Value!="" && dataFIO.Value!="" && dataResult.Value!="")
            {
                //Debug.WriteLine(cookieFIO.Value);
                //Debug.WriteLine(cookieRes.Value);
                //if (!File.Exists(filename)) File.Create(filename);
                try
                {
                    DateTime time = DateTime.Now;
                    string str= time.Year + "/" + time.Month.ToString("D2") + "/" + time.Day.ToString("D2") + " " + time.Hour.ToString("D2") + ":" + time.Minute.ToString("D2") + ":" + time.Second.ToString("D2") + ";" + dataResult.Value.Replace("<br>", ";") + "\r\n";
              //      byte[] utf8Bytes = win1251.GetBytes(str);
              //      byte[] win1251Bytes = Encoding.Convert(utf8, win1251, utf8Bytes);
                    //Console.WriteLine(win1251.GetString(win1251Bytes));
              //      string str2 = win1251.GetString(win1251Bytes);
              //      File.AppendAllText(filename, str);// Encoding.GetEncoding("UTF-8"));
              //      File.AppendAllText(filename, str2);// Encoding.GetEncoding("UTF-8"));
                    MyDatabase.Database database = new Database();
                    database.InitializeDB();                   
                    database.InsertData(dataFIO.Value,str );

                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Данные сохранены');", true);
                }
                catch(Exception ex)
                {
                    
                    //ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Ошибка сохранения данных');", true);
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert1", "alert('"+ex.Message+"');", true);
                    //lblStatus.Text = ex.Message;
                }
                //Encoding.Convert(Encoding)
                #region Send by Email
                //Send by Email
                
                try
                {
                    var fromAddress = new MailAddress("formailsend2015@gmail.com", "Tester MGIMO");
                    var toAddress = new MailAddress("formailsend2015@gmail.com", "Tester MGIMO");
                    const string fromPassword = "whypneva";
                    //Преобазование из Windows-1251 в UTF-8
                    string subject = "Результаты тестирования  ";


                    //byte[] utf8Bytes = win1251.GetBytes(dataFIO.Value);
                    //byte[] utf8Bytes2= win1251.GetBytes(dataResult.Value.Replace("<br>", "\r\n"));
                    //byte[] utf8Bytes3 = win1251.GetBytes(dataTasks.Value.Replace("<br>", "\r\n"));
                    //byte[] win1251Bytes = Encoding.Convert(utf8, win1251, utf8Bytes);
                    //byte[] win1251Bytes2= Encoding.Convert(utf8, win1251, utf8Bytes2);
                    //byte[] win1251Bytes3 = Encoding.Convert(utf8, win1251, utf8Bytes3);
                    //Console.WriteLine(win1251.GetString(win1251Bytes));
                    string fio = dataFIO.Value; //win1251.GetString(win1251Bytes);
                    string body = dataTasks.Value + "\r\n" + dataResult.Value;// win1251.GetString(win1251Bytes3)+"\r\n"+ win1251.GetString(win1251Bytes2);

                    var smtp = new SmtpClient
                    {
                        Host = "smtp.gmail.com",
                        Port = 587,
                        EnableSsl = true,
                        DeliveryMethod = SmtpDeliveryMethod.Network,
                        UseDefaultCredentials = false,
                        Credentials = new NetworkCredential("formailsend2015@gmail.com", fromPassword)
                    };
                    using (var message = new MailMessage(fromAddress, toAddress)
                    {
                        Subject = subject+fio,
                        Body = body

                    })
                    {
                        smtp.Send(message);
                    }


                }
                catch (Exception)
                {

                    //lblStatus.Text = "Ошибка отправки данных по Email";
                    //Debug.WriteLine(ex);
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert2", "alert('Ошибка отправки данных на почту');", true);

                }

                #endregion
                //string text = checkText.InnerHtml;
                //status = 1;
                //Label1.Text = results.Value;
            }
        }
    }
}