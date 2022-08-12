//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      RecText Field
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
	C_LONGINT:C283($_l_EndHighlight; $_l_Length; $_l_StartHighlight)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("RecText Field")
If (<>SYS_at_CurrentTableFieldNames>0)
	GET HIGHLIGHT:C209($1->; $_l_StartHighlight; $_l_EndHighlight)
	$_l_Length:=Length:C16(<>DB_at_TableNames{<>DB_at_TableNames})
	If (Substring:C12($1->; $_l_StartHighlight-$_l_Length-2; $_l_Length+2)#("["+<>DB_at_TableNames{<>DB_at_TableNames}+"]"))
		$1->:=Substring:C12($1->; 1; $_l_StartHighlight-1)+"["+<>DB_at_TableNames{<>DB_at_TableNames}+"]"+<>SYS_at_CurrentTableFieldNames{<>SYS_at_CurrentTableFieldNames}+Substring:C12($1->; $_l_EndHighlight; 32000)
		$_l_EndHighlight:=$_l_StartHighlight+Length:C16(<>SYS_at_CurrentTableFieldNames{<>SYS_at_CurrentTableFieldNames})+2+$_l_Length
	Else 
		$1->:=Substring:C12($1->; 1; $_l_StartHighlight-1)+<>SYS_at_CurrentTableFieldNames{<>SYS_at_CurrentTableFieldNames}+Substring:C12($1->; $_l_EndHighlight; 32000)
		$_l_EndHighlight:=$_l_StartHighlight+Length:C16(<>SYS_at_CurrentTableFieldNames{<>SYS_at_CurrentTableFieldNames})
	End if 
	HIGHLIGHT TEXT:C210($1->; $_l_EndHighlight; $_l_EndHighlight)
Else 
	<>SYS_at_CurrentTableFieldNames:=1
End if 
ERR_MethodTrackerReturn("RecText Field"; $_t_oldMethodName)
