If (False:C215)
	//object Method Name: Object Name:      ACC_ImportFieldMap.oListBoxFieldMap
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/02/2012 09:38
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(ACC_Datais)
	//C_UNKNOWN(ACC_LastEvent)
	//ARRAY TEXT(ACC_at_DaybookFields;0)
	C_LONGINT:C283($_l_Column; $_l_Event; $_l_Row)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [projectForm]/ACC_ImportFieldMap/oListBoxFieldMap"; Form event code:C388)
$_l_Event:=Form event code:C388
ACC_LastEvent:=$_l_Event
Case of 
	: ($_l_Event=On Data Change:K2:15)
		LISTBOX GET CELL POSITION:C971(*; "oListboxFieldMap"; $_l_Column; $_l_Row)
		Case of 
			: ($_l_Column=2)
				ACC_Datais:=ACC_at_DaybookFields{$_l_Row}
				If (ACC_at_DaybookFields{$_l_Row}="Debit Amount Identifier")
					Gen_Alert("This is not an actual field. Some Banks use an indicator cell to indentify that the amount is a debit amount. It is important that you name the import field as being the content that identifies the content")
				End if 
			Else 
				ACC_Datais:=""
		End case 
End case 
ERR_MethodTrackerReturn("OBJ ACC_ImportFieldMap.oListBoxFieldMap"; $_t_oldMethodName)
