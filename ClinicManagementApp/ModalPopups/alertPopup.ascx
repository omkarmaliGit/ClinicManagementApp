<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="alertPopup.ascx.cs" Inherits="ClinicManagementApp.ModalPopups.alertPopup" %>

<ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender" runat="server" TargetControlID="popupButton" OkControlID="okButton" PopupControlID="popupPanel"></ajaxToolkit:ModalPopupExtender>

<asp:Button ID="popupButton" runat="server" Text="popupButton" style="display:none"/>

<asp:Panel ID="popupPanel" runat="server" class="popupPanel">
    <asp:Label ID="popupLabel" runat="server" Text="This is Alert Popup Box!" class="col-form-label wordWrapingLabel"></asp:Label>
    <asp:Button ID="okButton" runat="server" Text="OK" class="btn btn-primary mx-2 mt-4"/>
</asp:Panel>
