If (False:C215)
	//object Name: [USER]CompanySelect.oIncludeCheckBox
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:12
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(COM_bo_DeDupShowDeleted; SD_bo_OptionSelected)
	C_LONGINT:C283($_l_event; CB_DedupIncludeDeleted)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].CompanySelect.oIncludeCheckBox"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		If (CB_DedupIncludeDeleted=1)
			CANCEL:C270
			SD_bo_OptionSelected:=True:C214
		End if 
		COM_bo_DeDupShowDeleted:=(CB_DedupIncludeDeleted=1)
End case 
ERR_MethodTrackerReturn("OBJ [USER].CompanySelect.oIncludeCheckBox"; $_t_oldMethodName)
