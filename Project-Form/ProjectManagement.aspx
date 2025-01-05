<%@ Page Language="VB" AutoEventWireup="true" CodeBehind="ProjectManagement.aspx.vb"
    Inherits="Project_Form.ProjectManagement" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .form-container {
            background-color: #ffffff;
            padding: 2rem;
            border-radius: 10px;
            min-width: 100%;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .form-label {
            font-weight: 600;
            color: #495057;
            margin-bottom: 0.5rem;
        }

        .form-control,
        .form-select {
            border-radius: 5px;
            border: 1px solid #ced4da;
            padding: 0.5rem;
            font-size: 0.9rem;
            width: 100%;
        }

        .form-control:focus,
        .form-select:focus {
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

        /* Move dropdown arrow to the left for RTL */
        .form-select {
            appearance: none; /* Remove default arrow */
            background-image: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="black" width="18px" height="18px"><path d="M7 10l5 5 5-5z"/></svg>'); /* Custom arrow */
            background-repeat: no-repeat;
            background-position: left 0.75rem center; /* Position arrow on the left */
            padding-left: 2.5rem; /* Add padding to accommodate the arrow */
            text-align: right; /* Align text to the right */
        }

        /* Ensure full width for form groups */
        .form-group.row .col-md-6 {
            flex: 0 0 50%; /* Each column takes 50% of the row */
            max-width: 50%; /* Ensure it doesn't exceed 50% */
        }

        /* Enhance the GridView styling */
        .grid-view-container {
            margin-top: 2rem;
        }

        .grid-view-container .table {
            width: 100%;
            border: 1px solid #dee2e6; /* Add a border to the table */
            border-radius: 10px; /* Rounded corners */
            overflow: hidden; /* Ensure rounded corners are applied */
        }

        .grid-view-container .table th {
            background-color: transparent; /* Remove blue background */
            color: #495057; /* Dark text color */
            border-bottom: 2px solid #dee2e6; /* Add a border below the header */
            padding: 0.75rem;
            text-align: right; /* Align text to the right for RTL */
        }

        .grid-view-container .table td {
            background-color: #ffffff; /* White background for cells */
            border-bottom: 1px solid #dee2e6; /* Add a border below each row */
            padding: 0.75rem;
            text-align: right; /* Align text to the right for RTL */
        }

        .grid-view-container .table tr:hover td {
            background-color: #f8f9fa; /* Light gray background on hover */
        }

        .grid-view-container .table .btn {
            margin: 0.25rem;
        }
    </style>

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
                            <asp:TextBox ID="txtRequestDate" runat="server" CssClass="form-control" TextMode="Date" />
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