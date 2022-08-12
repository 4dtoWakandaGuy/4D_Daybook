//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Comp Letter
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:   09/11/2010 09:54
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(vCM; xApply)
	C_TEXT:C284($_t_CurrentOutputform; $_t_InputForm; $_t_oldMethodName; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Comp Letter")
//Comp Letter
$_t_CurrentOutputform:=WIN_t_CurrentOutputform
If (xApply=1)
	If (vCM=0)
		If (([COMPANIES:2]Sales_Person:29#"") | ([COMPANIES:2]Taken_By:26#""))
			If ((DB_GetModuleSettingByNUM(Module_WPManager)=2) | (DB_GetModuleSettingByNUM(Module_WPManager)=4))
				$_t_InputForm:="Diary_InL13W"
				//DB_CreateNewRecord
				DB_MenuNewRecord("DiaryLetter"; ->[COMPANIES:2]Company_Code:1; ->[CONTACTS:1]Contact_Code:2; ->$_t_InputForm)
				
			Else 
				Gen_Alert("You do not have access to the WP Module"; "Cancel")
			End if 
		End if 
	End if 
End if 

WIN_t_CurrentOutputform:=$_t_CurrentOutputform
ERR_MethodTrackerReturn("Comp Letter"; $_t_oldMethodName)