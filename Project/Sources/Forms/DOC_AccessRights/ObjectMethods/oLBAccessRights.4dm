If (False:C215)
	//object Name: Object Name:      DOC_AccessRights.oLBAccessRights
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/06/2012 21:33
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(DOC_abo_PersonDeleteReport;0)
	//ARRAY BOOLEAN(DOC_abo_PersonEditReport;0)
	//ARRAY BOOLEAN(DOC_abo_PersonNoAccess;0)
	//ARRAY BOOLEAN(DOC_abo_PersonRunReport;0)
	//ARRAY BOOLEAN(DOC_lb_AccessRightsPersons;0)
	C_BOOLEAN:C305(Doc_bo_RightsEdit)
	C_LONGINT:C283($_l_Column; $_l_event; $_l_Row)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ DOC_AccessRights.oLBAccessRights"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4) | ($_l_event=On Data Change:K2:15)
		Doc_bo_RightsEdit:=True:C214
		LISTBOX GET CELL POSITION:C971(DOC_lb_AccessRightsPersons; $_l_Column; $_l_Row)
		Case of 
			: ($_l_Column=2)  //NO ACCESS
				If (DOC_abo_PersonNoAccess{$_l_Row})
					DOC_abo_PersonRunReport{$_l_Row}:=False:C215
					DOC_abo_PersonEditReport{$_l_Row}:=False:C215
					DOC_abo_PersonDeleteReport{$_l_Row}:=False:C215
				Else 
					DOC_abo_PersonRunReport{$_l_Row}:=True:C214
				End if 
			: ($_l_Column=3)  //RUN REPORT
				If (DOC_abo_PersonRunReport{$_l_Row})
					DOC_abo_PersonNoAccess{$_l_Row}:=False:C215
				End if 
			: ($_l_Column=4)  //EDIT REPORT
				If (DOC_abo_PersonEditReport{$_l_Row})
					DOC_abo_PersonNoAccess{$_l_Row}:=False:C215
				End if 
			: ($_l_Column=4)  //DELETE REPORT
				If (DOC_abo_PersonDeleteReport{$_l_Row})
					DOC_abo_PersonNoAccess{$_l_Row}:=False:C215
				End if 
		End case 
	Else 
		
End case 
ERR_MethodTrackerReturn("OBJ DOC_AccessRights.oLBAccessRights"; $_t_oldMethodName)
