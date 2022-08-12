//%attributes = {}
If (False:C215)
	//Project Method Name:      Diary_ModL
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/09/2009 21:29:29If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_AutoSearch)
	C_LONGINT:C283(<>MENU_l_BarModule; MOD_l_CurrentModuleAccess; vD)
	C_TEXT:C284($_t_oldMethodName; $1; $2; $_t_AutosearchCode; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_ModL")
//Diary_ModL
Start_Process
If (Diary_FileL)  // modified NG June 2004
	MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(<>MENU_l_BarModule)
	If (MOD_l_CurrentModuleAccess=3)
		READ ONLY:C145([DIARY:12])
	Else 
		READ WRITE:C146([DIARY:12])
	End if 
	While (vD=1)
		DB_t_CurrentFormUsage:="InL"
		If (Count parameters:C259>=2)
			$_bo_AutoSearch:=($2="TRUE")
			$_t_AutosearchCode:=$1
			Diary_Sel("Document: +$1"; False:C215)
		Else 
			
			Diary_Sel
		End if 
		
		QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Document_Code:15#"")
		Gen_ModMid("View Letters & "+Term_OrdWT("Quotes"); "DMaster"; ->[DIARY:12]; ->vD; "Diary Items"; ""; 0; "L")
	End while 
End if 

Process_End
ERR_MethodTrackerReturn("Diary_ModL"; $_t_oldMethodName)