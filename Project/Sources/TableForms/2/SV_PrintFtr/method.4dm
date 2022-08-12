If (False:C215)
	//Table Form Method Name: [COMPANIES]SV_PrintFtr
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283(<>DataSize)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [COMPANIES].SV_PrintFtr"; Form event code:C388)

Case of 
	: (Form event code:C388=On Printing Detail:K2:18)  // (During)
		//Set_Fonts ("vSVT1+vSVT2+vSVT3+vSVT4";◊DataSize)
		SetFontsByPointerParameter(<>DataSize; ""; 0; ->vSVT1; ->vSVT2; ->vSVT3; ->vSVT4)  //NG March 2006
End case 
ERR_MethodTrackerReturn("FM [COMPANIES].SV_PrintFtr"; $_t_oldMethodName)
