If (False:C215)
	//object Name: [USER]SD2_PersonAdd.Invisible Button2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:25
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Retries; DOC_l_CallEvent; SD2_l_EmailChoiceProc)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_PersonAdd.Invisible Button2"; Form event code:C388)

If (SD2_l_EmailChoiceProc>0)  //Tell the process to end
	$_l_Retries:=0
	While (Semaphore:C143("$SD2NamesCall"))
		$_l_Retries:=$_l_Retries+1
		DelayTicks(2*$_l_Retries)
	End while 
	
	SET PROCESS VARIABLE:C370(SD2_l_EmailChoiceProc; DOC_l_CallEvent; 2)
	BRING TO FRONT:C326(SD2_l_EmailChoiceProc)
	POST OUTSIDE CALL:C329(SD2_l_EmailChoiceProc)
	CLEAR SEMAPHORE:C144("$SD2NamesCall")
End if 
ERR_MethodTrackerReturn("OBJ [USER].SD2_PersonAdd.Invisible Button2"; $_t_oldMethodName)
