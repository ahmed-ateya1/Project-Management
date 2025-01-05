<%@ Page Language="VB" AutoEventWireup="true" CodeBehind="ProjectManagement.aspx.vb" Inherits="Project_Form.ProjectManagement" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .form-container {
            background-color: #ffffff;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .form-label {
            font-weight: 600;
            color: #495057;
            margin-bottom: 0.5rem;
        }
        .form-control, .form-select {
            border-radius: 5px;
            border: 1px solid #ced4da;
            padding: 0.5rem;
            font-size: 0.9rem;
            width: 100%;
        }
        .form-control:focus, .form-select:focus {
            border-color: #80bdff;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.25);
        }
        .btn-primary {
            background-color: #007bff;
            border: none;
            padding: 0.5rem 1rem;
            border-radius: 5px;
            font-weight: 600;
            font-size: 0.9rem;
        }
        .btn-primary:hover {
            background-color: #0056b3;
        }
        .btn-danger {
            background-color: #dc3545;
            border: none;
            padding: 0.5rem 1rem;
            border-radius: 5px;
            font-weight: 600;
            font-size: 0.9rem;
        }
        .btn-danger:hover {
            background-color: #c82333;
        }
        .table {
            margin-top: 1rem;
            border-collapse: separate;
            border-spacing: 0;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .table th, .table td {
            padding: 0.75rem;
            vertical-align: middle;
        }
        .table thead th {
            background-color: #007bff;
            color: white;
            border-bottom: 2px solid #0056b3;
        }
        .table tbody tr:hover {
            background-color: #f1f1f1;
        }
        .text-danger {
            font-size: 0.875rem;
            margin-top: 0.25rem;
            color: #dc3545;
        }
        .form-group {
            margin-bottom: 1.5rem;
        }
        .form-group.row {
            margin-bottom: 1rem;
        }
        .form-group.row .col-md-6 {
            padding-right: 15px;
            padding-left: 15px;
        }
        .icon {
            margin-right: 0.5rem;
        }

    </style>

    <div class="container mt-4 form-container">
        <h2 class="mb-4">إدارة المشروع</h2>

        <div class="form-group row">
            <div class="col-md-6">
                <div class="form-group">
                    <label for="txtProjectNameAr" class="form-label">اسم المشروع (العربية)</label>
                    <asp:TextBox ID="txtProjectNameAr" runat="server" CssClass="form-control" placeholder="أدخل اسم المشروع"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvProjectNameAr" runat="server"
                        ControlToValidate="txtProjectNameAr"
                        ErrorMessage="اسم المشروع بالعربية مطلوب"
                        CssClass="text-danger" />
                </div>

                <div class="form-group">
                    <label for="txtProjectNameEn" class="form-label">اسم المشروع (الإنجليزية)</label>
                    <asp:TextBox ID="txtProjectNameEn" runat="server" CssClass="form-control" placeholder="Enter Project Name"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvProjectNameEn" runat="server"
                        ControlToValidate="txtProjectNameEn"
                        ErrorMessage="اسم المشروع بالإنجليزية مطلوب"
                        CssClass="text-danger" />
                </div>

                <div class="form-group">
                    <label for="ddlProType" class="form-label">نوع المشروع</label>
                    <asp:DropDownList ID="ddlProType" runat="server" CssClass="form-select">
                        <asp:ListItem Value="">اختر النوع</asp:ListItem>
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
                        ErrorMessage="نوع المشروع مطلوب"
                        CssClass="text-danger" />
                </div>

                <div class="form-group">
                    <label for="ddlProPlace" class="form-label">مكان المشروع</label>
                    <asp:DropDownList ID="ddlProPlace" runat="server" CssClass="form-select">
                        <asp:ListItem Value="">اختر المكان</asp:ListItem>
                        <asp:ListItem Value="1">محلي</asp:ListItem>
                        <asp:ListItem Value="2">إقليمي</asp:ListItem>
                        <asp:ListItem Value="3">دولي</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvProPlace" runat="server"
                        ControlToValidate="ddlProPlace"
                        ErrorMessage="مكان المشروع مطلوب"
                        CssClass="text-danger" />
                </div>
            </div>

            <div class="col-md-6">
                <div class="form-group">
                    <label for="txtStartDate" class="form-label">تاريخ البدء</label>
                    <asp:TextBox ID="txtStartDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvStartDate" runat="server"
                        ControlToValidate="txtStartDate"
                        ErrorMessage="تاريخ البدء مطلوب"
                        CssClass="text-danger" />
                </div>

                <div class="form-group">
                    <label for="txtStBudget" class="form-label">الميزانية الأولية</label>
                    <asp:TextBox ID="txtStBudget" runat="server" CssClass="form-control" placeholder="أدخل الميزانية"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvStBudget" runat="server"
                        ControlToValidate="txtStBudget"
                        ErrorMessage="الميزانية الأولية مطلوبة"
                        CssClass="text-danger" />
                </div>

                <div class="form-group">
                    <label for="ddlGovernorate" class="form-label">المحافظة</label>
                    <asp:DropDownList ID="ddlGovernorate" runat="server" CssClass="form-select" />
                    <asp:RequiredFieldValidator ID="rfvGovernorate" runat="server"
                        ControlToValidate="ddlGovernorate"
                        ErrorMessage="المحافظة مطلوبة"
                        CssClass="text-danger" />
                </div>
            </div>
        </div>

        <div class="form-group">
            <label for="txtProAddress" class="form-label">عنوان المشروع</label>
            <asp:TextBox ID="txtProAddress" runat="server" CssClass="form-control" placeholder="أدخل عنوان المشروع"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvProAddress" runat="server"
                ControlToValidate="txtProAddress"
                ErrorMessage="عنوان المشروع مطلوب"
                CssClass="text-danger" />
        </div>

        <div class="form-group">
            <label for="txtProLocationDetail" class="form-label">تفاصيل الموقع</label>
            <asp:TextBox ID="txtProLocationDetail" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" placeholder="أدخل تفاصيل الموقع"></asp:TextBox>
        </div>

        <div class="form-group">
            <label for="txtProMail" class="form-label">البريد الإلكتروني للمشروع</label>
            <asp:TextBox ID="txtProMail" runat="server" CssClass="form-control" TextMode="Email" placeholder="أدخل البريد الإلكتروني"></asp:TextBox>
            <asp:RegularExpressionValidator ID="revProMail" runat="server"
                ControlToValidate="txtProMail"
                ErrorMessage="صيغة البريد الإلكتروني غير صحيحة"
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                CssClass="text-danger" />
        </div>

        <h3 class="mt-4">تفاصيل طلب المشروع</h3>
        <asp:GridView ID="gvRequestDetails" runat="server" CssClass="table table-bordered" AutoGenerateColumns="False" ShowFooter="True">
            <Columns>
                <asp:TemplateField HeaderText="المنظمة">
                    <ItemTemplate>
                        <asp:DropDownList ID="ddlOrganization" runat="server" CssClass="form-control" DataTextField="Firm_NameAr" DataValueField="ID" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="عناصر الطلب">
                    <ItemTemplate>
                        <asp:TextBox ID="txtRequestItems" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="تاريخ الطلب">
                    <ItemTemplate>
                        <asp:TextBox ID="txtRequestDate" runat="server" CssClass="form-control" TextMode="Date" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="btnRemove" runat="server" Text="إزالة" CssClass="btn btn-danger btn-sm" OnClick="btnRemove_Click" />
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:Button ID="btnAdd" runat="server" Text="إضافة صف جديد" CssClass="btn btn-primary btn-sm" OnClick="btnAdd_Click" />
                    </FooterTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

        <div class="mt-4">
            <asp:Button ID="btnSubmit" runat="server" Text="إرسال" CssClass="btn btn-primary" OnClick="btnSubmit_Click" />
        </div>
    </div>
</asp:Content>