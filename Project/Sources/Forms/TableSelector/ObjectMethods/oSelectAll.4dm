If (False:C215)
	//object Method Name: Object Name:      TableSelector.oSelectAll
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
	//ARRAY BOOLEAN(DB_abo_TableSelector;0)
	C_LONGINT:C283($_l_Index; DB_but_SelectAll; $_l_Event; $_l_Index; DB_but_SelectAll; DB_l_AllButtonState)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [projectForm]/TableSelector/oSelectAll"; Form event code:C388)

$_l_Event:=Form event code:C388
Case of 
	: ($_l_Event=On Clicked:K2:4)
		
		
		$_t_oldMethodName:=ERR_MethodTracker("OBJ TableSelector.oSelectAll"; Form event code:C388)
		Case of 
			: (DB_l_AllButtonState=0)
				OBJECT SET TITLE:C194(DB_but_SelectAll; "Deselect All")
				DB_l_AllButtonState:=1
				
			: (DB_l_AllButtonState=1)
				OBJECT SET TITLE:C194(DB_but_SelectAll; "select All")
				DB_l_AllButtonState:=0
		End case 
		For ($_l_Index; 1; Size of array:C274(DB_abo_TableSelector))
			DB_abo_TableSelector{$_l_Index}:=(DB_l_AllButtonState=1)
		End for 
End case 
ERR_MethodTrackerReturn("OBJ TableSelector.oSelectAll"; $_t_oldMethodName)
