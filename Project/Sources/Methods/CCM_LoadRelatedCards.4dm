//%attributes = {}
If (False:C215)
	//Project Method Name:      CCM_LoadRelatedCards
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 11/06/2011 09:24
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(CCM_al_CardClasses;0)
	//ARRAY LONGINT(CCM_al_CardOwnerClasses;0)
	//ARRAY TEXT(CCM_at_CardClasses;0)
	//ARRAY TEXT(CCM_at_CardOwnerClasses;0)
	C_BOOLEAN:C305($_bo_LoadCompany)
	C_LONGINT:C283($_l_CardClassPosition; $_l_CurrentCharIndex; $_l_DateType; $_l_Element; $_l_Index; $_l_Index2; $_l_Index3; $_l_NewCount; $_l_RecordCount; $_l_RecordID; $_l_Security)
	C_LONGINT:C283($_l_Size; $_l_TableNumber; $1; $2; CCM_l_CardToUse; CCM_l_LoadExpired)
	C_POINTER:C301($_ptr_DataField; $10; $11; $12; $13; $14; $3; $4; $5; $6; $7)
	C_POINTER:C301($8; $9)
	C_TEXT:C284($_t_CardExpires; $_t_CardStarts; $_t_FirstFour; $_t_FirstThree; $_t_ForthFour; $_t_MonthString; $_t_NameOnCard; $_t_oldMethodName; $_t_SecondFour; $_t_ThirdFour; $_t_YearString)
	C_TEXT:C284(CC_T_CCX99999999999; CCM_T_CardNumber)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CCM_LoadRelatedCards")
//CCM_LoadRelatedCards
//this method loads a range of cards belonging to one person or company to arrays
//```

ARRAY TEXT:C222(CCM_at_CardClasses; 2)
ARRAY LONGINT:C221(CCM_al_CardClasses; 2)
CCM_at_CardClasses{1}:="Debit Card"
CCM_at_CardClasses{2}:="Credit Card"
CCM_al_CardClasses{1}:=1
CCM_al_CardClasses{2}:=2
//````
ARRAY LONGINT:C221(CCM_al_CardOwnerClasses; 2)
ARRAY TEXT:C222(CCM_at_CardOwnerClasses; 2)
CCM_al_CardOwnerClasses{1}:=1
CCM_al_CardOwnerClasses{2}:=2
CCM_at_CardOwnerClasses{1}:="Company"
CCM_at_CardOwnerClasses{2}:="Personal"
//Make sure the array are defined and set to 0 size first
//cant reset in this method because there is not specific posistion for them
//Jut pair them together
$_bo_LoadCompany:=False:C215
If (Count parameters:C259>=4)
	If ($1<1)
		//Load only company class cards
		$_bo_LoadCompany:=True:C214
		$_l_TableNumber:=Abs:C99($1)
	Else 
		$_l_TableNumber:=$1
	End if 
	$_l_RecordID:=$2
	If ($_l_TableNumber>0) & ($_l_RecordID>0)
		
		QUERY:C277([xCreditCardDetails:132]; [xCreditCardDetails:132]RelatedTableNumber:12=$_l_TableNumber; *)
		QUERY:C277([xCreditCardDetails:132];  & ; [xCreditCardDetails:132]RelatedRecordIdent:13=$_l_RecordID)
		If ($_bo_LoadCompany)
			QUERY SELECTION:C341([xCreditCardDetails:132]; [xCreditCardDetails:132]CardHolderClass:2=1)
		End if 
		
		QUERY SELECTION:C341([xCreditCardDetails:132]; [xCreditCardDetails:132]xDeleted:18=0)
		
		$_l_RecordCount:=Records in selection:C76([xCreditCardDetails:132])
		CREATE SET:C116([xCreditCardDetails:132]; "$allCards")
		If (CCM_l_CardToUse#0)
			QUERY:C277([xCreditCardDetails:132]; [xCreditCardDetails:132]x_ID:1=CCM_l_CardToUse)
			CREATE SET:C116([xCreditCardDetails:132]; "$allCards2")
			UNION:C120("$allCards"; "$allCards2"; "$allCards")
			USE SET:C118("$allCards")
		End if 
		QUERY SELECTION:C341([xCreditCardDetails:132]; [xCreditCardDetails:132]EndDate:8>=Current date:C33)
		$_l_NewCount:=Records in selection:C76([xCreditCardDetails:132])
		//If ($_l_RecordCount>0) & ($_l_NewCount=0)
		If ($_l_RecordCount#$_l_NewCount)  //modified from above 22/0808 -kmw (it seemed incorrect to allow displayal of expired cards but only if there were no others....i'd have thought this was either a definate yes or a definate no.....CCM_LoadExpired now explicitly set before calling a card selection dialog)
			If (CCM_l_LoadExpired=0)  //added 22/0808 -kmw (it seemed incorrect to allow displayal of expired cards but only if there were no others....i'd have thought this was either a definate yes or a definate no.....CCM_LoadExpired now explicitly set before calling a card selection dia//log)
				Case of   //added 22/0808 -kmw (it seemed incorrect to allow displayal of expired cards but only if there were no others....i'd have thought this was either a definate yes or a definate no.....CCM_LoadExpired now explicitly set before calling a card selection dialog)
					: ($_l_NewCount=0)  //added 22/0808 -kmw (it seemed incorrect to allow displayal of expired cards but only if there were no others....i'd have thought this was either a definate yes or a definate no.....CCM_LoadExpired now explicitly set before calling a card selection dialog)
						Gen_Confirm("There are no current cards for this account. Show expired?"; "No"; "Show")
					: ($_l_NewCount>0)  //added 22/0808 -kmw (it seemed incorrect to allow displayal of expired cards but only if there were no others....i'd have thought this was either a definate yes or a definate no.....CCM_LoadExpired now explicitly set before calling a card selection dialog)
						Gen_Confirm("There is at least one expired card for this account. Show expired?"; "No"; "Show")  //added 22/0808 -kmw (it seemed incorrect to allow displayal of expired cards but only if there were no others....i'd have thought this was either a definate yes or a definate no.....CCM_LoadExpired now explicitly set before calling a card selection dia//log)
					Else   //added 22/0808 -kmw (it seemed incorrect to allow displayal of expired cards but only if there were no others....i'd have thought this was either a definate yes or a definate no.....CCM_LoadExpired now explicitly set before calling a card selection dialog)
						//shouldn't happen just in case. (can't have negative number of records found)
						OK:=0  //added 22/0808 -kmw (will set load expired to true)
				End case   //added 22/0808 -kmw (it seemed incorrect to allow displayal of expired cards but only if there were no others....i'd have thought this was either a definate yes or a definate no.....CCM_LoadExpired now explicitly set before calling a card selection dialog)
			Else 
				OK:=Num:C11(CCM_l_LoadExpired=-1)  //OK will be 1 if it =1
			End if 
			If (OK=0)
				CCM_l_LoadExpired:=1
				USE SET:C118("$allCards")
				$_l_NewCount:=Records in selection:C76([xCreditCardDetails:132])
				OK:=1
			Else 
				CCM_l_LoadExpired:=-1  //
			End if 
		End if 
		CLEAR SET:C117("$allCards")
		If ($_l_NewCount>0)
			For ($_l_Index; 4; Count parameters:C259; 2)
				If (Type:C295(${$_l_Index}->)=String array:K8:15) | (Type:C295(${$_l_Index}->)=Text array:K8:16) | (Type:C295(${$_l_Index}->)=Real array:K8:17) | (Type:C295(${$_l_Index}->)=Integer array:K8:18) | (Type:C295(${$_l_Index}->)=LongInt array:K8:19) | (Type:C295(${$_l_Index}->)=Date array:K8:20) | (Type:C295(${$_l_Index}->)=Boolean array:K8:21)
					$_l_Size:=Size of array:C274(${$_l_Index}->)
					Case of 
						: ($_l_NewCount>$_l_Size)
							INSERT IN ARRAY:C227(${$_l_Index}->; $_l_Size+1; ($_l_NewCount-$_l_Size))
						: ($_l_NewCount<$_l_Size)
							DELETE FROM ARRAY:C228(${$_l_Index}->; $_l_NewCount+1; $_l_Size)
					End case 
				End if 
				
			End for 
			//all the array(if that is what we are pointing  at )are set so poulate
			$_l_Element:=1
			FIRST RECORD:C50([xCreditCardDetails:132])
			For ($_l_Index; 1; $_l_NewCount)
				For ($_l_Index2; 3; Count parameters:C259; 2)
					Case of 
						: (Field:C253(${$_l_Index2})=Field:C253(->[xCreditCardDetails:132]AddedBy:15))
							If (Count parameters:C259>$_l_Index2)
								$_l_DateType:=Type:C295(${$_l_Index2+1}->)
								Case of 
									: ($_l_DateType=String array:K8:15) | ($_l_DateType=Text array:K8:16)
										$_ptr_DataField:=${$_l_Index2+1}
										$_ptr_DataField->{$_l_Element}:=[xCreditCardDetails:132]AddedBy:15
									: ($_l_DateType=Is string var:K8:2) | ($_l_DateType=Is text:K8:3) | ($_l_DateType=Is alpha field:K8:1)
										$_ptr_DataField->:=[xCreditCardDetails:132]AddedBy:15
								End case 
								
							End if 
							
						: (Field:C253(${$_l_Index2})=Field:C253(->[xCreditCardDetails:132]CardClass:3))
							If (Count parameters:C259>$_l_Index2)
								$_l_DateType:=Type:C295(${$_l_Index2+1}->)
								Case of 
									: ($_l_DateType=Integer array:K8:18) | ($_l_DateType=LongInt array:K8:19) | ($_l_DateType=Real array:K8:17)
										$_ptr_DataField:=${$_l_Index2+1}
										$_ptr_DataField->{$_l_Element}:=[xCreditCardDetails:132]CardClass:3
									: ($_l_DateType=Is longint:K8:6) | ($_l_DateType=Is integer:K8:5) | ($_l_DateType=Is real:K8:4)
										$_ptr_DataField->:=[xCreditCardDetails:132]CardClass:3
										
									: ($_l_DateType=String array:K8:15) | ($_l_DateType=Text array:K8:16)
										//resolve to a card class name
										$_ptr_DataField:=${$_l_Index2+1}
										$_l_CardClassPosition:=Find in array:C230(CCM_al_CardClasses; [xCreditCardDetails:132]CardClass:3)
										If ($_l_CardClassPosition>0)
											$_ptr_DataField->{$_l_Element}:=CCM_at_CardClasses{$_l_CardClassPosition}
										Else 
											$_ptr_DataField->{$_l_Element}:="Unknown"
										End if 
										
									: ($_l_DateType=Is string var:K8:2) | ($_l_DateType=Is text:K8:3) | ($_l_DateType=Is alpha field:K8:1)
										$_ptr_DataField:=${$_l_Index2+1}
										$_l_CardClassPosition:=Find in array:C230(CCM_al_CardClasses; [xCreditCardDetails:132]CardClass:3)
										If ($_l_CardClassPosition>0)
											$_ptr_DataField->:=CCM_at_CardClasses{$_l_CardClassPosition}
										Else 
											$_ptr_DataField->:="Unkown"
										End if 
										
								End case 
								
							End if 
							
						: (Field:C253(${$_l_Index2})=Field:C253(->[xCreditCardDetails:132]CardHolderClass:2))
							If (Count parameters:C259>$_l_Index2)
								$_l_DateType:=Type:C295(${$_l_Index2+1}->)
								Case of 
									: ($_l_DateType=Integer array:K8:18) | ($_l_DateType=LongInt array:K8:19) | ($_l_DateType=Real array:K8:17)
										$_ptr_DataField:=${$_l_Index2+1}
										$_ptr_DataField->{$_l_Element}:=[xCreditCardDetails:132]CardHolderClass:2
									: ($_l_DateType=Is longint:K8:6) | ($_l_DateType=Is integer:K8:5) | ($_l_DateType=Is real:K8:4)
										$_ptr_DataField->:=[xCreditCardDetails:132]CardHolderClass:2
										
									: ($_l_DateType=String array:K8:15) | ($_l_DateType=Text array:K8:16)
										//resolve to a card class name
										$_ptr_DataField:=${$_l_Index2+1}
										$_l_CardClassPosition:=Find in array:C230(CCM_al_CardOwnerClasses; [xCreditCardDetails:132]CardHolderClass:2)
										If ($_l_CardClassPosition>0)
											$_ptr_DataField->{$_l_Element}:=CCM_at_CardOwnerClasses{$_l_CardClassPosition}
										Else 
											$_ptr_DataField->{$_l_Element}:="Unkown"
										End if 
										
									: ($_l_DateType=Is string var:K8:2) | ($_l_DateType=Is text:K8:3) | ($_l_DateType=Is alpha field:K8:1)
										$_ptr_DataField:=${$_l_Index2+1}
										$_l_CardClassPosition:=Find in array:C230(CCM_al_CardOwnerClasses; [xCreditCardDetails:132]CardHolderClass:2)
										If ($_l_CardClassPosition>0)
											$_ptr_DataField->:=CCM_at_CardOwnerClasses{$_l_CardClassPosition}
										Else 
											$_ptr_DataField->:="Unkown"
										End if 
										
								End case 
								
							End if 
							
						: (Field:C253(${$_l_Index2})=Field:C253(->[xCreditCardDetails:132]CardNumber:9))
							CCM_DecryptCardNumber
							If (Position:C15(" "; CC_T_CCX99999999999)=0)
								If (Length:C16(CC_T_CCX99999999999)=15)
									$_t_FirstThree:=Substring:C12(CC_T_CCX99999999999; 1; 3)
									$_t_SecondFour:=Substring:C12(CC_T_CCX99999999999; 4; 4)
									$_t_ThirdFour:=Substring:C12(CC_T_CCX99999999999; 8; 4)
									$_t_ForthFour:=Substring:C12(CC_T_CCX99999999999; 12)
									CC_T_CCX99999999999:=$_t_FirstThree+" "+$_t_SecondFour+" "+$_t_ThirdFour+" "+$_t_ForthFour
								Else 
									$_t_FirstFour:=Substring:C12(CC_T_CCX99999999999; 1; 4)
									$_t_SecondFour:=Substring:C12(CC_T_CCX99999999999; 5; 4)
									$_t_ThirdFour:=Substring:C12(CC_T_CCX99999999999; 9; 4)
									$_t_ForthFour:=Substring:C12(CC_T_CCX99999999999; 13)
									CC_T_CCX99999999999:=$_t_FirstFour+" "+$_t_SecondFour+" "+$_t_ThirdFour+" "+$_t_ForthFour
								End if 
							End if 
							$_l_Security:=4
							If (Length:C16(CC_T_CCX99999999999)>0)
								For ($_l_Index3; 1; Length:C16(CC_T_CCX99999999999))
									If (CC_T_CCX99999999999[[$_l_Index3]]=" ")
										$_l_Security:=(Length:C16(CC_T_CCX99999999999))-$_l_Index3
									End if 
								End for 
							End if 
							
							$_l_CurrentCharIndex:=0
							CCM_T_CardNumber:=""
							
							If (CC_T_CCX99999999999#"")
								For ($_l_Index3; 1; (Length:C16(CC_T_CCX99999999999)-$_l_Security))
									If (CC_T_CCX99999999999[[$_l_Index3]]#" ")
										CCM_T_CardNumber:=CCM_T_CardNumber+"X"
									Else 
										CCM_T_CardNumber:=CCM_T_CardNumber+" "
									End if 
								End for 
								
							End if 
							If ($_l_Security>0) & (CC_T_CCX99999999999#"")
								CCM_T_CardNumber:=CCM_T_CardNumber+Substring:C12(CC_T_CCX99999999999; (Length:C16(CC_T_CCX99999999999)-$_l_Security); (Length:C16(CC_T_CCX99999999999)))
							End if 
							
							
							If (Count parameters:C259>$_l_Index2)
								$_l_DateType:=Type:C295(${$_l_Index2+1}->)
								Case of 
									: ($_l_DateType=String array:K8:15) | ($_l_DateType=Text array:K8:16)
										$_ptr_DataField:=${$_l_Index2+1}
										$_ptr_DataField->{$_l_Element}:=CCM_T_CardNumber
									: ($_l_DateType=Is string var:K8:2) | ($_l_DateType=Is text:K8:3) | ($_l_DateType=Is alpha field:K8:1)
										$_ptr_DataField->:=CCM_T_CardNumber
								End case 
								
							End if 
						: (Field:C253(${$_l_Index2})=Field:C253(->[xCreditCardDetails:132]Card_Issuer:6))
							If (Count parameters:C259>$_l_Index2)
								$_l_DateType:=Type:C295(${$_l_Index2+1}->)
								Case of 
									: ($_l_DateType=String array:K8:15) | ($_l_DateType=Text array:K8:16)
										$_ptr_DataField:=${$_l_Index2+1}
										$_ptr_DataField->{$_l_Element}:=[xCreditCardDetails:132]Card_Issuer:6
									: ($_l_DateType=Is string var:K8:2) | ($_l_DateType=Is text:K8:3) | ($_l_DateType=Is alpha field:K8:1)
										$_ptr_DataField->:=[xCreditCardDetails:132]Card_Issuer:6
								End case 
								
							End if 
						: (Field:C253(${$_l_Index2})=Field:C253(->[xCreditCardDetails:132]Card_TypeName:5))
							If (Count parameters:C259>$_l_Index2)
								$_l_DateType:=Type:C295(${$_l_Index2+1}->)
								Case of 
									: ($_l_DateType=String array:K8:15) | ($_l_DateType=Text array:K8:16)
										$_ptr_DataField:=${$_l_Index2+1}
										$_ptr_DataField->{$_l_Element}:=[xCreditCardDetails:132]Card_TypeName:5
									: ($_l_DateType=Is string var:K8:2) | ($_l_DateType=Is text:K8:3) | ($_l_DateType=Is alpha field:K8:1)
										$_ptr_DataField->:=[xCreditCardDetails:132]Card_TypeName:5
								End case 
								
							End if 
						: (Field:C253(${$_l_Index2})=Field:C253(->[xCreditCardDetails:132]xAVSStatus:19))
							If (Count parameters:C259>$_l_Index2)
								$_l_DateType:=Type:C295(${$_l_Index2+1}->)
								Case of 
									: ($_l_DateType=String array:K8:15) | ($_l_DateType=Text array:K8:16)
										$_ptr_DataField:=${$_l_Index2+1}
										$_ptr_DataField->{$_l_Element}:=[xCreditCardDetails:132]xAVSStatus:19
									: ($_l_DateType=Is string var:K8:2) | ($_l_DateType=Is text:K8:3) | ($_l_DateType=Is alpha field:K8:1)
										$_ptr_DataField->:=[xCreditCardDetails:132]xAVSStatus:19
								End case 
								
							End if 
							
						: (Field:C253(${$_l_Index2})=Field:C253(->[xCreditCardDetails:132]Card_TypeNUM:4))
							If (Count parameters:C259>$_l_Index2)
								$_l_DateType:=Type:C295(${$_l_Index2+1}->)
								Case of 
									: ($_l_DateType=Integer array:K8:18) | ($_l_DateType=LongInt array:K8:19) | ($_l_DateType=Real array:K8:17)
										$_ptr_DataField:=${$_l_Index2+1}
										$_ptr_DataField->{$_l_Element}:=[xCreditCardDetails:132]Card_TypeNUM:4
									: ($_l_DateType=Is longint:K8:6) | ($_l_DateType=Is integer:K8:5) | ($_l_DateType=Is real:K8:4)
										$_ptr_DataField:=${$_l_Index2+1}
										$_ptr_DataField->:=[xCreditCardDetails:132]Card_TypeNUM:4
									: ($_l_DateType=String array:K8:15) | ($_l_DateType=Text array:K8:16)
										$_ptr_DataField:=${$_l_Index2+1}
										$_ptr_DataField->{$_l_Element}:=[xCreditCardDetails:132]Card_TypeName:5
									: ($_l_DateType=Is string var:K8:2) | ($_l_DateType=Is text:K8:3) | ($_l_DateType=Is alpha field:K8:1)
										$_ptr_DataField->:=[xCreditCardDetails:132]Card_TypeName:5
								End case 
								
							End if 
							
						: (Field:C253(${$_l_Index2})=Field:C253(->[xCreditCardDetails:132]EndDate:8))
							If (Count parameters:C259>$_l_Index2)
								$_l_DateType:=Type:C295(${$_l_Index2+1}->)
								Case of 
									: ($_l_DateType=Date array:K8:20)
										$_ptr_DataField:=${$_l_Index2+1}
										
										$_ptr_DataField->{$_l_Element}:=[xCreditCardDetails:132]EndDate:8
									: ($_l_DateType=Is date:K8:7)
										$_ptr_DataField:=${$_l_Index2+1}
										$_ptr_DataField->:=[xCreditCardDetails:132]EndDate:8
									: ($_l_DateType=String array:K8:15) | ($_l_DateType=Text array:K8:16)
										$_ptr_DataField:=${$_l_Index2+1}
										$_t_YearString:=String:C10(Year of:C25([xCreditCardDetails:132]EndDate:8))
										If (Length:C16($_t_YearString)=4)
											$_t_YearString:=Substring:C12($_t_YearString; 3; 2)
										End if 
										$_t_MonthString:=String:C10(Month of:C24([xCreditCardDetails:132]EndDate:8))
										If (Length:C16($_t_MonthString)=1)
											$_t_MonthString:="0"+$_t_MonthString
										End if 
										$_t_CardExpires:=$_t_MonthString+"/"+$_t_YearString
										$_ptr_DataField->{$_l_Element}:=$_t_CardExpires
									: ($_l_DateType=Is string var:K8:2) | ($_l_DateType=Is text:K8:3) | ($_l_DateType=Is alpha field:K8:1)
										$_t_YearString:=String:C10(Year of:C25([xCreditCardDetails:132]EndDate:8))
										If (Length:C16($_t_YearString)=4)
											$_t_YearString:=Substring:C12($_t_YearString; 3; 2)
										End if 
										$_t_MonthString:=String:C10(Month of:C24([xCreditCardDetails:132]EndDate:8))
										If (Length:C16($_t_MonthString)=1)
											$_t_MonthString:="0"+$_t_MonthString
										End if 
										$_t_CardExpires:=$_t_MonthString+"/"+$_t_YearString
										
										$_ptr_DataField->:=$_t_CardExpires
								End case 
								
							End if 
							
						: (Field:C253(${$_l_Index2})=Field:C253(->[xCreditCardDetails:132]IssueNumber:10))
							If (Count parameters:C259>$_l_Index2)
								$_l_DateType:=Type:C295(${$_l_Index2+1}->)
								Case of 
									: ($_l_DateType=String array:K8:15) | ($_l_DateType=Text array:K8:16)
										$_ptr_DataField:=${$_l_Index2+1}
										$_ptr_DataField->{$_l_Element}:=[xCreditCardDetails:132]IssueNumber:10
									: ($_l_DateType=Is string var:K8:2) | ($_l_DateType=Is text:K8:3) | ($_l_DateType=Is alpha field:K8:1)
										$_ptr_DataField->:=[xCreditCardDetails:132]IssueNumber:10
								End case 
								
							End if 
						: (Field:C253(${$_l_Index2})=Field:C253(->[xCreditCardDetails:132]ModificationDetails:16))
							//eh programmmmmmmer only!@!!!!!!
							
						: (Field:C253(${$_l_Index2})=Field:C253(->[xCreditCardDetails:132]NameonCard:11))
							$_t_NameOnCard:=CCM_DecryptCardName
							If (Count parameters:C259>$_l_Index2)
								$_l_DateType:=Type:C295(${$_l_Index2+1}->)
								Case of 
									: ($_l_DateType=String array:K8:15) | ($_l_DateType=Text array:K8:16)
										$_ptr_DataField:=${$_l_Index2+1}
										$_ptr_DataField->{$_l_Element}:=$_t_NameOnCard
									: ($_l_DateType=Is string var:K8:2) | ($_l_DateType=Is text:K8:3) | ($_l_DateType=Is alpha field:K8:1)
										$_ptr_DataField->:=$_t_NameOnCard
								End case 
								
							End if 
							
						: (Field:C253(${$_l_Index2})=Field:C253(->[xCreditCardDetails:132]RelatedRecordIdent:13))
							
						: (Field:C253(${$_l_Index2})=Field:C253(->[xCreditCardDetails:132]RelatedTableNumber:12))
						: (Field:C253(${$_l_Index2})=Field:C253(->[xCreditCardDetails:132]SortOrder:14))
							If (Count parameters:C259>$_l_Index2)
								$_l_DateType:=Type:C295(${$_l_Index2+1}->)
								Case of 
									: ($_l_DateType=LongInt array:K8:19) | ($_l_DateType=Integer array:K8:18) | ($_l_DateType=Real array:K8:17)
										$_ptr_DataField:=${$_l_Index2+1}
										$_ptr_DataField->{$_l_Element}:=[xCreditCardDetails:132]SortOrder:14
									: ($_l_DateType=Is longint:K8:6) | ($_l_DateType=Is integer:K8:5) | ($_l_DateType=Is real:K8:4)
										$_ptr_DataField->:=[xCreditCardDetails:132]SortOrder:14
								End case 
								
							End if 
							
						: (Field:C253(${$_l_Index2})=Field:C253(->[xCreditCardDetails:132]StartDate:7))
							If (Count parameters:C259>$_l_Index2)
								$_l_DateType:=Type:C295(${$_l_Index2+1}->)
								Case of 
									: ($_l_DateType=Date array:K8:20)
										$_ptr_DataField:=${$_l_Index2+1}
										$_ptr_DataField->{$_l_Element}:=[xCreditCardDetails:132]StartDate:7
									: ($_l_DateType=Is date:K8:7)
										$_ptr_DataField:=${$_l_Index2+1}
										$_ptr_DataField->:=[xCreditCardDetails:132]StartDate:7
									: ($_l_DateType=String array:K8:15) | ($_l_DateType=Text array:K8:16)
										$_ptr_DataField:=${$_l_Index2+1}
										$_t_YearString:=String:C10(Year of:C25([xCreditCardDetails:132]StartDate:7))
										If (Length:C16($_t_YearString)=4)
											$_t_YearString:=Substring:C12($_t_YearString; 3; 2)
										End if 
										$_t_MonthString:=String:C10(Month of:C24([xCreditCardDetails:132]StartDate:7))
										If (Length:C16($_t_MonthString)=1)
											$_t_MonthString:="0"+$_t_MonthString
										End if 
										$_t_CardStarts:=$_t_MonthString+"/"+$_t_YearString
										$_ptr_DataField->{$_l_Element}:=$_t_CardStarts
									: ($_l_DateType=Is string var:K8:2) | ($_l_DateType=Is text:K8:3) | ($_l_DateType=Is alpha field:K8:1)
										$_t_YearString:=String:C10(Year of:C25([xCreditCardDetails:132]StartDate:7))
										If (Length:C16($_t_YearString)=4)
											$_t_YearString:=Substring:C12($_t_YearString; 3; 2)
										End if 
										$_t_MonthString:=String:C10(Month of:C24([xCreditCardDetails:132]StartDate:7))
										If (Length:C16($_t_MonthString)=1)
											$_t_MonthString:="0"+$_t_MonthString
										End if 
										$_t_CardStarts:=$_t_MonthString+"/"+$_t_YearString
										$_ptr_DataField->:=$_t_CardStarts
								End case 
								
							End if 
						: (Field:C253(${$_l_Index2})=Field:C253(->[xCreditCardDetails:132]x_ID:1))
							If (Count parameters:C259>$_l_Index2)
								$_l_DateType:=Type:C295(${$_l_Index2+1}->)
								Case of 
									: ($_l_DateType=LongInt array:K8:19) | ($_l_DateType=Integer array:K8:18) | ($_l_DateType=Real array:K8:17)
										$_ptr_DataField:=${$_l_Index2+1}
										$_ptr_DataField->{$_l_Element}:=[xCreditCardDetails:132]x_ID:1
									: ($_l_DateType=Is longint:K8:6) | ($_l_DateType=Is integer:K8:5) | ($_l_DateType=Is real:K8:4)
										$_ptr_DataField->:=[xCreditCardDetails:132]x_ID:1
										
								End case 
								
							End if 
							
					End case 
					
				End for 
				NEXT RECORD:C51([xCreditCardDetails:132])
				$_l_Element:=$_l_Element+1
			End for 
			
			
		End if 
		
	End if 
End if 
ERR_MethodTrackerReturn("CCM_LoadRelatedCards"; $_t_oldMethodName)