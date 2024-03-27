<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Appointment.aspx.cs" Inherits="ClinicManagementApp.Appointment" %>
<%@ Register Src="~/ModalPopups/alertPopup.ascx" TagName="alertModalPopup" TagPrefix="uc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
    <asp:Button ID="Button2" runat="server" Text="Button" OnClick="Button2_Click" />

    <uc:alertModalPopup ID="alertPopup" runat="server" />

</asp:Content>
