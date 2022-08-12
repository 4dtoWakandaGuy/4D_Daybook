//%attributes = {}
If (False:C215)
	//Project Method Name:      FurthFld_MC
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 21:17
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY DATE:C224($_ad_DateData; 0)
	//ARRAY LONGINT(<>DB_al_TableNums;0)
	//ARRAY LONGINT(<>SYS_al_TableUniqueField;0)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	ARRAY REAL:C219($_ar_NumberData; 0)
	//ARRAY TEXT(<>DB_at_TableNames;0)
	//ARRAY TEXT(<>FUR_at_2dCustomFieldFormat;0)
	//ARRAY TEXT(<>FUR_at_CustomFieldNames;0)
	//ARRAY TEXT(<>FUR_at_CustomFieldTypes;0)
	ARRAY TEXT:C222($_at_AlphaData; 0)
	ARRAY TEXT:C222($_at_FieldNames; 0)
	ARRAY TEXT:C222($_at_TextData; 0)
	ARRAY TEXT:C222($_at_UniqueCode; 0)
	ARRAY TEXT:C222($_at_UniqueCodeFinal; 0)
	ARRAY TEXT:C222($_at_UniqueQuery; 0)
	//ARRAY TEXT(CUS_at_DisplayedData;0)
	//ARRAY TEXT(FUR_at_CustomFieldNames;0)
	//ARRAY TEXT(FUR_at_CustomFieldTypes;0)
	//ARRAY TEXT(CUS_at_PageText;0)
	C_BOOLEAN:C305($_bo_Search; WIN_bo_TrackerInited)
	C_DATE:C307($_d_DateFrom; $_d_DateTo)
	C_LONGINT:C283($_l_FieldRow; $_l_Index; $_l_NumberofRows; $_l_OK; $_l_Sets; $_l_SizeofArray; $_l_Start; $_l_TableNumber; $_l_TableRow; $_l_WindowReferenceRow; bd35)
	C_LONGINT:C283(vAny; vNo; WIN_l_CurrentWinRef)
	C_POINTER:C301($_ptr_Field; $1)
	C_REAL:C285($_r_NumberFrom; $_r_NumberTo)
	C_TEXT:C284($_t_CurrentFormUsage; $_t_CurrentFormUsage2; $_t_CurrentFormUsage3; $_t_DataType; $_t_oldMethodName; $_t_TableNumberasString; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vRec)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FurthFld_MC")
//FurthFld_MC - More Choices
Load_Fields

If ((DB_GetModuleSettingByNUM(1))#5)
	bd35:=0
	$_t_CurrentFormUsage:=DB_t_CurrentFormUsage
	$_t_CurrentFormUsage2:=DB_t_CurrentFormUsage2
	$_t_CurrentFormUsage3:=DB_t_CurrentFormUsage3
	$_l_TableNumber:=Table:C252($1)
	$_l_TableRow:=Find in array:C230(<>DB_al_TableNums; $_l_TableNumber)
	If (<>SYS_al_TableUniqueField{$_l_TableRow}#0)
		$_ptr_Field:=Field:C253($_l_TableNumber; <>SYS_al_TableUniqueField{$_l_TableRow})
		$_t_TableNumberasString:=STR_LeadZeros(String:C10($_l_TableNumber); 3)
		
		DB_t_CurrentFormUsage:=$_t_TableNumberasString+DB_t_CurrentFormUsage3
		DB_t_CurrentFormUsage2:=Uppers2(Lowercase:C14(<>DB_at_TableNames{$_l_TableRow}))
		DB_t_CurrentFormUsage3:="MC"
		
		If (Size of array:C274(<>FUR_at_CustomFieldNames{$_l_TableRow})=0)
			FurthFld_Arr($_l_TableNumber)
		End if 
		
		$_l_SizeofArray:=Size of array:C274(<>FUR_at_CustomFieldNames{$_l_TableRow})
		If ($_l_SizeofArray#0)
			
			QUERY:C277([CUSTOM_FIELDS:98]; [CUSTOM_FIELDS:98]Unique_Code:2=DB_t_CurrentFormUsage)
			FurthFld_ArrZer
			ARRAY TEXT:C222($_at_FieldNames; 0)
			ARRAY TEXT:C222($_at_AlphaData; 0)
			ARRAY REAL:C219($_ar_NumberData; 0)
			ARRAY TEXT:C222($_at_TextData; 0)
			ARRAY DATE:C224($_ad_DateData; 0)
			
			COPY ARRAY:C226(<>FUR_at_CustomFieldNames{$_l_TableRow}; FUR_at_CustomFieldNames)
			COPY ARRAY:C226(<>FUR_at_2dCustomFieldFormat{$_l_TableRow}; FUR_at_CustomFieldFormat)
			COPY ARRAY:C226(<>FUR_at_CustomFieldTypes{$_l_TableRow}; FUR_at_CustomFieldTypes)
			ARRAY TEXT:C222(CUS_at_DisplayedData; $_l_SizeofArray)
			ARRAY TEXT:C222(CUS_at_PageText; $_l_SizeofArray)
			
			For ($_l_Index; 1; $_l_SizeofArray)  //clear the arr first
				CUS_at_DisplayedData{$_l_Index}:=""
				CUS_at_PageText{$_l_Index}:=""
			End for 
			
			Open_AnyTypeWindow(331; 550; 4; "Find "+DB_t_CurrentFormUsage2+" - Further Fields")  //542 `343 542  `335 530
			DIALOG:C40([CUSTOM_FIELDS:98]; "dFurthFld_MC")
			CLOSE WINDOW:C154
			$_l_OK:=OK
			OK:=1
			If (WIN_bo_TrackerInited)
				$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
				If ($_l_WindowReferenceRow>0)
					WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
				End if 
			End if 
			If ($_l_OK=1)
				$_bo_Search:=False:C215
				ARRAY TEXT:C222($_at_UniqueCodeFinal; 0)
				$_l_Start:=1
				
				For ($_l_Index; 1; $_l_SizeofArray)
					
					CUS_at_DisplayedData{$_l_Index}:=Str_StripDel(CUS_at_DisplayedData{$_l_Index})
					CUS_at_PageText{$_l_Index}:=Str_StripDel(CUS_at_PageText{$_l_Index})
					If ((CUS_at_DisplayedData{$_l_Index}#"") | (CUS_at_PageText{$_l_Index}#""))
						
						CUS_at_DisplayedData{$_l_Index}:=Sel_AtOp(CUS_at_DisplayedData{$_l_Index}; "=")
						CUS_at_PageText{$_l_Index}:=Sel_AtOp(CUS_at_PageText{$_l_Index}; "=")
						
						$_bo_Search:=True:C214
						QUERY:C277([CUSTOM_FIELDS:98]; [CUSTOM_FIELDS:98]Field_Name:3=FUR_at_CustomFieldNames{$_l_Index}; *)
						
						$_t_DataType:=Substring:C12(FUR_at_CustomFieldTypes{$_l_Index}; 1; 1)
						Case of 
							: ($_t_DataType="A")
								Case of 
									: (CUS_at_DisplayedData{$_l_Index}=CUS_at_PageText{$_l_Index})
										QUERY:C277([CUSTOM_FIELDS:98];  & ; [CUSTOM_FIELDS:98]String_31:4; vRec; CUS_at_DisplayedData{$_l_Index})
									: (CUS_at_PageText{$_l_Index}="")
										QUERY:C277([CUSTOM_FIELDS:98];  & ; [CUSTOM_FIELDS:98]String_31:4>=CUS_at_DisplayedData{$_l_Index})
									: (CUS_at_DisplayedData{$_l_Index}="")
										QUERY:C277([CUSTOM_FIELDS:98];  & ; [CUSTOM_FIELDS:98]String_31:4<=CUS_at_PageText{$_l_Index})
									Else 
										QUERY:C277([CUSTOM_FIELDS:98];  & ; [CUSTOM_FIELDS:98]String_31:4>=CUS_at_DisplayedData{$_l_Index}; *)
										QUERY:C277([CUSTOM_FIELDS:98];  & ; [CUSTOM_FIELDS:98]String_31:4<=CUS_at_PageText{$_l_Index})
								End case 
								
							: ($_t_DataType="T")
								QUERY:C277([CUSTOM_FIELDS:98])
								Case of 
									: (CUS_at_DisplayedData{$_l_Index}=CUS_at_PageText{$_l_Index})
										QUERY SELECTION:C341([CUSTOM_FIELDS:98]; [CUSTOM_FIELDS:98]Text_Field:6; vRec; CUS_at_DisplayedData{$_l_Index})
									: (CUS_at_PageText{$_l_Index}="")
										QUERY SELECTION:C341([CUSTOM_FIELDS:98]; [CUSTOM_FIELDS:98]Text_Field:6>=CUS_at_DisplayedData{$_l_Index})
									: (CUS_at_DisplayedData{$_l_Index}="")
										QUERY SELECTION:C341([CUSTOM_FIELDS:98]; [CUSTOM_FIELDS:98]Text_Field:6<=CUS_at_PageText{$_l_Index})
									Else 
										QUERY SELECTION:C341([CUSTOM_FIELDS:98]; [CUSTOM_FIELDS:98]Text_Field:6>=CUS_at_DisplayedData{$_l_Index}; *)
										QUERY SELECTION:C341([CUSTOM_FIELDS:98];  & ; [CUSTOM_FIELDS:98]Text_Field:6<=CUS_at_PageText{$_l_Index})
								End case 
								
							: ($_t_DataType="N")
								$_r_NumberFrom:=Num:C11(CUS_at_DisplayedData{$_l_Index})
								$_r_NumberTo:=Num:C11(CUS_at_PageText{$_l_Index})
								Case of 
									: ($_r_NumberFrom=$_r_NumberTo)
										QUERY:C277([CUSTOM_FIELDS:98];  & ; [CUSTOM_FIELDS:98]Real_or_Integer:5; vRec; $_r_NumberFrom)
									: ($_r_NumberTo=0)
										QUERY:C277([CUSTOM_FIELDS:98];  & ; [CUSTOM_FIELDS:98]Real_or_Integer:5>=$_r_NumberFrom)
									: ($_r_NumberFrom=0)
										QUERY:C277([CUSTOM_FIELDS:98];  & ; [CUSTOM_FIELDS:98]Real_or_Integer:5<=$_r_NumberTo)
									Else 
										QUERY:C277([CUSTOM_FIELDS:98];  & ; [CUSTOM_FIELDS:98]Real_or_Integer:5>=$_r_NumberFrom; *)
										QUERY:C277([CUSTOM_FIELDS:98];  & ; [CUSTOM_FIELDS:98]Real_or_Integer:5<=$_r_NumberTo)
								End case 
								
							: ($_t_DataType="D")
								$_d_DateFrom:=Date:C102(CUS_at_DisplayedData{$_l_Index})
								$_d_DateTo:=Date:C102(CUS_at_PageText{$_l_Index})
								Case of 
									: ($_d_DateFrom=$_d_DateTo)
										QUERY:C277([CUSTOM_FIELDS:98];  & ; [CUSTOM_FIELDS:98]Date_Field:7; vRec; $_d_DateFrom)
									: ($_d_DateTo=!00-00-00!)
										QUERY:C277([CUSTOM_FIELDS:98];  & ; [CUSTOM_FIELDS:98]Date_Field:7>=$_d_DateFrom)
									: ($_d_DateFrom=!00-00-00!)
										QUERY:C277([CUSTOM_FIELDS:98];  & ; [CUSTOM_FIELDS:98]Date_Field:7<=$_d_DateTo)
									Else 
										QUERY:C277([CUSTOM_FIELDS:98];  & ; [CUSTOM_FIELDS:98]Date_Field:7>=$_d_DateFrom; *)
										QUERY:C277([CUSTOM_FIELDS:98];  & ; [CUSTOM_FIELDS:98]Date_Field:7<=$_d_DateTo)
								End case 
								
						End case 
						
						If ($_l_Start=1)  //first one
							$_l_Start:=2
							SELECTION TO ARRAY:C260([CUSTOM_FIELDS:98]Unique_Code:2; $_at_UniqueCodeFinal)
						Else 
							ARRAY TEXT:C222($_at_UniqueCode; 0)
							SELECTION TO ARRAY:C260([CUSTOM_FIELDS:98]Unique_Code:2; $_at_UniqueCode)
							$_l_NumberofRows:=1
							While ($_l_NumberofRows<=Size of array:C274($_at_UniqueCodeFinal))
								IDLE:C311  // 03/04/03 pb
								$_l_FieldRow:=Find in array:C230($_at_UniqueCode; $_at_UniqueCodeFinal{$_l_NumberofRows})
								If ($_l_FieldRow<1)
									DELETE FROM ARRAY:C228($_at_UniqueCodeFinal; $_l_NumberofRows; 1)
								Else 
									$_l_NumberofRows:=$_l_NumberofRows+1
								End if 
							End while 
						End if 
						
					End if 
				End for 
				
				//find the actual records
				$_l_SizeofArray:=Size of array:C274($_at_UniqueCodeFinal)
				Case of 
					: ($_l_SizeofArray=0)
						REDUCE SELECTION:C351($1->; 0)
					: ($_l_SizeofArray=1)
						QUERY:C277($1->; $_ptr_Field->=Substring:C12($_at_UniqueCodeFinal{1}; 4; 99))
					Else 
						
						
						
						$_l_NumberofRows:=0
						$_l_Sets:=0
						ARRAY TEXT:C222($_at_UniqueQuery; 0)
						For ($_l_Index; 1; $_l_SizeofArray)
							$_l_NumberofRows:=$_l_NumberofRows+1
							APPEND TO ARRAY:C911($_at_UniqueQuery; Substring:C12($_at_UniqueCodeFinal{$_l_Index}; 4))
						End for 
						QUERY WITH ARRAY:C644($_ptr_Field->; $_at_UniqueQuery)
						
						
				End case 
				CREATE SET:C116($1->; "Big One")
				CREATE SET:C116($1->; "Master")
				vNo:=Records in selection:C76($1->)
				vAny:=1
				
			End if 
			
			FurthFld_ArrZer
			ARRAY TEXT:C222(CUS_at_DisplayedData; 0)
			ARRAY TEXT:C222(CUS_at_PageText; 0)
			
		Else 
			Gen_Alert("No Further Fields have been defined for "+DB_t_CurrentFormUsage2; "Cancel")
			OK:=0
		End if 
	Else 
		Gen_Alert("Further Fields cannot be used with this File"; "Cancel")
	End if 
	
	DB_t_CurrentFormUsage:=$_t_CurrentFormUsage
	DB_t_CurrentFormUsage2:=$_t_CurrentFormUsage2
	DB_t_CurrentFormUsage3:=$_t_CurrentFormUsage3
Else 
	Gen_Alert("Further Fields are not available in Daybook Silver"; "Cancel")
	OK:=0
End if 
ERR_MethodTrackerReturn("FurthFld_MC"; $_t_oldMethodName)