//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_HitInfo
	//------------------ Method Notes ------------------
	//
	//Method: IWS_HitInfo
	//
	//Written by  John Moore on 27/08/98
	//
	//Purpose: Returns info on hit
	
	//$1 - longint, element in array
	
	//
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>IWS_al_Bytes;0)
	//ARRAY LONGINT(<>IWS_al_LogIP;0)
	//ARRAY LONGINT(<>IWS_al_Ms;0)
	//ARRAY LONGINT(<>IWS_al_MsPageBuild;0)
	//ARRAY TEXT(<>IWS_at_GetOrPost;0)
	//ARRAY TEXT(<>IWS_at_PageType;0)
	C_LONGINT:C283(<>IWS_l_MSPageBuild; <>IWS_l_MSTaken; $_l_SelectedRow; $1)
	C_REAL:C285(<>IWS_r_Bytes)
	C_TEXT:C284(<>IWS_t_GetOrPost; <>IWS_t_IPAddress; <>IWS_t_PageType; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_HitInfo")
//******************************************************************************

//******************************************************************************

$_l_SelectedRow:=$1

<>IWS_t_IPAddress:=IWS_DottedIPAddress(<>IWS_al_LogIP{$_l_SelectedRow})
<>IWS_r_Bytes:=<>IWS_al_Bytes{$_l_SelectedRow}
<>IWS_l_MSTaken:=<>IWS_al_Ms{$_l_SelectedRow}
<>IWS_l_MSPageBuild:=<>IWS_al_MsPageBuild{$_l_SelectedRow}
<>IWS_t_GetOrPost:=<>IWS_at_GetOrPost{$_l_SelectedRow}
<>IWS_t_PageType:=<>IWS_at_PageType{$_l_SelectedRow}
ERR_MethodTrackerReturn("IWS_HitInfo"; $_t_oldMethodName)