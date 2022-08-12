//%attributes = {}
If (False:C215)
	//Project Method Name:      DIA_GetContactname
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/12/2012 11:02
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Process; $1)
	C_TEXT:C284($_t_ContactName; $_t_oldMethodName; $0; $2; SD2_T_CONTACTNAME)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DIA_GetContactname")


If (Count parameters:C259=0)
	$_l_Process:=New process:C317("DIA_GetContactName"; 128000; "GET CONTACT NAME"; Current process:C322; [DIARY:12]Contact_Code:2)
	While (Process state:C330($_l_Process)>=0)
		DelayTicks(2)
	End while 
	$0:=SD2_T_CONTACTNAME
Else 
	READ ONLY:C145(*)
	
	If ($2#"")
		QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=$2)
		$_t_ContactName:=[CONTACTS:1]Contact_Name:31
	Else 
		$_t_ContactName:=""
	End if 
	SET PROCESS VARIABLE:C370($1; SD2_T_CONTACTNAME; $_t_ContactName)
End if 
ERR_MethodTrackerReturn("DIA_GetContactname"; $_t_oldMethodName)