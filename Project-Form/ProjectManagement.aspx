<%@ Page Language="VB" AutoEventWireup="true" CodeBehind="ProjectManagement.aspx.vb" Inherits="Project_Form.ProjectManagement" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Project Management</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-4">
            <h2>Project Information</h2>
            
            <div class="row mb-3">
                <div class="col-md-6">
                    <div class="mb-3">
                        <label for="txtProjectNameAr" class="form-label">Project Name (Arabic)</label>
                        <asp:TextBox ID="txtProjectNameAr" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvProjectNameAr" runat="server" 
                            ControlToValidate="txtProjectNameAr" 
                            ErrorMessage="Project Name in Arabic is required" 
                            CssClass="text-danger" />
                    </div>

                    <div class="mb-3">
                        <label for="txtProjectNameEn" class="form-label">Project Name (English)</label>
                        <asp:TextBox ID="txtProjectNameEn" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvProjectNameEn" runat="server" 
                            ControlToValidate="txtProjectNameEn" 
                            ErrorMessage="Project Name in English is required" 
                            CssClass="text-danger" />
                    </div>

                    <div class="mb-3">
                        <label for="ddlProType" class="form-label">Project Type</label>
                        <asp:DropDownList ID="ddlProType" runat="server" CssClass="form-select">
                            <asp:ListItem Value="">Select Type</asp:ListItem>
                            <asp:ListItem Value="1">مزارع</asp:ListItem>
                            <asp:ListItem Value="2">مطور زراعي</asp:ListItem>
                            <asp:ListItem Value="3">محطات وسيطة</asp:ListItem>
                            <asp:ListItem Value="4">التخزيت</asp:ListItem>
                            <asp:ListItem Value="5">التصنيع الزراعي</asp:ListItem>
                            <asp:ListItem Value="6">التصنيع</asp:ListItem>
                            <asp:ListItem Value="7">تنسيق المواقع لاند سكيب</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvProType" runat="server" 
                            ControlToValidate="ddlProType" 
                            ErrorMessage="Project Type is required" 
                            CssClass="text-danger" />
                    </div>

                    <div class="mb-3">
                        <label for="ddlProPlace" class="form-label">Project Place</label>
                        <asp:DropDownList ID="ddlProPlace" runat="server" CssClass="form-select">
                            <asp:ListItem Value="">Select Place</asp:ListItem>
                            <asp:ListItem Value="1">Local</asp:ListItem>
                            <asp:ListItem Value="2">Regional</asp:ListItem>
                            <asp:ListItem Value="3">International</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvProPlace" runat="server" 
                            ControlToValidate="ddlProPlace" 
                            ErrorMessage="Project Place is required" 
                            CssClass="text-danger" />
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="mb-3">
                        <label for="txtStartDate" class="form-label">Start Date</label>
                        <asp:TextBox ID="txtStartDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvStartDate" runat="server" 
                            ControlToValidate="txtStartDate" 
                            ErrorMessage="Start Date is required" 
                            CssClass="text-danger" />
                    </div>

                    <div class="mb-3">
                        <label for="txtCustomerID" class="form-label">Customer ID</label>
                        <asp:TextBox ID="txtCustomerID" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvCustomerID" runat="server" 
                            ControlToValidate="txtCustomerID" 
                            ErrorMessage="Customer ID is required" 
                            CssClass="text-danger" />
                    </div>

                    <div class="mb-3">
                        <label for="txtStBudget" class="form-label">Start Budget</label>
                        <asp:TextBox ID="txtStBudget" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvStBudget" runat="server" 
                            ControlToValidate="txtStBudget" 
                            ErrorMessage="Start Budget is required" 
                            CssClass="text-danger" />
                    </div>

                    <div class="mb-3">
                        <label for="ddlGovernorate" class="form-label">Governorate</label>
                        <asp:DropDownList ID="ddlGovernorate" runat="server" CssClass="form-select" />
                        <asp:RequiredFieldValidator ID="rfvGovernorate" runat="server" 
                            ControlToValidate="ddlGovernorate" 
                            ErrorMessage="Governorate is required" 
                            CssClass="text-danger" />
                    </div>
                </div>
            </div>

            <div class="mb-3">
                <label for="txtProAddress" class="form-label">Project Address</label>
                <asp:TextBox ID="txtProAddress" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvProAddress" runat="server" 
                    ControlToValidate="txtProAddress" 
                    ErrorMessage="Project Address is required" 
                    CssClass="text-danger" />
            </div>

            <div class="mb-3">
                <label for="txtProLocationDetail" class="form-label">Location Details</label>
                <asp:TextBox ID="txtProLocationDetail" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3"></asp:TextBox>
            </div>

            <div class="mb-3">
                <label for="txtProMail" class="form-label">Project Email</label>
                <asp:TextBox ID="txtProMail" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                <asp:RegularExpressionValidator ID="revProMail" runat="server" 
                    ControlToValidate="txtProMail" 
                    ErrorMessage="Invalid Email Format" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                    CssClass="text-danger" />
            </div>

            <h3>Project Request Details</h3>
            <asp:GridView ID="gvRequestDetails" runat="server" CssClass="table table-bordered" AutoGenerateColumns="False" ShowFooter="True">
                <Columns>
                    <asp:TemplateField HeaderText="Organization">
                        <ItemTemplate>
                            <asp:DropDownList ID="ddlOrganization" runat="server" CssClass="form-control" DataTextField="Firm_NameAr" DataValueField="ID" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Expert ID">
                        <ItemTemplate>
                            <asp:TextBox ID="txtExpertID" runat="server" CssClass="form-control" TextMode="Number" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Request Items">
                        <ItemTemplate>
                            <asp:TextBox ID="txtRequestItems" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Request Date">
                        <ItemTemplate>
                            <asp:TextBox ID="txtRequestDate" runat="server" CssClass="form-control" TextMode="Date" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="btnRemove" runat="server" Text="Remove" CssClass="btn btn-danger btn-sm" OnClick="btnRemove_Click" />
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:Button ID="btnAdd" runat="server" Text="Add New Row" CssClass="btn btn-primary btn-sm" OnClick="btnAdd_Click" />
                        </FooterTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

            <div class="mt-4">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="btnSubmit_Click" />
            </div>
        </div>
    </form>
</body>
</html>