//%attributes = {}
If (False:C215)
	//Project Method Name:      StatsView_Del
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/11/2010 18:26
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>DB_al_TableNums;0)
	//ARRAY LONGINT(aSV2;0)
	//ARRAY LONGINT(SV_al_TableNumber;0)
	//ARRAY REAL(aSV3;0)
	//ARRAY REAL(aSV4;0)
	//ARRAY TEXT(<>SYS_at_2DFieldNames;0)
	//ARRAY TEXT(aSV1;0)
	//ARRAY TEXT(aSV5;0)
	//ARRAY TEXT(aSVN1;0)
	//ARRAY TEXT(SV_at_CalcOption3;0)
	//ARRAY TEXT(SV_at_CalcOption4;0)
	//ARRAY TEXT(SV_at_FieldName1;0)
	C_LONGINT:C283($_l_FIeldNumberColumn; $_l_FieldType; $_l_TableNumberRow; vNo; vSVT1; vSVT2)
	C_POINTER:C301($_ptr_FieldPointer; vFilePtr)
	C_REAL:C285($_l_SVT2; vSVT3; vSVT4)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StatsView_Del")
Load_Fields

If (aSV1>0)
	If (aSV1{aSV1}#"All selected records")
		vSVT1:=vSVT1-1
		$_l_SVT2:=vSVT2
		vSVT2:=vSVT2-aSV2{aSV1}
		If (SV_at_CalcOption3=2)
			vSVT3:=Gen_Round((((vSVT3*$_l_SVT2)-(aSV3{aSV1}*aSV2{aSV1}))/vSVT2); 2; 2)
		Else 
			vSVT3:=vSVT3-aSV3{aSV1}
		End if 
		If (SV_at_CalcOption4=2)
			vSVT4:=Gen_Round((((vSVT4*$_l_SVT2)-(aSV4{aSV1}*aSV2{aSV1}))/vSVT2); 2; 2)
		Else 
			vSVT4:=vSVT4-aSV4{aSV1}
		End if 
		If (SV_at_FieldName1{SV_at_FieldName1}="FF:@")
			
		Else 
			$_l_TableNumberRow:=Find in array:C230(<>DB_al_TableNums; SV_al_TableNumber{1})
			$_l_FIeldNumberColumn:=Find in array:C230(<>SYS_at_2DFieldNames{$_l_TableNumberRow}; SV_at_FieldName1{SV_at_FieldName1})  //Find the Field No from the interProcess_Arrays
			If ($_l_FIeldNumberColumn>0)
				$_ptr_FieldPointer:=Field:C253(SV_al_TableNumber{1}; $_l_FIeldNumberColumn)  //get a pointer to the field in column 1
				GET FIELD PROPERTIES:C258($_ptr_FieldPointer; $_l_FieldType)
				StatsView_UpdS(aSV1; $_ptr_FieldPointer; $_l_FieldType; False:C215)  //Search #
			End if 
			StatsView_Arr(aSV1; 2)
			vNo:=Records in selection:C76(vFilePtr->)
			If (aSV1>Size of array:C274(aSV1))
				aSV1:=0
				aSVN1:=0
				aSV2:=0
				aSV3:=0
				aSV4:=0
			End if 
		End if 
	End if 
End if 
ARRAY TEXT:C222(aSV5; Size of array:C274(aSV4))
ERR_MethodTrackerReturn("StatsView_Del"; $_t_oldMethodName)