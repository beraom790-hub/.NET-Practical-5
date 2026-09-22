<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Practical_5.Home" %>

<!DOCTYPE html>

<html>
<head runat="server">

    <title>Academic Calendar & Leave Management</title>

    <style>

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: "Segoe UI", Arial, sans-serif;
            background:
                radial-gradient(circle at top left, #dbeafe 0%, transparent 35%),
                radial-gradient(circle at bottom right, #e0e7ff 0%, transparent 35%),
                linear-gradient(135deg, #f8fafc, #eef2ff);

            color: #1e293b;
            min-height: 100vh;
        }

        /* ================= MAIN CONTAINER ================= */

        .container {
            width: 92%;
            max-width: 1200px;
            margin: 35px auto;
        }

        /* ================= HEADER ================= */

        .header {
            background: linear-gradient(135deg, #1e3a8a, #2563eb);
            color: white;
            padding: 30px 25px;
            border-radius: 20px;
            text-align: center;
            box-shadow: 0 15px 35px rgba(30, 58, 138, 0.25);
            position: relative;
            overflow: hidden;
            margin-bottom: 25px;
        }

        .header::before {
            content: "";
            position: absolute;
            width: 260px;
            height: 260px;
            background: rgba(255,255,255,0.08);
            border-radius: 50%;
            top: -150px;
            right: -80px;
        }

        .header::after {
            content: "";
            position: absolute;
            width: 200px;
            height: 200px;
            background: rgba(255,255,255,0.06);
            border-radius: 50%;
            bottom: -120px;
            left: -60px;
        }

        .header h1 {
            position: relative;
            z-index: 2;
            font-size: 30px;
            font-weight: 700;
            letter-spacing: 0.5px;
            margin-bottom: 8px;
        }

        .welcome {
            position: relative;
            z-index: 2;
            font-size: 15px;
            color: #dbeafe;
        }

        /* ================= ROW ================= */

        .row {
            display: flex;
            gap: 25px;
            align-items: stretch;
        }

        /* ================= CARD ================= */

        .card {
            background: rgba(255,255,255,0.96);
            padding: 28px;
            border-radius: 18px;
            box-shadow: 0 10px 30px rgba(15,23,42,0.08);
            border: 1px solid #e2e8f0;
            flex: 1;
            transition: all 0.3s ease;
        }

        .card:hover {
            transform: translateY(-3px);
            box-shadow: 0 15px 35px rgba(15,23,42,0.12);
        }

        .card h2 {
            margin-top: 0;
            margin-bottom: 22px;
            color: #1e3a8a;
            font-size: 21px;
            font-weight: 700;
            padding-bottom: 12px;
            border-bottom: 2px solid #e2e8f0;
        }

        /* ================= CALENDAR ================= */

        .calendar-box {
            min-height: 360px;
        }

        .calendar-box table {
            width: 100%;
            border-collapse: collapse;
        }

        .calendar-box td,
        .calendar-box th {
            padding: 9px;
            text-align: center;
        }

        .calendar-box a {
            color: #2563eb;
            text-decoration: none;
            font-weight: 600;
        }

        .calendar-box a:hover {
            color: #1e3a8a;
        }

        /* ================= FORM ================= */

        .form-group {
            margin-bottom: 20px;
        }

        .label {
            display: block;
            font-weight: 600;
            margin-bottom: 8px;
            color: #334155;
            font-size: 14px;
        }

        .input,
        .dropdown,
        .reason {
            width: 100%;
            padding: 13px 14px;
            border: 1px solid #cbd5e1;
            border-radius: 10px;
            font-size: 14px;
            background: #f8fafc;
            color: #1e293b;
            transition: all 0.25s ease;
        }

        .input:hover,
        .dropdown:hover,
        .reason:hover {
            border-color: #93c5fd;
        }

        .input:focus,
        .dropdown:focus,
        .reason:focus {
            outline: none;
            border-color: #2563eb;
            background: #ffffff;
            box-shadow: 0 0 0 4px rgba(37,99,235,0.12);
        }

        .reason {
            resize: vertical;
            min-height: 110px;
        }

        /* ================= BUTTON ================= */

        .btn {
            border: none;
            padding: 13px 25px;
            border-radius: 10px;
            background: linear-gradient(135deg, #1e3a8a, #2563eb);
            color: white;
            font-size: 15px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 7px 18px rgba(37,99,235,0.25);
        }

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 22px rgba(37,99,235,0.35);
            background: linear-gradient(135deg, #172554, #1d4ed8);
        }

        .btn:active {
            transform: translateY(0);
        }

        /* ================= MESSAGE ================= */

        .message {
            display: block;
            margin-top: 18px;
            padding: 12px 15px;
            border-radius: 10px;
            background: #ecfdf5;
            color: #047857;
            border-left: 4px solid #10b981;
            font-size: 14px;
        }

        /* ================= STATUS ================= */

        .status {
            margin-top: 10px;
            padding: 20px;
            background: linear-gradient(135deg, #eff6ff, #f8fafc);
            border-left: 5px solid #2563eb;
            border-radius: 12px;
            line-height: 2;
            color: #334155;
            font-size: 14px;
        }

        /* ================= LOGOUT ================= */

        .logout {
            background: linear-gradient(135deg, #dc2626, #ef4444);
            margin-top: 25px;
            box-shadow: 0 7px 18px rgba(220,38,38,0.22);
        }

        .logout:hover {
            background: linear-gradient(135deg, #991b1b, #dc2626);
            box-shadow: 0 10px 22px rgba(220,38,38,0.30);
        }

        /* ================= FOOTER ================= */

        .footer {
            text-align: center;
            margin-top: 25px;
            padding: 18px;
            color: #64748b;
            font-size: 13px;
        }

        /* ================= RESPONSIVE ================= */

        @media (max-width: 800px) {

            .container {
                width: 94%;
                margin: 20px auto;
            }

            .row {
                flex-direction: column;
            }

            .header {
                padding: 25px 18px;
            }

            .header h1 {
                font-size: 23px;
            }

            .card {
                padding: 22px;
            }
        }

        @media (max-width: 500px) {

            .container {
                width: 95%;
            }

            .header h1 {
                font-size: 20px;
            }

            .welcome {
                font-size: 13px;
            }

            .card h2 {
                font-size: 18px;
            }

            .btn {
                width: 100%;
            }
        }

    </style>

</head>

<body>

<form id="form1" runat="server">

<div class="container">

    <!-- ================= HEADER ================= -->

    <div class="header">

        <h1>
            📚 Academic Calendar & Leave Management
        </h1>

        <asp:Label
            ID="lblWelcome"
            runat="server"
            CssClass="welcome">
        </asp:Label>

    </div>


    <!-- ================= MAIN ROW ================= -->

    <div class="row">

        <!-- ================= CALENDAR CARD ================= -->

        <div class="card calendar-box">

            <h2>
                📅 Academic Calendar
            </h2>

            <asp:Calendar
                ID="AcademicCalendar"
                runat="server"
                OnSelectionChanged="AcademicCalendar_SelectionChanged">
            </asp:Calendar>

            <br />

            <asp:Label
                ID="lblDate"
                runat="server">
            </asp:Label>

        </div>


        <!-- ================= LEAVE CARD ================= -->

        <div class="card">

            <h2>
                📝 Leave Management
            </h2>


            <!-- Leave Type -->

            <div class="form-group">

                <asp:Label
                    ID="lblLeaveType"
                    runat="server"
                    Text="Leave Type"
                    CssClass="label">
                </asp:Label>


                <asp:DropDownList
                    ID="ddlLeaveType"
                    runat="server"
                    CssClass="dropdown">

                    <asp:ListItem>
                        Medical Leave
                    </asp:ListItem>

                    <asp:ListItem>
                        Casual Leave
                    </asp:ListItem>

                    <asp:ListItem>
                        Personal Leave
                    </asp:ListItem>

                </asp:DropDownList>

            </div>


            <!-- Leave Date -->

            <div class="form-group">

                <asp:Label
                    ID="lblLeaveDate"
                    runat="server"
                    Text="Leave Date"
                    CssClass="label">
                </asp:Label>


                <asp:TextBox
                    ID="txtLeaveDate"
                    runat="server"
                    CssClass="input">
                </asp:TextBox>

            </div>


            <!-- Reason -->

            <div class="form-group">

                <asp:Label
                    ID="lblReason"
                    runat="server"
                    Text="Reason"
                    CssClass="label">
                </asp:Label>


                <asp:TextBox
                    ID="txtReason"
                    runat="server"
                    CssClass="reason"
                    TextMode="MultiLine"
                    Rows="4">
                </asp:TextBox>

            </div>


            <!-- Apply Button -->

            <asp:Button
                ID="btnApply"
                runat="server"
                Text="Apply Leave"
                CssClass="btn"
                OnClick="btnApply_Click">
            </asp:Button>


            <!-- Message -->

            <asp:Label
                ID="lblMessage"
                runat="server"
                CssClass="message">
            </asp:Label>

        </div>

    </div>


    <!-- ================= STATUS ================= -->

    <div class="card" style="margin-top:25px;">

        <h2>
            📊 Leave Status
        </h2>

        <div class="status">

            <asp:Label
                ID="lblStatus"
                runat="server">
            </asp:Label>

        </div>

    </div>


    <!-- ================= LOGOUT ================= -->

    <div style="text-align:center;">

        <asp:Button
            ID="btnLogout"
            runat="server"
            Text="Logout"
            CssClass="btn logout"
            OnClick="btnLogout_Click">
        </asp:Button>

    </div>


    <!-- ================= FOOTER ================= -->

    <div class="footer">

        Academic Calendar & Leave Management System © 2026

    </div>

</div>

</form>

</body>

</html>