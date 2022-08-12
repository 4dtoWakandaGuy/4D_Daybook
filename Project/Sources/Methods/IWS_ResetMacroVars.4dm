//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_ResetMacroVars
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
	//ARRAY TEXT(IME_at_FieldNames;0)
	//ARRAY TEXT(IME_at_Fields;0)
	//ARRAY TEXT(IME_at_PrfDtaDataRetrieval;0)
	//ARRAY TEXT(IME_at_PrfDtaPrfCode;0)
	C_BOOLEAN:C305(<>IME_bo_RequireEncryption; IME_bo_Flushed)
	C_LONGINT:C283(IME_l_Browser; IME_l_PageSizeDivider)
	C_TEXT:C284(<>IME_t_IFTDateUS; $_t_oldMethodName; IME_t_Entitlements; IME_t_ImageLocation; IME_t_ImageLocationSF; IME_t_ImageLocationSFTemplate; IME_t_IndexPage; IME_t_LocationHttp; IME_t_LocationHttps; IME_t_OrganizationName; IME_t_OrgUniqueName)
	C_TEXT:C284(IME_t_ResponseType; IME_t_Terminology; IME_t_URLName; IME_t_UserAccessMenus; IME_t_UserGroupCode; IME_t_UserInitials; IME_t_UserJobTitle; IME_t_UserName; IME_t_UserType; IWS_t_CurrentMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_ResetMacroVars")
//******************************************************************************
//
//Method: IWS_ResetMacroVars
//
//Written by  John Moore on 10/26/98
//
//Purpose: In addition to the call to IME_CGISearchResetAllVars
//add here any vars to clear before you ever get to any CGISearch anything
//
//$1 - type -purpose
//
IWS_t_CurrentMethodName:="IWS_ResetMacroVars"

ARRAY TEXT:C222(IME_at_FieldNames; 0)
ARRAY TEXT:C222(IME_at_Fields; 0)

IME_t_ResponseType:=""

IME_t_UserName:=""
IME_t_UserInitials:=""
IME_t_UserGroupCode:=""
IME_t_UserJobTitle:=""
IME_t_UserType:=""
IME_t_UserAccessMenus:=""

IME_t_ImageLocation:=""
IME_t_ImageLocationSFTemplate:=""
IME_t_ImageLocationSF:=""
IME_t_OrganizationName:=""
IME_t_OrgUniqueName:=""

ARRAY TEXT:C222(IME_at_PrfDtaPrfCode; 0)
ARRAY TEXT:C222(IME_at_PrfDtaDataRetrieval; 0)

IME_FoldersClear
IME_t_IndexPage:=""
IME_t_URLName:=""

IME_bo_RequireEncryption:=<>IME_bo_RequireEncryption

IME_t_LocationHttp:=""
IME_t_LocationHttps:=""

IME_t_UserAccessMenus:=""
IME_bo_Flushed:=False:C215

IME_l_Browser:=0  //Rollo 3/23/2000 - reset here now due to change in CGISearch

IME_l_PageSizeDivider:=0

IME_t_Terminology:=""

IME_t_IFTDate:=<>IME_t_IFTDateUS

IME_t_Entitlements:=""
ERR_MethodTrackerReturn("IWS_ResetMacroVars"; $_t_oldMethodName)