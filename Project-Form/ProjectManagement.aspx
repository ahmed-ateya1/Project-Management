<%@ Page Language="VB" AutoEventWireup="true" CodeBehind="ProjectManagement.aspx.vb"
    Inherits="Project_Form.ProjectManagement" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="~/CSS/Project.css" rel="stylesheet" /> 

    <div class="container mt-4 form-container" dir="rtl">
        <h2 class="mb-4">إدارة المشروع</h2>

        <div class="form-group row">
            <div class="col-md-6">
                <div class="form-group">
                    <label for="txtProjectNameAr" class="form-label">اسم المشروع (العربية)</label>
                    <asp:TextBox ID="txtProjectNameAr" runat="server" CssClass="form-control"
                        placeholder="أدخل اسم المشروع"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvProjectNameAr" runat="server"
                        ControlToValidate="txtProjectNameAr" ErrorMessage="اسم المشروع بالعربية مطلوب"
                        CssClass="text-danger" />
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label for="txtStartDate" class="form-label">تاريخ البدء</label>
                    <asp:TextBox ID="txtStartDate" runat="server" CssClass="form-control" TextMode="Date">
                    </asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvStartDate" runat="server" ControlToValidate="txtStartDate"
                        ErrorMessage="تاريخ البدء مطلوب" CssClass="text-danger" />
                </div>
            </div>
        </div>

        <div class="form-group row">
            <div class="col-md-6">
                <div class="form-group">
                    <label for="txtStBudget" class="form-label">الميزانية المشروع</label>
                    <asp:TextBox ID="txtStBudget" runat="server" CssClass="form-control"
                        placeholder="أدخل الميزانية"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvStBudget" runat="server" ControlToValidate="txtStBudget"
                        ErrorMessage="الميزانية الأولية مطلوبة" CssClass="text-danger" />
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label for="ddlGovernorate" class="form-label">المحافظة</label>
                    <asp:DropDownList ID="ddlGovernorate" runat="server" CssClass="form-select" />
                    <asp:RequiredFieldValidator ID="rfvGovernorate" runat="server"
                        ControlToValidate="ddlGovernorate" ErrorMessage="المحافظة مطلوبة" CssClass="text-danger" />
                </div>
            </div>
        </div>

        <div class="form-group row">
            <div class="col-md-6">
                <div class="form-group">
                    <label for="ddlProPlace" class="form-label">عنوان الموقع</label>
                    <asp:DropDownList ID="ddlProPlace" runat="server" CssClass="form-select">
                        <asp:ListItem Value="">اختر المكان</asp:ListItem>
                        <asp:ListItem Value="1">محلي</asp:ListItem>
                        <asp:ListItem Value="2">إقليمي</asp:ListItem>
                        <asp:ListItem Value="3">دولي</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvProPlace" runat="server" ControlToValidate="ddlProPlace"
                        ErrorMessage="مكان المشروع مطلوب" CssClass="text-danger" />
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label for="txtProLocationDetail" class="form-label">شرح منطقة المشروع </label>
                    <asp:TextBox ID="txtProLocationDetail" runat="server" CssClass="form-control"
                        TextMode="MultiLine" Rows="3" placeholder="أدخل تفاصيل المشروع"></asp:TextBox>
                    <asp:RequiredFieldValidator ErrorMessage="تفاصيل المشروع مطلوب" CssClass="text-danger" ControlToValidate="txtProLocationDetail" runat="server" />
                </div>
            </div>
        </div>

        <div class="grid-view-container">
            <asp:GridView ID="gvRequestDetails" runat="server" CssClass="table table-bordered"
                AutoGenerateColumns="False" ShowFooter="True">
                <Columns>
                    <asp:TemplateField HeaderText="المنظمة">
                        <ItemTemplate>
                            <asp:DropDownList ID="ddlOrganization" runat="server" CssClass="form-control"
                                DataTextField="Firm_NameAr" DataValueField="ID" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="عناصر الطلب">
                        <ItemTemplate>
                            <asp:TextBox ID="txtRequestItems" runat="server" CssClass="form-control"
                                TextMode="MultiLine" Rows="3" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="تاريخ الطلب">
                        <ItemTemplate>
                            <asp:Label ID="lblRequestDate" runat="server" Text='<%# Eval("RequestDate", "{0:yyyy-MM-dd}") %>' CssClass="form-control" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="btnRemove" runat="server" Text="إزالة" CssClass="btn btn-danger btn-sm"
                                OnClick="btnRemove_Click" />
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:Button ID="btnAdd" runat="server" Text="إضافة صف جديد"
                                CssClass="btn btn-primary btn-sm" OnClick="btnAdd_Click" />
                        </FooterTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>

        <div class="mt-4">
            <asp:Button ID="btnSubmit" runat="server" Text="إرسال" CssClass="btn btn-primary"
                OnClick="btnSubmit_Click" />
        </div>
    </div>
</asp:Content>