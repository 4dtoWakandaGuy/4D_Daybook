If (False:C215)
	//object Method Name: Object Name:      DB_DiaryListingForm.oNavigator
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/01/2013 15:15
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(DB_al_TabNavigation;0)
	//ARRAY TEXT(DB_at_TabNavigation;0)
	C_LONGINT:C283($_l_Event; $_l_NewTableNumber; DB_l_CurrentDisplayedForm)
	C_TEXT:C284($_t_oldMethodName; DB_t_ClickedObjectName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ DB_DiaryListingForm.oNavigator"; Form event code:C388)
$_l_Event:=Form event code:C388
Case of 
	: ($_l_Event=On Clicked:K2:4)
		DB_t_ClickedObjectName:="DB_at_TabNavigation"
		
		$_l_NewTableNumber:=DB_al_TabNavigation{DB_at_TabNavigation}
		If ($_l_NewTableNumber>0)
			If ($_l_NewTableNumber#DB_l_CurrentDisplayedForm)
			End if 
		End if 
		
		
End case 
ERR_MethodTrackerReturn("OBJ DB_DiaryListingForm.oNavigator"; $_t_oldMethodName)
