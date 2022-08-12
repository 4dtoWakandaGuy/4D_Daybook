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
theLockAspectRatioProperty	= GETENV("XCEL_SHAPE_LOCK_ASPECT_RATIO")

If theLockAspectRatioProperty = "True" Then
	theShape.LockAspectRatio	= -1
Else
	theShape.LockAspectRatio	= 0
End If
