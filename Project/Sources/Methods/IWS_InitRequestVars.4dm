//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_InitRequestVars
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
	//Array Text(IWS_at_HeaderNames;0)
	//ARRAY TEXT(IME_at_FieldNames;0)
	//ARRAY TEXT(IME_at_Fields;0)
	//ARRAY TEXT(IWS_at_Headers;0)
	//ARRAY TEXT(IWS_at_HeaderValues;0)
	C_BLOB:C604(IME_blb_Result; IWS_blb_PostDataBLOB)
	C_BOOLEAN:C305(IWS_bo_ResponseHeaderSent; IWS_bo_StreamEnded; IWS_bo_ViaProxy)
	C_LONGINT:C283(IWS_l_MSStart; IWS_l_MSTaken)
	C_TEXT:C284($_t_oldMethodName; IWS_t_Extension; IWS_t_Protocol; IWS_t_Direct; IWS_t_ErrorHTML; IWS_t_Filename; IWS_t_PostData; IWS_t_Request; IWS_t_ResponseHeader; IWS_t_URL)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_InitRequestVars")
//Method: IWS_InitRequestVars
//
//Purpose: Initialises or clears out all the
//variables associated with a request
//for each call of the handler
//
// b24 Rollo 19990709 - Added two new variables

SET BLOB SIZE:C606(IWS_blb_PostDataBLOB; 0)
UTI_ArrayClear(->IME_at_Fields; ->IME_at_FieldNames)
IWS_t_Request:=""
IWS_t_PostData:=""
IWS_t_ErrorHTML:=""
IWS_t_Filename:=""
IWS_t_URL:=""
IWS_t_Direct:=""
IWS_bo_StreamEnded:=False:C215
IWS_l_MSTaken:=0  //will record overall time taken to build/fetch page, return result
IWS_l_MSStart:=0
IWS_t_ResponseHeader:=""
IWS_bo_ResponseHeaderSent:=False:C215
IWS_bo_ViaProxy:=False:C215  //Rollo 7/9/99
IWS_t_Protocol:="http"  //Rollo 7/9/99
IWS_t_Extension:=""  //Rollo 9/10/99

UTI_ArrayClear(->IWS_at_HeaderNames; ->IWS_at_HeaderValues; ->IWS_at_Headers)  //John 5/30/2000

SET BLOB SIZE:C606(IME_blb_Result; 0)
ERR_MethodTrackerReturn("IWS_InitRequestVars"; $_t_oldMethodName)