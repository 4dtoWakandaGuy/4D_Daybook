If (False:C215)
	//object Name: [xCreditCardDetails]CARD IN.Variable13
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
	C_TEXT:C284($_t_oldMethodName; CCM_t_AddressLine1; CCM_t_AddressLine1OLD; CCM_t_AddressLine2; CCM_t_AddressLine2OLD; CCM_t_Country; CCM_t_CountryOLD; CCM_t_County; CCM_t_CountyOLD; CCM_t_PostalCode; CCM_t_PostalCodeOLD)
	C_TEXT:C284(CCM_t_Town; CCM_t_TownOLD)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [xCreditCardDetails].CARD_IN.Variable13"; Form event code:C388)
Gen_Confirm("Are you sure you want to edit the address for this card. Note this will not updat"+"e the address for the contact or company"; "Yes"; "No")
If (ok=1)
	OBJECT SET VISIBLE:C603(*; "oCCM_AdressBlock@"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oCCMCardAddress@"; True:C214)
	If (CCM_t_AddressLine1="") & (CCM_t_AddressLine2="") & (CCM_t_Town="") & (CCM_t_County="") & (CCM_t_PostalCode="") & (CCM_t_Country="")
		
		QUERY:C277([AddressRecords:125]; [AddressRecords:125]X_OwnerTableID:4=Table:C252(->[xCreditCardDetails:132]); *)
		QUERY:C277([AddressRecords:125];  & ; [AddressRecords:125]X_OwnerRecordID:5=[xCreditCardDetails:132]x_ID:1)
		If (Records in selection:C76([AddressRecords:125])>0)
			CCM_t_AddressLine1:=[AddressRecords:125]AddressLine1:6
			CCM_t_AddressLine2:=[AddressRecords:125]AddressLine2:7
			CCM_t_Town:=[AddressRecords:125]Town_City:8
			CCM_t_County:=[AddressRecords:125]County_State:9
			CCM_t_PostalCode:=[AddressRecords:125]Postal_Code:10
			CCM_t_Country:=[AddressRecords:125]Country:11
		Else 
			
			CCM_t_AddressLine1:=CCM_t_AddressLine1OLD
			CCM_t_AddressLine2:=CCM_t_AddressLine2OLD
			CCM_t_Town:=CCM_t_TownOLD
			CCM_t_County:=CCM_t_CountyOLD
			CCM_t_PostalCode:=CCM_t_PostalCodeOLD
			CCM_t_Country:=CCM_t_CountryOLD
			
		End if 
		GOTO OBJECT:C206(CCM_t_AddressLine1)
		
	End if 
	
	
End if 
ERR_MethodTrackerReturn("OBJ [xCreditCardDetails].CARD_IN.Variable13"; $_t_oldMethodName)
