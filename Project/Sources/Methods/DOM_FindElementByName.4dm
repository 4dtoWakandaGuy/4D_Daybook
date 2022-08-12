//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      DOM_FindElementByName
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/12/2009 14:14
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_isFirstCallinChain; $4; DOM_bo_ContinueTreeWalk)
	C_LONGINT:C283($_l_TargetInstanceCount; $3; DOM_l_MatchingNodesFound)
	C_TEXT:C284($_t_CurrentName; $_t_oldMethodName; $_t_ResultXMLRef; $_t_TargetName; $_t_XMLRef; $0; $1; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DOM_FindElementByName")

If (False:C215)
	DOM_FindElementByName
	
	//// This routine scans through an XML tree looking for the specified
	//// element name an instance. If the element is found, the routine
	//// returns its XML node reference.
	
End if 


$_t_XMLRef:=$1
$_t_TargetName:=$2
$_l_TargetInstanceCount:=$3
$_bo_isFirstCallinChain:=True:C214
If (Count parameters:C259>=4)
	$_bo_isFirstCallinChain:=$4
End if 

$_t_ResultXMLRef:="0"*16

If ($_bo_isFirstCallinChain)
	OK:=1  //// Set control variable before entering loop for first time.
	DOM_l_MatchingNodesFound:=0  //// Used to keep track of how many times a match has been made.
	DOM_bo_ContinueTreeWalk:=True:C214  //// Used to control recursion.
Else 
	$_t_XMLRef:=DOM Get first child XML element:C723($_t_XMLRef)
End if 

Repeat 
	
	While (OK=1) & (DOM_bo_ContinueTreeWalk)
		
		$_t_CurrentName:=""
		
		DOM GET XML ELEMENT NAME:C730($_t_XMLRef; $_t_CurrentName)
		
		If (String_EqualCaseSensitively($_t_CurrentName; $_t_TargetName))
			DOM_l_MatchingNodesFound:=DOM_l_MatchingNodesFound+1
			If (DOM_l_MatchingNodesFound=$_l_TargetInstanceCount)
				$_t_ResultXMLRef:=$_t_XMLRef  //// This node is the target, return its reference.
				DOM_bo_ContinueTreeWalk:=False:C215  //// Break out of the recursion.
			End if 
		Else 
			//// Note: Recursive call below:
			$_t_ResultXMLRef:=DOM_FindElementByName($_t_XMLRef; $_t_TargetName; $_l_TargetInstanceCount; False:C215)
		End if 
		$_t_XMLRef:=DOM Get next sibling XML element:C724($_t_XMLRef)
		
	End while 
	
Until ((OK=0) | (DOM_bo_ContinueTreeWalk=False:C215))

$0:=$_t_ResultXMLRef
ERR_MethodTrackerReturn("DOM_FindElementByName"; $_t_oldMethodName)