Public Class Bob

    Public Function Hey(statement As String) As String
        If statement.Trim() = "" Then
            Return "Fine. Be that way!"
        ElseIf statement.ToUpper() = statement AndAlso statement.ToLower() <> statement Then
            If statement.Trim().EndsWith("?") Then
                Return "Calm down, I know what I'm doing!"
            Else
                Return "Whoa, chill out!"
            End If
        ElseIf statement.Trim().EndsWith("?") Then
            Return "Sure."
        Else
            Return "Whatever."
        End If
    End Function
End Class