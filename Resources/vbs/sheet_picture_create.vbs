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
thePictureFileName		= GETENV("XCEL_PICTURE_FILE_NAME")
theLeftPosition			= GETENV("XCEL_PICTURE_LEFT")
theTopPosition			= GETENV("XCEL_PICTURE_TOP")
theWidth				= GETENV("XCEL_PICTURE_WIDTH")
theHeight				= GETENV("XCEL_PICTURE_HEIGHT")

Set thePicture = theSheet.Shapes.AddPicture(thePictureFileName, False, True, theLeftPosition, theTopPosition, theWidth, theHeight)

WScript.StdOut.Write thePicture.Name
