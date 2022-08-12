//%attributes = {}
If (False:C215)
	//Project Method Name:      DBWS_Init
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 06/09/2011 16:16
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>DBWS_bo_optim; <>DBWS_Bo_Intited)
	C_LONGINT:C283($_l_Platform)
	C_TEXT:C284(<>_DBWS_t_sep; <>DBWS_t_cr; <>DBWS_t_encoding; <>DBWS_t_root; <>DBWS_t_tab; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DBWS_Init")

<>DBWS_Bo_Intited:=True:C214
<>DBWS_t_encoding:="utf-8"
<>DBWS_t_cr:=Char:C90(13)+Char:C90(10)
<>DBWS_t_tab:=Char:C90(9)
//_O_PLATFORM PROPERTIES($_l_Platform)
Get_PlatformProperty("Platform"; ->$_l_Platform)
If ($_l_Platform=3)
	<>_DBWS_t_sep:="\\"
Else 
	<>_DBWS_t_sep:=":"
End if 
SET DATABASE PARAMETER:C642(27; 102400)
<>DBWS_t_root:="WebFolder"
<>DBWS_bo_optim:=False:C215
ERR_MethodTrackerReturn("DBWS_Init"; $_t_oldMethodName)