If (False:C215)
	//Table Form Method Name: [DOCUMENTS]Mail Label4%2F13
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


$_t_oldMethodName:=ERR_MethodTracker("FM [DOCUMENTS].Mail Label4/13"; Form event code:C388)

Case of 
	: (Form event code:C388=On Printing Detail:K2:18)  //(During)
		If (cSIS=1)
			SetFontsByPointerParameter(<>DataSize; ""; 0; ->vDetails1; ->vDetails2; ->vTitle1; ->vTitle2)  //NG March 2006
			//Set_Fonts ("vDetails1+vDetails2+vTitle1+vTitle2";◊DataSize)
			SetFontsByPointerParameter(<>DataSize; ""; 0; ->vDetails3; ->vDetails4; ->vTitle4; ->vTitle3)  //NG March 2006
			//Set_Fonts ("vDetails3+vDetails4+vTitle3+vTitle4";◊DataSize)
			SetFontsByPointerParameter(<>DataSize; ""; 0; ->vSubGroup1; ->vSubGroup2; ->vSubGroup3; ->vSubGroup4)  //NG March 2006
			//Set_Fonts ("vSubGroup1+vSubGroup2+vDesc1+vDesc2";◊DataSize)
			SetFontsByPointerParameter(<>DataSize; ""; 0; ->vDesc1; ->vDesc2; ->vDesc3; ->vDesc4)  //NG March 2006
			//Set_Fonts ("vSubGroup3+vSubGroup4+vDesc3+vDesc4";◊DataSize)
		End if 
		// If (DB_t_CurrentFormUsage2="Bag")
		//  FONT STYLE(vDetails1;1)
		//  FONT STYLE(vDetails2;1)
		// FONT STYLE(vDetails3;1)
		//  FONT STYLE(vDetails4;1)
		// End if
End case 
ERR_MethodTrackerReturn("FM [DOCUMENTS].Mail Label4/13"; $_t_oldMethodName)
