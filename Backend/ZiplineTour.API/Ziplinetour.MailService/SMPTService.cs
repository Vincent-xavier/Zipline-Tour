using System.Net.Mail;
using System.Net;
using ZiplineTour.FrameWork.Helper;

namespace Ziplinetour.MailService
{
    public class SMPTService
    {
        public static ConfigSettings Settings = new ConfigSettings();

        public SMPTService()
        {
            Settings = LoadData();
        }

        /// <summary>
        /// To get the Value from json files
        /// </summary>
        /// <returns></returns>
        private static ConfigSettings LoadData()
        {
            ConfigSettingsService obj = new ConfigSettingsService();
            return obj.Settings;
        }

        public static string FormatMailContent(string MailContent)
        {
            Settings = LoadData();

            string SendMailContent = string.Empty;
            string LoginURL = Settings.SMTPMailConfig.LoginURL;
            string ContactMailId = Settings.SMTPMailConfig.ContactUsMailId;
            string ProductLogo = "Template/EmailLogo/ProductLogo.png";
            string ApplicationLogo = "Template/EmailLogo/ApplicationLogo.png";

            SendMailContent = @"<div style=""color: #000; font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; text-rendering: optimizelegibility; line-height: 1.629;    background: linear-gradient(90deg, rgb(180, 208, 224) 0%, rgb(221, 238, 255) 100%); box-shadow: inset 0 0 20px #82b3cf;padding: 1rem 2rem 2rem;"">
		<div style=""text-align:center""><img src=" + ApplicationLogo + @" alt=""Logo"" style=""max-width:200px;margin-bottom:1rem"" /></div>
		<!--<h4 style=""text-align: center;font-weight: bold;font-size: 1.2rem;color:#000""></h4>-->
		<div style=""background-color:#fff;padding: 2rem;"">";
            //MailContent = MailContent.Replace("URL", @"<a title='Click here to login'  target='_blank' style='border-radius: 3px; font-size: 12px; line-height: 1.5; padding: 5px 10px; background-color: #1ca59e; border-color: #1ca59e; color: #ffffff; text-decoration: none; '
            //                                href='" + LoginURL + "/'>Login Now</a>");

            SendMailContent += MailContent + @"</p><p style=""margin-top:2rem;border-top:solid 1px #808080""><span style=""text-transform: uppercase; font-family: Verdana, Arial, Helvetica, sans-serif; color: black; font-size: 10pt; "">DISCLAIMER</span><br /><span style=""color: black; line-height: 12.26px; font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 8pt"">Please do not respond directly to this e-mail. The originating e-mail account is not monitored.<br /> If you have any questions please feel free to contact us via <a href=""mailto:info@dwtc.com"" target=""_blank""><span><b><span mailto:style=""font-size:9.0pt;font-family:Verdana, Arial, Helvetica, sans-serif;color:#604a7b"">info@dwtc.com</span></b></span><span></span></a></span></p>
			<img src=" + ProductLogo + @" alt = ""Logo"" style = ""max-width:200px;margin-bottom:1rem""/></div></div>";
            return SendMailContent;
        }

        /// <summary>
        /// This is to send mail with content given
        /// </summary>
        /// <param name="subject"></param>
        /// <param name="content"></param>
        /// <param name="toAddress"></param>
        /// <param name="displayName"></param>
        public static bool SendMail(string MailSubject, string MailContent, string ToAddress, string? CCAddress = null, string? AttachmentFile = null, string? BCCAddress = null)
        {
            Settings = LoadData();

            int Count = 0;
            bool IsSuccess = false;
            string SendMailFlag = Settings.SMTPMailConfig.SendMailFlag;
            if (SendMailFlag.Equals("1"))
            {
            repeat:
                string DisplayName = Settings.SMTPMailConfig.DisplayName;
                string Username = Settings.SMTPMailConfig.MUserName;
                string Password = Settings.SMTPMailConfig.MPassword;
                string SmtpServer = Settings.SMTPMailConfig.SMTPServer;
                int SmtpPort = Convert.ToInt32(Settings.SMTPMailConfig.SMTPPort);
                string SSL = Settings.SMTPMailConfig.IsSSLEnabled;

                string SendMailContent = string.Empty;
                try
                {
                    // MailMessage mail = new MailMessage(Username, ToAddress, MailSubject, MailContent);
                    MailMessage mail = new MailMessage();
                    if (DisplayName != "")
                    {
                        mail.From = new MailAddress(Username, DisplayName);
                    }
                    else
                    {
                        mail.From = new MailAddress(Username);
                    }

                    //mail.To.Add(ToAddress);
                    if (!string.IsNullOrEmpty(ToAddress))
                    {
                        string[] ccMailAddress = ToAddress.Split(',');
                        foreach (string strccaddress in ccMailAddress)
                        {
                            mail.To.Add(strccaddress);
                        }
                    }
                    mail.Subject = MailSubject;
                    mail.BodyEncoding = System.Text.Encoding.GetEncoding("utf-8");
                    mail.IsBodyHtml = true;
                    if (MailContent != null)
                    {
                        mail.Body = FormatMailContent(MailContent);
                    }

                    if (!string.IsNullOrEmpty(CCAddress))
                    {
                        string[] ccMailAddress = CCAddress.Split(';');
                        foreach (string strccaddress in ccMailAddress)
                        {
                            mail.CC.Add(strccaddress);
                        }
                    }
                    if (!string.IsNullOrEmpty(BCCAddress))
                    {
                        string[] bccMailAddress = BCCAddress.Split(';');
                        foreach (string strccaddress in bccMailAddress)
                        {
                            mail.Bcc.Add(strccaddress);
                        }
                    }
                    if (!string.IsNullOrEmpty(AttachmentFile))
                    {
                        string[] AttachmentFilesList = AttachmentFile.Split(',');

                        foreach (string _file in AttachmentFilesList)
                        {
                            try
                            {
                                System.Net.Mail.Attachment aAttachment = new System.Net.Mail.Attachment(_file);
                                mail.Attachments.Add(aAttachment);
                            }
                            catch (Exception ex)
                            {
                                new ErrorLog().WriteLog(ex);
                            }
                        }
                    }

                    ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls
                                     | SecurityProtocolType.Tls11
                                     | SecurityProtocolType.Tls12;

                    //Send the message.
                    SmtpClient smtpClient = new SmtpClient(SmtpServer, SmtpPort);
                    System.Net.NetworkCredential netCred = new System.Net.NetworkCredential(Username, Password);
                    smtpClient.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
                    smtpClient.Credentials = netCred;
                    smtpClient.EnableSsl = false;
                    if (SSL == "1")//0 when the mail server is gmail and others ; 1 when the mail server is intranet service
                    {
                        smtpClient.EnableSsl = true;
                    }

                    smtpClient.Send(mail);
                    IsSuccess = true;
                }
                catch (Exception ex)
                {
                    if (Count == 0)
                    {
                        Count++;
                        goto repeat;
                    }
                    else
                    {
                        new ErrorLog().WriteLog(ex);
                    }
                }
            }
            return IsSuccess;
        }
    }
}