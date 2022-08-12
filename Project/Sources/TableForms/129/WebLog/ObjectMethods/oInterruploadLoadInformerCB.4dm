If (False:C215)
	//object Name: [WEBSETUP_4D]WebLog.CheckBox1
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
	C_BOOLEAN:C305(<>IWS_bo_LoadInformerInterrupt; DB_bo_NoLoad)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [WEBSETUP_4D].WebLog.CheckBox1"; Form event code:C388)
Case of 
	: (Form event code:C388=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		Self:C308->:=Num:C11(<>IWS_bo_LoadInformerInterrupt)
	: (Form event code:C388=On Clicked:K2:4)
		<>IWS_bo_LoadInformerInterrupt:=(Self:C308->=1)
End case 
ERR_MethodTrackerReturn("OBJ [WEBSETUP_4D].WebLog.CheckBox1"; $_t_oldMethodName)
