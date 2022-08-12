//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_SetStatiscsView
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  22/05/2010 15:43
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(DB_lb_OutputArrays;0)
	C_BOOLEAN:C305(DB_bo_DisplayFilters; DB_bo_DisplaySelections; DB_bo_DisplayStats; DB_bo_ShowArrayBased)
	C_LONGINT:C283($_l_MaxWidth; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_windowTop; DB_l_CurrentDisplayedForm)
	C_POINTER:C301($_ptr_Table)
	C_LONGINT:C283(DB_l_LBOutputForm)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentContext)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_SetStatiscsView")
If (Not:C34(DB_bo_DisplayStats))
	DB_bo_DisplayStats:=True:C214
	FORM GOTO PAGE:C247(2)
	If (Not:C34(DB_bo_DisplaySelections))
		OBJECT SET VISIBLE:C603(*; "oSelections@"; False:C215)
	End if 
	If (Not:C34(DB_bo_DisplayFilters))
		OBJECT SET VISIBLE:C603(*; "oFilters@"; False:C215)
	End if 
	OBJECT SET VISIBLE:C603(*; "oStats@"; True:C214)
	$_l_MaxWidth:=Screen width:C187-10
	GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
	
	SEL_CurrentRecordSelection
	$_ptr_Table:=Table:C252(DB_l_CurrentDisplayedForm)
	SRCH_Applyfilterstoselection($_ptr_Table)
	
	DB_bo_DisplayStats:=DB_InitStatsView(DB_l_CurrentDisplayedForm)
	DB_SetWindowTitle(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
	OBJECT SET VISIBLE:C603(*; "oStatsColumnBreakDown"; True:C214)
	
	
	
Else 
	DB_bo_DisplayStats:=False:C215
	If (Not:C34(DB_bo_DisplaySelections)) & (Not:C34(DB_bo_DisplayFilters))
		FORM GOTO PAGE:C247(1)
	Else 
		OBJECT SET VISIBLE:C603(*; "oStats@"; False:C215)
	End if 
	
End if 


If (DB_bo_ShowArrayBased)
	DB_SetFormSize(DB_l_CurrentDisplayedForm; ->DB_lb_OutputArrays; 90; 60; DB_bo_DisplayFilters)
Else 
	DB_SetFormSize(DB_l_CurrentDisplayedForm; ->DB_l_LBOutputForm; 90; 60; DB_bo_DisplayFilters)
End if 
//ALERT("4")
DB_SetFormMenuoptions
ERR_MethodTrackerReturn("DB_SetStatiscsView"; $_t_oldMethodName)