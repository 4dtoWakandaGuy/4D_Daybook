//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Gen_SearchA
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:42If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>AutoFind; <>SYS_bo_DefaultsFind; <>StartProc; SRCH_bo_AutoSearch; vAutoFind)
	C_LONGINT:C283(<>AutoProc; xNext)
	C_TEXT:C284(<>KEYS; $_t_oldMethodName; $0; $1; $2; $3; $4; $5; $6)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_SearchA")
If (((<>AutoFind) | (SRCH_bo_AutoSearch)) & (($4#"") | ($5#"") | ($6#"") | (<>AutoProc=987654321)) & ($2=""))
	
	//If (((◊AutoFind) | (SRCH_bo_AutoSearch)) | ((($4#"") | ($5#"") | ($6#"") | (◊AutoProc=987654321)) & ($2="")))
	If ($4#"")
		$0:=$4
	Else 
		If ($5#"")
			$0:=$5
		Else 
			$0:=$6
		End if 
	End if 
	OK:=1
	xNext:=0
	vAutoFind:=True:C214
	<>StartProc:=False:C215
	<>Keys:=""
Else 
	If (($2="") & (<>SYS_bo_DefaultsFind))
		If ($4#"")
			$2:=$4
		Else 
			If ($5#"")
				$2:=$5
			Else 
				$2:=$6
			End if 
		End if 
	End if 
	$0:=Gen_Search($1; $2; $3)
End if 
<>AutoFind:=False:C215
ERR_MethodTrackerReturn("Gen_SearchA"; $_t_oldMethodName)