//%attributes = {}
If (False:C215)
	//Project Method Name:      SVS_ContractTypeLoadRules
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
	//C_UNKNOWN($0)
	//C_UNKNOWN(SVS_iRB_ChargoutBilling)
	//C_UNKNOWN(SVS_iRB_TimeBilling)
	//C_UNKNOWN(SVS2_iRB_ChargePartPeriod)
	//C_UNKNOWN(SVS2_iRB_ChargePartPeriodnil)
	//C_UNKNOWN(SVS2_iRB_ChargeProRata)
	//ARRAY TEXT(SVS_at_ChargableActions;0)
	//ARRAY TEXT(SVS_at_ChargePeriods;0)
	C_BOOLEAN:C305(SVS_bo_Chargable; SVS_bo_LoansBilling; SVS_bo_PartsBilling; SVS_bo_Sheduled; SVS_bo_TimeOption; SVS_bo_Chargable; SVS_bo_LoansBilling; SVS_bo_PartsBilling; SVS_bo_Sheduled; SVS_bo_TimeOption)
	C_LONGINT:C283(SVS_iRB_ChargoutBilling; SVS_iRB_TimeBilling; SVS_l_ChargeLoanOption; SVS_l_ChargePeriodType; SVS_l_LoansPricePeriod; SVS_l_TimeBilling; SVS_l_TimeMinimum; SVS_l_TimePerUnit; SVS2_iRB_ChargePartPeriod; SVS2_iRB_ChargePartPeriodnil; SVS2_iRB_ChargeProRata)
	C_LONGINT:C283($_l_offset; SVS_l_ChargeLoanOption; SVS_l_ChargePeriodType; SVS_l_LoansPricePeriod; SVS_l_TimeBilling; SVS_l_TimeMinimum; SVS_l_TimePerUnit)
	C_OBJECT:C1216($_obj_ContractRules)
	C_TEXT:C284($_t_oldMethodName; SVS_t_CurrencyCode; SVS_t_CurrencyName; SVS_t_LoansPriceGroup; SVS_t_LoansPriceGroupNames; SVS_t_PartsPriceGroup; SVS_t_PartsPriceGroupName; $_t_oldMethodName; SVS_t_CurrencyCode; SVS_t_CurrencyName; SVS_t_LoansPriceGroup)
	C_TEXT:C284(SVS_t_LoansPriceGroupNames; SVS_t_PartsPriceGroup; SVS_t_PartsPriceGroupName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SVS_ContractTypeLoadRules")
If (Count parameters:C259=0)
	SVS_t_CurrencyCode:=""
	SVS_t_CurrencyName:=""
	SVS_l_TimeBilling:=0
	SVS_iRB_TimeBilling:=0
	SVS_iRB_ChargoutBilling:=0
	SVS_l_TimePerUnit:=0
	SVS_l_TimeMinimum:=0
	SVS_bo_TimeOption:=False:C215
	SVS_bo_Sheduled:=False:C215
	SVS_bo_Chargable:=False:C215
	SVS_bo_PartsBilling:=False:C215
	SVS_t_PartsPriceGroup:=""
	SVS_t_PartsPriceGroupName:=""
	SVS_bo_LoansBilling:=False:C215
	SVS_t_LoansPriceGroup:=""
	SVS_t_LoansPriceGroupNames:=""
	SVS_l_LoansPricePeriod:=0
	ARRAY TEXT:C222(SVS_at_ChargePeriods; 6)
	SVS_at_ChargePeriods{1}:="Hour"
	SVS_at_ChargePeriods{2}:="Day"
	SVS_at_ChargePeriods{3}:="Week"
	SVS_at_ChargePeriods{4}:="Month"
	SVS_at_ChargePeriods{5}:="Quarter"
	SVS_at_ChargePeriods{6}:="Year"
	
	SVS_l_ChargePeriodType:=0
	SVS_l_ChargeLoanOption:=0
	SVS2_iRB_ChargeProRata:=0
	SVS2_iRB_ChargePartPeriod:=0
	SVS2_iRB_ChargePartPeriodnil:=0
	ARRAY TEXT:C222(SVS_at_ChargableActions; 0)
	
	SVS_t_CurrencyName:=""
	//this is my own nasty code-and we want to get away from stuff like the above where a bunch of variables are set.
	//as part of this this method will now return and object with the data
	
	If ([CONTRACT_TYPES:19]xContractTypeRulesOBJ:13=Null:C1517)
		//data not transferred to new object field..
		
		If (BLOB size:C605([CONTRACT_TYPES:19]xContractTypeRules:9)>0)
			$_l_offset:=0
			
			
			BLOB TO VARIABLE:C533([CONTRACT_TYPES:19]xContractTypeRules:9; SVS_bo_Chargable; $_l_offset)  //Work is charg-able
			//note- if work is not charg-able then the charging rules on time are disabled!
			If (BLOB size:C605([CONTRACT_TYPES:19]xContractTypeRules:9)>$_l_offset)
				BLOB TO VARIABLE:C533([CONTRACT_TYPES:19]xContractTypeRules:9; SVS_t_CurrencyCode; $_l_offset)  //Chargable currency(units)=eg PSP
				If (BLOB size:C605([CONTRACT_TYPES:19]xContractTypeRules:9)>$_l_offset)
					BLOB TO VARIABLE:C533([CONTRACT_TYPES:19]xContractTypeRules:9; SVS_l_TimeBilling; $_l_offset)  // 1=Amts of time equal one unit 2=charge out rates
					//note that time billing and minimum units are disabled if using charge out rates!
					If (BLOB size:C605([CONTRACT_TYPES:19]xContractTypeRules:9)>$_l_offset)
						
						BLOB TO VARIABLE:C533([CONTRACT_TYPES:19]xContractTypeRules:9; SVS_l_TimePerUnit; $_l_offset)  // Amoint of time(Minutes) equal to a unit
						If (BLOB size:C605([CONTRACT_TYPES:19]xContractTypeRules:9)>$_l_offset)
							
							BLOB TO VARIABLE:C533([CONTRACT_TYPES:19]xContractTypeRules:9; SVS_l_TimeMinimum; $_l_offset)  //minimmum no of units
							If (BLOB size:C605([CONTRACT_TYPES:19]xContractTypeRules:9)>$_l_offset)
								
								BLOB TO VARIABLE:C533([CONTRACT_TYPES:19]xContractTypeRules:9; SVS_bo_TimeOption; $_l_offset)  // round up the units!!
								If (BLOB size:C605([CONTRACT_TYPES:19]xContractTypeRules:9)>$_l_offset)
									
									BLOB TO VARIABLE:C533([CONTRACT_TYPES:19]xContractTypeRules:9; SVS_bo_Sheduled; $_l_offset)  //Only allow items on the contract to be supported
									If (BLOB size:C605([CONTRACT_TYPES:19]xContractTypeRules:9)>$_l_offset)
										
										BLOB TO VARIABLE:C533([CONTRACT_TYPES:19]xContractTypeRules:9; SVS_bo_PartsBilling; $_l_offset)  //Charge for parts used
										//note if this is false then a price group for parts charging cannot be used
										If (BLOB size:C605([CONTRACT_TYPES:19]xContractTypeRules:9)>$_l_offset)
											
											BLOB TO VARIABLE:C533([CONTRACT_TYPES:19]xContractTypeRules:9; SVS_t_PartsPriceGroup; $_l_offset)  //Parts price group
											
											If (BLOB size:C605([CONTRACT_TYPES:19]xContractTypeRules:9)>$_l_offset)
												
												BLOB TO VARIABLE:C533([CONTRACT_TYPES:19]xContractTypeRules:9; SVS_bo_LoansBilling; $_l_offset)  //Charge for equipment loans
												//note if this is false then the loans price group and units are disabled
												If (BLOB size:C605([CONTRACT_TYPES:19]xContractTypeRules:9)>$_l_offset)
													
													BLOB TO VARIABLE:C533([CONTRACT_TYPES:19]xContractTypeRules:9; SVS_t_LoansPriceGroup; $_l_offset)  //Loans price group
													If (BLOB size:C605([CONTRACT_TYPES:19]xContractTypeRules:9)>$_l_offset)
														
														BLOB TO VARIABLE:C533([CONTRACT_TYPES:19]xContractTypeRules:9; SVS_l_LoansPricePeriod; $_l_offset)  //Loans price period
														
														If (BLOB size:C605([CONTRACT_TYPES:19]xContractTypeRules:9)>$_l_offset)
															
															BLOB TO VARIABLE:C533([CONTRACT_TYPES:19]xContractTypeRules:9; SVS_l_ChargePeriodType; $_l_offset)  //Loans price period type
															If (BLOB size:C605([CONTRACT_TYPES:19]xContractTypeRules:9)>$_l_offset)
																
																BLOB TO VARIABLE:C533([CONTRACT_TYPES:19]xContractTypeRules:9; SVS_l_ChargeLoanOption; $_l_offset)  //Charge part periods pro-rata
																If (BLOB size:C605([CONTRACT_TYPES:19]xContractTypeRules:9)>$_l_offset)
																	
																	BLOB TO VARIABLE:C533([CONTRACT_TYPES:19]xContractTypeRules:9; SVS_at_ChargableActions; $_l_offset)  //Charge part periods pro-rata
																	
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
			SVS_ContractTypeLoadRules(True:C214)  //transfer data to object field
		End if 
	Else 
		$_obj_ContractRules:=[CONTRACT_TYPES:19]xContractTypeRulesOBJ:13
		$0:=$_obj_ContractRules
		SVS_bo_Chargable:=$_obj_ContractRules.Chargable
		SVS_t_CurrencyCode:=$_obj_ContractRules.currencyCode
		SVS_l_TimeBilling:=$_obj_ContractRules.TimeBilling
		SVS_l_TimeBilling:=$_obj_ContractRules.TimePerUnit
		SVS_l_TimeMinimum:=$_obj_ContractRules.TimeMinimum
		SVS_bo_TimeOption:=$_obj_ContractRules.TimeOption
		SVS_bo_Sheduled:=$_obj_ContractRules.Sheduled
		SVS_bo_PartsBilling:=$_obj_ContractRules.PartsBilling
		SVS_t_PartsPriceGroup:=$_obj_ContractRules.PartsPriceGroup
		SVS_bo_LoansBilling:=$_obj_ContractRules.LoansBilling
		SVS_t_LoansPriceGroup:=$_obj_ContractRules.LoansPriceGroup
		SVS_l_LoansPricePeriod:=$_obj_ContractRules.LoansPricePeriod
		SVS_l_ChargePeriodType:=$_obj_ContractRules.ChargePeriodType
		SVS_l_ChargeLoanOption:=$_obj_ContractRules.ChargeLoanOption
		SVS_at_ChargableActions:=$_obj_ContractRules.ChargableActions
	End if 
Else 
	//instead of passing true false we can pass the object back in $1
	
	$_obj_ContractRules:=New object:C1471
	$_obj_ContractRules.Chargable:=SVS_bo_Chargable
	$_obj_ContractRules.currencyCode:=SVS_t_CurrencyCode
	$_obj_ContractRules.TimeBilling:=SVS_l_TimeBilling
	$_obj_ContractRules.TimePerUnit:=SVS_l_TimeBilling
	$_obj_ContractRules.TimeMinimum:=SVS_l_TimeMinimum
	$_obj_ContractRules.TimeOption:=SVS_bo_TimeOption
	$_obj_ContractRules.Sheduled:=SVS_bo_Sheduled
	$_obj_ContractRules.PartsBilling:=SVS_bo_PartsBilling
	$_obj_ContractRules.PartsPriceGroup:=SVS_t_PartsPriceGroup
	$_obj_ContractRules.LoansBilling:=SVS_bo_LoansBilling
	$_obj_ContractRules.LoansPriceGroup:=SVS_t_LoansPriceGroup
	$_obj_ContractRules.LoansPricePeriod:=SVS_l_LoansPricePeriod
	$_obj_ContractRules.ChargePeriodType:=SVS_l_ChargePeriodType
	$_obj_ContractRules.ChargeLoanOption:=SVS_l_ChargeLoanOption
	$_obj_ContractRules.ChargableActions:=SVS_at_ChargableActions
	[CONTRACT_TYPES:19]xContractTypeRulesOBJ:13:=$_obj_ContractRules
	//Save
	SET BLOB SIZE:C606([CONTRACT_TYPES:19]xContractTypeRules:9; 0)
	If (False:C215)
		VARIABLE TO BLOB:C532(SVS_bo_Chargable; [CONTRACT_TYPES:19]xContractTypeRules:9; *)  //Work is charg-able
		VARIABLE TO BLOB:C532(SVS_t_CurrencyCode; [CONTRACT_TYPES:19]xContractTypeRules:9; *)
		VARIABLE TO BLOB:C532(SVS_l_TimeBilling; [CONTRACT_TYPES:19]xContractTypeRules:9; *)
		VARIABLE TO BLOB:C532(SVS_l_TimePerUnit; [CONTRACT_TYPES:19]xContractTypeRules:9; *)
		VARIABLE TO BLOB:C532(SVS_l_TimeMinimum; [CONTRACT_TYPES:19]xContractTypeRules:9; *)
		VARIABLE TO BLOB:C532(SVS_bo_TimeOption; [CONTRACT_TYPES:19]xContractTypeRules:9; *)
		VARIABLE TO BLOB:C532(SVS_bo_Sheduled; [CONTRACT_TYPES:19]xContractTypeRules:9; *)
		VARIABLE TO BLOB:C532(SVS_bo_PartsBilling; [CONTRACT_TYPES:19]xContractTypeRules:9; *)
		VARIABLE TO BLOB:C532(SVS_t_PartsPriceGroup; [CONTRACT_TYPES:19]xContractTypeRules:9; *)
		VARIABLE TO BLOB:C532(SVS_bo_LoansBilling; [CONTRACT_TYPES:19]xContractTypeRules:9; *)
		VARIABLE TO BLOB:C532(SVS_t_LoansPriceGroup; [CONTRACT_TYPES:19]xContractTypeRules:9; *)
		VARIABLE TO BLOB:C532(SVS_l_LoansPricePeriod; [CONTRACT_TYPES:19]xContractTypeRules:9; *)
		VARIABLE TO BLOB:C532(SVS_l_ChargePeriodType; [CONTRACT_TYPES:19]xContractTypeRules:9; *)
		VARIABLE TO BLOB:C532(SVS_l_ChargeLoanOption; [CONTRACT_TYPES:19]xContractTypeRules:9; *)
		VARIABLE TO BLOB:C532(SVS_at_ChargableActions; [CONTRACT_TYPES:19]xContractTypeRules:9; *)
	End if 
	
End if 
ERR_MethodTrackerReturn("SVS_ContractTypeLoadRules"; $_t_oldMethodName)
