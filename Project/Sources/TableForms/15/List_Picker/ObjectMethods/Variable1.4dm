If (False:C215)
	//object Name: [USER]List_Picker.Variable1
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
	//ARRAY TEXT(AA_t_ListPickItem;0)
	C_LONGINT:C283(AA_l_ListSelectedItem)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].List_Picker.Variable1"; Form event code:C388)
If (AA_at_ListPickItem>0)
	AA_l_ListSelectedItem:=AA_at_ListPickItem
Else 
	AA_l_ListSelectedItem:=0
End if 
ERR_MethodTrackerReturn("OBJ [USER].List_Picker.Variable1"; $_t_oldMethodName)
