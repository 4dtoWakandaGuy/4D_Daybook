//%attributes = {}

If (False:C215)
	//Project Method Name:      Reports_BuildArrayofElements
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  03/08/2020
	//Created BY:  Nigel Greenlee
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 

//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SR_at_EmailPrintOption3;0)
	//ARRAY TEXT(SR_at_EmailPrintOption4;0)
	C_LONGINT:C283($_l_parameters)
	C_POINTER:C301($_ptr_ArrayToSetup; $_ptr_EMaiilPrintOption1; $_ptr_EMaiilPrintOption2; $_ptr_EMaiilPrintOption3; $_ptr_EMaiilPrintOption4; $_Ptr_EmailPrintOption2Cont; $_Ptr_EmailPrintOption2Email; $_Ptr_EmailPrintOption2pers; $_Ptr_EmailPrintOption2Role; $_Ptr_EmailPrintOption3Cont; $_Ptr_EmailPrintOption3Email)
	C_POINTER:C301($_Ptr_EmailPrintOption3pers; $_Ptr_EmailPrintOption3Role; $_Ptr_OverRideSR; $_Ptr_UseStandard; $1; $10; $11; $12; $13; $14; $15)
	C_POINTER:C301($2; $3; $4; $5; $6; $7; $8; $9)
	C_TEXT:C284(SR_t_EmailPrintOption3Role)
End if 
//Code Starts Here
$_l_parameters:=Count parameters:C259
If ($_l_parameters>=1)
	$_ptr_ArrayToSetup:=$1
	If ($_l_parameters>=2)
		$_Ptr_UseStandard:=$2
		If ($_l_parameters>=3)
			$_Ptr_OverRideSR:=$3
			If ($_l_parameters>=4)
				$_ptr_EMaiilPrintOption1:=$4  //An array
				If ($_l_parameters>=5)
					$_ptr_EMaiilPrintOption2:=$5  //An array
					If ($_l_parameters>=6)
						$_Ptr_EmailPrintOption2Email:=$6  //Text Ver
						If ($_l_parameters>=7)
							$_Ptr_EmailPrintOption2Cont:=$7  //Text Ver
							If ($_l_parameters>=8)
								$_Ptr_EmailPrintOption2Role:=$8  //Text Ver
								If ($_l_parameters>=9)
									$_Ptr_EmailPrintOption2pers:=$9  //Text Ver
									If ($_l_parameters>=10)
										$_ptr_EMaiilPrintOption3:=$10  //an array
										If ($_l_parameters>=11)
											$_Ptr_EmailPrintOption3Email:=$11  //Text Ver
											If ($_l_parameters>=12)
												$_Ptr_EmailPrintOption3Cont:=$12  //Text Ver
												If ($_l_parameters>=13)
													$_Ptr_EmailPrintOption3Role:=$13  //Text Ver
													If ($_l_parameters>=14)
														$_Ptr_EmailPrintOption3pers:=$14  //Text Ver
														If ($_l_parameters>=15)
															$_ptr_EMaiilPrintOption4:=$15  //an array
															If ($_l_parameters>=16)
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
End if 


ARRAY POINTER:C280($_ptr_ArrayToSetup->; 0)
If ($_l_parameters>=2)
	APPEND TO ARRAY:C911($_ptr_ArrayToSetup->; $_Ptr_UseStandard)  //SR_l_CompPrevUseStandardSR
	If ($_l_parameters>=3)
		APPEND TO ARRAY:C911($_ptr_ArrayToSetup->; $_Ptr_OverRideSR)  //SR_l_CompPrevOverrideSR
		If ($_l_parameters>=4)
			APPEND TO ARRAY:C911($_ptr_ArrayToSetup->; $_ptr_EMaiilPrintOption1)
			If ($_l_parameters>=5)
				APPEND TO ARRAY:C911($_ptr_ArrayToSetup->; $_ptr_EMaiilPrintOption2)
				If ($_l_parameters>=6)
					APPEND TO ARRAY:C911($_ptr_ArrayToSetup->; $_Ptr_EmailPrintOption2Email)
					If ($_l_parameters>=7)
						APPEND TO ARRAY:C911($_ptr_ArrayToSetup->; $_Ptr_EmailPrintOption2Cont)
						If ($_l_parameters>=8)
							APPEND TO ARRAY:C911($_ptr_ArrayToSetup->; $_Ptr_EmailPrintOption2Role)
							If ($_l_parameters>=9)
								APPEND TO ARRAY:C911($_ptr_ArrayToSetup->; $_Ptr_EmailPrintOption2Pers)
								If ($_l_parameters>=10)
									APPEND TO ARRAY:C911($_ptr_ArrayToSetup->; $_ptr_EMaiilPrintOption3)
									If ($_l_parameters>=11)
										APPEND TO ARRAY:C911($_ptr_ArrayToSetup->; $_Ptr_EmailPrintOption3Email)
										If ($_l_parameters>=12)
											APPEND TO ARRAY:C911($_ptr_ArrayToSetup->; $_Ptr_EmailPrintOption3Cont)
											If ($_l_parameters>=13)
												APPEND TO ARRAY:C911($_ptr_ArrayToSetup->; $_Ptr_EmailPrintOption3Role)
												If ($_l_parameters>=14)
													APPEND TO ARRAY:C911($_ptr_ArrayToSetup->; $_Ptr_EmailPrintOption3Pers)
													If ($_l_parameters>=15)
														APPEND TO ARRAY:C911($_ptr_ArrayToSetup->; $_ptr_EMaiilPrintOption4)
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
