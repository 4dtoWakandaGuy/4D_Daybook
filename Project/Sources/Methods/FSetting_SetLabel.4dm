//%attributes = {}
If (False:C215)
	//Project Method Name:      FSetting_SetLabel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(<>FS_at_FormReference;0)
	C_BOOLEAN:C305(<>FS_bo_FSettingsLoaded)
	C_LONGINT:C283($_l_FormReferenceRow)
	C_POINTER:C301($_ptr_Variable)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_oldMethodName; $_t_VariableName; $1; FS_t_SortFieldTXT; WT_t_SortFieldVARNAME)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FSetting_SetLabel")
//this method is needed because setting the text or variable label style outside
//of the form does not cause the label to be display correctly
If (Not:C34(<>FS_bo_FSettingsLoaded))
	FSettings_loadPreferences(<>PER_t_CurrentUserInitials)
End if 
While (Semaphore:C143("$WriteFormsortPref"))
	DelayTicks(2)
End while 
If (<>FS_bo_FSettingsLoaded)
	$_l_FormReferenceRow:=Find in array:C230(<>FS_at_FormReference; $1)
	If ($_l_FormReferenceRow>0)
		
		If (FS_t_SortFieldTXT#"")
			OBJECT SET FONT STYLE:C166(*; "Text@"; Plain:K14:1)
			OBJECT SET FONT STYLE:C166(*; "◊AT@"; Plain:K14:1)
			OBJECT SET FONT STYLE:C166(*; "v@"; Plain:K14:1)
			OBJECT SET FONT STYLE:C166(*; FS_t_SortFieldTXT; Bold:K14:2+Underline:K14:4)
		Else 
			If (WT_t_SortFieldVARNAME#"")
				OBJECT SET FONT STYLE:C166(*; "Text@"; Plain:K14:1)
				OBJECT SET FONT STYLE:C166(*; "◊AT@"; Plain:K14:1)
				OBJECT SET FONT STYLE:C166(*; "v@"; Plain:K14:1)
				$_ptr_Variable:=Get pointer:C304(WT_t_SortFieldVARNAME)
				OBJECT SET FONT STYLE:C166($_ptr_Variable->; Bold:K14:2+Underline:K14:4)
			Else 
				OBJECT SET FONT STYLE:C166(*; "Text@"; Plain:K14:1)
				OBJECT SET FONT STYLE:C166(*; "◊AT@"; Plain:K14:1)
				OBJECT SET FONT STYLE:C166(*; "v@"; Plain:K14:1)
			End if 
			
		End if 
	Else 
		OBJECT SET FONT STYLE:C166(*; "Text@"; Plain:K14:1)
		OBJECT SET FONT STYLE:C166(*; "◊AT@"; Plain:K14:1)
		OBJECT SET FONT STYLE:C166(*; "v@"; Plain:K14:1)
		
	End if 
End if 
CLEAR SEMAPHORE:C144("$WriteFormsortPref")
ERR_MethodTrackerReturn("FSetting_SetLabel"; $_t_oldMethodName)