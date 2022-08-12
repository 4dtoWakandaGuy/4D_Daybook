//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Diary_CalActCl
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
	//C_UNKNOWN(Vd6)
	//ARRAY INTEGER(aD;0)
	//ARRAY INTEGER(SD_ai_Days;0)
	//ARRAY LONGINT(CAL_al_DiaryDays;0)
	C_LONGINT:C283($_l_BackgroundColour; $_l_ForegroundColour; $_l_Index)
	C_POINTER:C301($_ptr_CalenderObject; $_Ptr_Variable)
	C_TEXT:C284($_t_BackgroundColour; $_t_ForegroundColour; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_CalActCl")
//Diary_CalActCl
$_l_Index:=1
While ($_l_Index<38)
	IDLE:C311  // 03/04/03 pb
	$_Ptr_Variable:=Get pointer:C304("vD"+String:C10($_l_Index))
	SD_ai_Days{$_l_Index}:=0
	CAL_al_DiaryDays{$_l_Index}:=0
	//_O_OBJECT SET COLOR($_Ptr_Variable->;-(15+61952))
	//OBJECT SET RGB COLORS($_ptr_CalenderObject->;15;(61952/256))
	$_t_ForegroundColour:=UTIL_4DColorToRGB(15)
	$_t_BackgroundColour:=UTIL_4DColorToRGB(61952/256)
	OBJECT SET RGB COLORS:C628(Vd6; $_t_ForegroundColour; $_t_BackgroundColour)
	
	OBJECT SET FONT STYLE:C166($_Ptr_Variable->; 0)
	$_l_Index:=$_l_Index+1  /// was i
End while 
ERR_MethodTrackerReturn("Diary_CalActCl"; $_t_oldMethodName)