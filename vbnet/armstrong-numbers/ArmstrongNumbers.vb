Imports System

Public Module ArmstrongNumbers
    Public Function IsArmstrongNumber(ByVal number As Integer) As Boolean
        Dim num As Integer = number
        Dim sum As Integer = 0
        Dim length As Integer = If(number = 0, 1, Int(Math.Log10(Math.Abs(number)) + 1))
        
        While num > 0
            sum += Math.Pow(num Mod 10, length)
            num \= 10
        End While
        
        Return sum = number
    End Function
End Module
