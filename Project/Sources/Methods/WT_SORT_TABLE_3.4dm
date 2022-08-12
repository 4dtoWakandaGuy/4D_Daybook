//%attributes = {}

If (False:C215)
	//Project Method Name:      WT_SORT_TABLE_3
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_FieldIndexed; $_bo_Sort; $_bo_Switch; $4)
	C_LONGINT:C283($_l_DataType; $_l_FieldLength; $_l_FieldNumber; $_l_FieldNumOLD; $_l_Number; $_l_TableNumber; FS_l_FieldType; FS_l_SortDirection; FS_l_SortFieldNUM; FS_l_SortTableNUM; xOK)
	C_POINTER:C301($1; $3)
	C_TEXT:C284($_t_oldMethodName; $_t_SubText; $_t_VariableName; $2; FS_t_SortFieldTXT; FS_t_SortVariableName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("WT_SORT_TABLE_3")

If (True:C214)
	If (Count parameters:C259>=3)
		$_t_oldMethodName:=ERR_MethodTracker("WT_SORT_TABLE_3")
		MESSAGES OFF:C175
		//WT_SORT_TABLE_3: for static text labels
		$_l_DataType:=Type:C295($3->)
		RESOLVE POINTER:C394($3; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		If ($_l_TableNumber>0)
			GET FIELD PROPERTIES:C258($3; FS_l_FieldType; $_l_FieldLength; $_bo_FieldIndexed)
		Else 
			$_l_TableNumber:=Table:C252($1)
			$_bo_FieldIndexed:=True:C214
		End if 
		If ($_bo_FieldIndexed=False:C215)
			If (Records in selection:C76($1->)>100000)
				Gen_Confirm4("This field is not indexed, sorting could be a few minutes."; "Continue?"; "Cancel")
			Else 
				xOK:=1
			End if 
			$_bo_Sort:=False:C215
			If (xOK=1)
				If (FS_l_FieldType#Is picture:K8:10) & (FS_l_FieldType#Is BLOB:K8:12) & (FS_l_FieldType#Is subtable:K8:11)
					
					$_bo_Sort:=True:C214
				End if 
				
			End if 
		Else 
			$_bo_Sort:=True:C214
		End if 
		If ($_bo_Sort)
			//If (FS_l_SortFieldNUM#$_l_FieldNumber)
			//field has been swapped -dont swap order
			//FS_l_SortDirection:=Abs(FS_l_SortDirection-1)
			//End if
			FS_t_SortVariableName:=$_t_VariableName
			$_l_FieldNumOLD:=FS_l_SortFieldNUM
			FS_l_SortFieldNUM:=$_l_FieldNumber  //Longint
			FS_l_SortTableNUM:=$_l_TableNumber
			
			If ($2#"")
				FS_t_SortFieldTXT:=$2
				$_l_Number:=Num:C11($2)
				$_t_SubText:=Substring:C12($2; 1; Length:C16($2)-Length:C16(String:C10($_l_Number)))
				OBJECT SET FONT STYLE:C166(*; $_t_SubText+"@"; Plain:K14:1)
				OBJECT SET FONT STYLE:C166(*; "◊AT@"; Plain:K14:1)
				OBJECT SET FONT STYLE:C166(*; "v@"; Plain:K14:1)
				OBJECT SET FONT STYLE:C166(*; $2; Bold:K14:2+Underline:K14:4)
			End if 
			If (Count parameters:C259>=4)
				$_bo_Switch:=$4
			Else 
				$_bo_Switch:=True:C214
			End if 
			If (FS_l_SortFieldNUM>0)
				If ($_l_FieldNumOLD=0)
					$_l_FieldNumOLD:=FS_l_SortFieldNUM
				End if 
				If (Table:C252($1)#Table:C252($3))
					SET AUTOMATIC RELATIONS:C310(True:C214; True:C214)
				End if 
				
				Case of 
					: (FS_l_SortDirection>=1) & (FS_l_SortFieldNUM=$_l_FieldNumOLD)
						If ($_bo_Switch)
							FS_l_SortDirection:=-1
							
							ORDER BY:C49($1->; $3->; <)
							
						Else 
							ORDER BY:C49($1->; $3->; >)
						End if 
					: (FS_l_SortDirection<=0) & (FS_l_SortFieldNUM=$_l_FieldNumOLD)
						If ($_bo_Switch)
							FS_l_SortDirection:=1
							ORDER BY:C49($1->; $3->; >)
						Else 
							ORDER BY:C49($1->; $3->; <)
						End if 
					: (FS_l_SortFieldNUM#$_l_FieldNumOLD)
						If ($_l_FieldNumOLD>0)
							If (FS_l_SortDirection>0)
								FS_l_SortDirection:=1
								ORDER BY:C49($1->; $3->; >)
							Else 
								FS_l_SortDirection:=-1
								ORDER BY:C49($1->; $3->; <)
							End if 
						Else 
							If ($_bo_Switch)
								If (FS_l_SortDirection>0)
									FS_l_SortDirection:=-1
									ORDER BY:C49($1->; $3->; <)
								Else 
									FS_l_SortDirection:=1
									ORDER BY:C49($1->; $3->; >)
								End if 
							Else 
								If (FS_l_SortDirection>0)
									
									ORDER BY:C49($1->; $3->; >)
								Else 
									ORDER BY:C49($1->; $3->; <)
								End if 
								
							End if 
							
						End if 
						
				End case 
				If (Table:C252($1)#Table:C252($3))
					SET AUTOMATIC RELATIONS:C310(False:C215; False:C215)
				End if 
				
			Else 
				If (FS_t_SortVariableName#"")
					Case of 
						: (FS_l_SortDirection>=1) & (FS_l_SortFieldNUM=$_l_FieldNumOLD)
							
							If ($_bo_Switch)
								FS_l_SortDirection:=-1
								ORDER BY FORMULA:C300($1->; FS_t_SortVariableName; <)
							Else 
								ORDER BY FORMULA:C300($1->; FS_t_SortVariableName; >)
							End if 
						: (FS_l_SortDirection<=0) & (FS_l_SortFieldNUM=$_l_FieldNumOLD)
							If ($_bo_Switch)
								FS_l_SortDirection:=-1
								ORDER BY FORMULA:C300($1->; FS_t_SortVariableName; <)
							Else 
								FS_l_SortDirection:=1
								ORDER BY FORMULA:C300($1->; FS_t_SortVariableName; >)
							End if 
						: (FS_l_SortFieldNUM#$_l_FieldNumOLD)
							If ($_l_FieldNumOLD>0)  //'dont switch anyway
								If (FS_l_SortDirection>0)
									FS_l_SortDirection:=1
									ORDER BY FORMULA:C300($1->; FS_t_SortVariableName; >)
								Else 
									FS_l_SortDirection:=-1
									ORDER BY FORMULA:C300($1->; FS_t_SortVariableName; <)
								End if 
							Else 
								If ($_bo_Switch)
									If (FS_l_SortDirection>0)
										FS_l_SortDirection:=-1
										ORDER BY FORMULA:C300($1->; FS_t_SortVariableName; <)
									Else 
										FS_l_SortDirection:=1
										ORDER BY FORMULA:C300($1->; FS_t_SortVariableName; >)
									End if 
								Else 
									If (FS_l_SortDirection>0)
										
										ORDER BY FORMULA:C300($1->; FS_t_SortVariableName; >)
									Else 
										ORDER BY FORMULA:C300($1->; FS_t_SortVariableName; <)
									End if 
									
								End if 
								
							End if 
							
					End case 
				End if 
			End if 
		End if 
		MESSAGES ON:C181
	End if 
Else 
	GEN_SortOutput($3)
End if 
ERR_MethodTrackerReturn("WT_SORT_TABLE_3"; $_t_oldMethodName)