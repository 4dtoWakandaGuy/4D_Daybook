
If (False:C215)
	//Object Name:      DB_minisearch.oButtonFind
	//------------------ Script Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  18/09/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(ACC_at_PeriodCode;0)
	C_DATE:C307(SD2_d_SearchValue)
	C_LONGINT:C283(SD2_l_SearchValue; SD2_l_True)
	C_REAL:C285(SD2_r_SearchValue)
	C_TEXT:C284($_t_oldMethodName; SD2_t_SearchValue)
	C_TIME:C306(SD2_ti_SearchValue)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [projectForm]/DB_minisearch/oButtonFind1"; Form event code:C388)
Case of 
	: (Form event code:C388=On Clicked:K2:4)
		Case of 
				
			: (FORM Get current page:C276=2)
				SD2_t_SearchValue:=String:C10(SD2_d_SearchValue)
			: (FORM Get current page:C276=3)
				SD2_t_SearchValue:=String:C10(SD2_r_SearchValue)
			: (FORM Get current page:C276=4)
				SD2_t_SearchValue:=String:C10(SD2_ti_SearchValue)
			: (FORM Get current page:C276=5)
				SD2_t_SearchValue:=String:C10(SD2_l_True)
			: (FORM Get current page:C276=6)
				SD2_t_SearchValue:=ACC_at_PeriodCode{ACC_at_PeriodCode}
		End case 
		If (SD2_t_SearchValue#"")
			CANCEL:C270
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [projectForm]/DB_minisearch/oButtonFind1"; $_t_oldMethodName)
