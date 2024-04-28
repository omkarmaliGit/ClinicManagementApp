<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Appointment.aspx.cs" Inherits="ClinicManagementApp.Appointment" %>

<%@ Register Src="~/ModalPopups/alertPopup.ascx" TagName="alertModalPopup" TagPrefix="uc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <asp:ScriptManager ID="ScriptManagerVisit" runat="server"></asp:ScriptManager>

    <div class="container pt-3">

        <asp:Table ID="AppointmentTable" runat="server" CssClass="table">
        </asp:Table>

    </div>

    <div>

        <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender" runat="server" TargetControlID="popupButton" PopupControlID="popupPanel" CancelControlID="cancelButton"></ajaxToolkit:ModalPopupExtender>

        <asp:Button ID="popupButton" runat="server" Text="popupButton" Style="display: none" />

        <asp:Panel ID="popupPanel" runat="server" class="popupPanelAppointment">

            <asp:Panel ID="PanelHeader" runat="server">

                <h3 class="mb-4 text-center">Book Appointment</h3>

            </asp:Panel>

            <asp:Panel ID="PanelBody" runat="server">

                <asp:UpdatePanel ID="UpdatePanel" runat="server">

                    <ContentTemplate>

                        <div id="patientRadioDiv" runat="server">

                            <div class="mb-4 row">
                                <asp:Label ID="popupLabel" runat="server" Text="" class="col-sm-5 col-form-label">
                                    <sup class="red">*</sup>Patient : 
                                </asp:Label>
                                <div class="col">
                                    <asp:RadioButtonList ID="RadioButtonList_Patient" runat="server" class="mt-2" RepeatDirection="Horizontal" AutoPostBack="true" OnSelectedIndexChanged="RadioButtonList_Patient_SelectedIndexChanged">
                                        <asp:ListItem Value="New" class="pe-4" Selected="True"> New</asp:ListItem>
                                        <asp:ListItem Value="Registered" class=""> Registered</asp:ListItem>
                                    </asp:RadioButtonList>
                                </div>
                            </div>

                        </div>


                        <div id="newDiv" class="" runat="server" visible="true">

                            <div class="mb-1 row">
                                <asp:Label ID="Label_Name" runat="server" Text="" class="col-sm-5 col-form-label">
                                    <sup class="red">*</sup>Patient Name : 
                                </asp:Label>
                                <div class="col">
                                    <asp:TextBox ID="TextBox_Name" runat="server" type="text" placeholder="Enter Your Name" class="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator_Name" runat="server" ErrorMessage="Please Enter Name" ControlToValidate="TextBox_Name" ForeColor="Red" ValidationGroup="appFormValidation"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="mb-1 row">
                                <asp:Label ID="Label_DOB" runat="server" Text="
         &lt;sup class=&quot;red&quot;&gt;*&lt;/sup&gt;Date of Birth : 
    "
                                    class="col-sm-5 col-form-label"></asp:Label>
                                <div class="col">
                                    <asp:TextBox ID="TextBox_DOB" runat="server" type="date" placeholder="Enter Date of Birth" class="form-control" TextMode="Date"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator_DOB" runat="server" ErrorMessage="Please Enter DOB" ControlToValidate="TextBox_DOB" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="mb-1 row">
                                <asp:Label ID="Label_BloodGroup" runat="server" Text="
        &lt;sup class=&quot;red&quot;&gt;*&lt;/sup&gt;Blood Group : 
    "
                                    class="col-sm-5 col-form-label"></asp:Label>
                                <div class="col">
                                    <asp:DropDownList ID="DropDownList_BloodGroup" runat="server" placeholder="Select Blood Group" class="form-select">
                                        <asp:ListItem>Select Blood Group</asp:ListItem>
                                        <asp:ListItem>A+</asp:ListItem>
                                        <asp:ListItem>B+</asp:ListItem>
                                        <asp:ListItem>AB+</asp:ListItem>
                                        <asp:ListItem>O+</asp:ListItem>
                                        <asp:ListItem>A-</asp:ListItem>
                                        <asp:ListItem>B-</asp:ListItem>
                                        <asp:ListItem>AB-</asp:ListItem>
                                        <asp:ListItem>O-</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator_BloodGroup" runat="server" ErrorMessage="Select Blood Group" ControlToValidate="DropDownList_BloodGroup" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                        </div>

                        <div id="registeredDiv" class="" runat="server" visible="false">

                            <div class="mb-1 row">
                                <asp:Label ID="Label_Registration" runat="server" Text="&lt;sup class=&quot;red&quot;&gt;*&lt;/sup&gt;Registration Number : "
                                    class="col-sm-5 col-form-label"></asp:Label>
                                <div class="col">
                                    <asp:DropDownList ID="DropDownList_Registration" runat="server" placeholder="Select Registration Number" class="form-select" EnableViewState="true">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator_Registration" runat="server" ErrorMessage="Please Enter Number" ControlToValidate="DropDownList_Registration" ForeColor="Red" ValidationGroup="appFormValidation"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                        </div>

                        <div id="doctorSelectDiv" runat="server">

                            <div class="mb-1 row">
                                <asp:Label ID="Label_Doctor" runat="server" Text="&lt;sup class=&quot;red&quot;&gt;*&lt;/sup&gt;Doctor Name : " class="col-sm-5 col-form-label"></asp:Label>
                                <div class="col">
                                    <asp:DropDownList ID="DropDownList_Doctor" runat="server" placeholder="Select Doctor Name" class="form-select" EnableViewState="true">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator_Doctor" runat="server" ErrorMessage="Please Select Doctor" ControlToValidate="DropDownList_Doctor" ForeColor="Red" ValidationGroup="appFormValidation"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                        </div>

                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="RadioButtonList_Patient" EventName="SelectedIndexChanged" />
                        <asp:AsyncPostBackTrigger ControlID="bookButton" EventName="Click" />
                    </Triggers>

                </asp:UpdatePanel>

            </asp:Panel>

            <asp:Panel ID="PanelFooter" runat="server">

                <div class="mb-1 row">
                    <asp:Button ID="bookButton" runat="server" Text="Book Now" class="btn btn-primary mx-2 mt-3 col" ValidationGroup="appFormValidation" OnClick="bookButton_Click" />
                    <asp:Button ID="cancelButton" runat="server" Text="Cancel" class="btn btn-primary mx-2 mt-3 col" />
                </div>

            </asp:Panel>

        </asp:Panel>

    </div>

    <uc:alertModalPopup ID="alertPopup" runat="server" />

</asp:Content>
