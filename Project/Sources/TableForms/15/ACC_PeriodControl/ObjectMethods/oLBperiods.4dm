If (False:C215)
	//object Name: [USER]ACC_PeriodControl.oLBperiods
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/03/2012 22:18
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(ACC_abo_PeriodMOD;0)
	//ARRAY TEXT(ACC_at_PeriodCodes;0)
	C_LONGINT:C283($_l_Column; $_l_event; $_l_Process; $_l_Row)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].ACC_PeriodControl.oLBperiods"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
	: ($_l_event=On Data Change:K2:15)
		LISTBOX GET CELL POSITION:C971(*; "oLBperiods"; $_l_Column; $_l_Row)
		Case of 
			: ($_l_Column=5) | ($_l_Column=6) | ($_l_Column=7)
				ACC_abo_PeriodMOD{$_l_Row}:=True:C214
				
		End case 
		
	: ($_l_event=On Double Clicked:K2:5)
		LISTBOX GET CELL POSITION:C971(*; "oLBperiods"; $_l_Column; $_l_Row)
		$_l_Process:=New process:C317("ACC_PeriodMod"; 32000; "Edit Period"+ACC_at_PeriodCodes{$_l_Row}; ACC_at_PeriodCodes{$_l_Row}; Current process:C322; *)
		
		
End case 
ERR_MethodTrackerReturn("OBJ [USER].ACC_PeriodControl.oLBperiods"; $_t_oldMethodName)
