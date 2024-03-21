<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Clinic.aspx.cs" Inherits="ClinicManagementApp.Clinic" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="centerAll">
        <div class="p-3 addClinic">

            <div class="mb-3 text-center">
                <h5>Add Clinic Details</h5>
            </div>

            <div class="mb-1 row">
                <asp:Label ID="Label_Name" runat="server" Text="Name : " class="col-sm-2 col-form-label"></asp:Label>
                <div class="col">
                    <asp:TextBox ID="TextBox_Name" runat="server" type="text" placeholder="Enter Name" class="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator_Name" runat="server" ErrorMessage="Please Enter Name" ControlToValidate="TextBox_Name" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator_Name" runat="server" ErrorMessage="Only Characters Allowed" ControlToValidate="TextBox_Name" ValidationExpression="^[a-zA-Z ]+$" ForeColor="Red"></asp:RegularExpressionValidator>
                </div>
            </div>

            <div class="mb-4 row">
                <asp:Label ID="Label_Address" runat="server" Text="Address : " class="col-sm-2 col-form-label"></asp:Label>
                <div class="col">
                    <asp:TextBox ID="TextBox_Address" runat="server" type="text" placeholder="Enter Address" class="form-control" TextMode="MultiLine"></asp:TextBox>
                </div>
            </div>

            <div class="mb-4 row">
                <asp:Label ID="Label_Area" runat="server" Text="Area : " class="col-sm-2 col-form-label"></asp:Label>
                <div class="col">
                    <asp:TextBox ID="TextBox_Area" runat="server" type="text" placeholder="Enter Area" class="form-control"></asp:TextBox>
                </div>
            </div>

            <div class="mb-1 row">
                <asp:Label ID="Label_City" runat="server" Text="City : " class="col-sm-2 col-form-label"></asp:Label>
                <div class="col">
                    <asp:TextBox ID="TextBox_City" runat="server" type="text" placeholder="Enter City" class="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator_City" runat="server" ErrorMessage="Please Enter City" ControlToValidate="TextBox_City" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="mb-4 row">
                <asp:Label ID="Label_Pincode" runat="server" Text="Pincode : " class="col-sm-2 col-form-label"></asp:Label>
                <div class="col">
                    <asp:TextBox ID="TextBox_Pincode" runat="server" type="number" placeholder="Enter Pincode" class="form-control" TextMode="Number"></asp:TextBox>
                </div>
            </div>

            <div class="mb-1 row">
                <asp:Label ID="Label_Contact" runat="server" Text="Contact : " class="col-sm-2 col-form-label"></asp:Label>
                <div class="col">
                    <asp:TextBox ID="TextBox_Contact" runat="server" type="number" placeholder="Enter Contact" class="form-control" TextMode="Number"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator_Contact" runat="server" ErrorMessage="Please Enter Contact" ControlToValidate="TextBox_Contact" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator_Contact" runat="server" ErrorMessage="Please Enter Valid Contact" ControlToValidate="TextBox_Contact" ValidationExpression="^[987]{1}[0-9]{9}$" ForeColor="Red"></asp:RegularExpressionValidator>
                </div>
            </div>

            <div class="mb-4 row">
                <asp:Label ID="Label_Website" runat="server" Text="Website : " class="col-sm-2 col-form-label"></asp:Label>
                <div class="col">
                    <asp:TextBox ID="TextBox_Website" runat="server" type="text" placeholder="Enter Website Url" class="form-control" TextMode="Url"></asp:TextBox>
                </div>
            </div>

            <div class="mb-1 row">
                <asp:Label ID="Label_Email" runat="server" Text="Email : " class="col-sm-2 col-form-label"></asp:Label>
                <div class="col">
                    <asp:TextBox ID="TextBox_Email" runat="server" type="email" placeholder="Enter Email" class="form-control" TextMode="Email"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator_Email" runat="server" ErrorMessage="Please Enter Email" ControlToValidate="TextBox_Email" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator_Email" runat="server" ErrorMessage="Please Enter Valid Email" ControlToValidate="TextBox_Email" ValidationExpression="^[a-z]+[0-9_]*[a-z]+@[a-z]+\.[a-z]{2,3}$" ForeColor="Red"></asp:RegularExpressionValidator>
                </div>
            </div>

            <div class="mb-1 row">
                <asp:Label ID="Label_StartTime" runat="server" Text="Start Time : " class="col-sm-2 col-form-label"></asp:Label>
                <div class="col">
                    <asp:TextBox ID="TextBox_StartTime" runat="server" placeholder="Enter Start Time" class="form-control" TextMode="Time"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator_StartTime" runat="server" ErrorMessage="Please Select Start Time" ControlToValidate="TextBox_StartTime" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="mb-1 row">
                <asp:Label ID="Label_EndTime" runat="server" Text="End Time : " class="col-sm-2 col-form-label"></asp:Label>
                <div class="col">
                    <asp:TextBox ID="TextBox_EndTime" runat="server" placeholder="Enter End Time" class="form-control" TextMode="Time"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator_EndTime" runat="server" ErrorMessage="Please Select End Time" ControlToValidate="TextBox_EndTime" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="mb-3 text-center">
                <asp:Button ID="Button_Save" runat="server" Text="Save" class="btn btn-primary mx-2" OnClick="Button_Save_Click" />
                <asp:Button ID="Button_Clear" runat="server" Text="Clear" class="btn btn-primary mx-2" OnClick="Button_Clear_Click" />
            </div>

        </div>
    </div>

</asp:Content>
