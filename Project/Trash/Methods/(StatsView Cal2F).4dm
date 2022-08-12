//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      StatsView_Cal2F
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
	//ARRAY LONGINT(<>DB_al_TableNums;0)
	//ARRAY LONGINT(<>SYS_al_TableUniqueField;0)
	//ARRAY LONGINT(aSV2;0)
	//ARRAY TEXT(<>FUR_at_CustomFieldNames;0)
	//ARRAY TEXT(<>FUR_at_CustomFieldTypes;0)
	//ARRAY TEXT(aSV1;0)
	//ARRAY TEXT(DB_at_TableName;0)
	//ARRAY TEXT(SV_at_FieldName1;0)
	//ARRAY TEXT(SV_at_FieldName3;0)
	//ARRAY TEXT(SV_at_FieldName4;0)
	C_LONGINT:C283(<>PS_l_Progress; <>SYS_l_CancelProcess; $_l_CurrentProcess; $_l_CustomFieldColumn; $_l_Index; $_l_SizeOfArray; $_l_TableNumber; $_l_TableRow; $_l_Type; bd15; bd16)
	C_LONGINT:C283(bd17; vSVT2)
	C_POINTER:C301($_ptr_Field; vFilePtr)
	C_REAL:C285(vSVT3; vSVT4)
	C_TEXT:C284($_t_CustomField; $_t_CustomFieldType; $_t_oldMethodName; $_t_TableNumberString; vTitle20)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StatsView_Cal2F")
//StatsView_Cal2F - FurthFld
Load_Fields

$_l_CurrentProcess:=Current process:C322

$_l_TableNumber:=Table:C252(vFilePtr)
$_t_TableNumberString:=Str LeadZeros(String:C10($_l_TableNumber); 3)
$_ptr_Field:=Field:C253($_l_TableNumber; <>SYS_al_TableUniqueField{$_l_TableNumber})
$_l_Type:=Type:C295($_ptr_Field)
$_l_TableRow:=Find in array:C230(<>DB_al_TableNums; $_l_TableNumber)
$_t_CustomField:=Substring:C12(SV_at_FieldName1{SV_at_FieldName1}; 4; 31)
$_l_CustomFieldColumn:=Find in array:C230(<>FUR_at_CustomFieldNames{$_l_TableRow}; $_t_CustomField)
If ($_l_CustomFieldColumn>0)
	$_t_CustomFieldType:=<>FUR_at_CustomFieldTypes{$_l_TableRow}{$_l_CustomFieldColumn}
	
	//find all the Further Fields attached to the main records
	QUERY:C277([CUSTOM_FIELDS:98]; [CUSTOM_FIELDS:98]Field_Name:3=$_t_CustomField)
	StatsView_FFSS($_ptr_Field; $_t_TableNumberString; $_l_Type)
	
	//calculate the values
	vSVT2:=0
	vSVT3:=0
	vSVT4:=0
	$_l_SizeOfArray:=Size of array:C274(aSV1)
	COPY NAMED SELECTION:C331(vFilePtr->; "$_l_SizeOfArrayelCal1")
	COPY NAMED SELECTION:C331([CUSTOM_FIELDS:98]; "$_l_SizeOfArrayelCalFF")
	vTitle20:="Calculating 1 of "+String:C10($_l_SizeOfArray)
	//DISPLAY RECORD([FILES])
	$_l_Index:=1
	While (($_l_Index<=$_l_SizeOfArray) & (<>SYS_l_CancelProcess#$_l_CurrentProcess))
		IDLE:C311  // 7/04/03 pb
		bd15:=Int:C8(bd17+(($_l_Index/$_l_SizeOfArray)*(10-bd17)))
		If (bd15#bd16)
			bd16:=bd15
			<>PS_l_Progress:=bd15
			//INPUT FORM([FILES];"dProgress0")
			vTitle20:="Calculating "+String:C10($_l_Index)+" of "+String:C10($_l_SizeOfArray)
			//DISPLAY RECORD([FILES])
		End if 
		
		//Find the right  FF records
		USE NAMED SELECTION:C332("$_l_SizeOfArrayelCalFF")
		StatsView_FFS2($_t_CustomFieldType; $_l_Index)
		
		//Find the right actual records
		USE NAMED SELECTION:C332("$_l_SizeOfArrayelCal1")
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
	USE NAMED SELECTION:C332("$_l_SizeOfArrayelCal1")
	CLEAR NAMED SELECTION:C333("$_l_SizeOfArrayelCal1")
	USE NAMED SELECTION:C332("$_l_SizeOfArrayelCalFF")
	CLEAR NAMED SELECTION:C333("$_l_SizeOfArrayelCalFF")
	
Else 
	//BEEP
End if 
ERR_MethodTrackerReturn("StatsView_Cal2F"; $_t_oldMethodName)
