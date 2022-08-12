//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_SetselectionManager
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:     16/05/2010 08:48
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(DB_lb_OutputArrays;0)
	C_BOOLEAN:C305(DB_bo_DisplayFilters; DB_bo_DisplaySelections; DB_bo_DisplayStats; DB_bo_ShowArrayBased)
	C_LONGINT:C283($_l_LBObjectBottom; $_l_LBObjectLeft; $_l_LBObjectRIght; $_l_LBObjectTop; $_l_ObjectBottom; $_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop; DB_l_CurrentDisplayedForm; DB_l_LBOutputForm)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_SetselectionManager")
If (DB_bo_DisplaySelections)
	DB_bo_DisplaySelections:=False:C215
	If (Not:C34(DB_bo_DisplayFilters))
		
		FORM GOTO PAGE:C247(1)
	End if 
	OBJECT SET VISIBLE:C603(*; "oSelections@"; False:C215)
	OBJECT GET COORDINATES:C663(*; "oListboxOutputForm"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
	OBJECT GET COORDINATES:C663(*; "oSelectionsListbox"; $_l_LBObjectLeft; $_l_LBObjectTop; $_l_LBObjectRIght; $_l_LBObjectBottom)
	OBJECT MOVE:C664(*; "oListboxOutputForm"; $_l_LBObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom; *)
	OBJECT MOVE:C664(*; "oListboxOutputArrays"; $_l_LBObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom; *)
	
Else 
	DB_bo_DisplaySelections:=True:C214
	FORM GOTO PAGE:C247(2)
	OBJECT SET VISIBLE:C603(*; "oSelections@"; True:C214)
	OBJECT GET COORDINATES:C663(*; "oListboxOutputForm"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
	OBJECT GET COORDINATES:C663(*; "oSelectionsListbox"; $_l_LBObjectLeft; $_l_LBObjectTop; $_l_LBObjectRIght; $_l_LBObjectBottom)
	
	OBJECT MOVE:C664(*; "oListboxOutputForm"; $_l_LBObjectRIght+12; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom; *)
	OBJECT MOVE:C664(*; "oListboxOutputArrays"; $_l_LBObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom; *)
	
	
	If (Not:C34(DB_bo_DisplayFilters))
		OBJECT SET VISIBLE:C603(*; "oFilters@"; False:C215)
	End if 
	If (Not:C34(DB_bo_DisplayStats))
		OBJECT SET VISIBLE:C603(*; "oStats@"; False:C215)
	End if 
	
End if 
If (DB_bo_ShowArrayBased)
	DB_SetFormSize(DB_l_CurrentDisplayedForm; ->DB_lb_OutputArrays; 90; 60; DB_bo_DisplayFilters)
Else 
	DB_SetFormSize(DB_l_CurrentDisplayedForm; ->DB_l_LBOutputForm; 90; 60; DB_bo_DisplayFilters)
End if 
DB_SetFormMenuoptions
ERR_MethodTrackerReturn("DB_SetselectionManager"; $_t_oldMethodName)