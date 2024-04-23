﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Staff.aspx.cs" Inherits="ClinicManagementApp.Staff" %>
<%@ Register Src="~/ModalPopups/alertPopup.ascx" TagName="alertModalPopup" TagPrefix="uc" %>
<%@ Register Src="~/ModalPopups/deletePopup.ascx" TagName="deleteModalPopup" TagPrefix="uc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManagerStaff" runat="server"></asp:ScriptManager>

    <ajaxToolkit:TabContainer ID="TabContainerStaff" runat="server" ActiveTabIndex="0" class="mb-3" OnActiveTabChanged="TabContainerStaff_ActiveTabChanged">

        <ajaxToolkit:TabPanel ID="TabPanelView" runat="server" HeaderText="List" class="tabPanel">

            <ContentTemplate>

                <div class="p-2">

                    <asp:GridView ID="GridView_Staff" runat="server" AutoGenerateColumns="False" AutoGenerateSelectButton="True" AutoGenerateDeleteButton="True" OnRowDeleting="GridView_Staff_RowDeleting" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" OnSelectedIndexChanged="GridView_Staff_SelectedIndexChanged" ShowHeaderWhenEmpty="True"  EmptyDataText="No Data Available Currently">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:TemplateField HeaderText="StaffID" Visible="False">
                                <ItemTemplate>
                                    <asp:Label ID="Label_StaffID" runat="server" Text='<%# Bind("staffID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Name">
                                <ItemTemplate>
                                    <asp:Label ID="Label_Name" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="City">
                                <ItemTemplate>
                                    <asp:Label ID="Label_City" runat="server" Text='<%# Bind("city") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Gender">
                                <ItemTemplate>
                                    <asp:Label ID="Label_Gender" runat="server" Text='<%# Bind("gender") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Contact">
                                <ItemTemplate>
                                    <asp:Label ID="Label_Contact" runat="server" Text='<%# Bind("contact") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle BackColor="#999999" />
                        <EmptyDataRowStyle Font-Italic="True" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                    </asp:GridView>

                </div>

            </ContentTemplate>

        </ajaxToolkit:TabPanel>

        <ajaxToolkit:TabPanel ID="TabPanelAdd" runat="server" HeaderText="Add" class="tabPanel">

            <ContentTemplate>

                <div class="font">

                    <div class="mb-3 text-center">
                        <h5>Add Staff Details</h5>
                    </div>

                    <div class="row">

                        <div class="col px-4">


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
                                <asp:Label ID="Label_Gender" runat="server" Text="" class="col-sm-3 col-form-label">
                                    <sup class="red">*</sup>Gender : 
                                </asp:Label>
                                <div class="col">
                                    <asp:RadioButtonList ID="RadioButtonList_Gender" runat="server" class="mt-2" RepeatDirection="Horizontal">
                                        <asp:ListItem Value="Male" class="pe-4">  Male</asp:ListItem>
                                        <asp:ListItem Value="Female" class="pe-4">  Female</asp:ListItem>
                                        <asp:ListItem Value="Other"> Other</asp:ListItem>
                                    </asp:RadioButtonList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator_Gender" runat="server" ErrorMessage="Please Select Gender" ControlToValidate="RadioButtonList_Gender" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="mb-1 row">
                                <asp:Label ID="Label_Aadhar" runat="server" Text="" class="col-sm-3 col-form-label">
                                    <sup class="red">*</sup>Aadhar Number : 
                                </asp:Label>
                                <div class="col">
                                    <asp:TextBox ID="TextBox_Aadhar" runat="server" type="number" placeholder="Enter Aadhar Card Number" class="form-control" TextMode="Number"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator_Aadhar" runat="server" ErrorMessage="Please Enter Aadhar Number" ControlToValidate="TextBox_Aadhar" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator_Aadhar" runat="server" ErrorMessage="Please Enter Valid Aadhar" ControlToValidate="TextBox_Aadhar" ValidationExpression="^[0-9]{12}$" ForeColor="Red"></asp:RegularExpressionValidator>
                                </div>
                            </div>

                            <div class="mb-4 row">
                                <asp:Label ID="Label_DOB" runat="server" Text="Date of Birth : " class="col-sm-3 col-form-label"></asp:Label>
                                <div class="col">
                                    <asp:TextBox ID="TextBox_DOB" runat="server" placeholder="Enter Date of Birth" class="form-control" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>

                            <div class="mb-4 row">
                                <asp:Label ID="Label_DOJ" runat="server" Text="Date of Joining : " class="col-sm-3 col-form-label"></asp:Label>
                                <div class="col">
                                    <asp:TextBox ID="TextBox_DOJ" runat="server" placeholder="Enter Date of Joining" class="form-control" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>

                            <div class="mb-4 row">
                                <asp:Label ID="Label_Qualification" runat="server" Text="Qualification : " class="col-sm-3 col-form-label"></asp:Label>
                                <div class="col">
                                    <asp:DropDownList ID="DropDownList_Qualification" runat="server" placeholder="Select Highest Qualification" class="form-select">
                                        <asp:ListItem>Select Qualification</asp:ListItem>
                                        <asp:ListItem Value="MBBS">MBBS</asp:ListItem>
                                        <asp:ListItem Value="B.Pharm">B.Pharm</asp:ListItem>
                                        <asp:ListItem Value="12th">12th</asp:ListItem>
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
                                    <asp:DropDownList ID="DropDownList_WorkType" runat="server" placeholder="Select Work Type" class="form-select">
                                        <asp:ListItem>Select WorkType</asp:ListItem>
                                        <asp:ListItem Value="Doctor">Doctor</asp:ListItem>
                                        <asp:ListItem Value="Pharmacist">Pharmacist</asp:ListItem>
                                        <asp:ListItem Value="Wardboy">Wardboy</asp:ListItem>
                                        <asp:ListItem Value="Nurse">Nurse</asp:ListItem>
                                        <asp:ListItem Value="Receptionist">Receptionist</asp:ListItem>
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
                                <asp:Label ID="Label_City" runat="server" Text="" class="col-sm-2 col-form-label">
                                    <sup class="red">*</sup>City : 
                                </asp:Label>
                                <div class="col">
                                    <asp:TextBox ID="TextBox_City" runat="server" type="text" placeholder="Enter City" class="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator_City" runat="server" ErrorMessage="Please Enter City" ControlToValidate="TextBox_City" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="mb-1 row">
                                <asp:Label ID="Label_Pincode" runat="server" Text="Pincode : " class="col-sm-2 col-form-label"></asp:Label>
                                <div class="col">
                                    <asp:TextBox ID="TextBox_Pincode" runat="server" type="number" placeholder="Enter Pincode" class="form-control" TextMode="Number"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator_Pincode" runat="server" ErrorMessage="only 6 digit allowed" ControlToValidate="TextBox_Pincode" ValidationExpression="^[0-9]{6}$" ForeColor="Red"></asp:RegularExpressionValidator>
                                </div>
                            </div>

                            <div class="mb-1 row">
                                <asp:Label ID="Label_Contact" runat="server" Text="" class="col-sm-2 col-form-label">
                                    <sup class="red">*</sup>Contact : 
                                </asp:Label>
                                <div class="col">
                                    <asp:TextBox ID="TextBox_Contact" runat="server" type="number" placeholder="Enter Contact" class="form-control" TextMode="Number"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator_Contact" runat="server" ErrorMessage="Please Enter Contact" ControlToValidate="TextBox_Contact" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator_Contact" runat="server" ErrorMessage="Please Enter Valid Contact" ControlToValidate="TextBox_Contact" ValidationExpression="^[987]{1}[0-9]{9}$" ForeColor="Red"></asp:RegularExpressionValidator>
                                </div>
                            </div>

                            <div class="mb-1 row">
                                <asp:Label ID="Label_Email" runat="server" Text="" class="col-sm-2 col-form-label">
                                    <sup class="red">*</sup>Email : 
                                </asp:Label>
                                <div class="col">
                                    <asp:TextBox ID="TextBox_Email" runat="server" type="email" placeholder="Enter Email" class="form-control" TextMode="Email"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator_Email" runat="server" ErrorMessage="Please Enter Email" ControlToValidate="TextBox_Email" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator_Email" runat="server" ErrorMessage="Please Enter Valid Email" ControlToValidate="TextBox_Email" ValidationExpression="^[a-z]+[0-9_]*[a-z]+@[a-z]+\.[a-z]{2,3}$" ForeColor="Red"></asp:RegularExpressionValidator>
                                </div>
                            </div>

                            <div class="mb-1 row">
                                <asp:Label ID="Label_Password" runat="server" Text="" class="col-sm-2 col-form-label">
                                    <sup class="red">*</sup>Password : 
                                </asp:Label>
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
                        <asp:Button ID="Button_Clear" runat="server" Text="Clear" class="btn btn-primary mx-2" OnClick="Button_Clear_Click" CausesValidation="false"/>
                    </div>

                </div>

            </ContentTemplate>

        </ajaxToolkit:TabPanel>

    </ajaxToolkit:TabContainer>

    <uc:alertModalPopup ID="alertPopup" runat="server" />
    <uc:deleteModalPopup ID="deletePopup" runat="server"/>

</asp:Content>
