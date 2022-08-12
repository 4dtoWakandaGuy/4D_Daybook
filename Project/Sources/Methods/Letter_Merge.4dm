//%attributes = {}
If (False:C215)
	//Project Method Name:      Letter_Merge
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/09/2009 21:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(i)
	//C_UNKNOWN(k12003)
	//C_UNKNOWN(vLayCode)
	//C_UNKNOWN(vNo)
	//C_UNKNOWN(vPtr)
	//C_UNKNOWN(vRequest)
	//C_UNKNOWN(Write_2)
	//ARRAY LONGINT(<>SYS_al_TableUniqueField;0)
	C_LONGINT:C283(i; vNo; WRITE_2; ch5)
	C_POINTER:C301(vPtr; $1)
	C_TEXT:C284(DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vLayCode; vRequest; $_t_oldMethodName; DB_t_CurrentFormUsage)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Letter_Merge")


vLayCode:=""
//If (◊Write="SW")  ` SuperWrite OUT 24/04/02 pb
// $r:=SW Print Merge ([DOCUMENTS]Write_;Table($1);3;"Letters_SWDets";3)
//Else
Write_2:=WR New offscreen area:P12000:47  //wr new offscreen area
WR PICTURE TO AREA:P12000:141(Write_2; [DOCUMENTS:7]Write_:5)
If ((ch5=1) & (DB_GetModuleSettingByNUM(31)>1))
	$1:=->[MAILSORT_MAIL:83]
	UNLOAD RECORD:C212([MAILSORT_MAIL:83])
End if 
vNo:=Records in selection:C76($1->)
i:=1
WR SET SELECTION:P12000:3(Write_2; 0; 0)
vPtr:=Field:C253(Table:C252($1); <>SYS_al_TableUniqueField{Table:C252($1)})
If ((Type:C295(vPtr->)=0) | (Type:C295(vPtr->)=24))
	vRequest:=""
	If (DB_t_CurrentFormUsage="SWMerge")  //ie if called from Simple Print Merge (Contacts only)
		WR INSERT EXPRESSION:P12000:24(Write_2; "Letters_SWDets")
	Else 
		WR INSERT EXPRESSION:P12000:24(Write_2; "Letter_Entries")
	End if 
	WR SET DOC PROPERTY:P12000:109(Write_2; wr view references:K12003:17; 0)
	WR PRINT MERGE:P12000:5(Write_2; Table:C252($1); 1)
	WR DELETE OFFSCREEN AREA:P12000:38(Write_2)
	//```
Else 
	Gen_Alert("This file cannot be Merged.  Use the 'Separate' option"; "Cancel")
End if 
//End if
ERR_MethodTrackerReturn("Letter_Merge"; $_t_oldMethodName)
