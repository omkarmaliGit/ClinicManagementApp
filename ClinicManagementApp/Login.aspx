﻿<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ClinicManagementApp.Login" %>

<%@ Register Src="~/ModalPopups/alertPopup.ascx" TagName="alertModalPopup" TagPrefix="uc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container d-flex justify-content-center align-items-center dashboardDiv">
        <div>
            <asp:ScriptManager ID="ScriptManagerStaff" runat="server"></asp:ScriptManager>

            <div class="mb-3 text-center">
                <asp:Image ID="ImageLogin" runat="server" ImageUrl="~/Images/profile.png" Width="75px" class="pb-4" />
                <h1>Admin Login</h1>
                <br />
            </div>

            <div class="mb-3">
                <%--<asp:Label ID="Label_Username" runat="server" Text="Username : " class="form-label"></asp:Label>--%>
                <asp:TextBox ID="TextBox_LoginID" runat="server" type="text" placeholder="Login ID" class="form-control"></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator_LoginID" runat="server" ErrorMessage="Please Enter Login ID" ControlToValidate="TextBox_LoginID" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator_LoginID" runat="server" ErrorMessage="Please Enter Valid Login ID" ControlToValidate="TextBox_LoginID" ValidationExpression="^[a-zA-Z]+[0-9_]*[a-zA-Z]+$" ForeColor="Red"></asp:RegularExpressionValidator>
            </div>
            <div class="mb-4">
                <%--<asp:Label ID="Label_Password" runat="server" Text="Password : " class="form-label"></asp:Label>--%>
                <asp:TextBox ID="TextBox_Password" runat="server" type="password" placeholder="Password" class="form-control"></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator_Password" runat="server" ErrorMessage="Please Enter Password" ControlToValidate="TextBox_Password" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator_Password" runat="server" ErrorMessage="Please Enter Valid Password" ControlToValidate="TextBox_Password" ValidationExpression="^[a-zA-Z0-9_!@#$%&]{8,12}$" ForeColor="Red"></asp:RegularExpressionValidator>
                <div id="errorMsg" runat="server"></div>
            </div>

            <div class="mb-4 text-center">
                <asp:Button ID="Button_Login" runat="server" Text="Signin" class="btn btn-primary btn-lg" OnClick="Button_Login_Click" />
            </div>

            <uc:alertModalPopup ID="alertPopup" runat="server" />
        </div>
    </div>

</asp:Content>
