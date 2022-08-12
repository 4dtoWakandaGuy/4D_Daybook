//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      JobStages InLOI
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/11/2010 19:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($2; vAB; vST; xNew)
	C_TEXT:C284($_t_oldMethodName; $1; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vButtDisSC)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JobStages InLOI")

If (Modified record:C314([ORDER_ITEMS:25]))
	DB_SaveRecord(->[ORDER_ITEMS:25])
	AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
	
End if 
If ($1="A")
	If ([JOBS:26]Use_WIP:47) & (False:C215)  //kmw 23/03/07 - changed that can add/modify order lines from this screen regardless of WIP (Was probably here because it used to be if WIP was on then user was forced to use Time & Cost entry screen....new functionality more flexible and does WIP via diary and order line triggers/process services)
		
		READ ONLY:C145([ORDER_ITEMS:25])
		OBJECT SET ENABLED:C1123(xNew; False:C215)
		
		vButtDisSC:=Substring:C12(vButtDisSC; 1; 3)+"PMO"+Substring:C12(vButtDisSC; 7; 99)
		//vButtDisSC≤4≥:="P"
		//vButtDisSC≤5≥:="M"
		// vButtDisSC≤6≥:="O"
		
		In_ButtChkDis(->vButtDisSC)
		
	Else 
		JobStages_InLEn
	End if 
	
	
	JobStages_InLEn
	QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]State:46=$1; *)
	QUERY:C277([ORDER_ITEMS:25];  | ; [ORDER_ITEMS:25]State:46=""; *)
Else 
	JobStages_InLEn
	QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]State:46=$1; *)
End if 

QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Job_Code:34=[JOB_STAGES:47]Job_Code:1; *)
QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Job_Stage:35=[JOB_STAGES:47]Stage_Code:2)
If ((DB_GetModuleSettingByNUM(Module_Assemblies))>0)
	If (Count parameters:C259>1)
		vAB:=$2
	Else 
		vAB:=0
	End if 
	OrderI_LevelSrc(vAB)
	vST:=0
Else 
	vAB:=0
End if 
ORDER BY:C49([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Sort_Order:26; >)
DB_t_CurrentFormUsage3:="Job"+$1
JST_LoadOrderItems
ERR_MethodTrackerReturn("JobStages InLOI"; $_t_oldMethodName)
