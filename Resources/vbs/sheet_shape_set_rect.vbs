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
theLeftPosition			= GETENV("XCEL_SHAPE_LEFT")
theTopPosition			= GETENV("XCEL_SHAPE_TOP")
theWidth				= GETENV("XCEL_SHAPE_WIDTH")
theHeight				= GETENV("XCEL_SHAPE_HEIGHT")

theShape.Left			= theLeftPosition
theShape.Top			= theTopPosition
theShape.Width			= theWidth
theShape.Height		= theHeight
