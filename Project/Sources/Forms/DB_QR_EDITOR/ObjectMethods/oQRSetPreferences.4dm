If (False:C215)
	//object Method Name: Object Name:      DB_QR_EDITOR.oQRSetPreferences
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/12/2011 03:02
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_event; $_l_index; $_l_ItemReference; $_l_NumberofColumns; $_l_SelectedListItem; DBQR_l_EDITORAREA; DBQR_l_SetPreferences)
	C_TEXT:C284($_t_ItemText; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ DB_QR_EDITOR.oQRSetPreferences"; Form event code:C388)

$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Clicked:K2:4)
		
		$_l_SelectedListItem:=Selected list items:C379(DBQR_l_SetPreferences)
		If ($_l_SelectedListItem>0)
			GET LIST ITEM:C378(DBQR_l_SetPreferences; *; $_l_ItemReference; $_t_ItemText)
			
			//GET LIST ITEM(DBQR_l_SetPreferences;$_l_SelectedListItem;$_l_ItemReference;$_t_ItemText;$_l_SublistiD;$_bo_Expanded)
			Case of 
				: ($_l_ItemReference=10000)  // No Borders
					$_l_NumberofColumns:=QR Count columns:C764(DBQR_l_EDITORAREA)
					For ($_l_index; 1; $_l_NumberofColumns)
						QR SET BORDERS:C797(DBQR_l_EDITORAREA; $_l_index; -2; 63; 0)
						QR SET BORDERS:C797(DBQR_l_EDITORAREA; $_l_index; -3; 63; 0)
						QR SET BORDERS:C797(DBQR_l_EDITORAREA; $_l_index; -1; 63; 0)
					End for 
					
				: ($_l_ItemReference=10001)  // extra light Borders
					$_l_NumberofColumns:=QR Count columns:C764(DBQR_l_EDITORAREA)
					For ($_l_index; 1; $_l_NumberofColumns)
						QR SET BORDERS:C797(DBQR_l_EDITORAREA; $_l_index; -2; 63; 1)
						QR SET BORDERS:C797(DBQR_l_EDITORAREA; $_l_index; -3; 63; 1)
						QR SET BORDERS:C797(DBQR_l_EDITORAREA; $_l_index; -1; 63; 1)
					End for 
				: ($_l_ItemReference=10002)  // light Borders
					$_l_NumberofColumns:=QR Count columns:C764(DBQR_l_EDITORAREA)
					For ($_l_index; 1; $_l_NumberofColumns)
						QR SET BORDERS:C797(DBQR_l_EDITORAREA; $_l_index; -2; 63; 2)
						QR SET BORDERS:C797(DBQR_l_EDITORAREA; $_l_index; -3; 63; 2)
						QR SET BORDERS:C797(DBQR_l_EDITORAREA; $_l_index; -1; 63; 2)
					End for 
				: ($_l_ItemReference=10003)  // medium  Borders
					$_l_NumberofColumns:=QR Count columns:C764(DBQR_l_EDITORAREA)
					For ($_l_index; 1; $_l_NumberofColumns)
						QR SET BORDERS:C797(DBQR_l_EDITORAREA; $_l_index; -2; 63; 3)
						QR SET BORDERS:C797(DBQR_l_EDITORAREA; $_l_index; -3; 63; 3)
						QR SET BORDERS:C797(DBQR_l_EDITORAREA; $_l_index; -1; 63; 3)
					End for 
				: ($_l_ItemReference=10004)  // Heavy  Borders
					$_l_NumberofColumns:=QR Count columns:C764(DBQR_l_EDITORAREA)
					For ($_l_index; 1; $_l_NumberofColumns)
						QR SET BORDERS:C797(DBQR_l_EDITORAREA; $_l_index; -2; 63; 4)
						QR SET BORDERS:C797(DBQR_l_EDITORAREA; $_l_index; -3; 63; 4)
						QR SET BORDERS:C797(DBQR_l_EDITORAREA; $_l_index; -1; 63; 4)
					End for 
				: ($_l_ItemReference=10005)  // Custom Borders
					QR EXECUTE COMMAND:C791(DBQR_l_EDITORAREA; qr cmd borders:K14900:46)
				: ($_l_ItemReference=20000)
					//QR EXECUTE COMMAND(DBQR_l_EDITORAREA;qr cmd presentation)
				: ($_l_ItemReference=30000)
					//QR EXECUTE COMMAND(DBQR_l_EDITORAREA;qr cmd header and footer)
			End case 
		End if 
		SELECT LIST ITEMS BY POSITION:C381(DBQR_l_SetPreferences; 0)
End case 
ERR_MethodTrackerReturn("OBJ DB_QR_EDITOR.oQRSetPreferences"; $_t_oldMethodName)
