//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      StatsView_Cal1F
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/11/2010 18:27
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY DATE:C224($_ad_DateFields; 0)
	//ARRAY LONGINT(<>DB_al_TableNums;0)
	//ARRAY LONGINT(<>SYS_al_TableUniqueField;0)
	//ARRAY LONGINT(aSV2;0)
	ARRAY REAL:C219($_ar_RealFields; 0)
	//ARRAY TEXT(<>FUR_at_CustomFieldNames;0)
	//ARRAY TEXT(<>FUR_at_CustomFieldTypes;0)
	ARRAY TEXT:C222($_at_DistinctValues; 0)
	//ARRAY TEXT(aSV1;0)
	//ARRAY TEXT(DB_at_TableName;0)
	//ARRAY TEXT(SV_at_FieldName1;0)
	//ARRAY TEXT(SV_at_FieldName3;0)
	//ARRAY TEXT(SV_at_FieldName4;0)
	C_LONGINT:C283(<>PS_l_Progress; <>SYS_l_CancelProcess; $_l_ArraySize; $_l_CurrentProcess; $_l_DataType; $_l_FurtherFieldColumn; $_l_Index; $_l_InsertRow; $_l_TableNumber; $_l_TableRow; $s2)
	C_LONGINT:C283(bd13; bd14; bd15; bd16; bd17; vSVT2)
	C_POINTER:C301($_ptr_Field; vFilePtr)
	C_REAL:C285(vSVT3; vSVT4)
	C_TEXT:C284($_t_FurtherFieldType; $_t_FurtherFieldValue; $_t_LastDistinct; $_t_oldMethodName; $_t_TableNumberString; vTitle20)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StatsView_Cal1F")
//StatsView_Cal1F - FurthFld
Load_Fields

$_l_CurrentProcess:=Current process:C322

$_l_TableNumber:=Table:C252(vFilePtr)
$_l_TableRow:=Find in array:C230(<>DB_al_TableNums; $_l_TableNumber)
$_t_TableNumberString:=Str LeadZeros(String:C10($_l_TableNumber); 3)
$_ptr_Field:=Field:C253($_l_TableNumber; <>SYS_al_TableUniqueField{$_l_TableNumber})
$_l_DataType:=Type:C295($_ptr_Field)

$_t_FurtherFieldValue:=Substring:C12(SV_at_FieldName1{SV_at_FieldName1}; 4; 31)
$_l_FurtherFieldColumn:=Find in array:C230(<>FUR_at_CustomFieldNames{$_l_TableRow}; $_t_FurtherFieldValue)
If ($_l_FurtherFieldColumn>0)
	$_t_FurtherFieldType:=<>FUR_at_CustomFieldTypes{$_l_TableRow}{$_l_FurtherFieldColumn}
	
	//find all the Further Fields attached to the main records
	QUERY:C277([CUSTOM_FIELDS:98]; [CUSTOM_FIELDS:98]Field_Name:3=$_t_FurtherFieldValue)
	StatsView_FFSS($_ptr_Field; $_t_TableNumberString; $_l_DataType)
	
	//do a distinct values on the FFs to find out what to analyse by
	MESSAGES OFF:C175
	ARRAY TEXT:C222($_at_DistinctValues; 0)  //distinct values returns text even if num or date
	Case of 
		: ($_t_FurtherFieldType="@A")
			DISTINCT VALUES:C339([CUSTOM_FIELDS:98]String_31:4; $_at_DistinctValues)
		: ($_t_FurtherFieldType="@N")
			ARRAY REAL:C219($_ar_RealFields; 0)
			SELECTION TO ARRAY:C260([CUSTOM_FIELDS:98]Real_or_Integer:5; $_ar_RealFields)
			SORT ARRAY:C229($_ar_RealFields; >)
			$_l_ArraySize:=Size of array:C274($_ar_RealFields)
			$_l_InsertRow:=1
			INSERT IN ARRAY:C227($_at_DistinctValues; $_l_InsertRow; 1)
			$_at_DistinctValues{$_l_InsertRow}:=String:C10($_ar_RealFields{1})
			For ($_l_Index; 1; $_l_ArraySize)
				If ($_at_DistinctValues{$_l_InsertRow}#String:C10($_ar_RealFields{$_l_Index}))
					$_l_InsertRow:=$_l_InsertRow+1
					INSERT IN ARRAY:C227($_at_DistinctValues; $_l_InsertRow; 1)
					$_at_DistinctValues{$_l_InsertRow}:=String:C10($_ar_RealFields{$_l_Index})
				End if 
			End for 
			ARRAY REAL:C219($_ar_RealFields; 0)
		: ($_t_FurtherFieldType="@D")
			ARRAY DATE:C224($_ad_DateFields; 0)
			SELECTION TO ARRAY:C260([CUSTOM_FIELDS:98]Date_Field:7; $_ad_DateFields)
			SORT ARRAY:C229($_ad_DateFields; >)
			$_l_ArraySize:=Size of array:C274($_ad_DateFields)
			$_l_InsertRow:=1
			INSERT IN ARRAY:C227($_at_DistinctValues; $_l_InsertRow; 1)
			$_at_DistinctValues{$_l_InsertRow}:=String:C10($_ad_DateFields{1})
			For ($_l_Index; 1; $_l_ArraySize)
				If ($_at_DistinctValues{$_l_InsertRow}#String:C10($_ad_DateFields{$_l_Index}))
					$_l_InsertRow:=$_l_InsertRow+1
					INSERT IN ARRAY:C227($_at_DistinctValues; $_l_InsertRow; 1)
					$_at_DistinctValues{$_l_InsertRow}:=String:C10($_ad_DateFields{$_l_Index})
				End if 
			End for 
			ARRAY DATE:C224($_ad_DateFields; 0)
	End case 
	MESSAGES ON:C181
	bd15:=1
	bd17:=1
	<>PS_l_Progress:=1
	//INPUT FORM([FILES];"dProgress0")
	//DISPLAY RECORD([FILES])
	
	//x chars calcs - see also StatsView_Cal1
	If ((bd13=1) & (bd14>0) & (Size of array:C274($_at_DistinctValues)>1))
		vTitle20:="Analysing "+String:C10(bd14)+" Character"+("s"*(Num:C11(bd14>1)))
		//DISPLAY RECORD([FILES])
		$_at_DistinctValues{1}:=Substring:C12($_at_DistinctValues{1}; 1; bd14)
		$_at_DistinctValues{1}:=$_at_DistinctValues{1}+("@"*(Num:C11(Length:C16($_at_DistinctValues{1})=bd14)))
		$_t_LastDistinct:=$_at_DistinctValues{1}
		$_l_Index:=2
		While (($_l_Index<=Size of array:C274($_at_DistinctValues)) & (<>SYS_l_CancelProcess#$_l_CurrentProcess))
			IDLE:C311  // 7/04/03 pb
			$_at_DistinctValues{$_l_Index}:=Substring:C12($_at_DistinctValues{$_l_Index}; 1; bd14)
			$_at_DistinctValues{$_l_Index}:=$_at_DistinctValues{$_l_Index}+("@"*(Num:C11(Length:C16($_at_DistinctValues{$_l_Index})=bd14)))
			If ($_t_LastDistinct=$_at_DistinctValues{$_l_Index})
				DELETE FROM ARRAY:C228($_at_DistinctValues; $_l_Index; 1)
			Else 
				$_t_LastDistinct:=$_at_DistinctValues{$_l_Index}
				$_l_Index:=$_l_Index+1
			End if 
		End while 
		bd15:=bd15+1
		bd16:=bd15
		<>PS_l_Progress:=bd15
		//INPUT FORM([FILES];"dProgress0")
		//DISPLAY RECORD([FILES])
		bd17:=bd17+1
	End if 
	
	//calculate the values
	vSVT2:=0
	vSVT3:=0
	vSVT4:=0
	$_l_ArraySize:=Size of array:C274($_at_DistinctValues)
	COPY NAMED SELECTION:C331(vFilePtr->; "$SelCal1")
	COPY NAMED SELECTION:C331([CUSTOM_FIELDS:98]; "$SelCalFF")
	vTitle20:="Calculating 1 of "+String:C10($_l_ArraySize)
	//DISPLAY RECORD([FILES])
	$_l_Index:=1
	While (($_l_Index<=$_l_ArraySize) & (<>SYS_l_CancelProcess#$_l_CurrentProcess))
		IDLE:C311  // 7/04/03 pb
		bd15:=Int:C8(bd17+(($_l_Index/$_l_ArraySize)*(10-bd17)))
		If (bd15#bd16)
			bd16:=bd15
			<>PS_l_Progress:=bd15
			//INPUT FORM([FILES];"dProgress0")
			vTitle20:="Calculating "+String:C10($_l_Index)+" of "+String:C10($_l_ArraySize)
			//DISPLAY RECORD([FILES])
		End if 
		
		StatsView_Arr($_l_Index; 1)
		aSV1{$_l_Index}:=Substring:C12($_at_DistinctValues{$_l_Index}; 1; 79)
		
		//Find the right  FF records
		USE NAMED SELECTION:C332("$SelCalFF")
		StatsView_FFS2($_t_FurtherFieldType; $_l_Index)
		
		//Find the right actual records
		USE NAMED SELECTION:C332("$SelCal1")
		StatsView_FFS3($_ptr_Field)
		
		//Calc the Count column
		If (DB_at_TableName=1)
			aSV2{$_l_Index}:=Records in selection:C76(vFilePtr->)
		Else 
			StatsView_Cal1C($_l_Index)
		End if 
		vSVT2:=vSVT2+aSV2{$_l_Index}
		
		//Calc columns 3 & 4
		If (SV_at_FieldName3>1)
			StatsView_Upd3($_l_Index)
		End if 
		If (SV_at_FieldName4>1)
			StatsView_Upd4($_l_Index)
		End if 
		
		$_l_Index:=$_l_Index+1
	End while 
	USE NAMED SELECTION:C332("$SelCal1")
	CLEAR NAMED SELECTION:C333("$SelCal1")
	USE NAMED SELECTION:C332("$SelCalFF")
	CLEAR NAMED SELECTION:C333("$SelCalFF")
	
Else 
	//BEEP
End if 
ERR_MethodTrackerReturn("StatsView_Cal1F"; $_t_oldMethodName)
