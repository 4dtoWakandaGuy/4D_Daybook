If (False:C215)
	//object Name: [PURCHASE_INVOICES]dPurch Sel.oCustomFieldsQuery
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/07/2012 14:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(COM_Lb_FurtherFieldsQuery;0)
	//ARRAY TEXT(CUS_at_DisplayedData;0)
	//ARRAY TEXT(CUS_at_PageText;0)
	//ARRAY TEXT(FUR_at_CustomFieldFormat;0)
	//ARRAY TEXT(FUR_at_CustomFieldTypes;0)
	C_DATE:C307($_d_Date)
	C_LONGINT:C283($_l_Column; $_l_event; $_l_Row)
	C_REAL:C285($_r_Number)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [PURCHASE_INVOICES].dPurch Sel.oCustomFieldsQuery"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		//CUS_at_DisplayedData;->CUS_at_PageText
		LISTBOX GET CELL POSITION:C971(COM_Lb_FurtherFieldsQuery; $_l_Column; $_l_Row)
		Case of 
			: ($_l_Column=2)
				EDIT ITEM:C870(CUS_at_DisplayedData; $_l_Row)
			: ($_l_Column=3)
				EDIT ITEM:C870(CUS_at_PageText; $_l_Row)
		End case 
	: ($_l_event=On Data Change:K2:15)
		LISTBOX GET CELL POSITION:C971(COM_Lb_FurtherFieldsQuery; $_l_Column; $_l_Row)
		Case of 
			: ($_l_Column=2)
				If (FUR_at_CustomFieldFormat{$_l_Row}#"")
					If (FUR_at_CustomFieldFormat{$_l_Row}="Pictures")
						Check_MinorNC(->CUS_at_DisplayedData{$_l_Row}; ""; ->[PICTURES:85]; ->[PICTURES:85]Picture_Code:1; ->[PICTURES:85]Picture_Name:2; "Picture")
					Else 
						Check_Lists(->CUS_at_DisplayedData{$_l_Row}; FUR_at_CustomFieldFormat{$_l_Row})
					End if 
				End if 
				Case of 
					: (FUR_at_CustomFieldTypes{$_l_Row}="D")
						$_d_Date:=Date:C102(CUS_at_DisplayedData{$_l_Row})
						CUS_at_DisplayedData{$_l_Row}:=String:C10($_d_Date)
						If (CUS_at_PageText{$_l_Row}="00/00/00")
							CUS_at_PageText{$_l_Row}:=CUS_at_DisplayedData{$_l_Row}
						End if 
					: (FUR_at_CustomFieldTypes{$_l_Row}="N")
						$_r_Number:=Num:C11(CUS_at_DisplayedData{$_l_Row})
						CUS_at_DisplayedData{$_l_Row}:=String:C10($_r_Number)
						If (CUS_at_PageText{$_l_Row}="0")
							CUS_at_PageText{$_l_Row}:=CUS_at_DisplayedData{$_l_Row}
						End if 
					Else 
						If (CUS_at_PageText{$_l_Row}="")
							CUS_at_PageText{$_l_Row}:=CUS_at_DisplayedData{$_l_Row}
						End if 
				End case 
				
				
			: ($_l_Column=3)
				If (FUR_at_CustomFieldFormat{$_l_Row}#"")
					If (FUR_at_CustomFieldFormat{$_l_Row}="Pictures")
						Check_MinorNC(->CUS_at_PageText{$_l_Row}; ""; ->[PICTURES:85]; ->[PICTURES:85]Picture_Code:1; ->[PICTURES:85]Picture_Name:2; "Picture")
					Else 
						Check_Lists(->CUS_at_PageText{$_l_Row}; FUR_at_CustomFieldFormat{$_l_Row})
					End if 
				End if 
				Case of 
					: (FUR_at_CustomFieldTypes{$_l_Row}="D")
						$_d_Date:=Date:C102(CUS_at_PageText{$_l_Row})
						CUS_at_PageText{$_l_Row}:=String:C10($_d_Date)
						If (CUS_at_DisplayedData{$_l_Row}="00/00/00")
							CUS_at_DisplayedData{$_l_Row}:=CUS_at_PageText{$_l_Row}
						End if 
					: (FUR_at_CustomFieldTypes{$_l_Row}="N")
						$_r_Number:=Num:C11(CUS_at_PageText{$_l_Row})
						CUS_at_PageText{$_l_Row}:=String:C10($_r_Number)
						If (CUS_at_DisplayedData{$_l_Row}="0")
							CUS_at_DisplayedData{$_l_Row}:=CUS_at_PageText{$_l_Row}
						End if 
					Else 
						If (CUS_at_DisplayedData{$_l_Row}="")
							CUS_at_DisplayedData{$_l_Row}:=CUS_at_PageText{$_l_Row}
						End if 
				End case 
				
		End case 
End case 
ERR_MethodTrackerReturn("OBJ [PURCHASE_INVOICES].dPurch Sel.oCustomFieldsQuery"; $_t_oldMethodName)
