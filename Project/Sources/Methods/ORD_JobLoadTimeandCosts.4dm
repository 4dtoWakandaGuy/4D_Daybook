//%attributes = {}
If (False:C215)
	//Project Method Name:      ORD_JobLoadTimeandCosts
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
	//ARRAY BOOLEAN(ORD_LB_Diary;0)
	//ARRAY POINTER(ORD_aPtr_LbDISetup;0)
	C_LONGINT:C283($_l_RecordsinSelection)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ORD_JobLoadTimeandCosts")
$_l_RecordsinSelection:=Records in selection:C76([JOB_STAGES:47])
LBi_ArrDefFill(->ORD_aPtr_LbDISetup; ->ORD_LB_Diary; ->[DIARY:12]Diary_Code:3; ->[ORDERS:24]Order_Code:3; "211111126"; "Diary_inT"; 10; "Times"; "Time")
LBi_LoadSetup(->ORD_aPtr_LbDISetup; "B")
ERR_MethodTrackerReturn("ORD_JobLoadTimeandCosts"; $_t_oldMethodName)