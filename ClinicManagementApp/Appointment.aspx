<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Appointment.aspx.cs" Inherits="ClinicManagementApp.Appointment" %>

<%@ Register Src="~/ModalPopups/deletePopup.ascx" TagName="alertModalPopup" TagPrefix="uc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <asp:ScriptManager ID="ScriptManagerVisit" runat="server"></asp:ScriptManager>

    <div class="container pt-3">

        <asp:Table ID="AppointmentTable" runat="server" CssClass="table table-active">
        </asp:Table>

    </div>

    <uc:alertModalPopup ID="alertPopup" runat="server" />

</asp:Content>
