If (False:C215)
	//Table Form Method Name: [IDENTIFIERS]ALL_FIELDS
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
	C_TEXT:C284($_t_oldMethodName; VDECODEREF)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [IDENTIFIERS].ALL_FIELDS"; Form event code:C388)

Case of 
	: (Form event code:C388=On Display Detail:K2:22)
		
		vDecodeRef:=DecodeRef([IDENTIFIERS:16]XRef_FIELD:8)
End case 
ERR_MethodTrackerReturn("FM [IDENTIFIERS].ALL_FIELDS"; $_t_oldMethodName)
