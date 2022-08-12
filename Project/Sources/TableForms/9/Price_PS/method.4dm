If (False:C215)
	//Table Form Method Name: [PRODUCTS]Price_Ps
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
	C_DATE:C307(vCDateF)
	C_LONGINT:C283(<>DataSize; <>TextSize; ch1; ch3; ch4; DB_l_ButtonPrefsSet)
	C_REAL:C285(vT1; vT2)
	C_TEXT:C284(<>TitAdd; <>TitDepCo; <>UserName; $_t_oldMethodName; vComments; vDesc; vGroup; vProdCode; vRole)
End if 
//Code Starts Here



$_t_oldMethodName:=ERR_MethodTracker("FM [PRODUCTS].Price_Ps"; Form event code:C388)
//Price_Ps

Case of 
	: (Form event code:C388=On Header:K2:17) & (Not:C34(DB_bo_NoLoad))
		
		SetFontsByPointerParameter(20; ""; 0; -><>UserName; ->vTitle3)  //NG March 2006
		
		
		//Set_Fonts ("◊UserName+vTitle3";20)
		//Set_Fonts ("vTitle1+vTitle2+vComments";◊TextSize)
		SetFontsByPointerParameter(<>TextSize; ""; 0; ->vTitle1; ->vTitle2; ->vComments)  //NG March 2006
		
		//Set_Fonts ("vGroup";14)
		SetFontsByPointerParameter(<>TextSize; ""; 0; ->vGroup)
		RELATE ONE:C42([PRODUCTS:9]Group_Code:3)
		vGroup:="Group  "+[PRODUCT_GROUPS:10]Group_Code:1+"  "+[PRODUCT_GROUPS:10]Group_Name:2
		vComments:=[PRODUCT_GROUPS:10]Group_Comments:3
		DB_l_ButtonPrefsSet:=0
	: (Form event code:C388=On Printing Detail:K2:18)
		SetFontsByPointerParameter(<>DataSize; ""; 0; ->vRole; ->vProdCode; ->[PRODUCTS:9]Product_Name:2; ->vT1; ->vT2)  //NG March 2006
		
		
		//Set_Fonts ("vRole+vProdCode"+"+[PRODUCTS]Product Name+vT1+vT2";◊DataSize)
		//Set_Fonts ("vDesc";◊TextSize)
		SetFontsByPointerParameter(<>TextSize; ""; 0; ->vDesc)
		
		//  Set_Fonts ("";◊TextSize)
		If (ch4=1)
			vDesc:=[PRODUCTS:9]Description:6
		Else 
			vDesc:=""
		End if 
		QUERY:C277([PRODUCTS_SUPPLIERS:148]; [PRODUCTS_SUPPLIERS:148]Product_Code:8=[PRODUCTS:9]Product_Code:1)
		
		
		vProdCode:=[PRODUCTS:9]Product_Code:1+("/"+String:C10(Round:C94([PRODUCTS_SUPPLIERS:148]Margin:3; 0))*Num:C11(ch3=1))
		If (([PRODUCTS:9]Modified_Date:10>=vCDateF) & (vCDateF>!00-00-00!))
			vRole:="•"
		Else 
			vRole:=""
		End if 
		If (ch1=1)
			vT1:=[PRODUCTS:9]Standard_Price:16
			vT2:=[PRODUCTS:9]Sales_Price:9
		Else 
			vT1:=0
			vT2:=[PRODUCTS:9]Sales_Price:9
		End if 
		If (DB_l_ButtonPrefsSet=1)  //these exist to counteract 4D's crazy
			vComments:=""  //insistence on printing the Comments in the During phase
		Else   //and in any case not doing variable length in the Header
			
			
			
			DB_l_ButtonPrefsSet:=1
		End if 
	: (Form event code:C388=On Printing Footer:K2:20)
		
		SetFontsByPointerParameter(<>TextSize; ""; 0; ->vTitle4; -><>TitDepCo; -><>TitAdd; ->vPPage)
		
End case 
ERR_MethodTrackerReturn("FM [PRODUCTS].Price_Ps"; $_t_oldMethodName)
