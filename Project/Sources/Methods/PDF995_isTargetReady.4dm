//%attributes = {}
If (False:C215)
	//Project Method Name:      PDF995_isTargetReady
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
	C_BOOLEAN:C305($_bo_ExitLoop; $0)
	C_LONGINT:C283($_l_TimeOutTicks; $_l_TimeStartTicks)
	C_TEXT:C284($_t_lockedFlagFilePathStr; $_t_oldMethodName; $_t_ResultSTR)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PDF995_isTargetReady")

$_t_ResultSTR:="ERR"

If (Is Windows:C1573)
	
	$_bo_ExitLoop:=True:C214
	$_t_lockedFlagFilePathStr:=PDF995_processingFileGet
	
	PDF995_batchFileSet(PDF995_batchFileGet; $_t_lockedFlagFilePathStr)
	
	$_l_TimeStartTicks:=Tickcount:C458
	$_l_TimeOutTicks:=60*60*2
	
	Repeat 
		Case of 
			: (Process aborted:C672)
				$_bo_ExitLoop:=True:C214  //this process is aborted quit asap
				
			: (PDF995_isEnabled=False:C215)
				$_bo_ExitLoop:=True:C214  //PDF995 is not enabled so no point going any further
				
			: (Test path name:C476(PDF995_batchFileGet)#Is a document:K24:1)  //Error no batch file defined created
				PDF995_errorSet("Pdf batch file creation process failed.")
				$_bo_ExitLoop:=True:C214
				
			: ((Tickcount:C458-$_l_TimeStartTicks)>$_l_TimeOutTicks)  //after 2 minutes alert and return err as PDF couldn't be created
				PDF995_errorSet("Pdf file creation process failed after 2 minutes.")
				$_bo_ExitLoop:=True:C214
				
			: (Test path name:C476($_t_lockedFlagFilePathStr)=Is a document:K24:1)  //flag file is still there wait in loop until it is deleted by batch file
				DELAY PROCESS:C323(Current process:C322; 60*1)  //check every second
				$_bo_ExitLoop:=False:C215
				
			Else   //if flag file has been deleted - PDF created exit
				$_bo_ExitLoop:=True:C214
				$_t_ResultSTR:="OK"
		End case 
	Until ($_bo_ExitLoop)
End if 

$0:=$_t_ResultSTR="OK"

ERR_MethodTrackerReturn("PDF995_isTargetReady"; $_t_oldMethodName)
