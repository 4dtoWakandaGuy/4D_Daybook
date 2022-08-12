//%attributes = {}
If (False:C215)
	//Project Method Name:      WT_SORT_TABLE_2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/10/2009 12:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_FieldIndexed; $_bo_Switch; $4)
	C_LONGINT:C283(<>l_FS_FieldNotIndexAlert; <>WT_SortFieldName_2; $_l_DataType; $_l_FieldLength; $_l_FieldNumber; $_l_FieldNumberOLD; $_l_TableNumber; $5; FS_l_FieldType; FS_l_SortDirection; FS_l_SortFieldNUM)
	C_LONGINT:C283(FS_l_SortTableNUM; xOK)
	C_POINTER:C301(<>WT_SortFieldName_1; $1; $2; $3)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName; FS_t_SortFieldTXT; FS_t_SortVariableName; WT_t_SortFieldVARNAME)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("WT_SORT_TABLE_2")
MESSAGES OFF:C175  //WT_SORT_TABLE_2: for variable text labels

If (Count parameters:C259>=3)
	$_l_DataType:=Type:C295($3->)
	RESOLVE POINTER:C394($3; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
	
	If ($_l_TableNumber>0)
		GET FIELD PROPERTIES:C258($3; FS_l_FieldType; $_l_FieldLength; $_bo_FieldIndexed)
	Else 
		$_l_TableNumber:=Table:C252($1)
		$_bo_FieldIndexed:=True:C214
	End if 
	If ($_bo_FieldIndexed=False:C215)
		If (Records in selection:C76($1->)>100000) & (<>l_FS_FieldNotIndexAlert=0)
			Gen_Confirm4("You are about to sort on a field which may take a few minutes!"; "Continue?"; "Cancel"; True:C214)
			<>l_FS_FieldNotIndexAlert:=cb_dConfirm4
		Else 
			xOK:=1
			If (<>l_FS_FieldNotIndexAlert=1)
				MESSAGES ON:C181  //bsw 19/04/07
			End if 
		End if 
		
		If (xOK=1)
			FS_t_SortVariableName:=$_t_VariableName
			$_l_FieldNumberOLD:=FS_l_SortFieldNUM
			FS_l_SortFieldNUM:=$_l_FieldNumber  //Longint
			FS_l_SortTableNUM:=$_l_TableNumber
			FS_t_SortFieldTXT:=$2->
			RESOLVE POINTER:C394($2; WT_t_SortFieldVARNAME; $_l_TableNumber; $_l_FieldNumber)
			FS_t_SortFieldTXT:=""
			OBJECT SET FONT STYLE:C166(*; "Text@"; Plain:K14:1)
			OBJECT SET FONT STYLE:C166(*; "◊AT@"; Plain:K14:1)
			OBJECT SET FONT STYLE:C166(*; "v@"; Plain:K14:1)
			OBJECT SET FONT STYLE:C166($2->; Bold:K14:2+Underline:K14:4)
			Case of 
				: (FS_l_SortDirection>=1) & (FS_l_SortFieldNUM=$_l_FieldNumberOLD)
					FS_l_SortDirection:=0
					ORDER BY:C49($1->; $3->; <)
				: (FS_l_SortDirection<=0) & (FS_l_SortFieldNUM=$_l_FieldNumberOLD)
					FS_l_SortDirection:=1
					ORDER BY:C49($1->; $3->; >)
				: (FS_l_SortFieldNUM#$_l_FieldNumberOLD)
					If (FS_l_SortDirection>0)
						FS_l_SortDirection:=1
						ORDER BY:C49($1->; $3->; >)
					Else 
						FS_l_SortDirection:=0
						ORDER BY:C49($1->; $3->; <)
					End if 
			End case 
		End if 
	Else 
		FS_t_SortVariableName:=$_t_VariableName
		$_l_FieldNumberOLD:=FS_l_SortFieldNUM
		FS_l_SortFieldNUM:=$_l_FieldNumber  //Longint
		FS_l_SortTableNUM:=$_l_TableNumber
		If (Count parameters:C259>=4)
			$_bo_Switch:=$4
		Else 
			$_bo_Switch:=True:C214
		End if 
		If (Not:C34(Undefined:C82($2->)))
			FS_t_SortFieldTXT:=$2->
			RESOLVE POINTER:C394($2; WT_t_SortFieldVARNAME; $_l_TableNumber; $_l_FieldNumber)
			FS_t_SortFieldTXT:=""
			OBJECT SET FONT STYLE:C166(*; "Text@"; Plain:K14:1)
			OBJECT SET FONT STYLE:C166(*; "◊AT@"; Plain:K14:1)
			OBJECT SET FONT STYLE:C166(*; "v@"; Plain:K14:1)
			OBJECT SET FONT STYLE:C166($2->; Bold:K14:2+Underline:K14:4)
			If (FS_l_SortFieldNUM>0)
				Case of 
					: (FS_l_SortDirection>=1) & (FS_l_SortFieldNUM=$_l_FieldNumberOLD)  // swap
						If ($_bo_Switch)
							FS_l_SortDirection:=-1
							ORDER BY:C49($1->; $3->; <)
						Else 
							ORDER BY:C49($1->; $3->; >)
						End if 
					: (FS_l_SortDirection<=0) & (FS_l_SortFieldNUM=$_l_FieldNumberOLD)  // Swap
						If ($_bo_Switch)
							FS_l_SortDirection:=1
							ORDER BY:C49($1->; $3->; >)
						Else 
							ORDER BY:C49($1->; $3->; <)
						End if 
						
					: (FS_l_SortFieldNUM#$_l_FieldNumberOLD)  //no swap
						If ($_l_FieldNumberOLD>0)
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
			Else 
				Case of 
					: (FS_l_SortDirection>=1) & (FS_l_SortFieldNUM=$_l_FieldNumberOLD)  // swap
						If ($_bo_Switch)
							FS_l_SortDirection:=-1
							ORDER BY FORMULA:C300($1->; FS_t_SortVariableName; <)
						Else 
							ORDER BY FORMULA:C300($1->; FS_t_SortVariableName; >)
						End if 
						
					: (FS_l_SortDirection<=0) & (FS_l_SortFieldNUM=$_l_FieldNumberOLD)  // swap
						If ($_bo_Switch)
							FS_l_SortDirection:=-1
							ORDER BY FORMULA:C300($1->; FS_t_SortVariableName; <)
						Else 
							FS_l_SortDirection:=1
							ORDER BY FORMULA:C300($1->; FS_t_SortVariableName; >)
						End if 
						
					: (FS_l_SortFieldNUM#$_l_FieldNumberOLD)  //no swap
						If ($_l_FieldNumberOLD>0)  //'dont switch anyway
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
End if 
MESSAGES ON:C181
ERR_MethodTrackerReturn("WT_SORT_TABLE_2"; $_t_oldMethodName)