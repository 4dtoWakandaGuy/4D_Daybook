If (False:C215)
	//object Name: [ORDER_ITEMS]BUILD_PRODUCT.oQuantitytoCreate2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/09/2013 12:04
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(PRD_aB_IssueInsert;0)
	//ARRAY DATE(PRD_ad_IssueDate;0)
	//ARRAY LONGINT(OI_al_ComponentSectionID;0)
	//ARRAY LONGINT(OI_al_MultiplesIndex;0)
	//ARRAY TEXT(OI_at_MultipleCodes;0)
	//ARRAY TEXT(OI_at_ProductSections;0)
	//ARRAY TEXT(PRD_at_FillPattern;0)
	//ARRAY TEXT(PRD_at_IssueCode;0)
	C_DATE:C307($_d_FirstDate; $_d_LastDate; $_d_PreviousDate; PRD_d_FirstDate; PRD_d_LastDate)
	C_LONGINT:C283($_l_Count; $_l_CountInserts; $_l_DateRowIndex; $_l_event; $_l_insertIssueIndex; $_l_LastDateRow; $_l_Max; $_l_Min; $_l_MonthOf; $_l_Monthof2; $_l_MultipleCodePosition2)
	C_LONGINT:C283($_l_MultiplesPosition; $_l_SectionID; $_l_Skip; $_l_Year; $_l_Year2; PRD_l_ExtraDates)
	C_REAL:C285(PRD_R_QUantity)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDER_ITEMS].BUILD_PRODUCT.oQuantitytoCreate2"; Form event code:C388)
// ----------------------------------------------------
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Data Change:K2:15)
		For ($_l_insertIssueIndex; 1; Size of array:C274(PRD_abo_IssueInsert))
			PRD_abo_IssueInsert{$_l_insertIssueIndex}:=False:C215
		End for 
		Case of 
			: ((PRD_R_QUantity-PRD_l_ExtraDates)=1)  //has to be consecutive
				$_l_LastDateRow:=Find in array:C230(PRD_ad_IssueDate; PRD_d_LastDate)
				If ($_l_LastDateRow<0)
					//end date is wrong
					For ($_l_insertIssueIndex; Size of array:C274(PRD_abo_IssueInsert); 1; -1)
						If (PRD_ad_IssueDate{$_l_insertIssueIndex}<=PRD_d_LastDate)
							PRD_d_LastDate:=PRD_ad_IssueDate{$_l_insertIssueIndex}
							$_l_LastDateRow:=$_l_insertIssueIndex
							$_l_insertIssueIndex:=0
						End if 
					End for 
					If ($_l_LastDateRow<0)
						$_l_LastDateRow:=1
					End if 
				End if 
				$_l_CountInserts:=0
				$_l_Min:=$_l_LastDateRow-(PRD_R_Quantity-PRD_l_ExtraDates)
				For ($_l_DateRowIndex; $_l_LastDateRow; $_l_Min; -1)
					If (Size of array:C274(PRD_abo_IssueInsert)>=$_l_DateRowIndex)
						PRD_abo_IssueInsert{$_l_DateRowIndex}:=True:C214
						$_l_CountInserts:=$_l_CountInserts+1
						If ($_l_DateRowIndex=$_l_LastDateRow)
							PRD_d_LastDate:=PRD_ad_IssueDate{$_l_DateRowIndex}
							If ($_l_DateRowIndex=(PRD_R_Quantity-PRD_l_ExtraDates))
								PRD_d_FirstDate:=PRD_ad_IssueDate{$_l_DateRowIndex}
							End if 
						Else 
							PRD_d_FirstDate:=PRD_ad_IssueDate{$_l_DateRowIndex}
						End if 
					Else 
						// too many inserts!!!
						PRD_R_Quantity:=$_l_CountInserts+PRD_l_ExtraDates
					End if 
					If ($_l_CountInserts=(PRD_R_Quantity-PRD_l_ExtraDates))
						$_l_DateRowIndex:=0
					End if 
				End for 
			Else 
				$_l_LastDateRow:=Find in array:C230(PRD_ad_IssueDate; PRD_d_LastDate)
				If ($_l_LastDateRow<0)
					//end date is wrong
					For ($_l_insertIssueIndex; Size of array:C274(PRD_abo_IssueInsert); 1; -1)
						If (PRD_ad_IssueDate{$_l_insertIssueIndex}<=PRD_d_LastDate)
							PRD_d_LastDate:=PRD_ad_IssueDate{$_l_insertIssueIndex}
							$_l_LastDateRow:=$_l_insertIssueIndex
							$_l_insertIssueIndex:=0
						End if 
					End for 
					If ($_l_LastDateRow<0)
						$_l_LastDateRow:=1
					End if 
				End if 
				$_l_CountInserts:=0
				Case of 
					: (PRD_at_FillPattern{PRD_at_FillPattern}="Consecutive Dates") | (PRD_at_FillPattern{PRD_at_FillPattern}="Alternating Dates") | (PRD_at_FillPattern{PRD_at_FillPattern}="Every 3rd Date") | (PRD_at_FillPattern{PRD_at_FillPattern}="Every 4th Date")
						$_l_Skip:=PRD_at_FillPattern
						$_l_Max:=(PRD_R_Quantity-PRD_l_ExtraDates)*$_l_Skip
						$_l_Min:=$_l_LastDateRow-$_l_Max
						If ($_l_Min<0)
							$_l_Min:=0
						End if 
						For ($_l_DateRowIndex; $_l_LastDateRow; $_l_Min; -$_l_Skip)
							If ($_l_DateRowIndex>0)
								If (Size of array:C274(PRD_abo_IssueInsert)>=$_l_DateRowIndex)
									$_l_CountInserts:=$_l_CountInserts+1
									PRD_abo_IssueInsert{$_l_DateRowIndex}:=True:C214
									If ($_l_CountInserts=1)
										PRD_d_LastDate:=PRD_ad_IssueDate{$_l_DateRowIndex}
										If ($_l_CountInserts=(PRD_R_Quantity-PRD_l_ExtraDates))
											PRD_d_FirstDate:=PRD_ad_IssueDate{$_l_DateRowIndex}
										End if 
									Else 
										If ($_l_DateRowIndex>0)
											PRD_d_FirstDate:=PRD_ad_IssueDate{$_l_DateRowIndex}
										End if 
									End if 
									
								End if 
								If ($_l_CountInserts=(PRD_R_Quantity-PRD_l_ExtraDates))
									$_l_DateRowIndex:=$_l_Min
								End if 
							End if 
						End for 
						
					: (PRD_at_FillPattern{PRD_at_FillPattern}="1st Date in Week")  //Even though we are working backwards its the 1ST not the last we want-so when the date switches week month or year its the one AFTER that we want to set as that is the 1st of the NEXT month/week/year
						
						$_d_PreviousDate:=PRD_ad_IssueDate{$_l_LastDateRow}+7
						$_l_DateRowIndex:=$_l_LastDateRow+1
						Repeat 
							$_l_DateRowIndex:=$_l_DateRowIndex-1
							
							If (Size of array:C274(PRD_abo_IssueInsert)>=$_l_DateRowIndex+1) & ($_l_DateRowIndex>0)
								If (PRD_ad_IssueDate{$_l_DateRowIndex}<=($_d_PreviousDate-7))
									$_d_PreviousDate:=PRD_ad_IssueDate{$_l_DateRowIndex}
									$_l_CountInserts:=$_l_CountInserts+1
									PRD_abo_IssueInsert{$_l_DateRowIndex+1}:=True:C214
									If ($_l_CountInserts=1)
										PRD_d_LastDate:=PRD_ad_IssueDate{$_l_DateRowIndex+1}
										If ($_l_CountInserts=(PRD_R_Quantity-PRD_l_ExtraDates))
											PRD_d_FirstDate:=PRD_ad_IssueDate{$_l_DateRowIndex+1}
										End if 
									Else 
										If ($_l_DateRowIndex>0)
											PRD_d_FirstDate:=PRD_ad_IssueDate{$_l_DateRowIndex+1}
										End if 
									End if 
								End if 
							End if 
						Until ($_l_DateRowIndex<=0) | ($_l_CountInserts>=(PRD_R_Quantity-PRD_l_ExtraDates))
					: (PRD_at_FillPattern{PRD_at_FillPattern}="1st Date in Month")
						$_l_MonthOf:=Month of:C24(PRD_ad_IssueDate{$_l_LastDateRow})
						$_l_DateRowIndex:=$_l_LastDateRow+1
						Repeat 
							$_l_DateRowIndex:=$_l_DateRowIndex-1
							//For ($_l_DateRowIndex;$Start;PRD_R_Quantity;1)
							If (Size of array:C274(PRD_abo_IssueInsert)>=$_l_DateRowIndex+1) & ($_l_DateRowIndex>0)
								$_l_Monthof2:=Month of:C24(PRD_ad_IssueDate{$_l_DateRowIndex})
								If ($_l_Monthof2#$_l_MonthOf)
									$_l_MonthOf:=$_l_Monthof2
									PRD_abo_IssueInsert{$_l_DateRowIndex+1}:=True:C214
									$_l_CountInserts:=$_l_CountInserts+1
									If ($_l_CountInserts=1)
										PRD_d_LastDate:=PRD_ad_IssueDate{$_l_DateRowIndex+1}
										If ($_l_CountInserts=(PRD_R_Quantity-PRD_l_ExtraDates))
											PRD_d_FirstDate:=PRD_ad_IssueDate{$_l_DateRowIndex+1}
										End if 
									Else 
										If ($_l_DateRowIndex>0)
											PRD_d_FirstDate:=PRD_ad_IssueDate{$_l_DateRowIndex+1}
										End if 
									End if 
								End if 
							End if 
						Until ($_l_DateRowIndex<=0) | ($_l_CountInserts>=(PRD_R_Quantity-PRD_l_ExtraDates))
						
					: (PRD_at_FillPattern{PRD_at_FillPattern}="1st Date in Year")
						$_l_Year:=9999
						$_l_DateRowIndex:=$_l_LastDateRow+1
						Repeat 
							$_l_DateRowIndex:=$_l_DateRowIndex-1
							//For ($_l_DateRowIndex;$Start;PRD_R_Quantity;1)
							If (Size of array:C274(PRD_abo_IssueInsert)>=$_l_DateRowIndex+1) & ($_l_DateRowIndex>0)
								$_l_Year2:=Year of:C25(PRD_ad_IssueDate{$_l_DateRowIndex})
								If ($_l_Year2#$_l_Year)
									$_l_Year:=$_l_Year2
									PRD_abo_IssueInsert{$_l_DateRowIndex+1}:=True:C214
									$_l_CountInserts:=$_l_CountInserts+1
									If ($_l_CountInserts=1)
										PRD_d_LastDate:=PRD_ad_IssueDate{$_l_DateRowIndex+1}
										If ($_l_CountInserts=(PRD_R_Quantity-PRD_l_ExtraDates))
											PRD_d_FirstDate:=PRD_ad_IssueDate{$_l_DateRowIndex+1}
										End if 
									Else 
										PRD_d_FirstDate:=PRD_ad_IssueDate{$_l_DateRowIndex+1}
									End if 
								End if 
							End if 
						Until ($_l_DateRowIndex<=0) | ($_l_CountInserts>=(PRD_R_Quantity-PRD_l_ExtraDates))
						
						
				End case 
				PRD_R_Quantity:=$_l_CountInserts+PRD_l_ExtraDates
				$_l_SectionID:=OI_al_ComponentSectionID{OI_at_ProductSections}
				$_l_MultiplesPosition:=Find in array:C230(OI_al_MultiplesIndex; $_l_SectionID)
				If ($_l_MultiplesPosition<0)
					APPEND TO ARRAY:C911(OI_al_MultiplesIndex; $_l_SectionID)
					INSERT IN ARRAY:C227(OI_at_MultipleCodes; Size of array:C274(OI_at_MultipleCodes)+1; 1)
					$_l_MultiplesPosition:=Size of array:C274(OI_at_MultipleCodes)
				End if 
				$_l_Count:=0
				$_d_FirstDate:=!00-00-00!
				$_d_LastDate:=!00-00-00!
				For ($_l_insertIssueIndex; 1; Size of array:C274(PRD_abo_IssueInsert))
					If (PRD_abo_IssueInsert{$_l_insertIssueIndex})
						$_l_MultipleCodePosition2:=Find in array:C230(OI_at_MultipleCodes{$_l_MultiplesPosition}; PRD_at_IssueCode{$_l_insertIssueIndex})
						If ($_l_MultipleCodePosition2<0)  //it should not be there already if we just clicked on it but other than that it should be!
							$_l_MultipleCodePosition2:=Find in array:C230(OI_at_MultipleCodes{$_l_MultiplesPosition}; "")
							If ($_l_MultipleCodePosition2<0)  //no blanks
								APPEND TO ARRAY:C911(OI_at_MultipleCodes{$_l_MultiplesPosition}; "")
								$_l_MultipleCodePosition2:=Size of array:C274(OI_at_MultipleCodes{$_l_MultiplesPosition})
							End if 
							OI_at_MultipleCodes{$_l_MultiplesPosition}{$_l_MultipleCodePosition2}:=PRD_at_IssueCode{$_l_insertIssueIndex}
						End if 
						$_l_Count:=$_l_Count+1
						If ($_d_FirstDate=!00-00-00!)
							$_d_FirstDate:=PRD_ad_IssueDate{$_l_DateRowIndex}
						End if 
						$_d_LastDate:=PRD_ad_IssueDate{$_l_DateRowIndex}
					Else 
						$_l_MultipleCodePosition2:=Find in array:C230(OI_at_MultipleCodes{$_l_MultiplesPosition}; PRD_at_IssueCode{$_l_insertIssueIndex})
						If ($_l_MultipleCodePosition2>0)
							OI_at_MultipleCodes{$_l_MultiplesPosition}{$_l_MultipleCodePosition2}:=""
						End if 
					End if 
				End for 
				PRD_R_Quantity:=$_l_Count+PRD_l_ExtraDates
				PRD_d_FIrstDate:=$_d_FirstDate
				PRD_d_LastDate:=$_d_LastDate
		End case 
End case 
ERR_MethodTrackerReturn("OBJ [ORDER_ITEMS].BUILD_PRODUCT.oQuantitytoCreate2"; $_t_oldMethodName)
