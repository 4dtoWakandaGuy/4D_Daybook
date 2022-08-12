//%attributes = {}
If (False:C215)
	//Project Method Name:      LB_SETENTRYOPTIONS
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($2)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LB_SETENTRYOPTIONS")
//LB_SETENTRYOPTIONS
//THIS METHOD IS TO MIMIC AL_SETENTRYOPTS
//AL_SetEntryOpts (AreaName;EntryMode;AllowReturn;DisplaySeconds;MoveWithArrows;MapEnterKey;DecimalCharForWin;UseNewPopupIcon)
//AT THE MOMENT ONLY PARAMETER ONE IS VALID AND ONLY THE FOLOWING VALUES
//1=NO ENTRY.(SELECTABLE MODE)
//2=ENTERABLE MODE(NOT SELECTABLE)
ERR_MethodTrackerReturn("LB_SETENTRYOPTIONS"; $_t_oldMethodName)