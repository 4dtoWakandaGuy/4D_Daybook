If (False:C215)
	//object Name: [LIST_LAYOUTS]Layout_In.Popup Drop down List10
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/11/2009 16:26
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SVS_at_PreviewDateString;0)
	C_LONGINT:C283($_l_Type)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [LIST_LAYOUTS].Layout_In.Popup Drop down List10"; Form event code:C388)
If (SVS_at_PreviewDateString=0)
	SVS_at_PreviewDateString:=[LIST_LAYOUTS:96]Footer:14
Else 
	If ([LIST_LAYOUTS:96]Table_Number:2>0)
		$_l_Type:=Type:C295(Field:C253([LIST_LAYOUTS:96]Table_Number:2; [LIST_LAYOUTS:96]Field_Number:3)->)
		If (($_l_Type=1) | ($_l_Type=8) | ($_l_Type=9) | ($_l_Type=11) | (SVS_at_PreviewDateString<3))
			[LIST_LAYOUTS:96]Footer:14:=SVS_at_PreviewDateString
		Else 
			Gen_Alert("That type of Footer is not valid unless the Field specified above is numerical"; "Try again")
			SVS_at_PreviewDateString:=[LIST_LAYOUTS:96]Footer:14
		End if 
	Else 
		Gen_Alert("You may not set a footer on this type of Definition")
		
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [LIST_LAYOUTS].Layout_In.Popup Drop down List10"; $_t_oldMethodName)
