//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_GetMIMEType
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
	C_LONGINT:C283($_l_Length)
	C_TEXT:C284(<>iEncrypt; $_t_oldMethodName; IWS_t_Extension; IWS_t_Direct; IWS_t_Search; IWS_t_CurrentMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_GetMIMEType")
// IWS_GetMIMEType
// Rollo 1/11/99
// get mime type of a specific document

//Modified by John to use extension from file
// b10 Rollo 19990616 - calls IWS_SetMIMEType instead of setting directly

IWS_t_CurrentMethodName:="IWS_GetMIMEType"

//this should not be nec. for dynamic links - no user meddling is allowed anyway

If (IWS_t_Extension="")  //Rollo 9/10/99
	IWS_t_Extension:=Substring:C12(IWS_GetFileExtension(->IWS_t_Direct; True:C214); 1; 21)
	
	//New by Rollo 1/12/99 - John, for uncompiled only, this routine removes the
	//extension from IWS_t_Search, because that it where it is
	//consequently I had to change IWS_GetFileExtension to take a pointer
	
	If ((<>iEncrypt="") & (IWS_t_Extension=""))
		IWS_t_Extension:=Substring:C12(IWS_GetFileExtension(->IWS_t_Search; True:C214); 1; 21)
	End if 
End if   //Rollo 9/10/99

IWS_SetMIMEType(IWS_t_Extension)  //Rollo 6/16/99
ERR_MethodTrackerReturn("IWS_GetMIMEType"; $_t_oldMethodName)