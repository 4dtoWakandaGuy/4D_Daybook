If (False:C215)
	//Table Form Method Name: [EW_ExportProjects]MacroSelect
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SM_at_ScriptNames;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [EW_ExportProjects].MacroSelect"; Form event code:C388)

Case of 
	: (Form event code:C388=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[EW_ExportProjects:117]); "MacroSelect")
		Case of 
			: ([EW_StepActions:119]MacroName:5="")  // new
				SM_at_ScriptNames:=1
			: (Find in array:C230(SM_at_ScriptNames; [EW_StepActions:119]MacroName:5)<1)
				//        ALERT("The previously selected macro, "+[EW_StepActions]MacroName+" does
				Gen_Alert("The previously selected macro, "+[EW_StepActions:119]MacroName:5+" does not appear to exist.")
				SM_at_ScriptNames:=1
			Else 
				SM_at_ScriptNames:=Find in array:C230(SM_at_ScriptNames; [EW_StepActions:119]MacroName:5)
		End case 
		INT_SetDialog
		
End case 
ERR_MethodTrackerReturn("FM [EW_ExportProjects].MacroSelect"; $_t_oldMethodName)
