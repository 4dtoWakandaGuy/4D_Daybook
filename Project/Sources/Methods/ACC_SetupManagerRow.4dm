//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_SetupManagerRow
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/08/2013 07:03
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
	//ARRAY BOOLEAN(ACC_lb_Headings;0)
	//ARRAY INTEGER(DB_aI_HeadingLevel1;0)
	//ARRAY INTEGER(DB_aI_HeadingLevel2;0)
	//ARRAY INTEGER(DB_ai_RowLevel;0)
	//ARRAY PICTURE(DB_api_AddAccount;0)
	//ARRAY PICTURE(DB_api_AddSubHeading;0)
	//ARRAY PICTURE(DB_apic_AddAccount;0)
	//ARRAY PICTURE(DB_apic_AddSubHeading;0)
	ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
	ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
	ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
	ARRAY TEXT:C222($_at_ColumnNames; 0)
	ARRAY TEXT:C222($_at_HeaderNames; 0)
	ARRAY TEXT:C222($_at_ValidSubHeadings; 0)
	//ARRAY TEXT(DB_at_AccHHeadings1;0)
	//ARRAY TEXT(DB_at_AccHHeadings2;0)
	//ARRAY TEXT(DB_at_AccHHeadings3;0)
	//ARRAY TEXT(DB_at_AccHHeadings4;0)
	//ARRAY TEXT(DB_at_AccHHeadings5;0)
	//ARRAY TEXT(DB_at_AccountCodes;0)
	//ARRAY TEXT(DB_at_HeadingGroup1;0)
	//ARRAY TEXT(DB_at_HeadingGroup2;0)
	//ARRAY TEXT(DB_at_HeadingGroup3;0)
	//ARRAY TEXT(DB_at_HeadingGroup4;0)
	//ARRAY TEXT(DB_at_HeadingLevelup1;0)
	//ARRAY TEXT(DB_at_HeadingLevelup2;0)
	//ARRAY TEXT(DB_At_headingNames;0)
	//ARRAY TEXT(DB_at_HeadingNames1;0)
	//ARRAY TEXT(DB_at_HeadingNames2;0)
	//ARRAY TEXT(DB_at_HeadingNames3;0)
	//ARRAY TEXT(DB_at_HeadingNames4;0)
	//ARRAY TEXT(DB_at_HeadingNames5;0)
	//ARRAY TEXT(DB_at_Headings;0)
	//ARRAY TEXT(DB_at_ReportHeadings;0)
	//ARRAY TEXT(DB_At_SubHeadingLevel;0)
	C_BOOLEAN:C305($_bo_OK)
	C_LONGINT:C283($_l_AddAfter; $_l_AddtoHeadingRow; $_l_ChildRows; $_l_CurrentLevel; $_l_DropRow; $_l_EndofHeader; $_l_event; $_l_Index; $_l_Level; $_l_Level2; $_l_ParentRow)
	C_LONGINT:C283($1; $3)
	C_PICTURE:C286($_pic_AddSubHeading)
	C_POINTER:C301($_Ptr_AccountCode2; $_Ptr_AccountGrpCode; $_ptr_AccountGrpCode2; $_Ptr_AccountGrpEnforce; $_Ptr_AccountGrpEnforce2; $_Ptr_AccountGrpGroup; $_Ptr_AccountGrpGroup2; $_Ptr_AccountGrpLevel; $_Ptr_AccountGrpLevel2; $_Ptr_AccountGrpLevelUp; $_ptr_AccountGrpLevelUp2)
	C_POINTER:C301($_Ptr_AccountGrpName; $_Ptr_AccountGrpName2; $_ptr_AccountGrpRangeFrom; $_Ptr_AccountGrpRangeFrom2; $_ptr_AccountGrpRangeTo; $_Ptr_AccountGrpRangeTo2; $_ptr_VarArray; $2)
	C_TEXT:C284($_t_AccountCodeRangeFrom; $_t_AccountCodeRangeTo; $_t_LevelGroupCode; $_t_LevelUpCode; $_t_LevelUpgroup; $_t_oldMethodName; $_t_Space)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_SetupManagerRow")
If (Count parameters:C259>=3)
	
	$_l_DropRow:=$1  //on a drop this is the row we are dropped at
	$_ptr_VarArray:=$2
	$_l_event:=$3
	
	If (False:C215)
		$_l_event:=$3
		$_l_Level:=DB_ai_RowLevel{$_l_DropRow}
		If ($_l_Level=1) & (DB_At_SubHeadingLevel{$_l_DropRow}="")
			$_l_Level:=0
		End if 
		
		Case of 
			: ($_l_Level>=0)  //this is a heading
				$_t_Space:="    "
				// Set pointers to the relevant arrays offset for this level for this row-the level one are in 2 etc etc
				$_Ptr_AccountGrpCode:=Get pointer:C304("DB_at_ACCHHeadings"+String:C10($_l_Level+1))
				$_Ptr_AccountGrpName:=Get pointer:C304("DB_at_HeadingNames"+String:C10($_l_Level+1))
				$_Ptr_AccountGrpLevel:=Get pointer:C304("DB_aI_HeadingLevel"+String:C10($_l_Level+1))
				$_ptr_AccountGrpRangeFrom:=Get pointer:C304("DB_at_HeadingAccCodeFrom"+String:C10($_l_Level+1))  //²
				$_ptr_AccountGrpRangeTo:=Get pointer:C304("DB_at_HeadingAccCodeTO"+String:C10($_l_Level+1))  //²
				$_Ptr_AccountGrpEnforce:=Get pointer:C304("DB_al_HeadingEnforce"+String:C10($_l_Level+1))
				$_Ptr_AccountGrpGroup:=Get pointer:C304("DB_at_HeadingGroup"+String:C10($_l_Level+1))  //²
				$_Ptr_AccountGrpLevelUp:=Get pointer:C304("DB_at_HeadingLevelup"+String:C10($_l_Level+1))  //²
				//Get the record Group and Level up values.
				Case of 
					: ($_l_Level=0)  //Parent Heading this has no parent group-the group is blank
						$_Ptr_AccountGrpGroup->{$_l_DropRow}:=""
						$_Ptr_AccountGrpLevelUp->{$_l_DropRow}:=""
					: ($_l_Level>0)
						If ($_l_DropRow>0)
							$_Ptr_AccountGrpLevel2:=Get pointer:C304("DB_aI_HeadingLevel"+String:C10($_l_Level))  //this is pointing at the parent level
							$_Ptr_AccountCode2:=Get pointer:C304("DB_at_HeadingLevelup"+String:C10($_l_Level))  //This is pointing at the parent level array
							$_Ptr_AccountGrpGroup2:=Get pointer:C304("DB_at_HeadingGroup"+String:C10($_l_Level))
							For ($_l_ParentRow; $_l_DropRow-1; 1; -1)
								If ($_Ptr_AccountCode2->{$_l_ParentRow}#"")
									$_t_LevelUpCode:=$_Ptr_AccountCode2->{$_l_ParentRow}
									$_t_LevelUpgroup:=$_Ptr_AccountGrpGroup2->{$_l_ParentRow}
									
									If ($_t_LevelUpgroup="") & ($_Ptr_AccountGrpLevel2->{$_l_ParentRow}=0)
										//Then this is a top level so the code is the group for the sub group
										$_t_LevelUpgroup:=$_t_LevelUpCode
										$_t_LevelUpCode:=""
										$_l_ParentRow:=0
									End if 
								End if 
							End for 
							
						End if 
				End case 
				//Now Get the account code range attached to this
				$_t_AccountCodeRangeFrom:=""
				$_t_AccountCodeRangeTo:=""
				ARRAY TEXT:C222($_at_ValidSubHeadings; 0)
				For ($_l_ChildRows; $_l_DropRow+1; Size of array:C274(DB_At_SubHeadingLevel))
					Case of 
						: (DB_at_AccountCodes{$_l_ChildRows}#"")  //There is an account code on this row
							If (DB_at_ReportHeadings{$_l_ChildRows}=$_Ptr_AccountGrpCode->{$_l_DropRow})  //direct Child
								If ($_t_AccountCodeRangeFrom="")
									$_t_AccountCodeRangeFrom:=DB_at_AccountCodes{$_l_ChildRows}
								End if 
								$_t_AccountCodeRangeTo:=DB_at_AccountCodes{$_l_ChildRows}
							Else   //check this child is a desendant of the parent
								If (Find in array:C230($_at_ValidSubHeadings; DB_at_ReportHeadings{$_l_ChildRows})>0)
									If ($_t_AccountCodeRangeFrom="")
										$_t_AccountCodeRangeFrom:=DB_at_AccountCodes{$_l_ChildRows}
									End if 
									$_t_AccountCodeRangeTo:=DB_at_AccountCodes{$_l_ChildRows}
								End if 
							End if 
						: (DB_at_Headings{$_l_ChildRows}#"")  //There is a group heading on this row
							//is this a child of the current row heading
							$_l_Level2:=DB_ai_RowLevel{$_l_ChildRows}
							
							If ($_l_Level2=1) & (DB_At_SubHeadingLevel{$_l_ChildRows}="")
								$_l_Level2:=0
							End if 
							If ($_l_Level2>$_l_Level)  //This is a sub level not the same level so include any accounts
								$_ptr_AccountGrpCode2:=Get pointer:C304("DB_at_ACCHHeadings"+String:C10($_l_Level2+1))
								$_Ptr_AccountGrpName2:=Get pointer:C304("DB_at_HeadingNames"+String:C10($_l_Level2+1))
								$_Ptr_AccountGrpLevel2:=Get pointer:C304("DB_aI_HeadingLevel"+String:C10($_l_Level2+1))
								$_Ptr_AccountGrpRangeFrom2:=Get pointer:C304("DB_at_HeadingAccCodeFrom"+String:C10($_l_Level2+1))
								$_Ptr_AccountGrpRangeTo2:=Get pointer:C304("DB_at_HeadingAccCodeTO"+String:C10($_l_Level2+1))
								$_Ptr_AccountGrpEnforce2:=Get pointer:C304("DB_al_HeadingEnforce"+String:C10($_l_Level2+1))
								$_Ptr_AccountGrpGroup2:=Get pointer:C304("DB_at_HeadingGroup"+String:C10($_l_Level2+1))
								$_ptr_AccountGrpLevelUp2:=Get pointer:C304("DB_at_HeadingLevelup"+String:C10($_l_Level2+1))
								//add the sub heading to the list of valid subheadings
								Case of 
									: ($_l_Level2=1)
										If ($_Ptr_AccountGrpGroup2->{$_l_ChildRows}=$_Ptr_AccountGrpCode->{$_l_DropRow})
											APPEND TO ARRAY:C911($_at_ValidSubHeadings; $_ptr_AccountGrpCode2->{$_l_ChildRows})
										Else 
											If (Find in array:C230($_at_ValidSubHeadings; $_Ptr_AccountGrpGroup2->{$_l_ChildRows})>0)
												APPEND TO ARRAY:C911($_at_ValidSubHeadings; $_ptr_AccountGrpCode2->{$_l_ChildRows})
											End if 
											
										End if 
										// if its level one
									Else 
										If ($_ptr_AccountGrpLevelUp2->{$_l_ChildRows}=$_Ptr_AccountGrpCode->{$_l_DropRow})
											APPEND TO ARRAY:C911($_at_ValidSubHeadings; $_ptr_AccountGrpCode2->{$_l_ChildRows})
										Else 
											If (Find in array:C230($_at_ValidSubHeadings; $_ptr_AccountGrpLevelUp2->{$_l_ChildRows})>0)
												APPEND TO ARRAY:C911($_at_ValidSubHeadings; $_ptr_AccountGrpCode2->{$_l_ChildRows})
											End if 
											
										End if 
										
								End case 
							End if 
					End case 
				End for 
				If (Count parameters:C259>=2)
					Gen_Alert("Group Level:"+String:C10($_l_Level)+Char:C90(13)+" Account Range From: "+$_t_AccountCodeRangeFrom+Char:C90(13)+"Account Range To: "+$_t_AccountCodeRangeTo+Char:C90(13)+"Level up:"+$_t_LevelUpCode)
					
				Else 
					$_ptr_AccountGrpRangeFrom->{$_l_DropRow}:=$_t_AccountCodeRangeFrom
					$_ptr_AccountGrpRangeTo->{$_l_DropRow}:=$_t_AccountCodeRangeTo
				End if 
				//make sure that the level up is on this row is correct
				
				
				
				
				//LB_SetupListbox (->ACC_lb_Headings;"oACH";"ACH_L";1;->DB_At_SubHeadingLevel;->DB_at_Headings;->DB_At_headingNames;->DB_at_HeadingACCRange;->DB_api_AddSubHeading;->DB_api_AddAccount;->DB_ai_RowLevel)
				//Because i want to keep this simple making a little change here
				
				//LB_SetupListbox (->ACC_lb_Headings;"oACH";"ACH_L";-99;->DB_at_ACCHHeadings1;->DB_aI_HeadingLevel1;->DB_at_HeadingNames1;
				//->DB_at_HeadingAccCodeFrom1;->DB_at_HeadingAccCodeTO1;->DB_al_HeadingEnforce1;->DB_at_HeadingGroup1;->DB_at_HeadingLevelup1)
				//LB_SetupListbox (->ACC_lb_Headings;"oACH";"ACH_L";-99;->DB_at_ACCHHeadings2;->DB_aI_HeadingLevel2;->DB_at_HeadingNames2;->DB_at_HeadingAccCodeFrom2;->DB_at_HeadingAccCodeTO2;->DB_al_HeadingEnforce2;->DB_at_HeadingGroup2;->DB_at_HeadingLevelup2)
				//LB_SetupListbox (->ACC_lb_Headings;"oACH";"ACH_L";-99;->DB_at_ACCHHeadings3;->DB_aI_HeadingLevel3;->DB_at_HeadingNames3;->DB_at_HeadingAccCodeFrom3;->DB_at_HeadingAccCodeTO3;->DB_al_HeadingEnforce3;->DB_at_HeadingGroup3;->DB_at_HeadingLevelup3)
				//LB_SetupListbox (->ACC_lb_Headings;"oACH";"ACH_L";-99;->DB_at_ACCHHeadings4;->DB_aI_HeadingLevel4;->DB_at_HeadingNames4;->DB_at_HeadingAccCodeFrom4;->DB_at_HeadingAccCodeTO4;->DB_al_HeadingEnforce4;->DB_at_HeadingGroup4;->DB_at_HeadingLevelup4)
				//LB_SetupListbox (->ACC_lb_Headings;"oACH";"ACH_L";-99;->DB_at_ACCHHeadings5;->DB_aI_HeadingLevel5;->DB_at_HeadingNames5;->DB_at_HeadingAccCodeFrom5;->DB_at_HeadingAccCodeTO5;->DB_al_HeadingEnforce5;->DB_at_HeadingGroup5;->DB_at_HeadingLevelup5)`
				
				//LB_SetupListbox (->ACC_lb_Headings;"oACH";"ACH_L";-99;->DB_at_AccountCodes;->DB_at_AccountNames;->DB_at_AccountPreferenceGroups;->DB_at_AccountIO;->DB_al_MultiCurrencyValuation;->DB_at_MultiCurrencyValuation;->DB_abo_NoNominalLedgerPostings;->DB_at_ProfitBalance;->DB_at_AnalysisCodes;->DB_at_LayerCodes;->DB_abo_AccountDefault;->DB_at_AccountHeadings;->DB_at_ReportHeadings)
				
				//L`B_SetupListbox (->ACC_lb_Headings;"oACH";"ACH_L";-99;->DB_at_Dummy)
				
				
				
			: ($_l_Level<0)  //this is an account
		End case 
		
	End if 
	If ($_l_DropRow>0)
		Case of 
			: (1=2)  //($_ptr_VarArray=->DB_at_SubHeadlingLevel)  //1
				//not editable cell
				Case of 
					: ($_l_event=On Clicked:K2:4)
						LISTBOX SELECT ROW:C912(ACC_lb_Headings; $1)
						
					: ($_l_event=On After Keystroke:K2:26) | ($_l_event=On After Edit:K2:43)
					: ($_l_event=On Data Change:K2:15)
				End case 
				
			: ($_ptr_VarArray=(->DB_at_Headings))  //2 Heading code
				Case of 
					: ($_l_event=On Clicked:K2:4)
						//only editable if its not already populated and this is not an account-it is a heading
						//make sure the plus button populated the correct values
						
						If (DB_at_Headings{$_l_DropRow}="") & (DB_at_AccountCodes{$_l_DropRow}="")
							LB_SetEnterable(->ACC_lb_Headings; True:C214; 2)
							ARRAY TEXT:C222($_at_ColumnNames; 0)
							ARRAY TEXT:C222($_at_HeaderNames; 0)
							ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
							ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
							ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
							ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
							LISTBOX GET ARRAYS:C832(*; "oAccountHeadings1"; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVariables; $_aptr_HeaderVariables; $_abo_ColumnsVisible; $_aptr_ColumnStyles)
							EDIT ITEM:C870(*; $_at_ColumnNames{2}; $_l_DropRow)
						Else 
							
							LB_SetEnterable(->ACC_lb_Headings; False:C215; 2)
							LISTBOX SELECT ROW:C912(ACC_lb_Headings; $1)
							
						End if 
						
					: ($_l_event=On After Keystroke:K2:26) | ($_l_event=On After Edit:K2:43)
						//the cell we are filling in is a 'unified' cell. it represents data from the
						//associated level. here we populate the level information
						//note that there is nothing to validate the value against
						
						Case of 
							: (DB_At_SubHeadingLevel{$_l_DropRow}="")
								DB_at_AccHHeadings1{$_l_DropRow}:=DB_at_Headings{$_l_DropRow}
								
							: (DB_At_SubHeadingLevel{$_l_DropRow}="@one@")
								DB_at_AccHHeadings2{$_l_DropRow}:=DB_at_Headings{$_l_DropRow}
								
							: (DB_At_SubHeadingLevel{$_l_DropRow}="@two@")
								DB_at_AccHHeadings3{$_l_DropRow}:=DB_at_Headings{$_l_DropRow}
								
							: (DB_At_SubHeadingLevel{$_l_DropRow}="@three@")
								DB_at_AccHHeadings4{$_l_DropRow}:=DB_at_Headings{$_l_DropRow}
								
							: (DB_At_SubHeadingLevel{$_l_DropRow}="@four@")
								DB_at_AccHHeadings5{$_l_DropRow}:=DB_at_Headings{$_l_DropRow}
								
							: (DB_at_AccountCodes{$_l_DropRow}#"")
								DB_at_AccHHeadings1{$_l_DropRow}:=""
								
						End case 
					: ($_l_event=On Data Change:K2:15)
						$_bo_OK:=False:C215
						Case of 
							: (DB_At_SubHeadingLevel{$_l_DropRow}="")
								DB_at_ACCHHeadings1{$_l_DropRow}:=DB_at_Headings{$_l_DropRow}
								$_bo_OK:=True:C214
							: (DB_At_SubHeadingLevel{$_l_DropRow}="@one@")
								DB_at_ACCHHeadings2{$_l_DropRow}:=DB_at_Headings{$_l_DropRow}
								$_bo_OK:=True:C214
							: (DB_At_SubHeadingLevel{$_l_DropRow}="@two@")
								DB_at_ACCHHeadings3{$_l_DropRow}:=DB_at_Headings{$_l_DropRow}
								$_bo_OK:=True:C214
							: (DB_At_SubHeadingLevel{$_l_DropRow}="@three@")
								DB_at_ACCHHeadings4{$_l_DropRow}:=DB_at_Headings{$_l_DropRow}
								$_bo_OK:=True:C214
							: (DB_At_SubHeadingLevel{$_l_DropRow}="@four@")
								DB_at_ACCHHeadings5{$_l_DropRow}:=DB_at_Headings{$_l_DropRow}
								$_bo_OK:=True:C214
							: (DB_at_AccountCodes{$_l_DropRow}#"")
								DB_at_Headings{$_l_DropRow}:=""
								
								
						End case 
						If ($_bo_OK)
							LB_SetEnterable(->ACC_lb_Headings; False:C215; 2)
							LB_SetEnterable(->ACC_lb_Headings; True:C214; 3)
							//LISTBOX SELECT ROW(*;"oAccountHeadings1";$_l_DropRow)
							ARRAY TEXT:C222($_at_ColumnNames; 0)
							ARRAY TEXT:C222($_at_HeaderNames; 0)
							ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
							ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
							ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
							ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
							Gen_Alert("Please give this Heading a Name")
							LISTBOX GET ARRAYS:C832(*; "oAccountHeadings1"; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVariables; $_aptr_HeaderVariables; $_abo_ColumnsVisible; $_aptr_ColumnStyles)
							EDIT ITEM:C870(*; $_at_ColumnNames{3}; $_l_DropRow)
							
						End if 
						
						
				End case 
			: (1=2)  // ($_ptr_VarArray=->DB_at_HeadingNames)  //3
				Case of 
					: ($_l_event=On Clicked:K2:4)
						
						If (DB_at_Headings{$_l_DropRow}#"") & (DB_At_headingNames{$_l_DropRow}="") & (DB_at_AccountCodes{$_l_DropRow}="")
							LB_SetEnterable(->ACC_lb_Headings; True:C214; 3)
							
							ARRAY TEXT:C222($_at_ColumnNames; 0)
							ARRAY TEXT:C222($_at_HeaderNames; 0)
							ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
							ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
							ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
							ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
							LISTBOX GET ARRAYS:C832(*; "oAccountHeadings1"; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVariables; $_aptr_HeaderVariables; $_abo_ColumnsVisible; $_aptr_ColumnStyles)
							
							EDIT ITEM:C870(*; $_at_ColumnNames{3}; $_l_DropRow)
						Else 
							LB_SetEnterable(->ACC_lb_Headings; False:C215; 3)
							LISTBOX SELECT ROW:C912(ACC_lb_Headings; $1)
						End if 
						
					: ($_l_event=On After Keystroke:K2:26) | ($_l_event=On After Edit:K2:43)
						Case of 
							: (DB_At_SubHeadingLevel{$_l_DropRow}="")
								DB_at_HeadingNames1{$_l_DropRow}:=DB_at_Headings{$_l_DropRow}
								
							: (DB_At_SubHeadingLevel{$_l_DropRow}="@one@")
								DB_at_HeadingNames1{$_l_DropRow}:=DB_at_Headings{$_l_DropRow}
								
							: (DB_At_SubHeadingLevel{$_l_DropRow}="@two@")
								DB_at_HeadingNames2{$_l_DropRow}:=DB_at_Headings{$_l_DropRow}
								
							: (DB_At_SubHeadingLevel{$_l_DropRow}="@three@")
								DB_at_HeadingNames3{$_l_DropRow}:=DB_at_Headings{$_l_DropRow}
								
							: (DB_At_SubHeadingLevel{$_l_DropRow}="@four@")
								DB_at_HeadingNames4{$_l_DropRow}:=DB_at_Headings{$_l_DropRow}
								
							: (DB_at_AccountCodes{$_l_DropRow}#"")
								DB_at_HeadingNames{$_l_DropRow}:=""
								
								
						End case 
						
					: ($_l_event=On Data Change:K2:15)
						$_bo_OK:=False:C215
						Case of 
							: (DB_At_SubHeadingLevel{$_l_DropRow}="")
								DB_at_HeadingNames1{$_l_DropRow}:=DB_at_Headings{$_l_DropRow}
								$_bo_OK:=True:C214
							: (DB_At_SubHeadingLevel{$_l_DropRow}="@one@")
								DB_at_HeadingNames2{$_l_DropRow}:=DB_at_Headings{$_l_DropRow}
								$_bo_OK:=True:C214
							: (DB_At_SubHeadingLevel{$_l_DropRow}="@two@")
								DB_at_HeadingNames3{$_l_DropRow}:=DB_at_Headings{$_l_DropRow}
								$_bo_OK:=True:C214
							: (DB_At_SubHeadingLevel{$_l_DropRow}="@three@")
								DB_at_HeadingNames4{$_l_DropRow}:=DB_at_Headings{$_l_DropRow}
								$_bo_OK:=True:C214
							: (DB_At_SubHeadingLevel{$_l_DropRow}="@four@")
								DB_at_HeadingNames5{$_l_DropRow}:=DB_at_Headings{$_l_DropRow}
								$_bo_OK:=True:C214
							: (DB_at_AccountCodes{$_l_DropRow}#"")
								DB_at_HeadingNames{$_l_DropRow}:=""
								
								
						End case 
						If ($_bo_OK)
							LB_SetEnterable(->ACC_lb_Headings; False:C215; 3)
							LISTBOX SELECT ROW:C912(*; "oAccountHeadings1"; $_l_DropRow)
						End if 
						
				End case 
			: (1=2)  //($_ptr_VarArray=->DB_at_HeadingACCRange)  //4-non editable-this is picked up from the account codes/
				Case of 
					: ($_l_event=On Clicked:K2:4)
						LISTBOX SELECT ROW:C912(*; "oAccountHeadings1"; $_l_DropRow)
					: ($_l_event=On After Keystroke:K2:26) | ($_l_event=On After Edit:K2:43)
					: ($_l_event=On Data Change:K2:15)
				End case 
			: (1=2)  //($_ptr_VarArray=->DB_aPi_addSubHeading)  //5 this is the add subheading button
				Case of 
					: ($_l_event=On Clicked:K2:4)
						
						If (DB_at_Headings{$_l_DropRow}#"") & (DB_At_headingNames{$_l_DropRow}#"") & (DB_at_AccountCodes{$_l_DropRow}="")
							
							
							$_l_CurrentLevel:=DB_ai_RowLevel{$_l_DropRow}
							$_t_LevelUpCode:=DB_at_Headings{$_l_DropRow}
							//$_t_LevelGroupCode:=DB_at_ACCHHeadings1{$_l_DropRow}
							$_bo_OK:=False:C215
							Case of 
								: ($_l_CurrentLevel=0)
									$_t_LevelGroupCode:=DB_at_Headings{$_l_DropRow}
									$_bo_OK:=True:C214
								: ($_l_CurrentLevel=1)
									$_t_LevelGroupCode:=DB_at_HeadingGroup2{$_l_DropRow}
									$_bo_OK:=True:C214
								: ($_l_CurrentLevel=2)
									$_t_LevelGroupCode:=DB_at_HeadingGroup3{$_l_DropRow}
									$_bo_OK:=True:C214
								: ($_l_CurrentLevel=3)
									$_t_LevelGroupCode:=DB_at_HeadingGroup4{$_l_DropRow}
									$_bo_OK:=True:C214
								: ($_l_CurrentLevel=4)
									Gen_Alert("Sorry. You may not add more than 5 levels")
									
							End case 
							$_l_AddAfter:=0
							For ($_l_EndofHeader; $_l_DropRow+1; Size of array:C274(DB_At_headingNames))
								If ($_l_EndofHeader<=Size of array:C274(DB_At_headingNames))
									Case of 
										: ($_l_CurrentLevel=0)
											If (DB_at_Headings{$_l_EndofHeader}#"")
												$_l_AddAfter:=$_l_EndofHeader-1
											End if 
										: ($_l_CurrentLevel=1)
											If (DB_at_Headings{$_l_EndofHeader}#"")
												$_l_AddAfter:=$_l_EndofHeader-1
											End if 
										: ($_l_CurrentLevel=2)
											If (DB_at_Headings{$_l_EndofHeader}#"")
												$_l_AddAfter:=$_l_EndofHeader-1
											End if 
										: ($_l_CurrentLevel=3)
											If (DB_at_Headings{$_l_EndofHeader}#"")
												$_l_AddAfter:=$_l_EndofHeader-1
											End if 
										: ($_l_CurrentLevel=4)
											$_l_AddAfter:=Size of array:C274(DB_At_headingNames)
									End case 
								Else 
									$_l_AddAfter:=Size of array:C274(DB_At_headingNames)
								End if 
								If ($_l_AddAfter>0)
									$_l_EndofHeader:=Size of array:C274(DB_At_headingNames)
								End if 
							End for 
							If ($_bo_OK)
								//TRACE
								//GET PICTURE FROM LIBRARY(22563; $_pic_AddSubHeading)
								$_pic_AddSubHeading:=Get_Picture(22563)
								TRANSFORM PICTURE:C988($_pic_AddSubHeading; Translate:K61:3; 3; 3)
								LISTBOX INSERT ROWS:C913(*; "oAccountHeadings1"; $_l_AddAfter+1; 1)
								$_l_DropRow:=$_l_AddAfter+1
								DB_apic_AddSubHeading{$_l_DropRow}:=$_pic_AddSubHeading
								DB_apic_AddAccount{$_l_DropRow}:=$_pic_AddSubHeading
								DB_ai_RowLevel{$_l_DropRow}:=$_l_CurrentLevel+1
								DB_at_Headings{$_l_DropRow}:=""
								Case of 
									: (DB_ai_RowLevel{$_l_DropRow}=0)
										DB_aI_HeadingLevel1{$_l_DropRow}:=DB_ai_RowLevel{$_l_DropRow}
										DB_at_ACCHHeadings1{$_l_DropRow}:=""
										DB_at_HeadingNames1{$_l_DropRow}:=""
										DB_at_HeadingGroup1{$_l_DropRow}:=$_t_LevelGroupCode
										DB_at_HeadingLevelup1{$_l_DropRow}:=$_t_LevelUpCode
										DB_at_ACCHHeadings1{$_l_DropRow}:=$_t_LevelGroupCode
										
									: (DB_ai_RowLevel{$_l_DropRow}=1)
										DB_aI_HeadingLevel2{$_l_DropRow}:=DB_ai_RowLevel{$_l_DropRow}
										DB_at_ACCHHeadings2{$_l_DropRow}:=""
										DB_at_HeadingNames2{$_l_DropRow}:=""
										DB_at_HeadingGroup2{$_l_DropRow}:=$_t_LevelGroupCode
										DB_at_HeadingLevelup2{$_l_DropRow}:=$_t_LevelUpCode
										DB_at_ACCHHeadings2{$_l_DropRow}:=$_t_LevelGroupCode
										DB_At_SubHeadingLevel{$_l_DropRow}:="One"
										
										
								End case 
								LB_SetEnterable(->ACC_lb_Headings; True:C214; 2)
								
								ARRAY TEXT:C222($_at_ColumnNames; 0)
								ARRAY TEXT:C222($_at_HeaderNames; 0)
								ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
								ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
								ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
								ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
								LISTBOX GET ARRAYS:C832(*; "oAccountHeadings1"; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVariables; $_aptr_HeaderVariables; $_abo_ColumnsVisible; $_aptr_ColumnStyles)
								EDIT ITEM:C870(*; $_at_ColumnNames{2}; $_l_DropRow)
								
								
							End if 
						End if 
						
						
					: ($_l_event=On After Keystroke:K2:26) | ($_l_event=On After Edit:K2:43)
						//no such event can happen in this object(its picture of a button
					: ($_l_event=On Data Change:K2:15)
						//no such event can happen in this object(its picture of a button)
				End case 
			: (1=2)  //($_ptr_VarArray=->DB_aPi_addAccount)//5/6
				Case of 
					: ($_l_event=On Clicked:K2:4)
						Case of 
							: (DB_at_Headings{$_l_DropRow}#"") & (DB_At_headingNames{$_l_DropRow}#"") & (DB_at_AccountCodes{$_l_DropRow}="")
								//add account at end of accounts for this heading
								$_l_AddtoHeadingRow:=$_l_DropRow
							: (DB_at_Headings{$_l_DropRow}="") & (DB_At_headingNames{$_l_DropRow}="") & (DB_at_AccountCodes{$_l_DropRow}#"")
								//add account code to the heading of that this account is under
								For ($_l_Index; $_l_DropRow; 1; -1)
									If (DB_at_Headings{$_l_DropRow}#"") & (DB_At_headingNames{$_l_DropRow}#"") & (DB_at_AccountCodes{$_l_DropRow}="")
										$_l_AddtoHeadingRow:=$_l_Index
										$_l_Index:=0
									End if 
								End for 
						End case 
						
						
						$_l_CurrentLevel:=DB_ai_RowLevel{$_l_AddtoHeadingRow}
						$_t_LevelUpCode:=DB_at_Headings{$_l_AddtoHeadingRow}
						//$_t_LevelGroupCode:=DB_at_ACCHHeadings1{$_l_DropRow}
						$_bo_OK:=False:C215
						
					: ($_l_event=On After Keystroke:K2:26) | ($_l_event=On After Edit:K2:43)
					: ($_l_event=On Data Change:K2:15)
				End case 
			: (1=2)  //($_ptr_VarArray=->DB_ai_RowLevel)  //7<--not displayed
				Case of 
					: ($_l_event=On Clicked:K2:4)
					: ($_l_event=On After Keystroke:K2:26) | ($_l_event=On After Edit:K2:43)
					: ($_l_event=On Data Change:K2:15)
				End case 
			: (1=2)  //:(1=2)//($_ptr_VarArray=->DB_at_AccHHeadings1)  //8<-not displayed
				Case of 
					: ($_l_event=On Clicked:K2:4)
					: ($_l_event=On After Keystroke:K2:26) | ($_l_event=On After Edit:K2:43)
					: ($_l_event=On Data Change:K2:15)
				End case 
			: (1=2)  //($_ptr_VarArray=->DB_al_HeadingLevel1)<-not displays
				Case of 
					: ($_l_event=On Clicked:K2:4)
					: ($_l_event=On After Keystroke:K2:26) | ($_l_event=On After Edit:K2:43)
					: ($_l_event=On Data Change:K2:15)
				End case 
			: (1=2)  //($_ptr_VarArray=->DB_at_HeadingNames1)  //<-not displays
				Case of 
					: ($_l_event=On Clicked:K2:4)
					: ($_l_event=On After Keystroke:K2:26) | ($_l_event=On After Edit:K2:43)
					: ($_l_event=On Data Change:K2:15)
				End case 
			: (1=2)  //($_ptr_VarArray=->DB_at_HeadingAccCodeFrom1)  //<-not displays
				Case of 
					: ($_l_event=On Clicked:K2:4)
					: ($_l_event=On After Keystroke:K2:26) | ($_l_event=On After Edit:K2:43)
					: ($_l_event=On Data Change:K2:15)
				End case 
			: (1=2)  // ($_ptr_VarArray=->DB_at_HeadingAccCodeto1)  //<-not displays
				Case of 
					: ($_l_event=On Clicked:K2:4)
					: ($_l_event=On After Keystroke:K2:26) | ($_l_event=On After Edit:K2:43)
					: ($_l_event=On Data Change:K2:15)
				End case 
			: (1=2)  //($_ptr_VarArray=->dB_al_Heading_Enforce1)  //<-not displays
				Case of 
					: ($_l_event=On Clicked:K2:4)
					: ($_l_event=On After Keystroke:K2:26) | ($_l_event=On After Edit:K2:43)
					: ($_l_event=On Data Change:K2:15)
				End case 
			: (1=2)  //($_ptr_VarArray=->DB_at_HeadingGroup1)  //<-not displayed
				Case of 
					: ($_l_event=On Clicked:K2:4)
					: ($_l_event=On After Keystroke:K2:26) | ($_l_event=On After Edit:K2:43)
					: ($_l_event=On Data Change:K2:15)
				End case 
			: (1=2)  //($_ptr_VarArray=->DB_at_HeadingLevelUp1)  //<-not displayed
				Case of 
					: ($_l_event=On Clicked:K2:4)
					: ($_l_event=On After Keystroke:K2:26) | ($_l_event=On After Edit:K2:43)
					: ($_l_event=On Data Change:K2:15)
				End case 
			: (1=2)  // ($_ptr_VarArray=->DB_at_ACCHHeadings2)  //<-not displayed
				Case of 
					: ($_l_event=On Clicked:K2:4)
					: ($_l_event=On After Keystroke:K2:26) | ($_l_event=On After Edit:K2:43)
					: ($_l_event=On Data Change:K2:15)
				End case 
			: (1=2)  //($_ptr_VarArray=->DB_al_HeadingLevel2)  //<-not displays
				Case of 
					: ($_l_event=On Clicked:K2:4)
					: ($_l_event=On After Keystroke:K2:26) | ($_l_event=On After Edit:K2:43)
					: ($_l_event=On Data Change:K2:15)
				End case 
			: (1=2)  //($_ptr_VarArray=->DB_at_HeadingNames2)  //<-not displays
				Case of 
					: ($_l_event=On Clicked:K2:4)
					: ($_l_event=On After Keystroke:K2:26) | ($_l_event=On After Edit:K2:43)
					: ($_l_event=On Data Change:K2:15)
				End case 
			: (1=2)  //($_ptr_VarArray=->DB_at_HeadingAccCodeFrom2)  //<-not displays
				Case of 
					: ($_l_event=On Clicked:K2:4)
					: ($_l_event=On After Keystroke:K2:26) | ($_l_event=On After Edit:K2:43)
					: ($_l_event=On Data Change:K2:15)
				End case 
			: (1=2)  //($_ptr_VarArray=->DB_at_HeadingAccCodeto2)  //<-not displays
				Case of 
					: ($_l_event=On Clicked:K2:4)
					: ($_l_event=On After Keystroke:K2:26) | ($_l_event=On After Edit:K2:43)
					: ($_l_event=On Data Change:K2:15)
				End case 
			: (1=2)  //($_ptr_VarArray=->DB_al_HeadingEnforce2)  //<-not displays
				Case of 
					: ($_l_event=On Clicked:K2:4)
					: ($_l_event=On After Keystroke:K2:26) | ($_l_event=On After Edit:K2:43)
					: ($_l_event=On Data Change:K2:15)
				End case 
			: (1=2)  //($_ptr_VarArray=->DB_at_HeadingGroup2)  //<-not displayed
				Case of 
					: ($_l_event=On Clicked:K2:4)
					: ($_l_event=On After Keystroke:K2:26) | ($_l_event=On After Edit:K2:43)
					: ($_l_event=On Data Change:K2:15)
				End case 
			: (1=2)  //($_ptr_VarArray=->DB_at_HeadingLevelUp2)  //<-not displayed
				Case of 
					: ($_l_event=On Clicked:K2:4)
					: ($_l_event=On After Keystroke:K2:26) | ($_l_event=On After Edit:K2:43)
					: ($_l_event=On Data Change:K2:15)
				End case 
				
			: (1=2)  //($_ptr_VarArray=->DB_at_ACCHHeadings3)  //<-not displayed
				Case of 
					: ($_l_event=On Clicked:K2:4)
					: ($_l_event=On After Keystroke:K2:26) | ($_l_event=On After Edit:K2:43)
					: ($_l_event=On Data Change:K2:15)
				End case 
			: (1=2)  // ($_ptr_VarArray=->DB_al_HeadingLevel3)  //<-not displays
				Case of 
					: ($_l_event=On Clicked:K2:4)
					: ($_l_event=On After Keystroke:K2:26) | ($_l_event=On After Edit:K2:43)
					: ($_l_event=On Data Change:K2:15)
				End case 
			: (1=2)  //($_ptr_VarArray=->DB_at_HeadingNames3)  //<-not displays
				Case of 
					: ($_l_event=On Clicked:K2:4)
					: ($_l_event=On After Keystroke:K2:26) | ($_l_event=On After Edit:K2:43)
					: ($_l_event=On Data Change:K2:15)
				End case 
			: (1=2)  //($_ptr_VarArray=->DB_at_HeadingAccCodeFrom3)  //<-not displays
				Case of 
					: ($_l_event=On Clicked:K2:4)
					: ($_l_event=On After Keystroke:K2:26) | ($_l_event=On After Edit:K2:43)
					: ($_l_event=On Data Change:K2:15)
				End case 
			: (1=2)  //($_ptr_VarArray=->DB_at_HeadingAccCodeto3)  //<-not displays
				Case of 
					: ($_l_event=On Clicked:K2:4)
					: ($_l_event=On After Keystroke:K2:26) | ($_l_event=On After Edit:K2:43)
					: ($_l_event=On Data Change:K2:15)
				End case 
			: (1=2)  //($_ptr_VarArray=->DB_al_HeadingEnforce3)  //<-not displays
				Case of 
					: ($_l_event=On Clicked:K2:4)
					: ($_l_event=On After Keystroke:K2:26) | ($_l_event=On After Edit:K2:43)
					: ($_l_event=On Data Change:K2:15)
				End case 
			: (1=2)  //($_ptr_VarArray=->DB_at_HeadingGroup3)  //<-not displayed
				Case of 
					: ($_l_event=On Clicked:K2:4)
					: ($_l_event=On After Keystroke:K2:26) | ($_l_event=On After Edit:K2:43)
					: ($_l_event=On Data Change:K2:15)
				End case 
			: (1=2)  //($_ptr_VarArray=->DB_at_HeadingLevelUp3)  //<-not displayed
				Case of 
					: ($_l_event=On Clicked:K2:4)
					: ($_l_event=On After Keystroke:K2:26) | ($_l_event=On After Edit:K2:43)
					: ($_l_event=On Data Change:K2:15)
				End case 
				
			: (1=2)  //($_ptr_VarArray=->DB_at_ACCHHeadings4)  //<-not displayed
				Case of 
					: ($_l_event=On Clicked:K2:4)
					: ($_l_event=On After Keystroke:K2:26) | ($_l_event=On After Edit:K2:43)
					: ($_l_event=On Data Change:K2:15)
				End case 
			: (1=2)  // ($_ptr_VarArray=->DB_al_HeadingLevel4)  //<-not displays
				Case of 
					: ($_l_event=On Clicked:K2:4)
					: ($_l_event=On After Keystroke:K2:26) | ($_l_event=On After Edit:K2:43)
					: ($_l_event=On Data Change:K2:15)
				End case 
			: (1=2)  //($_ptr_VarArray=->DB_at_HeadingNames4)  //<-not displays
				Case of 
					: ($_l_event=On Clicked:K2:4)
					: ($_l_event=On After Keystroke:K2:26) | ($_l_event=On After Edit:K2:43)
					: ($_l_event=On Data Change:K2:15)
				End case 
			: (1=2)  //($_ptr_VarArray=->DB_at_HeadingAccCodeFrom4)  //<-not displays
				Case of 
					: ($_l_event=On Clicked:K2:4)
					: ($_l_event=On After Keystroke:K2:26) | ($_l_event=On After Edit:K2:43)
					: ($_l_event=On Data Change:K2:15)
				End case 
			: (1=2)  //($_ptr_VarArray=->DB_at_HeadingAccCodeto4)  //<-not displays
				Case of 
					: ($_l_event=On Clicked:K2:4)
					: ($_l_event=On After Keystroke:K2:26) | ($_l_event=On After Edit:K2:43)
					: ($_l_event=On Data Change:K2:15)
				End case 
			: (1=2)  //($_ptr_VarArray=->DB_al_HeadingEnforce4)  //<-not displays
				Case of 
					: ($_l_event=On Clicked:K2:4)
					: ($_l_event=On After Keystroke:K2:26) | ($_l_event=On After Edit:K2:43)
					: ($_l_event=On Data Change:K2:15)
				End case 
			: (1=2)  //($_ptr_VarArray=->DB_at_HeadingGroup4)  //<-not displayed
				Case of 
					: ($_l_event=On Clicked:K2:4)
					: ($_l_event=On After Keystroke:K2:26) | ($_l_event=On After Edit:K2:43)
					: ($_l_event=On Data Change:K2:15)
				End case 
			: (1=2)  //($_ptr_VarArray=->DB_at_HeadingLevelUp4)  //<-not displayed
				Case of 
					: ($_l_event=On Clicked:K2:4)
					: ($_l_event=On After Keystroke:K2:26) | ($_l_event=On After Edit:K2:43)
					: ($_l_event=On Data Change:K2:15)
				End case 
			: (1=2)  //($_ptr_VarArray=->DB_at_ACCHHeadings5)  //<-not displayed
				Case of 
					: ($_l_event=On Clicked:K2:4)
					: ($_l_event=On After Keystroke:K2:26) | ($_l_event=On After Edit:K2:43)
					: ($_l_event=On Data Change:K2:15)
				End case 
			: (1=2)  // ($_ptr_VarArray=->DB_al_HeadingLevel5)  //<-not displays
				Case of 
					: ($_l_event=On Clicked:K2:4)
					: ($_l_event=On After Keystroke:K2:26) | ($_l_event=On After Edit:K2:43)
					: ($_l_event=On Data Change:K2:15)
				End case 
			: (1=2)  //($_ptr_VarArray=->DB_at_HeadingNames5)  //<-not displays
				Case of 
					: ($_l_event=On Clicked:K2:4)
					: ($_l_event=On After Keystroke:K2:26) | ($_l_event=On After Edit:K2:43)
					: ($_l_event=On Data Change:K2:15)
				End case 
			: (1=2)  //($_ptr_VarArray=->DB_at_HeadingAccCodeFrom5)  //<-not displays
				Case of 
					: ($_l_event=On Clicked:K2:4)
					: ($_l_event=On After Keystroke:K2:26) | ($_l_event=On After Edit:K2:43)
					: ($_l_event=On Data Change:K2:15)
				End case 
			: (1=2)  //($_ptr_VarArray=->DB_at_HeadingAccCodeto5)  //<-not displays
				Case of 
					: ($_l_event=On Clicked:K2:4)
					: ($_l_event=On After Keystroke:K2:26) | ($_l_event=On After Edit:K2:43)
					: ($_l_event=On Data Change:K2:15)
				End case 
			: (1=2)  //($_ptr_VarArray=->DB_al_HeadingEnforce5)  //<-not displays
				Case of 
					: ($_l_event=On Clicked:K2:4)
					: ($_l_event=On After Keystroke:K2:26) | ($_l_event=On After Edit:K2:43)
					: ($_l_event=On Data Change:K2:15)
				End case 
			: (1=2)  //($_ptr_VarArray=->DB_at_HeadingGroup5)  //<-not displayed
				Case of 
					: ($_l_event=On Clicked:K2:4)
					: ($_l_event=On After Keystroke:K2:26) | ($_l_event=On After Edit:K2:43)
					: ($_l_event=On Data Change:K2:15)
				End case 
			: (1=2)  //($_ptr_VarArray=->DB_at_HeadingLevelUp5)  //<-not displayed
				Case of 
					: ($_l_event=On Clicked:K2:4)
					: ($_l_event=On After Keystroke:K2:26) | ($_l_event=On After Edit:K2:43)
					: ($_l_event=On Data Change:K2:15)
				End case 
			: (1=2)  //($_ptr_VarArray=->DB_at_AccountCodes)
				Case of 
					: ($_l_event=On Clicked:K2:4)
					: ($_l_event=On After Keystroke:K2:26) | ($_l_event=On After Edit:K2:43)
					: ($_l_event=On Data Change:K2:15)
				End case 
			: (1=2)  //($_ptr_VarArray=->DB_at_AccountNames)
				Case of 
					: ($_l_event=On Clicked:K2:4)
					: ($_l_event=On After Keystroke:K2:26) | ($_l_event=On After Edit:K2:43)
					: ($_l_event=On Data Change:K2:15)
				End case 
			: (1=2)  //($_ptr_VarArray=->DB_at_AccountPreferenceGroups)
				Case of 
					: ($_l_event=On Clicked:K2:4)
					: ($_l_event=On After Keystroke:K2:26) | ($_l_event=On After Edit:K2:43)
					: ($_l_event=On Data Change:K2:15)
				End case 
			: (1=2)  //($_ptr_VarArray=->DB_at_AccountIO)
				Case of 
					: ($_l_event=On Clicked:K2:4)
					: ($_l_event=On After Keystroke:K2:26) | ($_l_event=On After Edit:K2:43)
					: ($_l_event=On Data Change:K2:15)
				End case 
			: (1=2)  //($_ptr_VarArray=->DB_al_MultiCurrencyValuation)
				Case of 
					: ($_l_event=On Clicked:K2:4)
					: ($_l_event=On After Keystroke:K2:26) | ($_l_event=On After Edit:K2:43)
					: ($_l_event=On Data Change:K2:15)
				End case 
			: (1=2)  //($_ptr_VarArray=->DB_at_MultiCurrencyValuation)
				Case of 
					: ($_l_event=On Clicked:K2:4)
					: ($_l_event=On After Keystroke:K2:26) | ($_l_event=On After Edit:K2:43)
					: ($_l_event=On Data Change:K2:15)
				End case 
			: (1=2)  //($_ptr_VarArray=->DB_abo_NoNominalLedgerPostings)
				Case of 
					: ($_l_event=On Clicked:K2:4)
					: ($_l_event=On After Keystroke:K2:26) | ($_l_event=On After Edit:K2:43)
					: ($_l_event=On Data Change:K2:15)
				End case 
			: (1=2)  //($_ptr_VarArray=->DB_at_ProfitBalance)
				Case of 
					: ($_l_event=On Clicked:K2:4)
					: ($_l_event=On After Keystroke:K2:26) | ($_l_event=On After Edit:K2:43)
					: ($_l_event=On Data Change:K2:15)
				End case 
			: (1=2)  //($_ptr_VarArray=->DB_at_AnalysisCodes)
				Case of 
					: ($_l_event=On Clicked:K2:4)
					: ($_l_event=On After Keystroke:K2:26) | ($_l_event=On After Edit:K2:43)
					: ($_l_event=On Data Change:K2:15)
				End case 
			: (1=2)  //($_ptr_VarArray=->DB_at_LayerCodes)
				Case of 
					: ($_l_event=On Clicked:K2:4)
					: ($_l_event=On After Keystroke:K2:26) | ($_l_event=On After Edit:K2:43)
					: ($_l_event=On Data Change:K2:15)
				End case 
			: (1=2)  //($_ptr_VarArray=->DB_at_AccountDefault)
				Case of 
					: ($_l_event=On Clicked:K2:4)
					: ($_l_event=On After Keystroke:K2:26) | ($_l_event=On After Edit:K2:43)
					: ($_l_event=On Data Change:K2:15)
				End case 
			: (1=2)  //($_ptr_VarArray=->DB_at_AccountHeadings)  //level zero parent heading
				Case of 
					: ($_l_event=On Clicked:K2:4)
					: ($_l_event=On After Keystroke:K2:26) | ($_l_event=On After Edit:K2:43)
					: ($_l_event=On Data Change:K2:15)
				End case 
			: (1=2)  //($_ptr_VarArray=->DB_at_ReportHeadings)  //B1 etc-Sub heading
				Case of 
					: ($_l_event=On Clicked:K2:4)
					: ($_l_event=On After Keystroke:K2:26) | ($_l_event=On After Edit:K2:43)
					: ($_l_event=On Data Change:K2:15)
				End case 
			: (1=2)  // ($_ptr_VarArray=->DB_a5_Dummys)  // place holder to make the last column does not resize
				Case of 
					: ($_l_event=On Clicked:K2:4)
					: ($_l_event=On After Keystroke:K2:26) | ($_l_event=On After Edit:K2:43)
					: ($_l_event=On Data Change:K2:15)
				End case 
		End case 
		
	End if 
	
End if 
ERR_MethodTrackerReturn("ACC_SetupManagerRow"; $_t_oldMethodName)
