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
Set theWindow			= theWorkbook.Windows(GETENV("XCEL_WINDOW_CAPTION"))
theLeftPosition			= GETENV("XCEL_WINDOW_LEFT")
theTopPosition			= GETENV("XCEL_WINDOW_TOP")
theWidth				= GETENV("XCEL_WINDOW_WIDTH")
theHeight				= GETENV("XCEL_WINDOW_HEIGHT")

theWindow.Left			= theLeftPosition
theWindow.Top			= theTopPosition
theWindow.Width			= theWidth
theWindow.Height		= theHeight
