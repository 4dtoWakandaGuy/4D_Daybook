//%attributes = {}

If (False:C215)
	//Project Method Name:      LBi_InclSetupJustStyle
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_FontDefined; DB_bo_FontsInited)
	C_LONGINT:C283(<>SYS_l_DefaultBoldFontSize; <>SYS_l_DefaultPlainFontSize)
	C_POINTER:C301($_Ptr_ListBox; $1)
	C_TEXT:C284(<>SYS_t_DefaultFontBold; <>SYS_t_DefaultFontPlain; $_t_ObjectPrefix; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LBi_InclSetupJustStyle")

//NG 21/7/2006
//This method replaces ALinclsetupjuststyle
$_t_oldMethodName:=ERR_MethodTracker("LBi_InclSetupJustStyle")
//ALInclSetupJustStyle
//Rollo 19/8/2004

//set a non-standard AL area to look the same as a standard one


$_Ptr_ListBox:=$1
$_t_ObjectPrefix:=""


LB_Setdividers($_Ptr_ListBox; Light grey:K11:13; 32)  //Both black
LB_SetColours($_Ptr_ListBox; Black:K11:16; Grey:K11:15; Light grey:K11:13)
If (Not:C34(DB_bo_FontsInited))
	DB_SetDefaultFonts
End if 


//If the Font Size of the first col = 9
LB_SETFONT($_Ptr_ListBox; $_t_ObjectPrefix; 1; <>SYS_t_DefaultFontBold; 0; 0; <>SYS_l_DefaultBoldFontSize; 0)
LB_SETFONT($_Ptr_ListBox; $_t_ObjectPrefix; 2; <>SYS_t_DefaultFontPlain; 0; 0; <>SYS_l_DefaultPlainFontSize; 0)
$_bo_FontDefined:=True:C214
ERR_MethodTrackerReturn("LBi_InclSetupJustStyle"; $_t_oldMethodName)