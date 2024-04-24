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

    <div>

        <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender" runat="server" TargetControlID="popupButton" PopupControlID="popupPanel" CancelControlID="cancelButton"></ajaxToolkit:ModalPopupExtender>

        <asp:Button ID="popupButton" runat="server" Text="popupButton" Style="display: none" />

        <asp:Panel ID="popupPanel" runat="server" class="popupPanel w-auto">

            <h4 class="mb-3">Book a Appointment</h4>

            <div id="patientRadioDiv" runat="server">

                <div class="mb-4 row" >

                <asp:Label ID="popupLabel" runat="server" Text="Patient : " class=" col-sm-5 col-form-label">
                </asp:Label>
                <div class="col">
                    <asp:RadioButtonList ID="RadioButtonList_Patient" runat="server" class="mt-2" RepeatDirection="Horizontal" OnSelectedIndexChanged="RadioButtonList_Patient_SelectedIndexChanged">
                        <asp:ListItem Value="New" class="pe-2"> New</asp:ListItem>
                        <asp:ListItem Value="Registered" class=""> Registered</asp:ListItem>
                    </asp:RadioButtonList>
                </div>

                </div>

            </div>

            <div id="newDiv" class="" runat="server" visible="true">

                <div class="mb-1 row">
                    <asp:Label ID="Label_Name" runat="server" Text="" class="col-sm-3 col-form-label">
                        <sup class="red">*</sup>Name : 
                    </asp:Label>
                    <div class="col">
                        <asp:TextBox ID="TextBox_Name" runat="server" type="text" placeholder="Enter Name" class="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator_Name" runat="server" ErrorMessage="Please Enter Name" ControlToValidate="TextBox_Name" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator_Name" runat="server" ErrorMessage="Only Characters Allowed" ControlToValidate="TextBox_Name" ValidationExpression="^[a-zA-Z\s]+$" ForeColor="Red"></asp:RegularExpressionValidator>
                    </div>
                </div>

                <div class="mb-1 row">
                    <asp:Label ID="Label_Doctor" runat="server" Text="&lt;sup class=&quot;red&quot;&gt;*&lt;/sup&gt;Doctor Name : " class="col-sm-4 col-form-label"></asp:Label>
                    <div class="col">
                        <asp:DropDownList ID="DropDownList_Doctor" runat="server" placeholder="Select Doctor Name" class="form-select">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator_Doctor" runat="server" ErrorMessage="Please Select Doctor" ControlToValidate="DropDownList_Doctor" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>

            </div>

            <div id="registeredDiv" class="" runat="server" visible="false">


                <div class="mb-1 row">
                    <asp:Label ID="Label_Registration" runat="server" Text="&lt;sup class=&quot;red&quot;&gt;*&lt;/sup&gt;Registration Number : "
                        class="col-sm-4 col-form-label"></asp:Label>
                    <div class="col">
                        <asp:TextBox ID="TextBox_Registration" runat="server" type="text" placeholder="Enter Registration Number" class="form-control" AutoPostBack="true"></asp:TextBox>
                        <asp:DropDownList ID="DropDownList_Registration" runat="server" placeholder="Select Registration Number" class="form-select" AutoPostBack="true" Visible="false">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator_Registration" runat="server" ErrorMessage="Please Enter Registration Number" ControlToValidate="TextBox_Registration" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>


                <div class="mb-1 row">
                    <asp:Label ID="Label1" runat="server" Text="&lt;sup class=&quot;red&quot;&gt;*&lt;/sup&gt;Doctor Name : " class="col-sm-4 col-form-label"></asp:Label>
                    <div class="col">
                        <asp:DropDownList ID="DropDownList1" runat="server" placeholder="Select Doctor Name" class="form-select">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Select Doctor" ControlToValidate="DropDownList_Doctor" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>

            </div>

            <div class="mb-1 row">
                <asp:Button ID="bookButton" runat="server" Text="Book Appointment" class="btn btn-primary mx-2 mt-4 col" />
                <asp:Button ID="cancelButton" runat="server" Text="Cancel" class="btn btn-primary mx-2 mt-4 col" />
            </div>
        </asp:Panel>

    </div>

    <uc:alertModalPopup ID="alertPopup" runat="server" />

</asp:Content>
