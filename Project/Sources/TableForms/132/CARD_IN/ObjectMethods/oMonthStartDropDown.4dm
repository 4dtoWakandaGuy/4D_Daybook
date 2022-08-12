If (False:C215)
	//object Method Name: Object Name:      [xCreditCardDetails].CARD_IN.oMonthStartDropDown
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Expanded)
	C_DATE:C307($_d_StartDate; $_d_StartDate1)
	C_LONGINT:C283($_l_Event; $_l_Index; $_l_ItemReference; $_l_MonthNumber; $_l_SelectedItemParent; $_l_SelectedListItem; $_l_SubListID; CCM_HL_MonthPicker1)
	C_TEXT:C284($_t_ItemText; $_t_MonthIDString; $_t_MonthString; $_t_oldMethodName; $_t_YearString; CCM_t_StartDate)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [xCreditCardDetails].CARD_IN.oMonthStartDropDown"; Form event code:C388)
$_l_Event:=Form event code:C388
Case of 
		
	: ($_l_Event=On Clicked:K2:4)
		
		
		$_l_SelectedListItem:=Selected list items:C379(CCM_HL_MonthPicker1)
		If ($_l_SelectedListItem>0)
			GET LIST ITEM:C378(CCM_HL_MonthPicker1; $_l_SelectedListItem; $_l_ItemReference; $_t_ItemText; $_l_SubListID; $_bo_Expanded)
			$_l_SelectedItemParent:=List item parent:C633(CCM_HL_MonthPicker1; $_l_ItemReference)
			If ($_l_SelectedItemParent>0)
				$_t_YearString:=String:C10($_l_SelectedItemParent)
				$_t_MonthIDString:=String:C10($_l_ItemReference)
				$_t_MonthString:=Replace string:C233($_t_MonthIDString; $_t_YearString; "")
				[xCreditCardDetails:132]StartDate:7:=Date:C102("01/01/"+$_t_YearString)
				$_d_StartDate:=[xCreditCardDetails:132]StartDate:7
				For ($_l_Index; 1; 365; 27)
					If ((Month of:C24($_d_StartDate))<Num:C11($_t_MonthString))
						$_d_StartDate:=[xCreditCardDetails:132]StartDate:7+$_l_Index
					Else 
						$_l_Index:=366
					End if 
				End for 
				$_d_StartDate1:=$_d_StartDate
				Repeat 
					$_d_StartDate:=$_d_StartDate-1
				Until (Month of:C24($_d_StartDate)#Month of:C24($_d_StartDate1))
				[xCreditCardDetails:132]StartDate:7:=$_d_StartDate+1
				$_l_MonthNumber:=Month of:C24([xCreditCardDetails:132]StartDate:7)
				If ($_l_MonthNumber<10)
					$_t_monthString:="0"+String:C10($_l_MonthNumber)
				Else 
					$_t_monthString:=String:C10($_l_MonthNumber)
				End if 
				$_t_YearString:=String:C10(Year of:C25([xCreditCardDetails:132]StartDate:7))
				If (Length:C16($_t_YearString)>3)
					$_t_YearString:=Substring:C12($_t_YearString; 3; Length:C16($_t_YearString))
				End if 
				
				
				CCM_t_StartDate:=$_t_monthString+"/"+$_t_YearString
			End if 
		End if 
		
End case 
ERR_MethodTrackerReturn("OBJ [xCreditCardDetails].CARD_IN.oMonthStartDropDown"; $_t_oldMethodName)
