//%attributes = {}
If (False:C215)
	//Project Method Name:      CCM_GetAddress
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 18/11/2010 15:33
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(CCM_al_CardOwnerClasses;0)
	//ARRAY TEXT(CCM_at_CardOwnerClasses;0)
	//ARRAY TEXT(CCM_at_CurrencyCodes;0)
	//ARRAY TEXT(CCM_at_CurrencyNames;0)
	C_BOOLEAN:C305($_bo_Create; $_bo_Unload; $0)
	C_LONGINT:C283(CCM_l_CountryElement; CCM_l_RelatedCoID)
	C_POINTER:C301($2; $3; $4; $5; $6)
	C_REAL:C285($1)
	C_TEXT:C284($_t_oldMethodName; $_t_CurrentInputForm; $_t_CurrentOutputform; CCM_t_CardOwnerDetails; CCM_t_CardOwner; CCM_t_AddressLine1; CCM_t_AddressLine1OLD; CCM_t_AddressLine2OLD; CCM_t_CountryISO; CCM_t_CountryOLD; CCM_t_County)
	C_TEXT:C284(CCM_t_CountyOLD; CCM_t_ISO; CCM_t_PostalCode; CCM_t_PostalCodeOLD; CCM_t_Town; CCM_t_TownOLD; WIN_t_CurrentInputForm; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CCM_GetAddress")
//this method will return the address for the currently card record..in the form required fo address verification
ARRAY LONGINT:C221(CCM_al_CardOwnerClasses; 2)
ARRAY TEXT:C222(CCM_at_CardOwnerClasses; 2)
CCM_al_CardOwnerClasses{1}:=1
CCM_al_CardOwnerClasses{2}:=2
CCM_at_CardOwnerClasses{1}:="Company"
CCM_at_CardOwnerClasses{2}:="Personal"

If (Count parameters:C259>0)
	
	If ([xCreditCardDetails:132]x_ID:1#$1)
		QUERY:C277([xCreditCardDetails:132]; [xCreditCardDetails:132]x_ID:1=$1)
	End if 
	
	If ([xCreditCardDetails:132]x_ID:1>0)
		QUERY:C277([AddressRecords:125]; [AddressRecords:125]X_OwnerTableID:4=Table:C252(->[xCreditCardDetails:132]); *)
		QUERY:C277([AddressRecords:125];  & ; [AddressRecords:125]X_OwnerRecordID:5=$1)
		If (Records in selection:C76([AddressRecords:125])=1)
			CCM_t_AddressLine1OLD:=[AddressRecords:125]AddressLine1:6
			CCM_t_AddressLine2OLD:=[AddressRecords:125]AddressLine2:7
			CCM_t_TownOLD:=[AddressRecords:125]Town_City:8
			CCM_t_CountyOLD:=[AddressRecords:125]County_State:9
			CCM_t_PostalCodeOLD:=[AddressRecords:125]Postal_Code:10
			CCM_t_CountryOLD:=[AddressRecords:125]Country:11
			
		Else 
			If ([xCreditCardDetails:132]RelatedRecordIdent:13#[CONTACTS:1]x_ID:33)
				QUERY:C277([CONTACTS:1]; [CONTACTS:1]x_ID:33=[xCreditCardDetails:132]RelatedRecordIdent:13)
			End if 
			If ([xCreditCardDetails:132]CardHolderClass:2>0)
				Case of 
					: ([xCreditCardDetails:132]CardHolderClass:2=CCM_al_CardOwnerClasses{Find in array:C230(CCM_at_CardOwnerClasses; "Company")})
						//This is a company card so company might matter
						
						
						If (CCM_l_RelatedCoID>0)
							QUERY:C277([COMPANIES:2]; [COMPANIES:2]x_ID:63=CCM_l_RelatedCoID)
						Else 
							//First company
							QUERY:C277([CONTACTS:1]; [CONTACTS:1]x_ID:33=[xCreditCardDetails:132]RelatedRecordIdent:13)
							QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[CONTACTS:1]Company_Code:1)
							
						End if 
						
						CCM_t_CardOwner:=[CONTACTS:1]Contact_Name:31+", "+[COMPANIES:2]Company_Name:2
						CCM_t_CardOwnerDetails:=[CONTACTS:1]Contact_Name:31+Char:C90(13)+[COMPANIES:2]Company_Name:2+Char:C90(13)+[COMPANIES:2]ADDRESS:60
						CCM_t_AddressLine1OLD:=[COMPANIES:2]Address_Line_one:3
						CCM_t_AddressLine2OLD:=[COMPANIES:2]Address_Line_two:4
						CCM_t_TownOLD:=[COMPANIES:2]Town_or_City:5
						CCM_t_CountyOLD:=[COMPANIES:2]County_or_State:6
						CCM_t_PostalCodeOLD:=[COMPANIES:2]Postal_Code:7
						CCM_t_CountryOLD:=[COMPANIES:2]Country:8
						
						
					: ([xCreditCardDetails:132]CardHolderClass:2=CCM_al_CardOwnerClasses{Find in array:C230(CCM_at_CardOwnerClasses; "Personal")})
						//this is a personal card so company does not matter
						
						If ([COMPANIES:2]Company_Code:1#[CONTACTS:1]Company_Code:1)
							
							QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[CONTACTS:1]Company_Code:1)
						End if 
						CCM_t_CardOwner:=[CONTACTS:1]Contact_Name:31
						CCM_t_CardOwnerDetails:=[CONTACTS:1]Contact_Name:31+Char:C90(13)+[COMPANIES:2]ADDRESS:60
						CCM_t_AddressLine1OLD:=[COMPANIES:2]Address_Line_one:3
						CCM_t_AddressLine2OLD:=[COMPANIES:2]Address_Line_two:4
						CCM_t_TownOLD:=[COMPANIES:2]Town_or_City:5
						CCM_t_CountyOLD:=[COMPANIES:2]County_or_State:6
						CCM_t_PostalCodeOLD:=[COMPANIES:2]Postal_Code:7
						CCM_t_CountryOLD:=[COMPANIES:2]Country:8
						
					Else 
				End case 
				
			Else 
				
				
				
				
				If (CCM_l_RelatedCoID>0)
					QUERY:C277([COMPANIES:2]; [COMPANIES:2]x_ID:63=CCM_l_RelatedCoID)
				Else 
					//First company
					If ([COMPANIES:2]Company_Code:1#[CONTACTS:1]Company_Code:1)
						
						QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[CONTACTS:1]Company_Code:1)
					End if 
				End if 
				CCM_t_CardOwner:=[CONTACTS:1]Contact_Name:31
				CCM_t_CardOwnerDetails:=[CONTACTS:1]Contact_Name:31+Char:C90(13)+[COMPANIES:2]ADDRESS:60
				CCM_t_AddressLine1OLD:=[COMPANIES:2]Address_Line_one:3
				CCM_t_AddressLine2OLD:=[COMPANIES:2]Address_Line_two:4
				CCM_t_TownOLD:=[COMPANIES:2]Town_or_City:5
				CCM_t_CountyOLD:=[COMPANIES:2]County_or_State:6
				CCM_t_PostalCodeOLD:=[COMPANIES:2]Postal_Code:7
				CCM_t_CountryOLD:=[COMPANIES:2]Country:8
				
				
				
			End if 
			
			
		End if 
		If (CCM_t_CountryOLD="")
			//use the home country of the base currency?
			$_bo_Unload:=(Records in selection:C76([USER:15])=0)
			ALL RECORDS:C47([USER:15])
			CCM_t_CountryOLD:=[USER:15]Country:7
			If ($_bo_Unload)
				UNLOAD RECORD:C212([USER:15])
			End if 
		End if 
		
		QUERY:C277([COUNTRIES:73]; [COUNTRIES:73]COUNTRY_CODE:1=CCM_t_CountryOLD)
		If (Records in selection:C76([COUNTRIES:73])=0) | ([COUNTRIES:73]ISO_Code:6="")
			If (Records in selection:C76([COUNTRIES:73])=0)
				Gen_Alert("The country "+CCM_t_CountryOLD+" is unknown, either this adress should have a valid country or that country shoul"+"d be created in the data manager. You will need to select a country to use for th"+"is address.")
				CCM_ISOCurrencyCodes("Country")
				INSERT IN ARRAY:C227(CCM_at_CurrencyNames; Size of array:C274(CCM_at_CurrencyNames)+1; 1)
				CCM_at_CurrencyNames{Size of array:C274(CCM_at_CurrencyNames)}:="More..."
				Repeat 
					$_bo_Create:=GEN_ChoicePopupCall(->CCM_at_CurrencyNames; ->CCM_l_CountryElement; False:C215; "Select Country"; "Select"; "Cancel")
					If (CCM_l_CountryElement=0)
						Gen_Confirm("You must select a country to continue processing"; "OK"; "Stop")
						If (Ok=0)
							CCM_t_CountryOLD:="NUL"
						End if 
					End if 
				Until (CCM_t_CountryOLD="NUL") | (CCM_l_CountryElement>0)
				If (CCM_t_CountryOLD#"NUL")
					If (CCM_at_CurrencyNames{CCM_l_CountryElement}="More...")
						CCM_l_CountryElement:=0
						CCM_ISOCurrencyCodes("CountryFULL")
						$_bo_Create:=GEN_ChoicePopupCall(->CCM_at_CurrencyNames; ->CCM_l_CountryElement; False:C215; "Select Country"; "Select"; "Cancel")
						If (CCM_l_CountryElement=0)
							Repeat 
								Gen_Confirm("You must select a country to continue processing"; "OK"; "Stop")
								If (Ok=0)
									CCM_t_CountryOLD:="NUL"
								Else 
									$_bo_Create:=GEN_ChoicePopupCall(->CCM_at_CurrencyNames; ->CCM_l_CountryElement; False:C215; "Select Country"; "Select"; "Cancel")
									
								End if 
							Until (CCM_t_CountryOLD="NUL") | (CCM_l_CountryElement>0)
							If (CCM_t_CountryOLD#"NUL")
								CCM_t_CountryOLD:=CCM_at_CurrencyNames{CCM_l_CountryElement}
								CCM_t_ISO:=CCM_at_CurrencyCodes{CCM_l_CountryElement}
							End if 
						Else 
							CCM_t_CountryOLD:=CCM_at_CurrencyNames{CCM_l_CountryElement}
							CCM_t_ISO:=CCM_at_CurrencyCodes{CCM_l_CountryElement}
						End if 
					End if 
				End if 
			Else 
				Gen_Alert("The ISO code of this country is unknown. You will only need to set this once")
				Repeat 
					//$CurrentDefault:=Current default table
					DBI_DisplayRecord(Current process:C322; Table:C252(->[COUNTRIES:73]); "Modify Country")
					WIN_t_CurrentInputForm:=$_t_CurrentInputForm
					WIN_t_CurrentOutputform:=$_t_CurrentOutputform
					QUERY:C277([COUNTRIES:73]; [COUNTRIES:73]COUNTRY_CODE:1=CCM_t_CountryOLD)
					If ([COUNTRIES:73]ISO_Code:6="")
						Gen_Confirm("Sorry you must set this to continue"; "Try Again"; "Stop")
						If (OK=0)
							CCM_t_CountryOLD:="NUL"
						End if 
					Else 
						CCM_t_CountryOLD:=[COUNTRIES:73]ISO_Code:6
					End if 
				Until (CCM_t_CountryOLD#"")
				If (CCM_t_CountryOLD#"NUL")
					CCM_t_ISO:=[COUNTRIES:73]ISO_Code:6
				End if 
				UNLOAD RECORD:C212([COUNTRIES:73])
			End if 
			
			
		Else 
			CCM_t_ISO:=[COUNTRIES:73]ISO_Code:6
		End if 
		
		If (CCM_t_CountryOLD#"NUL")
			$0:=True:C214
			
			If (Count parameters:C259>=6)
				$2->:=CCM_t_AddressLine1OLD
				$3->:=CCM_t_TownOLD
				$4->:=CCM_t_CountyOLD
				$5->:=CCM_t_PostalCodeOLD
				$6->:=CCM_t_ISO
			Else 
				CCM_t_AddressLine1:=CCM_t_AddressLine1OLD
				CCM_t_Town:=CCM_t_TownOLD
				CCM_t_County:=CCM_t_CountyOLD
				CCM_t_PostalCode:=CCM_t_PostalCodeOLD
				CCM_t_CountryISO:=CCM_t_ISO
				
			End if 
			
		Else 
			$0:=False:C215
			
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("CCM_GetAddress"; $_t_oldMethodName)