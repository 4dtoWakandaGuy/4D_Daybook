If (False:C215)
	//object Name: Object Name:      LAYOUT_CONFIG.oMaxWidthValue
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 21/02/2013 19:10
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(LAY_bo_RecordEdited)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [projectForm]/LAYOUT_CONFIG/oMaxWidthValue"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Data Change:K2:15)
		If (Self:C308->#"Not Set")
			LAY_bo_RecordEdited:=True:C214
			If (Num:C11(Self:C308->)>0)
				If (Num:C11(Self:C308->)<600)
					Gen_Alert("Sorry the minimum this can be set to is 600")
					Self:C308->:="600"
				End if 
			End if 
			
		End if 
End case 
ERR_MethodTrackerReturn("OBJ LAYOUT_CONFIG.oMaxWidthValue"; $_t_oldMethodName)
