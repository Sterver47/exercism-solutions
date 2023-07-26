Public Class Allergies
    Private Shared ReadOnly _allergens As New List(Of String) From {
        "eggs",         ' 1 << 0 = 00000001 = 1
        "peanuts",      ' 1 << 1 = 00000010 = 2
        "shellfish",    ' 1 << 2 = 00000100 = 4
        "strawberries", ' 1 << 3 = 00001000 = 8
        "tomatoes",     ' 1 << 4 = 00010000 = 16
        "chocolate",    ' 1 << 5 = 00100000 = 32
        "pollen",       ' 1 << 6 = 01000000 = 64
        "cats"          ' 1 << 7 = 10000000 = 128
    }

    Private _listOfAllergens As New List(Of String)

    Public Sub New(score As Integer)
        For i as Integer = 0 To _allergens.Count()-1
            If score And (1 << i) Then
                _listOfAllergens.Add(_allergens(i))
            End If
        Next
    End Sub

    Public Function AllergicTo(allergy As String) As Boolean
        Return _listOfAllergens.Contains(allergy)
    End Function

    Public Function List() As IList(Of String)
        Return _listOfAllergens
    End Function
End Class