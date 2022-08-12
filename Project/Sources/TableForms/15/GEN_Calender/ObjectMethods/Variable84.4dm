If (False:C215)
	//object Name: [USER]GEN_Calender.Variable84
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:13
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(<>DB_d_CurrentDate; CAL_D_CurrentViewDate)
	C_LONGINT:C283($_l_event; $_l_ItemReference; $_l_itemSublistID; $_l_Month; $_l_ParentYear; $_l_SelectedListItem2; HL_l_MonthsYears)
	C_TEXT:C284($_t_ItemReferenceSTR; $_t_ItemText; $_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].GEN_Calender.Variable84"; Form event code:C388)
//xAny
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		$_l_SelectedListItem2:=Selected list items:C379(HL_l_MonthsYears)
		If ($_l_SelectedListItem2>0)
			GET LIST ITEM:C378(HL_l_MonthsYears; $_l_SelectedListItem2; $_l_ItemReference; $_t_ItemText; $_l_itemSublistID)
			$_l_ParentYear:=List item parent:C633(HL_l_MonthsYears; $_l_ItemReference)
			If ($_l_itemSublistID=0) & ($_l_ParentYear>0)
				$_t_ItemReferenceSTR:=String:C10($_l_ItemReference)
				$_t_ItemReferenceSTR:=Replace string:C233($_t_ItemReferenceSTR; String:C10($_l_ParentYear); "")
				
				
				$_l_Month:=Num:C11($_t_ItemReferenceSTR)
				
				CAL_D_CurrentViewDate:=Date_FromStrs("1"; String:C10($_l_Month); String:C10($_l_ParentYear))
				vCalPeriod:=Diary_CalPer(<>DB_d_CurrentDate; CAL_D_CurrentViewDate; ->vCalF; ->VCalT; ->vPeriod; ->SD_t_Periodstr)
			End if 
		End if 
		
		
End case 
ERR_MethodTrackerReturn("OBJ [USER].GEN_Calender.Variable84"; $_t_oldMethodName)
