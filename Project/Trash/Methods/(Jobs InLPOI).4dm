//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Jobs_InLPOI
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/12/2009 07:27`Method: Jobs_InLPOI
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(JOB_lb_Stages;0)
	//ARRAY POINTER(JOB_aPtr_OrderItemsSetup;0)
	C_LONGINT:C283($1; vAB; vST; xNew)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vButtDisJob)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Jobs_InLPOI")

If (Modified record:C314([ORDER_ITEMS:25]))
	DB_SaveRecord(->[ORDER_ITEMS:25])
	AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
End if 
If ([JOBS:26]Use_WIP:47) & (False:C215)  //Don't worry if WIP set anymore, 27/03/07 -kmw
	READ ONLY:C145([ORDER_ITEMS:25])
	
	OBJECT SET ENABLED:C1123(xNew; False:C215)
	vButtDisJob:=Substring:C12(vButtDisJob; 1; 3)+"PMO"+Substring:C12(vButtDisJob; 7; 99)
	// vButtDisJob≤4≥:="P"
	// vButtDisJob≤5≥:="M"
	// vButtDisJob≤6≥:="O"
	
	In_ButtChkDis(->vButtDisJob)
	
Else 
	If (Read only state:C362([JOB_STAGES:47])=False:C215)
		READ WRITE:C146([ORDER_ITEMS:25])
		OBJECT SET ENABLED:C1123(xNew; True:C214)
	End if 
End if 
QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Job_Code:34=[JOBS:26]Job_Code:1; *)
QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Job_Stage:35="")
If ((DB_GetModuleSettingByNUM(Module_Assemblies))>0)
	If (Count parameters:C259>0)
		vAB:=$1
	Else 
		vAB:=0
	End if 
	OrderI_LevelSrc(vAB)
	vST:=0
End if 
ORDER BY:C49([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Sort_Order:26; >)

DB_t_CurrentFormUsage3:="Job"
//NG This Section will load the CURRENT order items into an area list area.
//April 2004

If (Form event code:C388=On Load:K2:1)
	
	If (Size of array:C274(JOB_aPtr_OrderItemsSetup)=0)
		//see also Contacts_InLPß
		LBi_ArrDefFill(->JOB_aPtr_OrderItemsSetup; ->JOB_lb_Stages; ->[ORDER_ITEMS:25]Item_Number:27; ->[JOBS:26]Job_Code:1; "411111126"; "Items In13"; 11; "Cost Items"; "Order Item")
		
		
	Else 
		OK:=1
		LBi_Prefs11(->JOB_aPtr_OrderItemsSetup)
	End if 
	LBi_LoadSetup(->JOB_aPtr_OrderItemsSetup; "B")
Else 
	LBi_LoadSetup(->JOB_aPtr_OrderItemsSetup; "P")
End if 
ERR_MethodTrackerReturn("Jobs_InLPOI"; $_t_oldMethodName)
