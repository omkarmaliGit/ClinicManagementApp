<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Staff.aspx.cs" Inherits="ClinicManagementApp.Staff" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <ajaxToolkit:TabContainer ID="TabContainerClinic" runat="server" ActiveTabIndex="1" class="mb-3">

        <ajaxToolkit:TabPanel ID="TabPanelView" runat="server" HeaderText="View" class="tabPanel">
        </ajaxToolkit:TabPanel>

        <ajaxToolkit:TabPanel ID="TabPanelAdd" runat="server" HeaderText="Add" class="tabPanel">

            <ContentTemplate>

                <div class="font">

                    <div class="mb-3 text-center">
                        <h5>Add Clinic Details</h5>
                    </div>

                    <div class="row">

                        <div class="col px-4">


                            <div class="mb-1 row">
                                <asp:Label ID="Label_Name" runat="server" Text="Name : " class="col-sm-3 col-form-label"></asp:Label>
                                <div class="col">
                                    <asp:TextBox ID="TextBox_Name" runat="server" type="text" placeholder="Enter Name" class="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator_Name" runat="server" ErrorMessage="Please Enter Name" ControlToValidate="TextBox_Name" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator_Name" runat="server" ErrorMessage="Only Characters Allowed" ControlToValidate="TextBox_Name" ValidationExpression="^[a-zA-Z]+$" ForeColor="Red"></asp:RegularExpressionValidator>
                                </div>
                            </div>

                            <div class="mb-1 row">
                                <asp:Label ID="Label_Gender" runat="server" Text="Gender : " class="col-sm-3 col-form-label"></asp:Label>
                                <div class="col">
                                    <asp:DropDownList ID="DropDownList_Gender" runat="server" placeholder="Select Gender" class="form-control">
                                        <asp:ListItem>Male</asp:ListItem>
                                        <asp:ListItem>Female</asp:ListItem>
                                        <asp:ListItem>Other</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator_Gender" runat="server" ErrorMessage="Please Enter Gender" ControlToValidate="DropDownList_Gender" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="mb-1 row">
                                <asp:Label ID="Label_Aadhar" runat="server" Text="Aadhar Number : " class="col-sm-3 col-form-label"></asp:Label>
                                <div class="col">
                                    <asp:TextBox ID="TextBox_Aadhar" runat="server" type="number" placeholder="Enter Aadhar Card Number" class="form-control" TextMode="Number"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator_Aadhar" runat="server" ErrorMessage="Please Enter Aadhar Number" ControlToValidate="TextBox_Aadhar" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="mb-4 row">
                                <asp:Label ID="Label_DOB" runat="server" Text="Date of Birth : " class="col-sm-3 col-form-label"></asp:Label>
                                <div class="col">
                                    <asp:TextBox ID="TextBox_DOB" runat="server" type="text" placeholder="Enter Date of Birth" class="form-control" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>

                            <div class="mb-4 row">
                                <asp:Label ID="Label_DOJ" runat="server" Text="Date of Joining : " class="col-sm-3 col-form-label"></asp:Label>
                                <div class="col">
                                    <asp:TextBox ID="TextBox_DOJ" runat="server" type="text" placeholder="Enter Date of Joining" class="form-control" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>

                            <div class="mb-4 row">
                                <asp:Label ID="Label_Qualification" runat="server" Text="Qualification : " class="col-sm-3 col-form-label"></asp:Label>
                                <div class="col">
                                    <asp:DropDownList ID="DropDownList_Qualification" runat="server" placeholder="Select Highest Qualification" class="form-control">
                                        <asp:ListItem>MBBS</asp:ListItem>
                                        <asp:ListItem>B.Pharm</asp:ListItem>
                                        <asp:ListItem>12th</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <div class="mb-4 row">
                                <asp:Label ID="Label_Experience" runat="server" Text="Experience : " class="col-sm-3 col-form-label"></asp:Label>
                                <div class="col">
                                    <asp:TextBox ID="TextBox_Experience" runat="server" type="number" placeholder="Enter Experience in Year" class="form-control"></asp:TextBox>
                                </div>
                            </div>

                            <div class="mb-3 row">
                                <asp:Label ID="Label_WorkType" runat="server" Text="Work Type : " class="col-sm-3 col-form-label"></asp:Label>
                                <div class="col">
                                    <asp:DropDownList ID="DropDownList_WorkType" runat="server" placeholder="Select Work Type" class="form-control">
                                        <asp:ListItem>Doctor</asp:ListItem>
                                        <asp:ListItem>Pharmacist</asp:ListItem>
                                        <asp:ListItem>Wardboy</asp:ListItem>
                                        <asp:ListItem>Nurse</asp:ListItem>
                                        <asp:ListItem>Receptionist</asp:ListItem>
                                    </asp:DropDownList>


                                </div>
                            </div>

                        </div>

                        <div class="col px-4">

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

                            <div class="mb-1 row">
                                <asp:Label ID="Label_Email" runat="server" Text="Email : " class="col-sm-2 col-form-label"></asp:Label>
                                <div class="col">
                                    <asp:TextBox ID="TextBox_Email" runat="server" type="email" placeholder="Enter Email" class="form-control" TextMode="Email"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator_Email" runat="server" ErrorMessage="Please Enter Email" ControlToValidate="TextBox_Email" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator_Email" runat="server" ErrorMessage="Please Enter Valid Email" ControlToValidate="TextBox_Email" ValidationExpression="^[a-z]+[0-9_]*[a-z]+@[a-z]+\.[a-z]{2,3}$" ForeColor="Red"></asp:RegularExpressionValidator>
                                </div>
                            </div>

                            <div class="mb-1 row">
                                <asp:Label ID="Label_Password" runat="server" Text="Password : " class="col-sm-2 col-form-label"></asp:Label>
                                <div class="col">
                                    <asp:TextBox ID="TextBox_Password" runat="server" type="password" placeholder="Create Password" class="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator_Password" runat="server" ErrorMessage="Please Enter Password" ControlToValidate="TextBox_Password" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator_Password" runat="server" ErrorMessage="Please Enter Valid Password" ControlToValidate="TextBox_Password" ValidationExpression="^[a-zA-Z0-9_!@#$%&]{8,12}$" ForeColor="Red"></asp:RegularExpressionValidator>
                                </div>
                            </div>

                        </div>

                    </div>
                    <div class="mb-3 text-center">
                        <asp:Button ID="Button_Save" runat="server" Text="Save" class="btn btn-primary mx-2" OnClick="Button_Save_Click" />
                        <asp:Button ID="Button_Clear" runat="server" Text="Clear" class="btn btn-primary mx-2" OnClick="Button_Clear_Click" />
                    </div>

                </div>

            </ContentTemplate>

        </ajaxToolkit:TabPanel>

    </ajaxToolkit:TabContainer>

</asp:Content>
