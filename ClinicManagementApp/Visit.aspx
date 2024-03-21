<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Visit.aspx.cs" Inherits="ClinicManagementApp.Visit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <asp:ScriptManager ID="ScriptManagerVisit" runat="server"></asp:ScriptManager>

    <div class="font">

        <div>

            <div class="mb-3 text-center">
                <h5>Add Visit Details</h5>
            </div>

            <div class="row">

                <div class="col px-4">

                    <div class="mb-4 row">
                        <asp:Label ID="Label_Registration" runat="server" Text="Registration Number : " class="col-sm-4 col-form-label"></asp:Label>
                        <div class="col">
                            <asp:DropDownList ID="DropDownList_Registration" runat="server" placeholder="Select Registration Number" class="form-control">
                                <asp:ListItem>MBBS</asp:ListItem>
                                <asp:ListItem>B.Pharm</asp:ListItem>
                                <asp:ListItem>12th</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>

                    <div class="mb-4 row">
                        <asp:Label ID="Label_PatientName" runat="server" Text="Patient Name : " class="col-sm-4 col-form-label"></asp:Label>
                        <div class="col">
                            <asp:Label ID="Label_PatientNameShow" runat="server" Text="" class="col-form-label"></asp:Label>
                        </div>
                    </div>

                    <div class="mb-4 row">
                        <asp:Label ID="Label_Age" runat="server" Text="Age : " class="col-sm-4 col-form-label"></asp:Label>
                        <div class="col">
                            <asp:Label ID="Label_AgeShow" runat="server" Text="" class="col-form-label"></asp:Label>
                        </div>
                    </div>

                    <div class="mb-4 row">
                        <asp:Label ID="Label_BloodGroup" runat="server" Text="Blood Group : " class="col-sm-4 col-form-label"></asp:Label>
                        <div class="col">
                            <asp:Label ID="Label_BloodGroupShow" runat="server" Text="" class="col-form-label"></asp:Label>
                        </div>
                    </div>

                </div>

                <div class="col px-4">

                    <div class="mb-4 row">
                        <asp:Label ID="Label_VisitDate" runat="server" Text="Visit Date : " class="col-sm-4 col-form-label"></asp:Label>
                        <div class="col">
                            <asp:TextBox ID="TextBox_VisitDate" runat="server" type="text" placeholder="Enter Visit Date" class="form-control" TextMode="Date"></asp:TextBox>
                        </div>
                    </div>

                    <div class="mb-4 row">
                        <asp:Label ID="Label_VisitTime" runat="server" Text="Visit Time : " class="col-sm-4 col-form-label"></asp:Label>
                        <div class="col">
                            <asp:TextBox ID="TextBox_VisitTime" runat="server" type="text" placeholder="Enter Visit Time" class="form-control" TextMode="Time"></asp:TextBox>
                        </div>
                    </div>

                    <div class="mb-4 row">
                        <asp:Label ID="Label_VisitType" runat="server" Text="Visit Type : " class="col-sm-4 col-form-label"></asp:Label>
                        <div class="col">
                            <asp:DropDownList ID="DropDownList_VisitType" runat="server" placeholder="Select Visit Type" class="form-control">
                                <asp:ListItem>With Appointment</asp:ListItem>
                                <asp:ListItem>Without Appointment</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>

                    <div class="mb-4 row">
                        <asp:Label ID="Label_Doctor" runat="server" Text="Doctor Name : " class="col-sm-4 col-form-label"></asp:Label>
                        <div class="col">
                            <asp:DropDownList ID="DropDownList_Doctor" runat="server" placeholder="Select Doctor Name" class="form-control">
                                <asp:ListItem>With Appointment</asp:ListItem>
                                <asp:ListItem>Without Appointment</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>

                    <div class="mb-4 row">
                        <asp:Label ID="Label_Staff" runat="server" Text="Staff Name : " class="col-sm-4 col-form-label"></asp:Label>
                        <div class="col">
                            <asp:DropDownList ID="DropDownList_Staff" runat="server" placeholder="Select Staff Name" class="form-control">
                                <asp:ListItem>With Appointment</asp:ListItem>
                                <asp:ListItem>Without Appointment</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>

                </div>

            </div>
        </div>

        <div>

            <div class="mb-3 text-center">
                <h5>Add Vital Signs</h5>
            </div>

            <div class="row">

                <div class="col px-4">

                    <div class="mb-4 row">
                        <asp:Label ID="Label_Temperature" runat="server" Text="Temperature : " class="col-sm-4 col-form-label"></asp:Label>
                        <div class="col">
                            <asp:TextBox ID="TextBox_Temperature" runat="server" type="text" class="form-control" CssClass="smallBox"></asp:TextBox>
                            <asp:Label ID="Label_T" runat="server" Text=" °C" class="col-form-label" CssClass="smallLabel"></asp:Label>
                        </div>
                    </div>

                    <div class="mb-4 row">
                        <asp:Label ID="Label_Blood" runat="server" Text="Blood Pressure : " class="col-sm-4 col-form-label"></asp:Label>
                        <div class="col">
                            <asp:TextBox ID="TextBox_Blood" runat="server" type="text" class="form-control" CssClass="smallBox"></asp:TextBox>
                            <asp:Label ID="Label_B" runat="server" Text=" / " class="col-form-label" CssClass="smallLabel"></asp:Label>
                            <asp:TextBox ID="TextBox_Pressure" runat="server" type="text" class="form-control" CssClass="smallBox"></asp:TextBox>
                            <asp:Label ID="Label_P" runat="server" Text=" mmHg" class="col-form-label" CssClass="smallLabel"></asp:Label>
                        </div>
                    </div>

                    <div class="mb-4 row">
                        <asp:Label ID="Label_Oxygen" runat="server" Text="Oxygen Level : " class="col-sm-4 col-form-label"></asp:Label>
                        <div class="col">
                            <asp:TextBox ID="TextBox_Oxygen" runat="server" type="text" class="form-control" CssClass="smallBox"></asp:TextBox>
                            <asp:Label ID="Label_O" runat="server" Text=" %SpO<sub>2</sub>" class="col-form-label" CssClass="smallLabel"></asp:Label>
                        </div>
                    </div>

                </div>

                <div class="col px-4">

                    <div class="mb-4 row">
                        <asp:Label ID="Label_Height" runat="server" Text="Height : " class="col-sm-4 col-form-label"></asp:Label>
                        <div class="col">
                            <asp:TextBox ID="TextBox_Height" runat="server" type="text" class="form-control" CssClass="smallBox"></asp:TextBox>
                            <asp:Label ID="Label_H" runat="server" Text=" ft" class="col-form-label" CssClass="smallLabel"></asp:Label>
                        </div>
                    </div>

                    <div class="mb-4 row">
                        <asp:Label ID="Label_Weight" runat="server" Text="Weight : " class="col-sm-4 col-form-label"></asp:Label>
                        <div class="col">
                            <asp:TextBox ID="TextBox_Weight" runat="server" type="text" class="form-control" CssClass="smallBox"></asp:TextBox>
                            <asp:Label ID="Label_W" runat="server" Text=" kg" class="col-form-label" CssClass="smallLabel"></asp:Label>
                        </div>
                    </div>

                </div>

            </div>

            <div class="row d-flex justify-content-center">

                <div class="mb-4 row">
                    <asp:Label ID="Label_Symptoms" runat="server" Text="Symptoms : " class="col-sm-3 col-form-label"></asp:Label>
                    <div class="col">
                        <asp:TextBox ID="TextBox_Symptoms" runat="server" type="text" placeholder="Enter Symptoms" class="form-control" TextMode="MultiLine"></asp:TextBox>
                    </div>
                </div>

                <div class="mb-4 row">
                    <asp:Label ID="Label_Diagnosis" runat="server" Text="Diagnosis : " class="col-sm-3 col-form-label"></asp:Label>
                    <div class="col">
                        <asp:TextBox ID="TextBox_Diagnosis" runat="server" type="text" placeholder="Enter Diagnosis" class="form-control" TextMode="MultiLine"></asp:TextBox>
                    </div>
                </div>

            </div>

        </div>

        <div>

            <ajaxToolkit:TabContainer ID="TabContainerVisit" runat="server" ActiveTabIndex="0" class="mb-3">

                <ajaxToolkit:TabPanel ID="TabPanelMedication" runat="server" HeaderText="Medication">

                    <ContentTemplate>

                        <div class="row">

                            <div class="col p-4">

                                <div class="mb-4 row">
                                    <asp:Label ID="Label_Medicine" runat="server" Text="Medicine : " class="col-sm-4 col-form-label"></asp:Label>
                                    <div class="col">
                                        <asp:TextBox ID="TextBox_Medicine" runat="server" type="text" placeholder="Enter Medicine Name" class="form-control"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="mb-4 row">
                                    <asp:Label ID="Label_Frequency" runat="server" Text="Medicine Frequency : " class="col-sm-4 col-form-label"></asp:Label>
                                    <div class="col">
                                        <asp:DropDownList ID="DropDownList_Frequency" runat="server" placeholder="Select Medicine Frequency" class="form-control">
                                            <asp:ListItem>Once a day</asp:ListItem>
                                            <asp:ListItem>Twice a day</asp:ListItem>
                                            <asp:ListItem>Trice a day</asp:ListItem>
                                            <asp:ListItem>Early Morning</asp:ListItem>
                                            <asp:ListItem>Before Meal</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>

                                <div class="mb-4 row">
                                    <asp:Label ID="Label_Days" runat="server" Text="No. of Days : " class="col-sm-4 col-form-label"></asp:Label>
                                    <div class="col">
                                        <asp:TextBox ID="TextBox_Days" runat="server" type="number" placeholder="Enter No. of Days" class="form-control" TextMode="Number"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="mb-3 text-center">
                                    <asp:Button ID="Button_MedicineAdd" runat="server" Text="Add" class="btn btn-primary mx-2" />
                                    <asp:Button ID="Button_MedicineClear" runat="server" Text="Clear" class="btn btn-primary mx-2" />
                                </div>

                            </div>

                            <div class="col p-4">

                                <asp:GridView ID="GridViewMedication" runat="server" AutoGenerateColumns="False" AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" CellPadding="4" ForeColor="#333333" GridLines="None" ShowFooter="True" Width="100%" ShowHeaderWhenEmpty="true">
                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="Medicine">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                            </EditItemTemplate>
                                            <FooterTemplate>
                                                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                                            </FooterTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Frequency">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                                            </EditItemTemplate>
                                            <FooterTemplate>
                                                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                                                <asp:Button ID="Button1" runat="server" Text="Button" />
                                            </FooterTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="No. of Days">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                                            </EditItemTemplate>
                                            <FooterTemplate>
                                                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                                                <asp:Button ID="Button1" runat="server" Text="Button" />
                                            </FooterTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <EditRowStyle BackColor="#999999" />
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

                        </div>

                    </ContentTemplate>

                </ajaxToolkit:TabPanel>

                <ajaxToolkit:TabPanel ID="TabPanelInvestigation" runat="server" HeaderText="Investigation">

                    <ContentTemplate>

                        <div class="row">

                            <div class="col p-4">

                                <div class="row d-flex justify-content-center">

                                    <div class="mb-4 row">
                                        <asp:Label ID="Label_Investigation" runat="server" Text="Investigation : " class="col-sm-3 col-form-label"></asp:Label>
                                        <div class="col">
                                            <asp:TextBox ID="TextBox_Investigation" runat="server" type="text" placeholder="Enter Investigation" class="form-control" TextMode="MultiLine"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="mb-4 row">
                                        <asp:Label ID="Label_Result" runat="server" Text="Result : " class="col-sm-3 col-form-label"></asp:Label>
                                        <div class="col">
                                            <asp:TextBox ID="TextBox_Result" runat="server" type="text" placeholder="Enter Result" class="form-control" TextMode="MultiLine"></asp:TextBox>
                                        </div>
                                    </div>

                                </div>

                                <div class="mb-3 text-center">
                                    <asp:Button ID="Button_InvestigationAdd" runat="server" Text="Add" class="btn btn-primary mx-2" />
                                    <asp:Button ID="Button_InvestigationClear" runat="server" Text="Clear" class="btn btn-primary mx-2" />
                                </div>


                            </div>

                            <div class="col p-4">

                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" CellPadding="4" ForeColor="#333333" GridLines="None" ShowFooter="True" Width="100%" ShowHeaderWhenEmpty="true">
                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="Medicine">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                            </EditItemTemplate>
                                            <FooterTemplate>
                                                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                                            </FooterTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Frequency">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                                            </EditItemTemplate>
                                            <FooterTemplate>
                                                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                                                <asp:Button ID="Button1" runat="server" Text="Button" />
                                            </FooterTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="No. of Days">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                                            </EditItemTemplate>
                                            <FooterTemplate>
                                                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                                                <asp:Button ID="Button1" runat="server" Text="Button" />
                                            </FooterTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <EditRowStyle BackColor="#999999" />
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

                        </div>

                    </ContentTemplate>

                </ajaxToolkit:TabPanel>

            </ajaxToolkit:TabContainer>


        </div>

        <div class="mb-3 text-center">
            <asp:Button ID="Button_Save" runat="server" Text="Save" class="btn btn-primary mx-2" />
            <asp:Button ID="Button_Clear" runat="server" Text="Clear" class="btn btn-primary mx-2" />
        </div>

    </div>

</asp:Content>
