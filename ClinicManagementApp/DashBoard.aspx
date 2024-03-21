<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DashBoard.aspx.cs" Inherits="ClinicManagementApp.DashBoard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="dashboardDiv">

        <div class="row">
            
            <div class="pt-4 text-center">
                <h1>Hello Admin, Welcome Back!</h1>
            </div>

            <div class="mb-2 text-center">
                <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/medicalStoreIcon.png" Width="400px"/>
            </div>

        </div>

    </div>

</asp:Content>
