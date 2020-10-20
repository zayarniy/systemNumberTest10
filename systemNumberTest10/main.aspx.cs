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

namespace systemNumberTest10
{
    public partial class main : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
           
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

            Encoding utf8 = Encoding.GetEncoding("UTF-8");
            Encoding win1251 = Encoding.GetEncoding("Windows-1251");

            string filename = HttpRuntime.AppDomainAppPath+"\\results.csv";

            HttpCookie cookieRes = Request.Cookies["results_zaa"];
            HttpCookie cookieFIO = Request.Cookies["FIO_zaa"];
            if (cookieFIO.Value == "")
            {
                //lblStatus.Text = "Имя не задано! Результаты не отправлены";
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert0", "alert('Имя не введено. Данные не сохранены');", true);
                return;
            }
            if (cookieRes != null && cookieFIO!=null && cookieFIO.Value!="")
            {
                //Debug.WriteLine(cookieFIO.Value);
                //Debug.WriteLine(cookieRes.Value);
                //if (!File.Exists(filename)) File.Create(filename);
                try
                {
                    DateTime time = DateTime.Now;

                    string str= time.Year + "/" + time.Month + "/" + time.Day + " " + time.Hour + ":" + time.Minute + ":" + time.Second + ";" + cookieRes.Value.Replace("<br>", ";") + "\r\n";
                    byte[] utf8Bytes = win1251.GetBytes(str);
                    byte[] win1251Bytes = Encoding.Convert(utf8, win1251, utf8Bytes);
                    //Console.WriteLine(win1251.GetString(win1251Bytes));
                    string str2 = win1251.GetString(win1251Bytes);
                    File.AppendAllText(filename, str2);// Encoding.GetEncoding("UTF-8"));
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Данные сохранены');", true);
                }
                catch
                {
                    //lblStatus.Text = "Ошибка сохранения данных";
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Ошибка сохранения данных');", true);
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


                    byte[] utf8Bytes = win1251.GetBytes(cookieFIO.Value);
                    byte[] utf8Bytes2= win1251.GetBytes(cookieRes.Value.Replace("<br>", "\r\n"));
                    byte[] win1251Bytes = Encoding.Convert(utf8, win1251, utf8Bytes);
                    byte[] win1251Bytes2= Encoding.Convert(utf8, win1251, utf8Bytes2);
                    //Console.WriteLine(win1251.GetString(win1251Bytes));
                    string fio = win1251.GetString(win1251Bytes);

                    string body = win1251.GetString(win1251Bytes2);

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
                catch (Exception ex)
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