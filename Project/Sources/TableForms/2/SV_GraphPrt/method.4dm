If (False:C215)
	//Table Form Method Name: [COMPANIES]SV_GraphPrt
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


$_t_oldMethodName:=ERR_MethodTracker("FM [COMPANIES].SV_GraphPrt"; Form event code:C388)

Case of 
	: (Form event code:C388=On Printing Detail:K2:18)  // (During)
		SetFontsByPointerParameter(18; ""; 0; ->vTitle1; -><>DB_d_CurrentDate)  //NG March 2006
		//Set_Fonts ("vTitle1+◊CDate";18)
		SetFontsByPointerParameter(<>DataSize; ""; 0; ->vTitle12; ->vGraph)  //NG March 2006
		//Set_Fonts ("vTitle12+vGraph";◊DataSize)
End case 
ERR_MethodTrackerReturn("FM [COMPANIES].SV_GraphPrt"; $_t_oldMethodName)
