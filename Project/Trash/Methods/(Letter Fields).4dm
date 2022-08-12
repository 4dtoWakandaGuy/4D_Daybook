//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Letter Fields
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
	//ARRAY TEXT(<>DB_at_TableNames;0)
	//ARRAY TEXT(<>SYS_at_CurrentTableFieldNames;0)
	C_LONGINT:C283($_l_EndHighlight; $_l_StartHighlight)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Letter Fields")
If (<>DB_at_TableNames>0)
	$_l_StartHighlight:=0
	$_l_EndHighlight:=0
	GET HIGHLIGHT:C209([DOCUMENTS:7]Text:3; $_l_StartHighlight; $_l_EndHighlight)
	[DOCUMENTS:7]Text:3:=Substring:C12([DOCUMENTS:7]Text:3; 1; $_l_StartHighlight-1)+"<["+<>DB_at_TableNames{<>DB_at_TableNames}+"]"+<>SYS_at_CurrentTableFieldNames{<>SYS_at_CurrentTableFieldNames}+">"+Substring:C12([DOCUMENTS:7]Text:3; $_l_EndHighlight; 32000)
End if 
ERR_MethodTrackerReturn("Letter Fields"; $_t_oldMethodName)