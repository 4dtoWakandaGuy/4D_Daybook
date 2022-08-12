//%attributes = {}
If (False:C215)
	//Project Method Name:      PDF995_batchFileSet
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
	C_BOOLEAN:C305($_bo_CreateBatchFIle; $_bo_OK; $_bo_SetINIFile; $3)
	C_TEXT:C284(<>PDF995_batchFilePathStr; $_t_BatchFile; $_t_BatchFileContents; $_t_LockedFlagFIlePath; $_t_oldMethodName; $1; $2; PDF_t_995FileContent)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PDF995_batchFileSet")


If (Count parameters:C259>0)
	$_t_BatchFile:=$1
Else 
	$_t_BatchFile:=""
End if 
//
If (Count parameters:C259>1)
	$_t_LockedFlagFIlePath:=$2
Else 
	$_t_LockedFlagFIlePath:=""
End if 
//
If (Count parameters:C259>2)
	$_bo_SetINIFile:=$3
Else 
	$_bo_SetINIFile:=False:C215
End if 

If (Is Windows:C1573)
	
	PDF995_constantsInit
	
	If ($_t_BatchFile="")
		$_t_BatchFile:=PDF995_batchFileGet
		
	Else 
		<>PDF995_batchFilePathStr:=$_t_BatchFile
	End if 
	
	If ($_t_LockedFlagFIlePath="")
		$_t_LockedFlagFIlePath:=PDF995_processingFileGet
	End if 
	
	$_t_BatchFileContents:="DEL "+Char:C90(Double quote:K15:41)+$_t_LockedFlagFIlePath+Char:C90(Double quote:K15:41)
	
	Case of 
		: (Test path name:C476($_t_BatchFile)=Is a document:K24:1)
			$_bo_OK:=PDF995_fileContentGet($_t_BatchFile; ->PDF_t_995FileContent)
			//UNICODE TEST
			$_bo_CreateBatchFIle:=(($_bo_OK) & (Position:C15($_t_BatchFileContents; PDF_t_995FileContent; *)=0))
			
			If ($_bo_CreateBatchFIle)
				//DELETE DOCUMENT($_t_BatchFile)
				PDF995_DoDocument("DELETE DOCUMENT"; $_t_BatchFile)  //changed kmw 29/10/08 v631b120c (so that Error_Procs can gather more info)
				
			End if 
		Else 
			$_bo_CreateBatchFIle:=True:C214
	End case 
	
	If ($_bo_CreateBatchFIle)
		//create the batch file if it doesn't exist
		PDF_t_995FileContent:=$_t_BatchFileContents
		$_bo_OK:=PDF995_fileContentSet($_t_BatchFile; ->PDF_t_995FileContent)
		
	End if 
	
	//set batch file ref in INI file as batch file path might be changed now
	//If (($_bo_SetINIFile) & (Test path name(PDF995_iNIFilePathGet )=Is a document ))
	//$_bo_OK:=PDF995_fileContentGet (PDF995_iNIFilePathGet ;->PDF_t_995FileContent)
	If (($_bo_SetINIFile) & (Test path name:C476(PDF995_iNIFilePathGet)=Is a document:K24:1))  // set in ini file already
		PDF995_iNIConfigSetParams
	End if 
	//End if
End if 

ERR_MethodTrackerReturn("PDF995_batchFileSet"; $_t_oldMethodName)
