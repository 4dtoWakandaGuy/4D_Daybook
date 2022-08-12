//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Diary_FileL
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/11/2010 09:34
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($0)
	C_LONGINT:C283($1; MOD_l_CurrentModuleAccess; vD)
	C_TEXT:C284(<>SYS_t_4DWriteType; $_t_DocumentWriteType; $_t_oldMethodName; vOrdTitle; WIN_t_CurrentInputForm; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_FileL")

$0:=True:C214
If (Count parameters:C259>=1)
	Case of 
		: ($1=1)
			$_t_DocumentWriteType:=Documents_4DWriteAccessType(True:C214)
			If ($_t_DocumentWriteType="WS")
				$_t_DocumentWriteType:="W"
			End if 
		: ($1=2)
			$_t_DocumentWriteType:=Documents_4DWriteAccessType(True:C214)
			If ($_t_DocumentWriteType="WS")
				$_t_DocumentWriteType:="W"
			End if 
		: ($1=3)
			$_t_DocumentWriteType:="E"
			FORM SET INPUT:C55([DIARY:12]; "Diary_InEmail")
			WIN_t_CurrentInputForm:="Diary_InEmail"
		Else 
			$_t_DocumentWriteType:=Documents_4DWriteAccessType(True:C214)
			If ($_t_DocumentWriteType="WS")
				$_t_DocumentWriteType:="W"
			End if 
			FORM SET INPUT:C55([DIARY:12]; "Diary_InL13"+$_t_DocumentWriteType)  //NG April 2004 removed reference to ◊screen
			WIN_t_CurrentInputForm:="Diary_InL13"+$_t_DocumentWriteType  //NG April 2004 removed reference to ◊screen
	End case 
Else 
	$_t_DocumentWriteType:=Documents_4DWriteAccessType(True:C214)
	If ($_t_DocumentWriteType="WS")
		$_t_DocumentWriteType:="W"
	End if 
	FORM SET INPUT:C55([DIARY:12]; "Diary_InL13"+$_t_DocumentWriteType)  //NG April 2004 removed reference to ◊screen
	WIN_t_CurrentInputForm:="Diary_InL13"+$_t_DocumentWriteType  //NG April 2004 removed reference to ◊screen
End if 
If ($_t_DocumentWriteType#"")
	FORM SET OUTPUT:C54([DIARY:12]; "Diary OutL")
	WIN_t_CurrentOutputform:="Diary OutL"
	vD:=1
	MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_WPManager)
	If (MOD_l_CurrentModuleAccess<2)
		Gen_Alert("You do not have access to the WP Module"; "Cancel")
		OK:=0
		vD:=0
		$0:=False:C215
	Else 
		Diary_FileP
		If (MOD_l_CurrentModuleAccess#3)
			READ WRITE:C146([DOCUMENTS:7])
		End if 
		// If ((◊Write="SW") | (◊Write="WS"))  ` SuperWrite or 4DWrite "Silver"
		If (<>SYS_t_4DWriteType="WS")  // 4DWrite "Silver"  24/04/02 pb
			vOrdTitle:="Diary: Document History"
		Else 
			vOrdTitle:="Diary: Letters & "+Term_OrdWT("Quotations")
		End if 
	End if 
Else 
	//  ABORT
End if 
ERR_MethodTrackerReturn("Diary_FileL"; $_t_oldMethodName)