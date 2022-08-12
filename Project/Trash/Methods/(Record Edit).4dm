//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Record Edit
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/11/2010 17:15
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_RecordModified)
	C_LONGINT:C283(<>RecBarUp; <>SCPT_l_RecordEdit; $_l_AddMode; MOD_l_CurrentModuleAccess; Vadd)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Record Edit")
If ((DB_GetModuleSettingByNUM(Module_Macros))>1)  // & (◊SinProc=False))
	If (False:C215)
		Start_ProcCount("Macro Editor")
		//DEFAULT TABLE([MACROS])
		MOD_l_CurrentModuleAccess:=1
		$_l_AddMode:=Vadd
		vAdd:=0
		DB_t_CurrentFormUsage:=""
		DB_bo_RecordModified:=False:C215
		Open_Pro_Window("Macro Editor")
		//NG May 2004 this form does not exist!
		//The method is called only from the 'stop' button on macro list dialogues
		//the edit button calls a different method ZRecord_EditLst so I have put a wrapper on this method to ZRecord_EditLst
		
		//DIALOG([MACROS];"RecText Edit13")  `NG April 2004 Removed ◊Screen
		
		Close_ProWin
		
		Vadd:=$_l_AddMode
	Else 
		ZRecord_EditLst
	End if 
	
End if 
//Process_End `NG Commented out May 2003. this should not be here!
ERR_MethodTrackerReturn("Record Edit"; $_t_oldMethodName)
