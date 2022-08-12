If (False:C215)
	//object Name: [USER]Gen_PopUpChoice.Variable3
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:13
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(GEN_at_DropDownMenu;0)
	//ARRAY TEXT(GEN_at_LongPopUp;0)
	C_BOOLEAN:C305(POP_bo_ShowLongString; Gen_bo_Create)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].Gen_PopUpChoice.Variable3"; Form event code:C388)
If (POP_bo_ShowLongString)
	If (GEN_at_LongPopUp>0)
		Gen_bo_Create:=False:C215
		CANCEL:C270
	Else   //added 1/07/08 -kmw
		//shouldn't be needed but just in case (should never be left with no value selected because default value is pre-selected)
		//Gen_Alert ("Please select how many records you wish to reduce your result to before continuin"+"g (or click cancel).")
		//kmw 21/08/08, changed to more generic message (realised that this functionality is of course used in others places other than diary history window).
		Gen_Alert("Please select an option before continuin"+"g (or click cancel).")
	End if 
Else 
	
	If (GEN_at_DropDownMenu>0)
		Gen_bo_Create:=False:C215
		CANCEL:C270
	Else   //added 1/07/08 -kmw
		//shouldn't be needed but just in case (should never be left with no value selected because default value is pre-selected)
		//Gen_Alert ("Please select how many records you wish to reduce your result to before continuin"+"g (or click cancel).")
		//kmw 21/08/08, changed to more generic message (realised that this functionality is of course used in others places other than diary history window).
		Gen_Alert("Please select an option before continuin"+"g (or click cancel).")
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [USER].Gen_PopUpChoice.Variable3"; $_t_oldMethodName)
