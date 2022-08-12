If (False:C215)
	//Table Form Method Name: [COMPANIES]SV_PrintHdr
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
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283(<>DataSize)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [COMPANIES].SV_PrintHdr"; Form event code:C388)

Case of 
	: (Form event code:C388=On Printing Detail:K2:18)  //(During)
		//Set_Fonts ("vTitle1+◊CDate";18)
		SetFontsByPointerParameter(18; ""; 0; ->vTitle1; -><>DB_d_CurrentDate)  //NG March 2006
		//Set_Fonts ("vTitle2+vTitle3+vTitle4+vTitle5+vTitle6+vTitle7"+"+vTitle8+vTitle9";◊DataSize)
		SetFontsByPointerParameter(<>DataSize; ""; 0; ->vTitle2; ->vTitle3; ->vTitle4; ->vTitle5; ->vTitle6; ->vTitle7; ->vTitle8; ->vTitle9)  //NG March 2006
End case 
ERR_MethodTrackerReturn("FM [COMPANIES].SV_PrintHdr"; $_t_oldMethodName)
