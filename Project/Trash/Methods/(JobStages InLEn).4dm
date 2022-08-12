//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      JobStages InLEn
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/04/2011 10:18
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(xNew)
	C_TEXT:C284($_t_oldMethodName; vButtDisSC)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JobStages InLEn")
If ((Read only state:C362([ORDER_ITEMS:25])) & (Read only state:C362([JOB_STAGES:47])=False:C215))
	READ WRITE:C146([ORDER_ITEMS:25])
	OBJECT SET ENABLED:C1123(xNew; True:C214)
	vButtDisSC:=Substring:C12(vButtDisSC; 1; 3)+"   "+Substring:C12(vButtDisSC; 7; 99)
	// vButtDisSC≤4≥:=" "
	// vButtDisSC≤5≥:=" "
	// vButtDisSC≤6≥:=" "
	
	In_ButtChkDis(->vButtDisSC)
	
End if 
ERR_MethodTrackerReturn("JobStages InLEn"; $_t_oldMethodName)
