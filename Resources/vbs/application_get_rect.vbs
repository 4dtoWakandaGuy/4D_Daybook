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

WScript.StdOut.Write "{"
WScript.StdOut.Write Chr(34) & "left" & Chr(34) & ":"
WScript.StdOut.Write objExcelApplication.Left & ","
WScript.StdOut.Write Chr(34) & "top" & Chr(34) & ":"
WScript.StdOut.Write objExcelApplication.Top & ","
WScript.StdOut.Write Chr(34) & "width" & Chr(34) & ":"
WScript.StdOut.Write objExcelApplication.Width & ","
WScript.StdOut.Write Chr(34) & "height" & Chr(34) & ":"
WScript.StdOut.Write objExcelApplication.Height & "}"
