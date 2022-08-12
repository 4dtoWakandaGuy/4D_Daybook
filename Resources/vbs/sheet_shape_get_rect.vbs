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
Set theWorkbook		= objExcelApplication.Workbooks(GETENV("XCEL_WORKBOOK_NAME"))
Set theSheet			= theWorkbook.Sheets(GETENV("XCEL_SHEET_NAME"))
Set theShape			= theSheet.Shapes(GETENV("XCEL_SHAPE_NAME"))

WScript.StdOut.Write "{"
WScript.StdOut.Write Chr(34) & "left" & Chr(34) & ":"
WScript.StdOut.Write theShape.Left & ","
WScript.StdOut.Write Chr(34) & "top" & Chr(34) & ":"
WScript.StdOut.Write theShape.Top & ","
WScript.StdOut.Write Chr(34) & "width" & Chr(34) & ":"
WScript.StdOut.Write theShape.Width & ","
WScript.StdOut.Write Chr(34) & "height" & Chr(34) & ":"
WScript.StdOut.Write theShape.Height & "}"
