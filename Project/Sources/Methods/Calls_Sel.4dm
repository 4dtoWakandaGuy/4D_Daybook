//%attributes = {}
If (False:C215)
	//Project Method Name:      Calls_Sel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/06/2010 08:37
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($2; $bFromWebFind; SRCH_bo_AutoSearch)
	C_LONGINT:C283(vCalls; xNext)
	C_TEXT:C284(<>CallCode; $_t_oldMethodName; $1; $_t_Search; $_t_SearchAt; VSELPREV)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Calls_Sel")
//Calls_Sel
//DEFAULT TABLE([SERVICE CALLS])
//Rollo 23//2004
//modified to work from web request without interface

If (Count parameters:C259>0)
	$_t_Search:=$1
	$bFromWebFind:=True:C214
	vSelPrev:=""
	xNext:=0
	OK:=1
Else 
	$bFromWebFind:=False:C215
End if 

vCalls:=1

If (vSelPrev="•FSC")
	Calls_SelP  // (->[SERVICE CALLS])
	
Else 
	
	If ($bFromWebFind=False:C215)
		If (<>CallCode#"")
			$_t_Search:="Call: "+<>CallCode
		Else 
			$_t_Search:=""
		End if 
		If (Count parameters:C259>=1)
			If ($1#"")
				$_t_Search:="Call:"+$1
			End if 
		End if 
		If (Count parameters:C259>=2)
			SRCH_bo_AutoSearch:=$2
		Else 
			SRCH_bo_AutoSearch:=False:C215
		End if 
		
		$_t_Search:=Gen_SearchA("Call Code, Company or Person to find:"; vSelPrev; "Find  Calls"; $_t_Search; Sel_ContCode; Sel_CompCode)
	End if 
	
	If (OK=1)
		If (xNext=0)
			Calls_Sel2($_t_Search)
		Else 
			Calls_SelP
		End if 
	Else 
		vCalls:=0
	End if 
End if 
ERR_MethodTrackerReturn("Calls_Sel"; $_t_oldMethodName)