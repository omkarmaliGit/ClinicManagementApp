<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Appointment.aspx.cs" Inherits="ClinicManagementApp.Appointment" %>

<%@ Register Src="~/ModalPopup.ascx" TagName="ModalPopup" TagPrefix="uc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click"/>
    <uc:ModalPopup ID="ModalPopup1" runat="server" Text="Button5656" />

</asp:Content>
