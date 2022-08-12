//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Macros Copy
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/09/2012 14:54
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_StartHighlight; $end)
	C_POINTER:C301($_ptr_FocusObject)
	C_TEXT:C284(<>ButtDis; <>RECTEXT; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Macros Copy")
Menu_Record("Macros Copy"; "Copy to Current Macro")
If (<>ButtDis="O@")
	COPY NAMED SELECTION:C331([SCRIPTS:80]; "$Sel")
	USE SET:C118("Userset")
End if 
$_ptr_FocusObject:=Focus object:C278
If (Field:C253($_ptr_FocusObject)=Field:C253(->[SCRIPTS:80]Recording_Text:4))
	GET HIGHLIGHT:C209([SCRIPTS:80]Recording_Text:4; $_l_StartHighlight; $end)
Else 
	$_l_StartHighlight:=0
	$End:=0
End if 
If ($_l_StartHighlight=$end)
	<>RecText:=Macro_PlatformTranslate(->[SCRIPTS:80]Recording_Text:4; 0)
Else 
	<>RecText:=Substring:C12(Macro_PlatformTranslate(->[SCRIPTS:80]Recording_Text:4); $_l_StartHighlight; $end-$_l_StartHighlight+1)
End if 
POST OUTSIDE CALL:C329(-1)
If (<>ButtDis="O@")
	USE NAMED SELECTION:C332("$Sel")
	CLEAR NAMED SELECTION:C333("$Sel")
End if 
ERR_MethodTrackerReturn("Macros Copy"; $_t_oldMethodName)