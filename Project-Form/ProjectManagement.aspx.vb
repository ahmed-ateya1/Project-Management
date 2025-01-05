Imports System.Data.OleDb

Public Class ProjectManagement
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            LoadGovernorateData()
            LoadOrganizationData()
            AddNewRow()
        End If
    End Sub

    Private Sub LoadGovernorateData()
        Using conn As New OleDbConnection(ConfigurationManager.ConnectionStrings("AccessConnection").ConnectionString)
            Try
                conn.Open()
                Dim cmd As New OleDbCommand("SELECT ID, Name FROM Governorate_Info", conn)
                Dim dt As New DataTable()
                Dim adapter As New OleDbDataAdapter(cmd)
                adapter.Fill(dt)

                ddlGovernorate.DataSource = dt
                ddlGovernorate.DataTextField = "Name"
                ddlGovernorate.DataValueField = "ID"
                ddlGovernorate.DataBind()
                ddlGovernorate.Items.Insert(0, New ListItem("Select Governorate", ""))
            Catch ex As Exception
                ShowError("Error loading governorate data: " & ex.Message)
            End Try
        End Using
    End Sub

    Private Sub LoadOrganizationData()
        Using conn As New OleDbConnection(ConfigurationManager.ConnectionStrings("AccessConnection").ConnectionString)
            Try
                conn.Open()
                Dim cmd As New OleDbCommand("SELECT ID, Firm_NameAr FROM Organization_Info", conn)
                Dim dt As New DataTable()
                Dim adapter As New OleDbDataAdapter(cmd)
                adapter.Fill(dt)

                ' Bind the dropdown in the GridView
                For Each row As GridViewRow In gvRequestDetails.Rows
                    If row.RowType = DataControlRowType.DataRow Then
                        Dim ddlOrganization As DropDownList = DirectCast(row.FindControl("ddlOrganization"), DropDownList)
                        ddlOrganization.DataSource = dt
                        ddlOrganization.DataTextField = "Firm_NameAr"
                        ddlOrganization.DataValueField = "ID"
                        ddlOrganization.DataBind()
                    End If
                Next
            Catch ex As Exception
                ShowError("Error loading organization data: " & ex.Message)
            End Try
        End Using
    End Sub

    Protected Sub btnAdd_Click(sender As Object, e As EventArgs)
        AddNewRow()
    End Sub

    Private Sub AddNewRow()
        Dim dt As DataTable = GetRequestDetailsTable()
        dt.Rows.Add(dt.NewRow())
        gvRequestDetails.DataSource = dt
        gvRequestDetails.DataBind()
        LoadOrganizationData() ' Reload organization data for the new row
    End Sub

    Protected Sub btnRemove_Click(sender As Object, e As EventArgs)
        Dim button As Button = DirectCast(sender, Button)
        Dim row As GridViewRow = DirectCast(button.NamingContainer, GridViewRow)
        Dim dt As DataTable = GetRequestDetailsTable()
        dt.Rows.RemoveAt(row.RowIndex)
        gvRequestDetails.DataSource = dt
        gvRequestDetails.DataBind()
        If dt.Rows.Count = 0 Then
            AddNewRow()
        End If
    End Sub

    Private Function GetRequestDetailsTable() As DataTable
        Dim dt As New DataTable()
        If ViewState("RequestDetails") Is Nothing Then
            dt.Columns.Add("OrganizationID", GetType(Integer))
            dt.Columns.Add("ExpertID", GetType(Integer))
            dt.Columns.Add("RequestItems", GetType(String))
            dt.Columns.Add("RequestDate", GetType(DateTime))
            ViewState("RequestDetails") = dt
        Else
            dt = DirectCast(ViewState("RequestDetails"), DataTable)
        End If
        Return dt
    End Function

    Protected Sub btnSubmit_Click(sender As Object, e As EventArgs)
        If Page.IsValid Then
            Using conn As New OleDbConnection(ConfigurationManager.ConnectionStrings("AccessConnection").ConnectionString)
                Try
                    conn.Open()
                    Dim transaction As OleDbTransaction = conn.BeginTransaction()

                    Try
                        ' Insert Project Info
                        Dim cmdProject As New OleDbCommand("INSERT INTO Project_Info (ProjectNameAr, ProjectNameEn, Pro_Type, " &
                        "Pro_Place, St_Date, Customer_ID, St_Budget, Gov_COD, Pro_Address, Pro_LocationDetail, Pro_Mail) " &
                        "VALUES (@ProjectNameAr, @ProjectNameEn, @ProType, @ProPlace, @StDate, @CustomerID, @StBudget, " &
                        "@GovCOD, @ProAddress, @ProLocationDetail, @ProMail)", conn, transaction)

                        With cmdProject.Parameters
                            .AddWithValue("@ProjectNameAr", txtProjectNameAr.Text)
                            .AddWithValue("@ProjectNameEn", txtProjectNameEn.Text)
                            .AddWithValue("@ProType", Integer.Parse(ddlProType.SelectedValue))
                            .AddWithValue("@ProPlace", Integer.Parse(ddlProPlace.SelectedValue))
                            .AddWithValue("@StDate", DateTime.Parse(txtStartDate.Text))
                            .AddWithValue("@CustomerID", Integer.Parse(txtCustomerID.Text))
                            .AddWithValue("@StBudget", txtStBudget.Text)
                            .AddWithValue("@GovCOD", Integer.Parse(ddlGovernorate.SelectedValue))
                            .AddWithValue("@ProAddress", txtProAddress.Text)
                            .AddWithValue("@ProLocationDetail", txtProLocationDetail.Text)
                            .AddWithValue("@ProMail", txtProMail.Text)
                        End With

                        cmdProject.ExecuteNonQuery()

                        ' Get the last inserted Project ID
                        Dim cmdLastID As New OleDbCommand("SELECT @@IDENTITY", conn, transaction)
                        Dim projectID As Integer = Convert.ToInt32(cmdLastID.ExecuteScalar())

                        ' Insert Project Request Details
                        For Each row As GridViewRow In gvRequestDetails.Rows
                            If row.RowType = DataControlRowType.DataRow Then
                                Dim ddlOrganization As DropDownList = DirectCast(row.FindControl("ddlOrganization"), DropDownList)
                                Dim txtExpertID As TextBox = DirectCast(row.FindControl("txtExpertID"), TextBox)
                                Dim txtRequestItems As TextBox = DirectCast(row.FindControl("txtRequestItems"), TextBox)
                                Dim txtRequestDate As TextBox = DirectCast(row.FindControl("txtRequestDate"), TextBox)

                                If Not String.IsNullOrEmpty(ddlOrganization.SelectedValue) AndAlso
                                   Not String.IsNullOrEmpty(txtExpertID.Text) AndAlso
                                   Not String.IsNullOrEmpty(txtRequestItems.Text) AndAlso
                                   Not String.IsNullOrEmpty(txtRequestDate.Text) Then

                                    Dim cmdRequest As New OleDbCommand("INSERT INTO Project_Request (Project_ID, Organization_ID, Expert_ID, Pro_Request_Items, Request_Date) " &
                                    "VALUES (@ProjectID, @OrganizationID, @ExpertID, @RequestItems, @RequestDate)", conn, transaction)

                                    With cmdRequest.Parameters
                                        .AddWithValue("@ProjectID", projectID)
                                        .AddWithValue("@OrganizationID", Integer.Parse(ddlOrganization.SelectedValue))
                                        .AddWithValue("@ExpertID", Integer.Parse(txtExpertID.Text))
                                        .AddWithValue("@RequestItems", txtRequestItems.Text)
                                        .AddWithValue("@RequestDate", DateTime.Parse(txtRequestDate.Text))
                                    End With

                                    cmdRequest.ExecuteNonQuery()
                                End If
                            End If
                        Next

                        ' Commit transaction
                        transaction.Commit()
                        ShowSuccess("Project and request details saved successfully.")

                    Catch ex As Exception
                        transaction.Rollback()
                        ShowError("Error saving project details: " & ex.Message)
                    End Try

                Catch ex As Exception
                    ShowError("Database connection error: " & ex.Message)
                End Try
            End Using
        End If
    End Sub

    Private Sub ShowError(message As String)
        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Error", $"alert('{message}');", True)
    End Sub

    Private Sub ShowSuccess(message As String)
        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Success", $"alert('{message}');", True)
    End Sub
End Class