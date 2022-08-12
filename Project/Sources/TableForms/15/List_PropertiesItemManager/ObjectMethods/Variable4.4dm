If (False:C215)
	//object Name: [USER]List_PropertiesItemManager.Variable4
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
	//ARRAY LONGINT(AA_al_ActionCodes;0)
	//ARRAY TEXT(AA_at_ActionNames;0)
	C_LONGINT:C283($_l_event; AA_l_PropertyCurItemActionCode)
	C_TEXT:C284($_t_oldMethodName; AA_t_PropertyCurrentItemAction)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].List_PropertiesItemManager.Variable4"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		If (AA_at_ActionNames>0)
			AA_t_PropertyCurrentItemAction:=AA_at_ActionNames{AA_at_ActionNames}
			AA_l_PropertyCurItemActionCode:=AA_al_ActionCodes{AA_at_ActionNames}
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [USER].List_PropertiesItemManager.Variable4"; $_t_oldMethodName)
