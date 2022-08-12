Function GETENV(variableName)
	
	Set objShell 		= WScript.CreateObject("WScript.Shell")
	Set theVariable 	= objShell.Environment("PROCESS")
	GETENV 			= theVariable(variableName)
	Set objShell 		= Nothing

end Function

Function GETAPP(applicationName)

	On Error Resume Next
	Set GETAPP		 = GetObject(, applicationName)
	If Err.Number <> 0 Then
		Set GETAPP 	= CreateObject(applicationName) 
	End If
	On Error GoTo 0

end Function

Set objExcelApplication	= GETAPP("Excel.Application")
Set theWorkbook			= objExcelApplication.Workbooks(GETENV("XCEL_WORKBOOK_NAME"))
Set theSheet			= theWorkbook.Sheets(GETENV("XCEL_SHEET_NAME"))
Set theRange			= theSheet.Range(GETENV("XCEL_RANGE"))
theBorderType			= CLng(GETENV("XCEL_RANGE_BORDER_TYPE"))

Set theBorders			= theRange.Borders(theBorderType)

WScript.StdOut.Write "{"
WScript.StdOut.Write Chr(34) & "style" & Chr(34) & ":"
WScript.StdOut.Write theBorders.LineStyle & ","
WScript.StdOut.Write Chr(34) & "weight" & Chr(34) & ":"
WScript.StdOut.Write theBorders.Weight & ","
WScript.StdOut.Write Chr(34) & "color" & Chr(34) & ":"
WScript.StdOut.Write theBorders.ColorIndex & "}"