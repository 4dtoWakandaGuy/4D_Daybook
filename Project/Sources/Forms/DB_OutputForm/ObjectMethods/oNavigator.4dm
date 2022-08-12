If (False:C215)
	//object Name: Object Name:      DB_OutputForm.oNavigator
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:03
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(DB_al_TabNavigation;0)
	//ARRAY TEXT(DB_at_TabNavigation;0)
	C_LONGINT:C283($_l_event; $_l_NewTable; DB_l_CurrentDisplayedForm)
	C_TEXT:C284($_t_oldMethodName; DB_t_ClickedObjectName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ DB_OutputForm.oNavigator"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		DB_t_ClickedObjectName:="DB_at_TabNavigation"
		
		$_l_NewTable:=DB_al_TabNavigation{DB_at_TabNavigation}
		If ($_l_NewTable>0)
			If ($_l_NewTable#DB_l_CurrentDisplayedForm)
			End if 
		End if 
		
		
End case 
ERR_MethodTrackerReturn("OBJ DB_OutputForm.oNavigator"; $_t_oldMethodName)
