Sub CreateLayout()

Sheets("Sudoku").Select

Cells.Clear

With Range("C3:K11")
    .ColumnWidth = 10
    .RowHeight = 29
    .Font.Size = 20
    .HorizontalAlignment = xlCenter
    .VerticalAlignment = xlCenter
    .Borders.LineStyle = xlContinuous
    .Borders.Weight = xlThin
    End With
    
    Range("F3:H5").Borders(xlEdgeBottom).LineStyle = xlContinuous
    Range("F3:H5").Borders(xlEdgeBottom).Weight = xlThick
    Range("F3:H5").Borders(xlEdgeRight).LineStyle = xlContinuous
    Range("F3:H5").Borders(xlEdgeRight).Weight = xlThick
        
   Range("I3:K5").Borders(xlEdgeBottom).LineStyle = xlContinuous
    Range("I3:K5").Borders(xlEdgeBottom).Weight = xlThick
    
    Range("C6:E8").Borders(xlEdgeBottom).LineStyle = xlContinuous
    Range("C6:E8").Borders(xlEdgeBottom).Weight = xlThick
    Range("C6:E8").Borders(xlEdgeRight).LineStyle = xlContinuous
    Range("C6:E8").Borders(xlEdgeRight).Weight = xlThick
    
    Range("F6:H8").Borders(xlEdgeBottom).LineStyle = xlContinuous
    Range("F6:H8").Borders(xlEdgeBottom).Weight = xlThick
    Range("F6:H8").Borders(xlEdgeRight).LineStyle = xlContinuous
    Range("F6:H8").Borders(xlEdgeRight).Weight = xlThick
    
    Range("C3:E5").Borders(xlEdgeBottom).LineStyle = xlContinuous
    Range("C3:E5").Borders(xlEdgeBottom).Weight = xlThick
    Range("C3:E5").Borders(xlEdgeRight).LineStyle = xlContinuous
    Range("C3:E5").Borders(xlEdgeRight).Weight = xlThick
    
    Range("I6:K8").Borders(xlEdgeBottom).LineStyle = xlContinuous
    Range("I6:K8").Borders(xlEdgeBottom).Weight = xlThick
    
    Range("C9:E11").Borders(xlEdgeRight).LineStyle = xlContinuous
    Range("C9:E11").Borders(xlEdgeRight).Weight = xlThick
    
    Range("F9:H11").Borders(xlEdgeRight).LineStyle = xlContinuous
    Range("F9:H11").Borders(xlEdgeRight).Weight = xlThick


End Sub

Sub AddNumbers()

Dim number As Integer, LoopCount As Integer
Dim GridRow As Integer, GridCol As Integer
Dim CellRow As Integer, CellCol As Integer
Sheets("Sudoku").Select

StartOver:
Range("C3:K11").Value = ""

For number = 1 To 9
For GridRow = 3 To 11 Step 3
For GridCol = 3 To 11 Step 3
LoopCount = 0

    Do
    Randomize
    CellRow = Int((GridRow + 2 - GridRow + 1) * Rnd + GridRow)
    CellCol = Int((GridCol + 2 - GridCol + 1) * Rnd + GridCol)
    
    If Cells(CellRow, CellCol) = "" Then
        If WorksheetFunction.CountIf(Rows(CellRow), number) = 0 And _
        WorksheetFunction.CountIf(Columns(CellCol), number) = 0 Then
        Cells(CellRow, CellCol) = number
        Exit Do
        End If
        End If
        
        LoopCount = LoopCount + 1
        If LoopCount > 99 Then GoTo StartOver
        Loop
        Next GridCol
        Next GridRow
        Next number

End Sub

Sub PlayGame()

Dim number As Integer, LoopCount As Integer
Dim CellRow As Integer, CellCol As Integer
Dim uCell As Integer, Comp As Boolean

Do
    Randomize
    CellRow = Int((11 - 3 + 1) * Rnd + 2)
    CellCol = Int((11 - 3 + 1) * Rnd + 2)
    number = Val(Cells(CellRow, CellCol).Value)
    If number <> 0 Then
        Comp = False
        For uCell = 3 To 11
        'Rows
            If Cells(uCell, CellCol).Value = "" Then
                If WorksheetFunction.CountIf(Rows(uCell), num) = 0 And _
                WorksheetFunction.CountIf(Range(qRng(uCell, CellCol)), num) = 0 Then Comp = True
                End If
                
        'Cols
            If Cells(CellRow, uCell).Value = "" Then
                If WorksheetFunction.CountIf(Columns(uCell), num) = 0 And _
                WorksheetFunction.CountIf(Range(qRng(CellRow, uCell)), num) = 0 Then Comp = True
                End If
            Next uCell
            
            If Comp = False Then
                Cells(CellRow, CellCol).Value = ""
                End If
            End If
            
            LoopCount = LoopCount + 1
            If LoopCount > 299 Then Exit Do
            Loop

End Sub

Function qRng(r As Integer, c As Integer) As String
    If c < 6 Then
        If r < 6 Then
            qRng = "C3:E5"
        ElseIf r < 9 Then
            qRng = "C6:E8"
        Else
            qRng = "C9:E11"
        End If
        
    ElseIf c < 9 Then
            If r < 6 Then
                qRng = "F3:H5"
            ElseIf r < 9 Then
            qRng = "F6:H8"
        Else
            qRng = "F9:H11"
        End If
    Else
            If r < 5 Then
                qRng = "I3:K5"
            ElseIf r < 8 Then
            qRng = "I6:K8"
        Else
            qRng = "I9:K11"
            End If
        End If

End Function