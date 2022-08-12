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
theTitle				= GETENV("XCEL_CHART_TITLE")
theLeftPosition			= GETENV("XCEL_CHART_LEFT")
theTopPosition			= GETENV("XCEL_CHART_TOP")
theWidth				= GETENV("XCEL_CHART_WIDTH")
theHeight				= GETENV("XCEL_CHART_HEIGHT")

Set theChart = theSheet.ChartObjects.Add(theLeftPosition, theTopPosition, theWidth, theHeight)
theChart.Chart.ChartWizard theSheet.Range(GETENV("XCEL_RANGE")),,,,,,, theTitle	

WScript.StdOut.Write theChart.Name