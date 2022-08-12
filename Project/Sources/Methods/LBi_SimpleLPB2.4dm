//%attributes = {}

If (False:C215)
	//Project Method Name:      LBi_SimpleLPB2
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
	C_BOOLEAN:C305(DB_bo_FontsInited)
	C_LONGINT:C283(<>SYS_l_DefaultBoldFontSize; <>SYS_l_DefaultPlainFontSize)
	C_POINTER:C301($1)
	C_TEXT:C284(<>SYS_t_DefaultFontBold; <>SYS_t_DefaultFontPlain; $_t_ObjectPrefix; $_t_oldMethodName; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LBi_SimpleLPB2")

//NG 19/7/06 This method is a replacement for ALSimpleLPB2 to use with Listbox.
//Note that$2 HAs to be passed the object prefix
$_t_oldMethodName:=ERR_MethodTracker("LBi_SimpleLPB2")
//ALSimpleLPB2
If (Not:C34(DB_bo_FontsInited))
	DB_SetDefaultFonts
End if 
If (Count parameters:C259>=2)
	LB_Setdividers($1; Black:K11:16; 32)  //Both contextual
	LB_SetColours($1; 255; 243; 0)
	LB_SETFONT($1; $_t_ObjectPrefix; 1; <>SYS_t_DefaultFontBold; 0; 0; <>SYS_l_DefaultBoldFontSize)  //Header
	LB_SETFONT($1; $_t_ObjectPrefix; 2; <>SYS_t_DefaultFontPlain; 0; 0; <>SYS_l_DefaultPlainFontSize)  //Header
	
	
	LISTBOX SET ROWS HEIGHT:C835($1->; 16)
	//NG todo-sort options and Entry options
	//LB_SetSortOpts ($1->;0;1;0;"Sort by …";0)  `!sort in during, allow sort, allow editor, prompt, !show order
	//LB_SetEntryOpts($1->;2;0;0;0;0)
End if 
ERR_MethodTrackerReturn("LBi_SimpleLPB2"; $_t_oldMethodName)