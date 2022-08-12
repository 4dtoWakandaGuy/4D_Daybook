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
Set theRange			= theSheet.Range(GETENV("XCEL_RANGE"))

For n = 1 to theRange.Cells.Count  
On Error Resume Next
	theValue			= GETENV("XCEL_VALUE" & n)	
On Error GoTo 0
	theRange.Cells(n).Value = theValue 
Next 
