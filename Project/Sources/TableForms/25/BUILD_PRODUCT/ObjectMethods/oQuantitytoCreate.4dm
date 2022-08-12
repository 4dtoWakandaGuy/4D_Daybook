If (False:C215)
	//object Name: [ORDER_ITEMS]BUILD_PRODUCT.oQuantitytoCreate
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:30
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(PRD_abo_IssueInsert;0)
	//ARRAY DATE(PRD_ad_IssueDate;0)
	//ARRAY LONGINT(OI_al_ComponentSectionID;0)
	//ARRAY LONGINT(OI_al_MultiplesIndex;0)
	//ARRAY TEXT(OI_at_MultipleCodes;0)
	//ARRAY TEXT(OI_at_ProductSections;0)
	//ARRAY TEXT(PRD_at_FillPattern;0)
	//ARRAY TEXT(PRD_at_IssueCode;0)
	C_DATE:C307($_d_FirstDate; $_d_LastDate; $_d_PreviousDate; PRD_d_FIrstDate; PRD_d_LastDate)
	C_LONGINT:C283($_l_CodeRow; $_l_Count; $_l_CountInserts; $_l_CurrentRow; $_l_Day; $_l_event; $_l_IssueRow; $_l_Max; $_l_Month; $_l_Month2; $_l_SectionID)
	C_LONGINT:C283($_l_Skip; $_l_Start; $_l_Year; $_l_Year2; PRD_l_ExtraDates)
	C_REAL:C285(PRD_R_QUantity)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDER_ITEMS].BUILD_PRODUCT.oQuantitytoCreate"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Data Change:K2:15)
		For ($_l_CurrentRow; 1; Size of array:C274(PRD_abo_IssueInsert))
			PRD_abo_IssueInsert{$_l_CurrentRow}:=False:C215
		End for 
		Case of 
			: ((PRD_R_QUantity-PRD_l_ExtraDates)=1)  //has to be consecutive
				$_l_Start:=Find in array:C230(PRD_ad_IssueDate; PRD_d_FIrstDate)
				If ($_l_Start<0)
					//Start date is wrong
					For ($_l_CurrentRow; 1; Size of array:C274(PRD_abo_IssueInsert))
						If (PRD_ad_IssueDate{$_l_CurrentRow}>=PRD_d_FIrstDate)
							PRD_d_FIrstDate:=PRD_ad_IssueDate{$_l_CurrentRow}
							$_l_Start:=$_l_CurrentRow
							$_l_CurrentRow:=Size of array:C274(PRD_abo_IssueInsert)
						End if 
					End for 
					If ($_l_Start<0)
						$_l_Start:=1
					End if 
				End if 
				$_l_CountInserts:=0
				For ($_l_CurrentRow; $_l_Start; (PRD_R_Quantity-PRD_l_ExtraDates); 1)
					If (Size of array:C274(PRD_abo_IssueInsert)>=$_l_CurrentRow)
						PRD_abo_IssueInsert{$_l_CurrentRow}:=True:C214
						$_l_CountInserts:=$_l_CountInserts+1
						If ($_l_CurrentRow=$_l_Start)
							PRD_d_FIrstDate:=PRD_ad_IssueDate{$_l_CurrentRow}
							If ($_l_Start=(PRD_R_Quantity-PRD_l_ExtraDates))
								PRD_d_LastDate:=PRD_ad_IssueDate{$_l_CurrentRow}
							End if 
						Else 
							PRD_d_LastDate:=PRD_ad_IssueDate{$_l_CurrentRow}
						End if 
					Else 
						// too many inserts!!!
						PRD_R_Quantity:=$_l_CountInserts+PRD_l_ExtraDates
					End if 
					If ($_l_CountInserts=(PRD_R_Quantity-PRD_l_ExtraDates))
						$_l_CurrentRow:=PRD_R_Quantity
					End if 
				End for 
			Else 
				$_l_Start:=Find in array:C230(PRD_ad_IssueDate; PRD_d_FIrstDate)
				If ($_l_Start<0)
					//Start date is wrong
					For ($_l_CurrentRow; 1; Size of array:C274(PRD_abo_IssueInsert))
						If (PRD_ad_IssueDate{$_l_CurrentRow}>=PRD_d_FIrstDate)
							PRD_d_FIrstDate:=PRD_ad_IssueDate{$_l_CurrentRow}
							$_l_Start:=$_l_CurrentRow
							$_l_CurrentRow:=Size of array:C274(PRD_abo_IssueInsert)
						End if 
					End for 
					If ($_l_Start<0)
						$_l_Start:=1
					End if 
				End if 
				$_l_CountInserts:=0
				Case of 
					: (PRD_at_FillPattern{PRD_at_FillPattern}="Consecutive Dates") | (PRD_at_FillPattern{PRD_at_FillPattern}="Alternating Dates") | (PRD_at_FillPattern{PRD_at_FillPattern}="Every 3rd Date") | (PRD_at_FillPattern{PRD_at_FillPattern}="Every 4th Date")
						$_l_Skip:=PRD_at_FillPattern
						$_l_Max:=$_l_Start+(PRD_R_Quantity-PRD_l_ExtraDates)*$_l_Skip
						For ($_l_CurrentRow; $_l_Start; $_l_Max; $_l_Skip)
							If (Size of array:C274(PRD_abo_IssueInsert)>=$_l_CurrentRow)
								$_l_CountInserts:=$_l_CountInserts+1
								PRD_abo_IssueInsert{$_l_CurrentRow}:=True:C214
								If ($_l_CountInserts=1)
									PRD_d_FIrstDate:=PRD_ad_IssueDate{$_l_CurrentRow}
									If ($_l_CountInserts=(PRD_R_Quantity-PRD_l_ExtraDates))
										PRD_d_LastDate:=PRD_ad_IssueDate{$_l_CurrentRow}
									End if 
								Else 
									PRD_d_LastDate:=PRD_ad_IssueDate{$_l_CurrentRow}
								End if 
								
							End if 
							If ($_l_CountInserts=(PRD_R_Quantity-PRD_l_ExtraDates))
								$_l_CurrentRow:=$_l_Max
							End if 
						End for 
						
					: (PRD_at_FillPattern{PRD_at_FillPattern}="1st Date in Week")
						$_l_Day:=0
						$_d_PreviousDate:=!00-00-00!
						$_l_CurrentRow:=$_l_Start-1
						Repeat 
							$_l_CurrentRow:=$_l_CurrentRow+1
							
							If (Size of array:C274(PRD_abo_IssueInsert)>=$_l_CurrentRow)
								If (PRD_ad_IssueDate{$_l_CurrentRow}>=($_d_PreviousDate+7))
									$_d_PreviousDate:=PRD_ad_IssueDate{$_l_CurrentRow}
									$_l_CountInserts:=$_l_CountInserts+1
									PRD_abo_IssueInsert{$_l_CurrentRow}:=True:C214
									If ($_l_CountInserts=1)
										PRD_d_FIrstDate:=PRD_ad_IssueDate{$_l_CurrentRow}
										If ($_l_CountInserts=(PRD_R_Quantity-PRD_l_ExtraDates))
											PRD_d_LastDate:=PRD_ad_IssueDate{$_l_CurrentRow}
										End if 
									Else 
										PRD_d_LastDate:=PRD_ad_IssueDate{$_l_CurrentRow}
									End if 
								End if 
							End if 
							
						Until ($_l_CurrentRow>=Size of array:C274(PRD_abo_IssueInsert)) | ($_l_CountInserts>=(PRD_R_Quantity-PRD_l_ExtraDates))
					: (PRD_at_FillPattern{PRD_at_FillPattern}="1st Date in Month")
						$_l_Month:=0
						$_l_CurrentRow:=$_l_Start-1
						Repeat 
							$_l_CurrentRow:=$_l_CurrentRow+1
							//For ($_l_CurrentRow;$_l_Start;PRD_R_Quantity;1)
							If (Size of array:C274(PRD_abo_IssueInsert)>=$_l_CurrentRow)
								$_l_Month2:=Month of:C24(PRD_ad_IssueDate{$_l_CurrentRow})
								If ($_l_Month2#$_l_Month)
									$_l_Month:=$_l_Month2
									PRD_abo_IssueInsert{$_l_CurrentRow}:=True:C214
									$_l_CountInserts:=$_l_CountInserts+1
									If ($_l_CountInserts=1)
										PRD_d_FIrstDate:=PRD_ad_IssueDate{$_l_CurrentRow}
										If ($_l_CountInserts=(PRD_R_Quantity-PRD_l_ExtraDates))
											PRD_d_LastDate:=PRD_ad_IssueDate{$_l_CurrentRow}
										End if 
									Else 
										PRD_d_LastDate:=PRD_ad_IssueDate{$_l_CurrentRow}
									End if 
								End if 
							End if 
						Until ($_l_CurrentRow>=Size of array:C274(PRD_abo_IssueInsert)) | ($_l_CountInserts>=(PRD_R_Quantity-PRD_l_ExtraDates))
						
						
					: (PRD_at_FillPattern{PRD_at_FillPattern}="1st Date in Year")
						$_l_Year:=0
						$_l_CurrentRow:=$_l_Start-1
						Repeat 
							$_l_CurrentRow:=$_l_CurrentRow+1
							//For ($_l_CurrentRow;$_l_Start;PRD_R_Quantity;1)
							If (Size of array:C274(PRD_abo_IssueInsert)>=$_l_CurrentRow)
								$_l_Year2:=Year of:C25(PRD_ad_IssueDate{$_l_CurrentRow})
								If ($_l_Year2#$_l_Year)
									$_l_Year:=$_l_Year2
									PRD_abo_IssueInsert{$_l_CurrentRow}:=True:C214
									$_l_CountInserts:=$_l_CountInserts+1
									If ($_l_CountInserts=1)
										PRD_d_FIrstDate:=PRD_ad_IssueDate{$_l_CurrentRow}
										If ($_l_CountInserts=(PRD_R_Quantity-PRD_l_ExtraDates))
											PRD_d_LastDate:=PRD_ad_IssueDate{$_l_CurrentRow}
										End if 
									Else 
										PRD_d_LastDate:=PRD_ad_IssueDate{$_l_CurrentRow}
									End if 
								End if 
							End if 
						Until ($_l_CurrentRow>=Size of array:C274(PRD_abo_IssueInsert)) | ($_l_CountInserts>=(PRD_R_Quantity-PRD_l_ExtraDates))
						
						
				End case 
				PRD_R_Quantity:=$_l_CountInserts+PRD_l_ExtraDates
		End case 
		$_l_SectionID:=OI_al_ComponentSectionID{OI_at_ProductSections}
		$_l_IssueRow:=Find in array:C230(OI_al_MultiplesIndex; $_l_SectionID)
		If ($_l_IssueRow<0)
			APPEND TO ARRAY:C911(OI_al_MultiplesIndex; $_l_SectionID)
			INSERT IN ARRAY:C227(OI_at_MultipleCodes; Size of array:C274(OI_at_MultipleCodes)+1; 1)
			$_l_IssueRow:=Size of array:C274(OI_at_MultipleCodes)
		End if 
		
		$_l_Count:=0
		$_d_FirstDate:=!00-00-00!
		$_d_LastDate:=!00-00-00!
		For ($_l_CurrentRow; 1; Size of array:C274(PRD_abo_IssueInsert))
			If (PRD_abo_IssueInsert{$_l_CurrentRow})
				$_l_CodeRow:=Find in array:C230(OI_at_MultipleCodes{$_l_IssueRow}; PRD_at_IssueCode{$_l_CurrentRow})
				If ($_l_CodeRow<0)  //it should not be there already if we just clicked on it but other than that it should be!
					$_l_CodeRow:=Find in array:C230(OI_at_MultipleCodes{$_l_IssueRow}; "")
					If ($_l_CodeRow<0)  //no blanks
						APPEND TO ARRAY:C911(OI_at_MultipleCodes{$_l_IssueRow}; "")
						$_l_CodeRow:=Size of array:C274(OI_at_MultipleCodes{$_l_IssueRow})
					End if 
					OI_at_MultipleCodes{$_l_IssueRow}{$_l_CodeRow}:=PRD_at_IssueCode{$_l_CurrentRow}
				End if 
				$_l_Count:=$_l_Count+1
				If ($_d_FirstDate=!00-00-00!)
					$_d_FirstDate:=PRD_ad_IssueDate{$_l_CurrentRow}
				End if 
				$_d_LastDate:=PRD_ad_IssueDate{$_l_CurrentRow}
			Else 
				$_l_CodeRow:=Find in array:C230(OI_at_MultipleCodes{$_l_IssueRow}; PRD_at_IssueCode{$_l_CurrentRow})
				If ($_l_CodeRow>0)
					OI_at_MultipleCodes{$_l_IssueRow}{$_l_CodeRow}:=""
				End if 
			End if 
		End for 
		PRD_R_Quantity:=$_l_Count+PRD_l_ExtraDates
		PRD_d_FIrstDate:=$_d_FirstDate
		PRD_d_LastDate:=$_d_LastDate
End case 
ERR_MethodTrackerReturn("OBJ [ORDER_ITEMS].BUILD_PRODUCT.oQuantitytoCreate"; $_t_oldMethodName)
