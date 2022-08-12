//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      ZRecord_Edit
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>SCPT_l_RecordEdit)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ZRecord_Edit")
If (<>SCPT_l_RecordEdit>0)
	POST OUTSIDE CALL:C329(<>SCPT_l_RecordEdit)
	BRING TO FRONT:C326(<>SCPT_l_RecordEdit)
Else 
	<>SCPT_l_RecordEdit:=New process:C317("Record_Edit"; DB_ProcessMemoryinit(1); "Macro Editor")
	If (<>SCPT_l_RecordEdit>0)
		Process_StartAr(<>SCPT_l_RecordEdit; "Macro Editor")
	End if 
End if 
ERR_MethodTrackerReturn("ZRecord_Edit"; $_t_oldMethodName)