If (False:C215)
	//object Name: [SALES_PROJECTION]Target_EntryForm.Field2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [SALES_PROJECTION].Target_EntryForm.Field2"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Data Change:K2:15)
		If ([SALES_PROJECTION:113]ProjectionFromDate:22=!00-00-00!)
			[SALES_PROJECTION:113]ProjectionFromDate:22:=[SALES_PROJECTION:113]ProjectiontoDate:23
		End if 
		If ([SALES_PROJECTION:113]ProjectionFromDate:22>[SALES_PROJECTION:113]ProjectiontoDate:23)
			[SALES_PROJECTION:113]ProjectionFromDate:22:=[SALES_PROJECTION:113]ProjectiontoDate:23
			//     ALERT("Note: The from date has been changed")
			Gen_Alert("Note: The from date has been changed.")
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [SALES_PROJECTION].Target_EntryForm.Field2"; $_t_oldMethodName)
