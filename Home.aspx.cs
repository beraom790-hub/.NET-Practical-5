using System;

namespace Practical_5
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check whether user is logged in
            if (Session["Username"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            // Execute only when page loads for the first time
            if (!IsPostBack)
            {
                // Display username
                lblWelcome.Text =
                    "Welcome, " + Session["Username"].ToString();

                // Initial leave status
                lblStatus.Text =
                    "No leave applied yet.";
            }
        }


        // Calendar date selection event
        protected void AcademicCalendar_SelectionChanged(
            object sender,
            EventArgs e)
        {
            // Put selected calendar date into Leave Date textbox
            txtLeaveDate.Text =
                AcademicCalendar.SelectedDate.ToShortDateString();

            // Display selected date
            lblDate.Text =
                "Selected Date: " +
                AcademicCalendar.SelectedDate.ToShortDateString();
        }


        // Apply Leave button event
        protected void btnApply_Click(
            object sender,
            EventArgs e)
        {
            // Check whether date and reason are entered
            if (txtLeaveDate.Text == "" ||
                txtReason.Text == "")
            {
                lblMessage.Text =
                    "Please select date and enter reason.";

                return;
            }


            // Store Leave Type in Session
            Session["LeaveType"] =
                ddlLeaveType.SelectedValue;


            // Store Leave Date in Session
            Session["LeaveDate"] =
                txtLeaveDate.Text;


            // Store Reason in Session
            Session["Reason"] =
                txtReason.Text;


            // Set Leave Status
            Session["LeaveStatus"] =
                "Pending";


            // Display success message
            lblMessage.Text =
                "Leave applied successfully.";


            // Display leave status
            lblStatus.Text =
                "Leave Type: " +
                Session["LeaveType"] +
                "<br/>Leave Date: " +
                Session["LeaveDate"] +
                "<br/>Reason: " +
                Session["Reason"] +
                "<br/>Status: " +
                Session["LeaveStatus"];
        }


        // Logout button event
        protected void btnLogout_Click(
            object sender,
            EventArgs e)
        {
            // Clear current session
            Session.Clear();

            // Redirect to login page
            Response.Redirect("Login.aspx");
        }
    }
}