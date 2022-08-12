//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_CheckValidIP
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
	//Array LONGINT(<>IWS_al_IPEnd;0)
	//Array LONGINT(<>IWS_al_IPStart;0)
	C_BOOLEAN:C305(<>IWS_bo_RestrictAccess; IWS_bo_ValidIP)
	C_LONGINT:C283($i)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_CheckValidIP")
//******************************************************************************
//
//Method: IWS_CheckValidIP
//
//Written by  John Moore on 11/9/98
//
//Purpose: checks IWS_l_RemoteIPAddress to see if it is an acceptable one

//******************************************************************************



If (Size of array:C274(<>IWS_al_IPStart)>0) & (<>IWS_bo_RestrictAccess)
	IWS_bo_ValidIP:=True:C214
	For ($i; 1; Size of array:C274(<>IWS_al_IPStart))
		If (IWS_l_RemoteIPAddress<<>IWS_al_IPStart{$i}) | (IWS_l_RemoteIPAddress><>IWS_al_IPEnd{$i})
			
		Else 
			IWS_bo_ValidIP:=False:C215
			$i:=Size of array:C274(<>IWS_al_IPStart)+1
		End if 
	End for 
Else 
	IWS_bo_ValidIP:=True:C214
End if 

//If (Size of array(◊IWS_ai_IPStart)>0) & (◊IWS_bo_RestrictAccess)
//IWS_bo_ValidIP:=False
// For ($i;1;Size of array(◊IWS_ai_IPStart))
//If (IWS_l_RemoteIPAddress>=◊IWS_ai_IPStart{$i}) & (IWS_l_RemoteIPAddress<=◊IWS_a
//  IWS_bo_ValidIP:=True
// $i:=Size of array(◊IWS_ai_IPStart)+1
//End if
//End for
//Else
//IWS_bo_ValidIP:=True
//End if

//LOG_ResetMethod
ERR_MethodTrackerReturn("IWS_CheckValidIP"; $_t_oldMethodName)