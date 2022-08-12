//%attributes = {}
If (False:C215)
	//Project Method Name:      PDF995_collectOutput
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/03/2010 16:57
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(PDF_bo_995PrinterResetOK; PDF_bo_995SemaphoreGainedOK)
	C_TEXT:C284(<>PDF995_IniFilePathCopyStr; <>PDF995_IniFilePathStr; <>PDF995_IniFilePathTempStr; $_t_CentralPathToPDF; $_t_oldMethodName; $_t_PathToCollectPDF; $_t_StuctureFIleName; $_t_TempFIleName; $_t_TempPath; $1; PDF995_currentPrinterStr)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PDF995_collectOutput")

$_t_PathToCollectPDF:=$1

If (Is Windows:C1573)
	
	$_t_CentralPathToPDF:=PDF995_targetPathGet
	
	Case of 
		: (PDF995_isTargetReady=False:C215)
			PDF995_errorSet("An error occurred and output cannot be generated")
			
		: (Test path name:C476($_t_CentralPathToPDF)#Is a document:K24:1)
			PDF995_errorSet("An error occurred and output cannot be generated")
			
		Else   //all seems ok
			If (Test path name:C476($_t_PathToCollectPDF)=Is a document:K24:1)
				//DELETE DOCUMENT($_t_PathToCollectPDF)
				PDF995_DoDocument("DELETE DOCUMENT"; $_t_PathToCollectPDF)  //changed kmw 29/10/08 v631b120c (so that Error_Procs can gather more info)
			End if 
			
			//MOVE DOCUMENT($_t_CentralPathToPDF;$_t_PathToCollectPDF)
			PDF995_DoDocument("MOVE DOCUMENT"; $_t_CentralPathToPDF; $_t_PathToCollectPDF)  //changed kmw 29/10/08 v631b120c (so that Error_Procs can gather more info)
	End case 
	
	PDF995_constantsInit
	
	If (Test path name:C476(<>PDF995_IniFilePathStr)=Is a document:K24:1)  //move actual ini file to structurenameINIFile
		$_t_StuctureFIleName:=PDF995_filePathToName(Structure file:C489)
		
		$_t_StuctureFIleName:=Replace string:C233($_t_StuctureFIleName; ".4DB"; "")
		$_t_StuctureFIleName:=Replace string:C233($_t_StuctureFIleName; ".4DC"; "")
		
		//COPY DOCUMENT(◊PDF995_IniFilePathStr;◊PDF995_IniFilePathCopyStr;*)
		PDF995_DoDocument("COPY DOCUMENT"; <>PDF995_IniFilePathStr; <>PDF995_IniFilePathCopyStr; "*")  //changed kmw 29/10/08 v631b120c (so that Error_Procs can gather more info)
		
	End if 
	
	If (Test path name:C476(<>PDF995_IniFilePathTempStr)=Is a document:K24:1)  //move backed up temp ini file to ini file
		$_t_TempFIleName:=PDF995_filePathToName(<>PDF995_IniFilePathTempStr)
		$_t_TempPath:=PDF995_filePathToDirPath(<>PDF995_IniFilePathTempStr)
		
		$_t_TempFIleName:=Replace string:C233($_t_TempFIleName; "Temp_"; "")
		
		//COPY DOCUMENT(◊PDF995_IniFilePathTempStr;$_t_TempPath+$_t_TempFIleName;*)
		PDF995_DoDocument("COPY DOCUMENT"; <>PDF995_IniFilePathTempStr; $_t_TempPath+$_t_TempFIleName; "*")  //changed kmw 29/10/08 v631b120c (so that Error_Procs can gather more info)
		
		
	End if 
	
	If (PDF_bo_995PrinterResetOK)
		PDF995_defaultPrinterSet(PDF995_currentPrinterStr)
	End if 
	
	If (PDF_bo_995SemaphoreGainedOK)
		CLEAR SEMAPHORE:C144("PDF_printing")
	End if 
	
End if 

ERR_MethodTrackerReturn("PDF995_collectOutput"; $_t_oldMethodName)
