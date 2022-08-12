//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Letters In
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/09/2009 21:44
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>Email_bo_Enabled; DOC_bo_CheckType)
	C_LONGINT:C283(<>MENU_l_BarModule; MOD_l_CurrentModuleAccess; WS_l_SelDocTemplateClass)
	C_POINTER:C301(VfilePtr)
	C_TEXT:C284($_1; $_t_DocumentWriteType; $_t_oldMethodName; $0; $1; WIN_t_CurrentInputForm)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Letters In")
Start_Process

If (Count parameters:C259>=1)
	$_1:=$1
	WS_l_SelDocTemplateClass:=Num:C11($_1)
Else 
	WS_l_SelDocTemplateClass:=Num:C11($_1)
	$_1:=""
End if 
DOC_bo_CheckType:=True:C214

Case of 
	: (WS_l_SelDocTemplateClass=1)  //letter templates
		MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(<>MENU_l_BarModule)
		$_t_DocumentWriteType:=Letters_FileI(True:C214)
		If ($_t_DocumentWriteType#"")
			Gen_InMid("Enter Letter Template"; "Master"; ->[DOCUMENTS:7])
		End if 
		
	: (WS_l_SelDocTemplateClass=2)  //superreporttemplates
		VFilePtr:=->[CONTACTS:1]
		FORM SET INPUT:C55([DOCUMENTS:7]; "Reports_In13")
		WIN_t_CurrentInputForm:="Reports_In13"
		Gen_InMid("Enter SuperReport Template"; "Master"; ->[DOCUMENTS:7])
	: (WS_l_SelDocTemplateClass=3)  //email templates
		MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(<>MENU_l_BarModule)
		If (<>Email_bo_Enabled)
			FORM SET INPUT:C55([DOCUMENTS:7]; "eMail In13")
			WIN_t_CurrentInputForm:="eMail In13"
			
			Gen_InMid("Enter eMail Template"; "Master"; ->[DOCUMENTS:7])
		Else 
			//   ALERT("Email is Not available, Contact Daybook for a licence")
			Gen_Alert("Email is not available. Contact Daybook for a licence.")
		End if 
		
	: (WS_l_SelDocTemplateClass=5)  //others
		$_t_DocumentWriteType:=Letters_FileI(True:C214)
		If ($_t_DocumentWriteType#"")
			Gen_InMid("Enter Template"; "Master"; ->[DOCUMENTS:7])
		End if 
		
		
	Else 
		$_t_DocumentWriteType:=Letters_FileI(True:C214)
		If ($_t_DocumentWriteType#"")
			Gen_InMid("Enter Letter Template"; "Master"; ->[DOCUMENTS:7])
		End if 
		
End case 
If (Count parameters:C259>1)
	$0:=[DOCUMENTS:7]Document_Code:1
	Process_End
Else 
	Process_End
End if 
ERR_MethodTrackerReturn("Letters In"; $_t_oldMethodName)