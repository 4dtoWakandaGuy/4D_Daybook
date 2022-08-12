If (False:C215)
	//object Method Name: Object Name:      [USER].WS_SetManager.Variable4
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/01/2012 19:38
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(GEN_at_Identity;0)
	C_BOOLEAN:C305(<>FindMy)
	C_LONGINT:C283($_l_CurrentProcess; $_l_MacrosProcess; $_l_Retries; s1)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].WS_SetManager.Variable4"; Form event code:C388)
$_l_CurrentProcess:=Current process:C322


$_l_MacrosProcess:=New process:C317("Record_BarSel"; DB_ProcessMemoryinit(2); "Find Macros")
If ($_l_MacrosProcess>0)
	GEN_at_Identity:=1
	DelayTicks(120)
	$_l_Retries:=0
	
	While (Process state:C330($_l_MacrosProcess)>=0)
		$_l_Retries:=$_l_Retries+1
		DelayTicks(2*$_l_Retries)
	End while 
	USE NAMED SELECTION:C332("◊Macros")
	If (s1=1)
		QUERY SELECTION:C341([SCRIPTS:80]; [SCRIPTS:80]Same_Process:6=True:C214; *)
	Else 
		QUERY SELECTION:C341([SCRIPTS:80]; [SCRIPTS:80]Same_Process:6=False:C215; *)
		QUERY SELECTION:C341([SCRIPTS:80];  & ; [SCRIPTS:80]Script_Code:1#"©@"; *)
	End if 
	If (<>FindMy)
		QUERY SELECTION:C341([SCRIPTS:80];  & ; [SCRIPTS:80]Person:5=<>PER_t_CurrentUserInitials)
	Else 
		QUERY SELECTION:C341([SCRIPTS:80])
	End if 
	If (Records in selection:C76([SCRIPTS:80])=0)
		BEEP:C151
	End if 
	Record_BarArr
End if 
ERR_MethodTrackerReturn("OBJ [USER].WS_SetManager.Variable4"; $_t_oldMethodName)
