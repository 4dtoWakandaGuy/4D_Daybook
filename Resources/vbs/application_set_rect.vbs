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
theLeftPosition			= GETENV("XCEL_LEFT")
theTopPosition			= GETENV("XCEL_TOP")
theWidth				= GETENV("XCEL_WIDTH")
theHeight				= GETENV("XCEL_HEIGHT")

objExcelApplication.Left		= theLeftPosition
objExcelApplication.Top			= theTopPosition
objExcelApplication.Width		= theWidth
objExcelApplication.Height		= theHeight
