If (False:C215)
	//Table Form Method Name: [DOCUMENTS]Mail Label 7x2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283(<>DataSize; cSIS)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [DOCUMENTS].Mail Label 7x2"; Form event code:C388)

Case of 
	: (Form event code:C388=On Printing Detail:K2:18)  //(During)
		If (cSIS=1)
			SetFontsByPointerParameter(<>DataSize; ""; 0; ->vDetails1; ->vDetails2; ->vTitle1; ->vTitle2)  //NG March 2006
			//Set_Fonts ("vDetails1+vDetails2+vTitle1+vTitle2";◊DataSize)
		End if 
		// If (DB_t_CurrentFormUsage2="Bag")
		// FONT STYLE(vDetails1;1)
		//  FONT STYLE(vDetails2;1)
		//  End if
End case 
ERR_MethodTrackerReturn("FM [DOCUMENTS].Mail Label 7x2"; $_t_oldMethodName)
