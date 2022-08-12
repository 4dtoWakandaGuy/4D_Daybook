//%attributes = {}
If (False:C215)
	//Project Method Name:      SVS_ContractLoadRules
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(CON_at_ChargableActions;0)
	//ARRAY TEXT(CON_at_ChargePeriods;0)
	C_BOOLEAN:C305(CON_bo_Chargable; CON_bo_LoansBilling; CON_bo_PartsBilling; CON_bo_Sheduled; CON_bo_TimeOption)
	C_LONGINT:C283($_l_offset; CON_iRB_ChargoutBilling; CON_iRB_TimeBilling; CON_l_ChargeLoanOption; CON_l_ChargePeriodType; CON_l_LoansPricePeriod; CON_l_TimeBilling; CON_l_TimeMinimum; CON_l_TimePerUnit; CON2_iRB_ChargePartPeriod; CON2_iRB_ChargePartPeriodnil)
	C_LONGINT:C283(CON2_iRB_ChargeProRata)
	C_TEXT:C284($_t_oldMethodName; CONT_t_LoansPriceGroup; CON_t_CurrencyCode; CON_t_CurrencyName; CON_t_LoansPriceGroup; CON_t_PartsPriceGroup; CONT_t_PartsPriceGroup)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SVS_ContractLoadRules")
//note-this method is very similart o CON_ContractTYPEloadrules. If you need to modify you should probably be modifying the type as well

If (Count parameters:C259=0)
	CON_t_CurrencyCode:=""
	CON_t_CurrencyName:=""
	CON_l_TimeBilling:=0
	CON_iRB_TimeBilling:=0
	CON_iRB_ChargoutBilling:=0
	CON_l_TimePerUnit:=0
	CON_l_TimeMinimum:=0
	CON_bo_TimeOption:=False:C215
	CON_bo_Sheduled:=False:C215
	CON_bo_Chargable:=False:C215
	CON_bo_PartsBilling:=False:C215
	CONT_t_PartsPriceGroup:=""
	CON_t_PartsPriceGroup:=""
	CON_bo_LoansBilling:=False:C215
	CONT_t_LoansPriceGroup:=""
	CON_t_LoansPriceGroup:=""
	CON_l_LoansPricePeriod:=0
	ARRAY TEXT:C222(CON_at_ChargePeriods; 6)
	CON_at_ChargePeriods{1}:="Hour"
	CON_at_ChargePeriods{2}:="Day"
	CON_at_ChargePeriods{3}:="Week"
	CON_at_ChargePeriods{4}:="Month"
	CON_at_ChargePeriods{5}:="Quarter"
	CON_at_ChargePeriods{6}:="Year"
	
	CON_l_ChargePeriodType:=0
	CON_l_ChargeLoanOption:=0
	CON2_iRB_ChargeProRata:=0
	CON2_iRB_ChargePartPeriod:=0
	CON2_iRB_ChargePartPeriodnil:=0
	ARRAY TEXT:C222(CON_at_ChargableActions; 0)
	
	CON_t_CurrencyName:=""
	If (BLOB size:C605([CONTRACTS:17]xContractRules:13)>0)
		$_l_offset:=0
		
		
		BLOB TO VARIABLE:C533([CONTRACTS:17]xContractRules:13; CON_bo_Chargable; $_l_offset)  //Work is charg-able
		//note- if work is not charg-able then the charging rules on time are disabled!
		If (BLOB size:C605([CONTRACTS:17]xContractRules:13)>$_l_offset)
			BLOB TO VARIABLE:C533([CONTRACTS:17]xContractRules:13; CON_t_CurrencyCode; $_l_offset)  //Chargable currency(units)=eg PSP
			If (BLOB size:C605([CONTRACTS:17]xContractRules:13)>$_l_offset)
				BLOB TO VARIABLE:C533([CONTRACTS:17]xContractRules:13; CON_l_TimeBilling; $_l_offset)  // 1=Amts of time equal one unit 2=charge out rates
				//note that time billing and minimum units are disabled if using charge out rates!
				If (BLOB size:C605([CONTRACTS:17]xContractRules:13)>$_l_offset)
					
					BLOB TO VARIABLE:C533([CONTRACTS:17]xContractRules:13; CON_l_TimePerUnit; $_l_offset)  // Amoint of time(Minutes) equal to a unit
					If (BLOB size:C605([CONTRACTS:17]xContractRules:13)>$_l_offset)
						
						BLOB TO VARIABLE:C533([CONTRACTS:17]xContractRules:13; CON_l_TimeMinimum; $_l_offset)  //minimmum no of units
						If (BLOB size:C605([CONTRACTS:17]xContractRules:13)>$_l_offset)
							
							BLOB TO VARIABLE:C533([CONTRACTS:17]xContractRules:13; CON_bo_TimeOption; $_l_offset)  // round up the units!!
							If (BLOB size:C605([CONTRACTS:17]xContractRules:13)>$_l_offset)
								
								BLOB TO VARIABLE:C533([CONTRACTS:17]xContractRules:13; CON_bo_Sheduled; $_l_offset)  //Only allow items on the contract to be supported
								If (BLOB size:C605([CONTRACTS:17]xContractRules:13)>$_l_offset)
									
									BLOB TO VARIABLE:C533([CONTRACTS:17]xContractRules:13; CON_bo_PartsBilling; $_l_offset)  //Charge for parts used
									//note if this is false then a price group for parts charging cannot be used
									If (BLOB size:C605([CONTRACTS:17]xContractRules:13)>$_l_offset)
										
										BLOB TO VARIABLE:C533([CONTRACTS:17]xContractRules:13; CONT_t_PartsPriceGroup; $_l_offset)  //Parts price group
										
										If (BLOB size:C605([CONTRACTS:17]xContractRules:13)>$_l_offset)
											
											BLOB TO VARIABLE:C533([CONTRACTS:17]xContractRules:13; CON_bo_LoansBilling; $_l_offset)  //Charge for equipment loans
											//note if this is false then the loans price group and units are disabled
											If (BLOB size:C605([CONTRACTS:17]xContractRules:13)>$_l_offset)
												
												BLOB TO VARIABLE:C533([CONTRACTS:17]xContractRules:13; CONT_t_LoansPriceGroup; $_l_offset)  //Loans price group
												If (BLOB size:C605([CONTRACTS:17]xContractRules:13)>$_l_offset)
													
													BLOB TO VARIABLE:C533([CONTRACTS:17]xContractRules:13; CON_l_LoansPricePeriod; $_l_offset)  //Loans price period
													
													If (BLOB size:C605([CONTRACTS:17]xContractRules:13)>$_l_offset)
														
														BLOB TO VARIABLE:C533([CONTRACTS:17]xContractRules:13; CON_l_ChargePeriodType; $_l_offset)  //Loans price period type
														If (BLOB size:C605([CONTRACTS:17]xContractRules:13)>$_l_offset)
															
															BLOB TO VARIABLE:C533([CONTRACTS:17]xContractRules:13; CON_l_ChargeLoanOption; $_l_offset)  //Charge part periods pro-rata
															If (BLOB size:C605([CONTRACTS:17]xContractRules:13)>$_l_offset)
																
																BLOB TO VARIABLE:C533([CONTRACTS:17]xContractRules:13; CON_at_ChargableActions; $_l_offset)  //Charge part periods pro-rata
																
															End if 
														End if 
													End if 
												End if 
											End if 
										End if 
									End if 
								End if 
							End if 
						End if 
					End if 
				End if 
			End if 
		End if 
	End if 
Else 
	//Save
	SET BLOB SIZE:C606([CONTRACTS:17]xContractRules:13; 0)
	VARIABLE TO BLOB:C532(CON_bo_Chargable; [CONTRACTS:17]xContractRules:13; *)  //Work is charg-able
	VARIABLE TO BLOB:C532(CON_t_CurrencyCode; [CONTRACTS:17]xContractRules:13; *)
	VARIABLE TO BLOB:C532(CON_l_TimeBilling; [CONTRACTS:17]xContractRules:13; *)
	VARIABLE TO BLOB:C532(CON_l_TimePerUnit; [CONTRACTS:17]xContractRules:13; *)
	VARIABLE TO BLOB:C532(CON_l_TimeMinimum; [CONTRACTS:17]xContractRules:13; *)
	VARIABLE TO BLOB:C532(CON_bo_TimeOption; [CONTRACTS:17]xContractRules:13; *)
	VARIABLE TO BLOB:C532(CON_bo_Sheduled; [CONTRACTS:17]xContractRules:13; *)
	VARIABLE TO BLOB:C532(CON_bo_PartsBilling; [CONTRACTS:17]xContractRules:13; *)
	VARIABLE TO BLOB:C532(CONT_t_PartsPriceGroup; [CONTRACTS:17]xContractRules:13; *)
	VARIABLE TO BLOB:C532(CON_bo_LoansBilling; [CONTRACTS:17]xContractRules:13; *)
	VARIABLE TO BLOB:C532(CONT_t_LoansPriceGroup; [CONTRACTS:17]xContractRules:13; *)
	VARIABLE TO BLOB:C532(CON_l_LoansPricePeriod; [CONTRACTS:17]xContractRules:13; *)
	VARIABLE TO BLOB:C532(CON_l_ChargePeriodType; [CONTRACTS:17]xContractRules:13; *)
	VARIABLE TO BLOB:C532(CON_l_ChargeLoanOption; [CONTRACTS:17]xContractRules:13; *)
	VARIABLE TO BLOB:C532(CON_at_ChargableActions; [CONTRACTS:17]xContractRules:13; *)
	
End if 
ERR_MethodTrackerReturn("SVS_ContractLoadRules"; $_t_oldMethodName)
