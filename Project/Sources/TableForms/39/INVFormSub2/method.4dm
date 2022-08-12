If (False:C215)
	//Table Form Method Name: [INVOICES]INVFormSub2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/09/2009 10:24
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283(<>DataSize; $_l_event; $_l_Length; $_l_Length2; PRT_l_PrintedLines; r1)
	C_REAL:C285(vAmount; vPrice; vRate; vTotal)
	C_TEXT:C284($_t_Comment; $_t_oldMethodName; PRT_t_BreakComment; vComments; vDesc; vQtyT)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [INVOICES].INVFormSub2"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Printing Detail:K2:18)
		Case of 
			: (r1=-1)
				//print custom comment(page break)
				vComments:=PRT_t_BreakComment  //
				$_t_Comment:=Vcomments
				$_l_Length:=Length:C16($_t_Comment)
				$_t_Comment:=Replace string:C233($_t_Comment; Char:C90(13); "")
				$_t_Comment:=Replace string:C233($_t_Comment; Char:C90(10); "")
				$_l_Length2:=Length:C16($_t_Comment)
				//allow an extra 18 for each line
				PRT_l_PrintedLines:=PRT_l_PrintedLines+18+(18*($_l_Length-$_l_Length2))
				r1:=1
			: ((r1=1) | ([INVOICES:39]Print_Comments:25=False:C215))
				vComments:=""
				PRT_l_PrintedLines:=PRT_l_PrintedLines+18
			Else 
				SetFontsByPointerParameter(<>DataSize; ""; 0; ->vComments)
				
				//Set_Fonts ("vComments";◊DataSize)
				$_t_Comment:=Vcomments
				$_l_Length:=Length:C16($_t_Comment)
				$_t_Comment:=Replace string:C233($_t_Comment; Char:C90(13); "")
				$_t_Comment:=Replace string:C233($_t_Comment; Char:C90(10); "")
				$_l_Length2:=Length:C16($_t_Comment)
				//allow an extra 18 for each line
				PRT_l_PrintedLines:=PRT_l_PrintedLines+18+(18*($_l_Length-$_l_Length2))
				r1:=1
		End case 
		Set_Fonts("vT"; <>DataSize-1)
		Set_Fonts("vDesc+vPrice+vQtyT+vAmount+vRate"; <>DataSize)
		vDesc:=[INVOICES_ITEMS:161]Product_Name:2
		vPrice:=[INVOICES_ITEMS:161]Sales_Price:4
		vQtyT:=InvFormSubQty
		vAmount:=[INVOICES_ITEMS:161]Amount:5
		If (vTotal<0)
			OBJECT SET FORMAT:C236(vPrice; "|InvAccNZ")
			OBJECT SET FORMAT:C236(vAmount; "|InvAccNZ")
		End if 
		RELATE ONE:C42([INVOICES_ITEMS:161]Tax_Code:6)
		If ([TAX_CODES:35]Use_Areas:4)
			vRate:=[INVOICES:39]Tax_Rate:28
		Else 
			vRate:=[TAX_CODES:35]Tax_Rate:3
		End if 
		If ((vAmount=0) & ([INVOICES_ITEMS:161]Product_Code:1=""))
			OBJECT SET FORMAT:C236(vRate; ";;")
		End if 
		Form_vT([INVOICES_ITEMS:161]Print_Description:14; [INVOICES_ITEMS:161]Description:13)
		//NOTE THAT THIS FORM DOES NOT INCLUDE Vt
End case 
ERR_MethodTrackerReturn("FM [INVOICES].INVFormSub2"; $_t_oldMethodName)
