<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ModalPopup.ascx.cs" Inherits="ClinicManagementApp.ModalPopup" %>

 <asp:ScriptManager ID="ScriptManager" runat="server"></asp:ScriptManager>

 <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender" runat="server" TargetControlID="popupButton" OkControlID="okButton" PopupControlID="popupPanel"></ajaxToolkit:ModalPopupExtender>

 <asp:Button ID="popupButton" runat="server" Text="popupButton" CssClass="popupButton"/>

 <asp:Panel ID="popupPanel" runat="server" CssClass="popupPanel">
     <asp:Label ID="popupLabel" runat="server" Text="Something message"></asp:Label>
     <br />
     <asp:Button ID="okButton" runat="server" Text="OK" CssClass="okButton" />
 </asp:Panel>