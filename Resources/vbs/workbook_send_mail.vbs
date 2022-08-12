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
theRecipients		= GETENV("XCEL_WORKBOOK_MAIL_RECIPIENTS")
theSubject			= GETENV("XCEL_WORKBOOK_MAIL_SUBJECT")

objExcelApplication.DisplayAlerts = False
theWorkbook.SaveAs ,,,,,,2
theWorkbook.SendMail theRecipients, theSubject
theWorkbook.SaveAs ,,,,,,1
objExcelApplication.DisplayAlerts = True
