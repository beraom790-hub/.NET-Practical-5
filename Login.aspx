<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="AcademicLeave.Login" %>

<!DOCTYPE html>

<html>

<head runat="server">

    <title>Academic Portal Login</title>


    <style>

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }


        /* ================= BODY ================= */

        body {

            font-family: "Segoe UI", Arial, sans-serif;

            min-height: 100vh;

            display: flex;

            justify-content: center;

            align-items: center;

            background:
                radial-gradient(
                    circle at top left,
                    #dbeafe 0%,
                    transparent 35%
                ),

                radial-gradient(
                    circle at bottom right,
                    #e0e7ff 0%,
                    transparent 35%
                ),

                linear-gradient(
                    135deg,
                    #0f172a,
                    #1e3a8a
                );

            padding: 20px;

        }


        /* ================= LOGIN CARD ================= */

        .login-card {

            width: 410px;

            max-width: 100%;

            background: rgba(255,255,255,0.97);

            padding: 40px;

            border-radius: 24px;

            box-shadow:
                0 25px 60px rgba(0,0,0,0.25),
                0 5px 15px rgba(0,0,0,0.08);

            text-align: center;

            border: 1px solid rgba(255,255,255,0.5);

            animation: cardAppear 0.6s ease;

        }


        /* ================= ANIMATION ================= */

        @keyframes cardAppear {

            from {

                opacity: 0;

                transform: translateY(25px);

            }

            to {

                opacity: 1;

                transform: translateY(0);

            }

        }


        /* ================= LOGO ================= */

        .logo {

            width: 75px;

            height: 75px;

            margin: 0 auto 18px;

            border-radius: 20px;

            background:
                linear-gradient(
                    135deg,
                    #1e3a8a,
                    #2563eb
                );

            display: flex;

            align-items: center;

            justify-content: center;

            font-size: 34px;

            box-shadow:
                0 12px 25px rgba(37,99,235,0.30);

            transform: rotate(-2deg);

        }


        /* ================= HEADING ================= */

        h1 {

            margin: 5px 0 8px;

            color: #0f172a;

            font-size: 27px;

            font-weight: 700;

            letter-spacing: -0.5px;

        }


        /* ================= SUBTITLE ================= */

        .subtitle {

            display: block;

            color: #64748b;

            font-size: 14px;

            margin-bottom: 30px;

        }


        /* ================= LABEL ================= */

        .label {

            display: block;

            text-align: left;

            font-weight: 600;

            color: #334155;

            margin-bottom: 8px;

            font-size: 14px;

        }


        /* ================= INPUT ================= */

        .input {

            width: 100%;

            padding: 14px 15px;

            margin-bottom: 20px;

            border: 1px solid #cbd5e1;

            border-radius: 11px;

            font-size: 14px;

            background: #f8fafc;

            color: #0f172a;

            transition: all 0.25s ease;

        }


        .input:hover {

            border-color: #93c5fd;

        }


        .input:focus {

            outline: none;

            border-color: #2563eb;

            background: #ffffff;

            box-shadow:
                0 0 0 4px rgba(37,99,235,0.12);

        }


        .input::placeholder {

            color: #94a3b8;

        }


        /* ================= REMEMBER CHECKBOX ================= */

        .remember {

            display: block;

            text-align: left;

            color: #64748b;

            font-size: 13px;

            margin-bottom: 22px;

        }


        .remember input {

            accent-color: #2563eb;

            margin-right: 5px;

        }


        /* ================= LOGIN BUTTON ================= */

        .login-btn {

            width: 100%;

            padding: 14px;

            border: none;

            border-radius: 11px;

            background:
                linear-gradient(
                    135deg,
                    #1e3a8a,
                    #2563eb
                );

            color: white;

            font-size: 15px;

            font-weight: 700;

            cursor: pointer;

            transition: all 0.3s ease;

            box-shadow:
                0 10px 22px rgba(37,99,235,0.25);

        }


        .login-btn:hover {

            transform: translateY(-2px);

            background:
                linear-gradient(
                    135deg,
                    #172554,
                    #1d4ed8
                );

            box-shadow:
                0 14px 28px rgba(37,99,235,0.35);

        }


        .login-btn:active {

            transform: translateY(0);

        }


        /* ================= ERROR MESSAGE ================= */

        .message {

            display: block;

            margin-top: 18px;

            padding: 11px;

            border-radius: 9px;

            background: #fef2f2;

            color: #dc2626;

            border-left: 4px solid #ef4444;

            font-size: 13px;

        }


        /* ================= FOOTER ================= */

        .footer {

            margin-top: 28px;

            padding-top: 18px;

            border-top: 1px solid #e2e8f0;

            color: #94a3b8;

            font-size: 12px;

            line-height: 1.7;

        }


        /* ================= MOBILE ================= */

        @media (max-width: 500px) {

            body {

                padding: 15px;

            }


            .login-card {

                padding: 30px 22px;

                border-radius: 20px;

            }


            h1 {

                font-size: 23px;

            }


            .logo {

                width: 65px;

                height: 65px;

                font-size: 28px;

            }

        }

    </style>

</head>


<body>


<form id="form1" runat="server">


    <div class="login-card">


        <!-- ================= LOGO ================= -->

        <div class="logo">
            🎓
        </div>


        <!-- ================= TITLE ================= -->

        <h1>
            Academic Portal
        </h1>


        <!-- ================= SUBTITLE ================= -->

        <asp:Label
            ID="lblSubtitle"
            runat="server"
            Text="Academic Calendar & Leave Management"
            CssClass="subtitle">
        </asp:Label>


        <!-- ================= USERNAME ================= -->

        <asp:Label
            ID="lblUsername"
            runat="server"
            Text="Username"
            CssClass="label">
        </asp:Label>


        <asp:TextBox
            ID="txtUsername"
            runat="server"
            CssClass="input"
            placeholder="Enter username">
        </asp:TextBox>


        <!-- ================= PASSWORD ================= -->

        <asp:Label
            ID="lblPassword"
            runat="server"
            Text="Password"
            CssClass="label">
        </asp:Label>


        <asp:TextBox
            ID="txtPassword"
            runat="server"
            TextMode="Password"
            CssClass="input"
            placeholder="Enter password">
        </asp:TextBox>


        <!-- ================= REMEMBER ================= -->

        <asp:CheckBox
            ID="chkRemember"
            runat="server"
            Text=" Remember Username"
            CssClass="remember">
        </asp:CheckBox>


        <!-- ================= LOGIN ================= -->

        <asp:Button
            ID="btnLogin"
            runat="server"
            Text="Login"
            CssClass="login-btn"
            OnClick="btnLogin_Click">
        </asp:Button>

        <!-- ================= MESSAGE ================= -->

        <asp:Label
            ID="lblMessage"
            runat="server"
            CssClass="message">
        </asp:Label>

        <!-- ================= FOOTER ================= -->
        <div class="footer">
            Academic Calendar & Leave Management System
            <br />
            © 2026
        </div>
    </div>
</form>
</body>
</html>