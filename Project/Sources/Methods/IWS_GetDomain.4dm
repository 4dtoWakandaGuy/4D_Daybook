//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_GetDomain
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
	C_TEXT:C284($_t_oldMethodName; $0; $Domain; $Host; IWS_t_CurrentMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_GetDomain")
//******************************************************************************
//
//Method: IWS_GetDomain
//
//Written by  John Moore on 10/22/98
//
//Purpose: returns domain part of entered URL

//$1 - text, full address
//$0 - text, domain

IWS_t_CurrentMethodName:="IWS_GetDomain"
//
//******************************************************************************


$Host:=IWS_GetHeaderField("Host")
If (Not:C34(IWS_IsDottedAddress($Host))) & ($Host#"")
	$Domain:=""
Else 
	$Domain:="n/a"
End if 
$0:=$Domain
ERR_MethodTrackerReturn("IWS_GetDomain"; $_t_oldMethodName)