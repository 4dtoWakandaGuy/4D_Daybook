//%attributes = {}
If (False:C215)
	//Project Method Name:      Remote_ImShow
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:   28/11/2010 18:30
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(GEN_at_Name;0)
	//ARRAY TEXT(GEN_at_RecordCode;0)
	C_BOOLEAN:C305(<>RemShowData)
	C_LONGINT:C283(<>Process; <>SYS_l_CancelProcess; $_l_PersonRow; i)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Remote_ImShow")
If ((<>RemShowData) & (<>SYS_l_CancelProcess#<>Process))
	$_l_PersonRow:=Find in array:C230(GEN_at_RecordCode; [PERSONNEL:11]Initials:1)
	If (i>0)
		If (GEN_at_Name{$_l_PersonRow}#"")
			OK:=1
			If (Records in selection:C76([PERSONNEL:11])>1)
				Gen_Confirm("Do you want to View "+[PERSONNEL:11]Initials:1+"'s data?"; "Yes"; "No")
			End if 
			If (OK=1)
				Remote_ImShow2(->[COMPANIES:2]; "New Comp"; "Mod Comp"; "Companies"; "Companies_File"; "CMaster"; "C"; "Not Comp"; ->$_l_PersonRow)
				Remote_ImShow2(->[CONTACTS:1]; "New Cont"; "Mod Cont"; "Contacts"; "Contacts_File"; "OMaster"; "O"; "Not Cont"; ->$_l_PersonRow)
				Remote_ImShow2(->[PRODUCTS:9]; "New Prod"; "Mod Prod"; "Products"; "Products_File"; "Master"; "P"; "Not Prod"; ->$_l_PersonRow)
				If ((DB_GetModuleSettingByNUM(Module_DiaryManager))>1)
					Remote_ImShow2(->[DIARY:12]; "New Diary"; "Mod Diary"; "Diary Items"; "Diary_File"; "DMaster"; "D"; "Not Diary"; ->$_l_PersonRow)
				End if 
				If ((DB_GetModuleSettingByNUM(Module_Enquiries))>1)
					Remote_ImShow2(->[ORDERS:24]; "New Ord"; "Mod Ord"; "Orders"; "OrdersV_File"; "OrMaster"; "R"; "Not Ord"; ->$_l_PersonRow)
					
				End if 
				If ((DB_GetModuleSettingByNUM(Module_WPManager))>1)
					Remote_ImShow2(->[DOCUMENTS:7]; "New Doc"; "Mod Doc"; "Documents"; "Letters_File"; "Master"; "L"; "Not Doc"; ->$_l_PersonRow)
					
				End if 
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Remote_ImShow"; $_t_oldMethodName)
