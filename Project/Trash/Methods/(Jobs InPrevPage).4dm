//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Jobs_InPrevPage
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
	C_BOOLEAN:C305(vFromIn)
	C_LONGINT:C283(xNew)
	C_TEXT:C284($_t_oldMethodName; vButtDisJob)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Jobs_InPrevPage")
vFromIn:=True:C214
If (Read only state:C362([JOB_STAGES:47])=False:C215)
	READ WRITE:C146([ORDER_ITEMS:25])
	OBJECT SET ENABLED:C1123(xNew; True:C214)
	vButtDisJob:=Substring:C12(vButtDisJob; 1; 3)+"   "+Substring:C12(vButtDisJob; 7; 99)
	//vButtDisJob≤4≥:=" "
	//vButtDisJob≤5≥:=" "
	//vButtDisJob≤6≥:=" "
	
	In_ButtChkDis(->vButtDisJob)
	
End if 
ERR_MethodTrackerReturn("Jobs_InPrevPage"; $_t_oldMethodName)
