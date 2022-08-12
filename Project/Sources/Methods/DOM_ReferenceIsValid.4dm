//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      DOM_ReferenceIsValid
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
	C_BOOLEAN:C305($_bo_NodeRefisValid; $0)
	C_LONGINT:C283(DOM_l_ReferenceIsValidError)
	C_TEXT:C284($_t_ElementName; $_t_MethodName; $_t_NodeRef; $_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DOM_ReferenceIsValid")

$_t_NodeRef:=$1
$_bo_NodeRefisValid:=True:C214

//========================    Method Actions    ==================================

DOM_StartCustomErrorHandling

DOM GET XML ELEMENT NAME:C730($_t_NodeRef; $_t_ElementName)

Case of 
	: (DOM_l_ReferenceIsValidError#0)  // There was an error of some kind.
		$_bo_NodeRefisValid:=False:C215
		
	: ($_t_ElementName="")  // Elements must have names to be operated on safely.
		$_bo_NodeRefisValid:=False:C215
		
	Else 
		$_bo_NodeRefisValid:=True:C214
End case 

DOM_StopCustomErrorHandling

//========================    Clean up and Exit    =================================

$0:=$_bo_NodeRefisValid
ERR_MethodTrackerReturn("DOM_ReferenceIsValid"; $_t_oldMethodName)