using System;

namespace AcademicLeave
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(
            object sender,
            EventArgs e)
        {
            // Execute only when page loads for the first time
            if (!IsPostBack)
            {
                // Check whether Username cookie exists
                if (Request.Cookies["Username"] != null)
                {
                    // Load saved username
                    txtUsername.Text =
                        Request.Cookies["Username"].Value;
                }
            }
        }


        // Login button event
        protected void btnLogin_Click(
            object sender,
            EventArgs e)
        {
            // Check username and password
            if (txtUsername.Text == "Kanbi" &&
                txtPassword.Text == "Kanbi@123")
            {
                // Create Username Session
                Session["Username"] =
                    txtUsername.Text;


                // Check Remember Username
                if (chkRemember.Checked)
                {
                    // Save username in Cookie
                    Response.Cookies["Username"].Value =
                        txtUsername.Text;


                    // Cookie will expire after 7 days
                    Response.Cookies["Username"].Expires =
                        DateTime.Now.AddDays(7);
                }


                // Redirect to Home page
                Response.Redirect("Home.aspx");
            }

            else
            {
                // Display invalid login message
                lblMessage.Text =
                    "Invalid Username or Password";
            }
        }
    }
}