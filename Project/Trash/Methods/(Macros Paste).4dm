//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Macros Paste
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
	C_LONGINT:C283($_l_StartHighlight; $end)
	C_TEXT:C284(<>RECTEXT; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Macros Paste")
Menu_Record("Macros Paste"; "Paste Current Macro")
GET HIGHLIGHT:C209([SCRIPTS:80]Recording_Text:4; $_l_StartHighlight; $end)
[SCRIPTS:80]Recording_Text:4:=Substring:C12([SCRIPTS:80]Recording_Text:4; 1; $_l_StartHighlight-1)+<>RecText+(Char:C90(13)*Num:C11(Substring:C12(<>RecText; Length:C16(<>RecText); 1)#Char:C90(13)))+Substring:C12([SCRIPTS:80]Recording_Text:4; $end; 32000)
$end:=$_l_StartHighlight+Length:C16(<>RecText)+1
HIGHLIGHT TEXT:C210([SCRIPTS:80]Recording_Text:4; $end; $end)
ERR_MethodTrackerReturn("Macros Paste"; $_t_oldMethodName)