<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="deletePopup.ascx.cs" Inherits="ClinicManagementApp.ModalPopups.deletePopup" %>
<%@ Register Src="~/ModalPopups/alertPopup.ascx" TagName="alertModalPopup" TagPrefix="uc" %>

<ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender" runat="server" TargetControlID="popupButton" PopupControlID="popupPanel" CancelControlID="cancelButton"></ajaxToolkit:ModalPopupExtender>

<asp:Button ID="popupButton" runat="server" Text="popupButton" Style="display: none" />

<asp:Panel ID="popupPanel" runat="server" class="popupPanel">
    <asp:Label ID="popupLabel" runat="server" Text="Are you sure?" class="col-form-label wordWrapingLabel">
    </asp:Label>
    <asp:Button ID="deleteButton" runat="server" Text="Yes, Delete it!" class="btn btn-primary mx-2 mt-4" OnClick="deleteButton_Click" />
    <asp:Button ID="cancelButton" runat="server" Text="Cancel" class="btn btn-primary mx-2 mt-4" />
</asp:Panel>

<uc:alertModalPopup ID="alertPopup" runat="server" />
