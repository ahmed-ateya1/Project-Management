Public Class SiteMaster
    Inherits MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ' Example: Set the application name dynamically
            Dim appName As String = "My Custom Application"
            Dim navbarBrand As HtmlAnchor = CType(FindControl("navbarBrand"), HtmlAnchor)
            If navbarBrand IsNot Nothing Then
                navbarBrand.InnerText = appName
            End If
        End If
    End Sub

    ' Event handler for the Register button
    Protected Sub btnRegister_Click(sender As Object, e As EventArgs) Handles btnRegister.Click
        Response.Write("Register button clicked!")
    End Sub

    ' Event handler for the Delete button
    Protected Sub btnDelete_Click(sender As Object, e As EventArgs) Handles btnDelete.Click
        Response.Write("Delete button clicked!")
    End Sub

    ' Event handler for the Print Reports button
    Protected Sub btnPrintReports_Click(sender As Object, e As EventArgs) Handles btnPrintReports.Click
        Response.Write("Print Reports button clicked!")
    End Sub

    ' Event handler for the Statistics button
    Protected Sub btnStatistics_Click(sender As Object, e As EventArgs) Handles btnStatistics.Click
        Response.Write("Statistics button clicked!")
    End Sub

    ' Event handler for the Project Contracts button
    Protected Sub btnProjectContracts_Click(sender As Object, e As EventArgs) Handles btnProjectContracts.Click
        Response.Write("Project Contracts button clicked!")
    End Sub

    ' Event handler for the Project Documents button
    Protected Sub btnProjectDocuments_Click(sender As Object, e As EventArgs) Handles btnProjectDocuments.Click
        Response.Write("Project Documents button clicked!")
    End Sub
End Class