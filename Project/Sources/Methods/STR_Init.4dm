//%attributes = {}
If (False:C215)
	//Project Method Name:      STR_Init
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/03/2010 15:16
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_REAL:C285(<>STR_l_Capitalization)
	C_TEXT:C284(<>STR_t_CR; <>STR_t_CRLF; <>STR_t_DoubleQuote; <>STR_t_LF; <>STR_s_Quote; <>STR_s_Sep; <>STR_s_TAB; <>STR_s_Wildcard1; <>STR_s_Wildcard2; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STR_Init")
<>STR_t_DoubleQuote:=Char:C90(34)
<>STR_t_LF:=Char:C90(10)
<>STR_t_CR:=Char:C90(13)
<>STR_s_TAB:=Char:C90(9)

<>STR_t_CRLF:=<>STR_t_CR+<>STR_t_LF

//<>STR_s_Sep:=DB_DirSymbol 

<>STR_s_Quote:=Char:C90(34)  // also STR_ks_DoubleQuote

<>STR_l_Capitalization:=0

<>STR_s_Wildcard1:="@"
<>STR_s_Wildcard2:=""
ERR_MethodTrackerReturn("STR_Init"; $_t_oldMethodName)