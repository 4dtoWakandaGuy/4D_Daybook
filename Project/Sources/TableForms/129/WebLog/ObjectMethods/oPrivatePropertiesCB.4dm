If (False:C215)
	//object Name: [WEBSETUP_4D]WebLog.Check Box3
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283(GEN_cb_2)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [WEBSETUP_4D].WebLog.Check Box3"; Form event code:C388)
Case of 
	: (Form event code:C388=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		Self:C308->:=0
		OBJECT SET ENABLED:C1123(GEN_cb_2; False:C215)
End case 




//ARRAY STRING(31;◊IWS_as_IPRanges;0)
//STR_Text2Array (◊IWS_t_IPRanges;->◊IWS_as_IPRanges)
//ARRAY TO LIST(◊IWS_as_IPRanges;"Valid IP Ranges")
//IWS_GetValidIPRanges
ERR_MethodTrackerReturn("OBJ [WEBSETUP_4D].WebLog.Check Box3"; $_t_oldMethodName)
